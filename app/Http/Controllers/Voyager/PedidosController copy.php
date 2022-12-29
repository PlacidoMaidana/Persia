<?php

namespace App\Http\Controllers\Voyager;

use App\Models\nota_pedido;
use Exception;
use App\Models\renglones_notapedido;
use App\Models\Formaspago;
use App\Models\User;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataRestored;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;

use PDF;
use Yajra\DataTables\WithExportQueue;

class PedidosController extends \TCG\Voyager\Http\Controllers\VoyagerBaseController
{

    
    use BreadRelationshipParser;
    

    //***************************************
    //               ____
    //              |  _ \
    //              | |_) |
    //              |  _ <
    //              | |_) |
    //              |____/
    //
    //      Browse our Data Type (B)READ
    //
    //****************************************

    public function index(Request $request)
    {
        
        // GET THE SLUG, ex. 'posts', 'pages', etc.
        $slug = $this->getSlug($request);

        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('browse', app($dataType->model_name));

        $getter = $dataType->server_side ? 'paginate' : 'get';

        $search = (object) ['value' => $request->get('s'), 'key' => $request->get('key'), 'filter' => $request->get('filter')];

        $searchNames = [];
        if ($dataType->server_side) {
            $searchNames = $dataType->browseRows->mapWithKeys(function ($row) {
                return [$row['field'] => $row->getTranslatedAttribute('display_name')];
            });
        }

        $orderBy = $request->get('order_by', $dataType->order_column);
        $sortOrder = $request->get('sort_order', $dataType->order_direction);
        $usesSoftDeletes = false;
        $showSoftDeleted = false;

        // Next Get or Paginate the actual content from the MODEL that corresponds to the slug DataType
        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            $query = $model::select($dataType->name.'.*');

            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query->{$dataType->scope}();
            }

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model)) && Auth::user()->can('delete', app($dataType->model_name))) {
                $usesSoftDeletes = true;

                if ($request->get('showSoftDeleted')) {
                    $showSoftDeleted = true;
                    $query = $query->withTbuscarashed();
                }
            }

            // If a column has a relationship associated with it, we do not want to show that field
            $this->removeRelationshipField($dataType, 'browse');

            if ($search->value != '' && $search->key && $search->filter) {
                $search_filter = ($search->filter == 'equals') ? '=' : 'LIKE';
                $search_value = ($search->filter == 'equals') ? $search->value : '%'.$search->value.'%';

                $searchField = $dataType->name.'.'.$search->key;
                if ($row = $this->findSearchableRelationshipRow($dataType->rows->where('type', 'relationship'), $search->key)) {
                    $query->whereIn(
                        $searchField,
                        $row->details->model::where($row->details->label, $search_filter, $search_value)->pluck('id')->toArray()
                    );
                } else {
                    if ($dataType->browseRows->pluck('field')->contains($search->key)) {
                        $query->where($searchField, $search_filter, $search_value);
                    }
                }
            }

            $row = $dataType->rows->where('field', $orderBy)->firstWhere('type', 'relationship');
            if ($orderBy && (in_array($orderBy, $dataType->fields()) || !empty($row))) {
                $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                if (!empty($row)) {
                    $query->select([
                        $dataType->name.'.*',
                        'joined.'.$row->details->label.' as '.$orderBy,
                    ])->leftJoin(
                        $row->details->table.' as joined',
                        $dataType->name.'.'.$row->details->column,
                        'joined.'.$row->details->key
                    );
                }

                $dataTypeContent = call_user_func([
                    $query->orderBy($orderBy, $querySortOrder),
                    $getter,
                ]);
            } elseif ($model->timestamps) {
                $dataTypeContent = call_user_func([$query->latest($model::CREATED_AT), $getter]);
            } else {
                $dataTypeContent = call_user_func([$query->orderBy($model->getKeyName(), 'DESC'), $getter]);
            }

            // Replace relationships' keys for labels and create READ links if a slug is provided.
            $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType);
        } else {
            // If Model doesn't exist, get data from table name
            $dataTypeContent = call_user_func([DB::table($dataType->name), $getter]);
            $model = false;
        }

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($model);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'browse', $isModelTranslatable);

        // Check if server side pagination is enabled
        $isServerSide = isset($dataType->server_side) && $dataType->server_side;

        // Check if a default search key is set
        $defaultSearchKey = $dataType->default_search_key ?? null;

        // Actions
        $actions = [];
        if (!empty($dataTypeContent->first())) {
            foreach (Voyager::actions() as $action) {
                $action = new $action($dataType, $dataTypeContent->first());

                if ($action->shouldActionDisplayOnDataType()) {
                    $actions[] = $action;
                }
            }
        }

        // Define showCheckboxColumn
        $showCheckboxColumn = false;
        if (Auth::user()->can('delete', app($dataType->model_name))) {
            $showCheckboxColumn = true;
        } else {
            foreach ($actions as $action) {
                if (method_exists($action, 'massAction')) {
                    $showCheckboxColumn = true;
                }
            }
        }

        // Define orderColumn
        $orderColumn = [];
        if ($orderBy) {
            $index = $dataType->browseRows->where('field', $orderBy)->keys()->first() + ($showCheckboxColumn ? 1 : 0);
            $orderColumn = [[$index, $sortOrder ?? 'desc']];
        }

        // Define list of columns that can be sorted server side
        $sortableColumns = $this->getSortableColumns($dataType->browseRows);

        $view = 'voyager::bread.browse';

        if (view()->exists("voyager::$slug.browse")) {
            $view = "voyager::$slug.browse";
        }

        return Voyager::view($view, compact(
            'actions',
            'dataType',
            'dataTypeContent',
            'isModelTranslatable',
            'search',
            'orderBy',
            'orderColumn',
            'sortableColumns',
            'sortOrder',
            'searchNames',
            'isServerSide',
            'defaultSearchKey',
            'usesSoftDeletes',
            'showSoftDeleted',
            'showCheckboxColumn'
        ));
    }
////////////////////////////////////////
//       REMITOS
//////////////////////////////////////////

public function remitos()
{

   return view('vendor.voyager.remitos.browse');
}

    //<<<<<<<<<<<<<<<<<>>>>>>>>>>>><<<<<<<<<<>>>>>>>>>>>><<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<       <>>>>>><<<<<         <>>>>>><<<<><<              <>>>>>>>>>>>
        //<<<<<<<<<<<<    <<<<<>    >>><<<<<    <<<<    >>><<<>><<<    <<<<<>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<   <<<<<>>>    >><<<<<   <<<<<>>>    >><<<<<<   <<<<<>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<   <<<<<>>>    >><<<<<   <<<<<>>>    >><<<<<<   <<<<<>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<   <<<<<>>>    >><<<<<   <<<<<>>>    >><<<<<<   <<<<<>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<               <<<<<<<   <<<<<>>>    <<<<<<<<             <<<<<>>>>>>>>
        //<<<<<<<<<<<<   <<<<<>>>>><<>><<<<<   <<<<<>>>    >><<<<<<   <<<<<>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<   <<<<<>>>>><<>><<<<<   <<<<<>>>    >><<<<<<   <<<<<>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<   <<<<<>>>>><<>><<<<<   <<<<<>    >>>><<<<<<   <<<<<>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<   <<<<<>>>>><<>><<<<<          >><<<<<<<<<<   <<<<<>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<>>>>>>>><<>>>>>><<<<<<<<<<>>>>>>>>>>>><<<<<<<<<<<>>>>>>>>>>>>>>>>>

        public function createPDF($id_ped){

           //$texto="esto es el texto de la nota";
           $texto= DB::table('formaspago')
           //->where('nota_pedidos.id', $id_ped)
            ->where('formaspago.id', 1)
           ->select([ 'formaspago.Forma_pago_Productos',
                     'formaspago.Forma_pago_Obras',
                     'formaspago.Forma_pago_Muebles'
                    ])           
           ->first();

           $datosPedidos= DB::table('nota_pedidos')
           ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
           ->where('nota_pedidos.id', $id_ped)
           ->select([ 'nota_pedidos.id as id_pedido',
                     'nota_pedidos.fecha',
                     'clientes.nombre',
                     'clientes.id as id_cliente',
                     'nota_pedidos.totalgravado',
                     'nota_pedidos.total',
                     'nota_pedidos.monto_iva',
                     'nota_pedidos.id_factura',
                     'nota_pedidos.observaciones',
                     'nota_pedidos.descuento',
                     'nota_pedidos.estado'
               ])           
           ->first();
           
           $detallesPedidos= DB::table('nota_pedidos')
           ->join('renglones_notapedidos','nota_pedidos.id','=','renglones_notapedidos.id_pedido')
           ->join('productos','renglones_notapedidos.id_producto','=','productos.id')
           ->join('rubros as r','productos.rubro_id','=','r.id')
           ->join('subrubros as s','productos.subrubro_id','=','s.id')
           ->where('nota_pedidos.id', $id_ped)
           ->select(DB::raw('nota_pedidos.id as id_pedido,
           renglones_notapedidos.id,
           s.descripcion_subrubro as subrubro,
           renglones_notapedidos.cantidad,
           renglones_notapedidos.id_producto,
           renglones_notapedidos.total_linea / renglones_notapedidos.cantidad as punit,
           renglones_notapedidos.total_linea,
           productos.descripcion,
           productos.unidad' 
           ) )
           ->get();
            
             $pdf = PDF::loadView("vendor.voyager.nota-pedidos.exportar",
             compact('id_ped','texto','datosPedidos','detallesPedidos'));
             return $pdf->stream('invoice.pdf');

        }


        public function createremitosPDF($id_ped){
         
            // verifico que se haya pagado toda la NP antes de emitir el Remito
             $suma_cobranza = DB::table('mov_financieros')-> where ('mov_financieros.id_nota_pedido','=',$id_ped)->sum('importe_ingreso');
            
            // verifico que se haya empaquetay controlado toda la produccion vinculada al pedido antes de emitir el Remito   
             $cant_ordfab_pendientes = DB::table('ordenes_fabricacion')-> where ('id_pedido','=',$id_ped)-> where ('estado','=','Empaquetado y controlado')->count('id');
             $cant_ordfab = DB::table('ordenes_fabricacion')-> where ('id_pedido','=',$id_ped)->count('id');
                  
            $texto= DB::table('formaspago')
            ->where('formaspago.id', 1)
            ->select([ 'formaspago.Forma_pago_Productos',
                      'formaspago.Forma_pago_Obras',
                      'formaspago.Forma_pago_Muebles'
                     ])           
            ->first();
 
            $datosPedidos= DB::table('nota_pedidos')
            ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
            ->where('nota_pedidos.id', $id_ped)
            ->select([ 'nota_pedidos.id as id_pedido',
                      'nota_pedidos.fecha',
                      'clientes.nombre',
                      'clientes.id as id_cliente',
                      'nota_pedidos.totalgravado',
                      'nota_pedidos.total',
                      'nota_pedidos.monto_iva',
                      'nota_pedidos.id_factura',
                      'nota_pedidos.observaciones',
                      'nota_pedidos.descuento',
                      'nota_pedidos.nro_remito',
                      'nota_pedidos.fecha_entrega',
                      'nota_pedidos.estado'
                ])           
            ->first();
           //  dd( $suma_cobranza , $datosPedidos->total);
            if ($suma_cobranza != $datosPedidos->total)
                {
                    $redirect = redirect()->back();        
                    return $redirect->with([
                        'message'    => __('Asegurese que el cliente pague la totalidad del pedido antes de emitir el remito'),
                        'alert-type' => 'error',
                    ]);
                   
                }
           // dd( $cant_ordfab_pendientes , $cant_ordfab);
            if ( $cant_ordfab_pendientes != $cant_ordfab)
                {
                // dd( $cant_ordfab_pendientes , $cant_ordfab);
                //echo 'Asegurese que el cliente empaquete y controle todas las ordenes del pedido antes de emitir el remito';
               
                $redirect = redirect()->back();        
                return $redirect->with([
                    'message'    => __('Asegurese que el cliente empaquete y controle todas las ordenes del pedido antes de emitir el remito'),
                    'alert-type' => 'error',
                ]);

                 }
            if ($datosPedidos->nro_remito==0)  
            {
                $ultimo_remito = DB::table('nota_pedidos')->max('nro_remito');
                $Pedidos_remito = DB::table('nota_pedidos')
                  ->where('id',$id_ped)
                  ->update(['nro_remito' => $ultimo_remito+1,'fecha_entrega' => today(),'estado'=> 'Entregado']);
                $ordenesfab_remito = DB::table('ordenes_fabricacion')
                  ->where('id_pedido',$id_ped)
                  ->update(['estado'=> 'Entregado']);
            }
            
 
            $detallesPedidos= DB::table('nota_pedidos')
            ->join('renglones_notapedidos','nota_pedidos.id','=','renglones_notapedidos.id_pedido')
            ->join('productos','renglones_notapedidos.id_producto','=','productos.id')
            ->where('nota_pedidos.id', $id_ped)
            ->select(['nota_pedidos.id as id_pedido',
            'renglones_notapedidos.id',
            'renglones_notapedidos.cantidad',
            'renglones_notapedidos.id_producto',
            'renglones_notapedidos.total_linea',
            'productos.unidad',
            'productos.descripcion'
            ])
            ->get();
             
           

            $datosPedidos= DB::table('nota_pedidos')
            ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
            ->where('nota_pedidos.id', $id_ped)
            ->select([ 'nota_pedidos.id as id_pedido',
                      'nota_pedidos.fecha',
                      'clientes.nombre',
                      'clientes.id as id_cliente',
                      'nota_pedidos.totalgravado',
                      'nota_pedidos.total',
                      'nota_pedidos.monto_iva',
                      'nota_pedidos.id_factura',
                      'nota_pedidos.observaciones',
                      'nota_pedidos.descuento',
                      'nota_pedidos.nro_remito',
                      'nota_pedidos.fecha_entrega',
                      'nota_pedidos.estado'
                ])           
            ->first();


              $pdf = PDF::loadView("vendor.voyager.remitos.exportar",
              compact('id_ped','texto','datosPedidos','detallesPedidos'));
              return $pdf->stream('remito.pdf');
 
        }
        public function crea_factura($id_ped){


        /*
            Usar fechas del día.

            Como se muestra en el código no deben pasarse parámetros directamente sino usar variables intermedias.

            Desde PHP se debe referenciar la clase como WSAFIPFEPHP. Por lo demás la clase tiene exactamente los mismos métodos y propiedades tal como se explica en esta documentación.
        */
        /*
            <?php

            $fe = new COM("WSAFIPFEPHP.FACTURA") or die("no se pudo crear clase WSAFIPFEPHP.factura");

            $modo = 0;

            $cuit = "aqui cuit sin separadores del emisor";

            $certificado = "ruta y nombre del certificado *.pfx";

            $licencia = " ";

            $resultado = $fe->iniciar($modo, $cuit, $certificado, $licencia);

            echo "resultado iniciar   {$fe->ultimomensajeerror}\n";

            $resultado = $fe->obtenerticketacceso();

            echo "resultado acceso   {$resultado}\n";

            echo "detalle acceso   {$fe->ultimomensajeerror}\n";

            $fe->FECabeceraCantReg = 1;

            $fe->FECabeceraPresta_serv = 1;

            $fe->indice = 0;

            $fe->FEDetalleFecha_vence_pago = "20090630";

            $fe->FEDetalleFecha_serv_desde = "20090630";

            $fe->FEDetalleFecha_serv_hasta = "20090630";

            $fe->FEDetalleImp_neto = 100;

            $fe->FEDetalleImp_total  = 121;

            $fe->FEDetalleFecha_cbte  = "20090630";

            $fe->FEDetalleNro_doc  = "aqui cuit del cliente inscripto";

            $fe->FEDetalleTipo_doc  = 80;

            $puntoventa = 1;

            $tipo = 1;

            $identificador ="1";

            $resultado = $fe->registrar($puntoventa, $tipo,$identificador);

            echo "resultado iniciar   {$fe->ultimomensajeerror}\n";

            echo "error AFIP  {$fe->permsg}\n";

            echo "resultado repetido (reproceso)   {$fe->FERespuestaReproceso}\n";

            echo "CAE   {$fe->FERespuestaDetalleCAE}\n";

            echo "numero   {$fe->FERespuestaDetalleCbt_desde}\n";

            echo "fin";

            $fe = null;

            ?>
            
        */
 
        }

    //***************************************
    //                _____
    //               |  __ \
    //               | |__) |
    //               |  _  /
    //               | | \ \
    //               |_|  \_\
    //
    //  Read an item of our Data Type B(R)EAD
    //
    //****************************************
    public function show(Request $request, $id)
    {
          
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $isSoftDeleted = false;

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $query = $model->query();

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $query = $query->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $query->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$query, 'findOrFail'], $id);
            if ($dataTypeContent->deleted_at) {
                $isSoftDeleted = true;
            }
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }
        //<<<<<<<<<<<<<<        <<<<<<<<          <<<<<<<                 <<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<    <<<<  <<<<<<    <<<<<<<<<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<    <<<<<   <<<<<          <<<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<    <<<<   <<<<<<    <<<<<<<<<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<    <<<<   <<<<<<    <<<<<<<<<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<       <<<<<<<<<<           <<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    
        $renglones=$this->obtener_lineas($id);
  
       // $totales=$this->obtener_totales_lineas($id);
    
        // Replace relationships' keys for labels and create READ links if a slug is provided.
        $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType, true);

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'read');

        // Check permission
        $this->authorize('read', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'read', $isModelTranslatable);

        $view = 'voyager::bread.read';

        if (view()->exists("voyager::$slug.read")) {
            $view = "voyager::$slug.read";
        }
        
        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'isSoftDeleted','renglones'));
        
    }

    public function ver_remito(Request $request, $id)
    {
       // $slug = $this->getSlug($request);
        $slug = 'nota-pedidos';
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $isSoftDeleted = false;

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $query = $model->query();

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $query = $query->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $query->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$query, 'findOrFail'], $id);
            if ($dataTypeContent->deleted_at) {
                $isSoftDeleted = true;
            }
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }
        //<<<<<<<<<<<<<<        <<<<<<<<          <<<<<<<                 <<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<    <<<<  <<<<<<    <<<<<<<<<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<    <<<<<   <<<<<          <<<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<    <<<<   <<<<<<    <<<<<<<<<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<    <<<<   <<<<<<    <<<<<<<<<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<       <<<<<<<<<<           <<<<<<<<<<<<     <<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    
        $renglones=$this->obtener_lineas($id);

       // $totales=$this->obtener_totales_lineas($id);
    
        // Replace relationships' keys for labels and create READ links if a slug is provided.
        $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType, true);

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'read');

        // Check permission
        $this->authorize('read', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'read', $isModelTranslatable);

        $view = 'voyager::bread.read';

        if (view()->exists("voyager::$slug.read")) {
           // $view = "voyager::$slug.read";
            $view = "vendor.voyager.remitos.read";
        }
        
        return view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'isSoftDeleted','renglones', 'id'));
        
    }
    //***************************************
    //                ______
    //               |  ____|
    //               | |__
    //               |  __|
    //               | |____
    //               |______|
    //
    //  Edit an item of our Data Type BR(E)AD
    //
    //****************************************

    public function edit(Request $request, $id)
    {
       // dd("Esto es la primer pantalla para editar");die;
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $query = $model->query();

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $query = $query->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $query->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$query, 'findOrFail'], $id);
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        $renglones=$this->obtener_lineas($id);
         
        
        foreach ($dataType->editRows as $key => $row) {
            $dataType->editRows[$key]['col_width'] = isset($row->details->width) ? $row->details->width : 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'edit');

        // Check permission
        $this->authorize('edit', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'edit', $isModelTranslatable);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }
         
         

       $id_filtro_pedido=$id;
       return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable','renglones','id_filtro_pedido'));
    }

    public function obtener_lineas($id_pedido)
    {
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<                 <<<<<<<<<           <<<<<<       <<<<<<<<    <<<<<<<<<<<<<<<<
        //<<<<     <<<<<<<<    <<<<<<<<<     <<<<<<<<<<<<         <<<<<<    <<<<<<<<<<<<<<<<
        //<<<<     <<<<<<<<   <<<<<<<<<<     <<<<<<<<<<<<     <<    <<<<    <<<<<<<<<<<<<<<<
        //<<<<             <<<<<<<<<<<<<           <<<<<<     <<<    <<    <<<<<<<<<<<<<<<<<
        //<<<<     <<<<<<     <<<<<<<<<<     <<<<<<<<<<<<     <<<<   <<<    <<<<<<<<<<<<<<<<
        //<<<<     <<<<<<<<    <<<<<<<<<     <<<<<<<<<<<<     <<<<<  <<<    <<<<<<<<<<<<<<<<
        //<<<<     <<<<<<<<<   <<<<<<<<<           <<<<<<     <<<<<         <<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        
       
/*

        return $renglones=   DB::table('nota_pedidos')
        ->join('renglones_notapedidos as r','nota_pedidos.id','=','r.id_pedido')
        ->join('productos as p','r.id_producto','=','p.id')
        ->join('rubros as rub','p.rubro_id','=','rub.id')
        ->leftjoin ('ordenes_fabricacion as of',function($join){
            $join->on('of.id_producto','=','r.id_producto')
                ->on('of.id_pedido','=','r.id_pedido');
               })
        ->select('r.id','r.id_producto','rub.rubro','p.descripcion','r.cantidad','p.unidad','p.preciovta' ,'r.total_linea', 'iva', 'nota_pedidos.id_factura as factura', 'of.estado as estado_fabricacion')
        ->where('nota_pedidos.id',$id_pedido)->get();     

    */    
    return $renglones=   DB::table('nota_pedidos')
        ->join('renglones_notapedidos as r','nota_pedidos.id','=','r.id_pedido')
        ->join('productos as p','r.id_producto','=','p.id')
        ->join('rubros as rub','p.rubro_id','=','rub.id')
        ->join('subrubros as s','p.subrubro_id','=','s.id')
        ->leftjoin ('ordenes_fabricacion as of',function($join){
            $join->on('of.id_producto','=','r.id_producto')
                ->on('of.id_pedido','=','r.id_pedido');
               })
               ->select(DB::raw('nota_pedidos.id as id_pedido,
               r.id,
               rub.rubro,
               s.descripcion_subrubro as subrubro,
               r.cantidad,
               r.id_producto,
               r.total_linea / r.cantidad as precio,
               r.total_linea,
               p.descripcion,
               p.unidad, 
               of.estado as estado_fabricacion'
               ))
        ->where('nota_pedidos.id',$id_pedido)->get();     

    }

    public function obtener_totales_NP($fecha_desde,$fecha_hasta)
    {
        return $total_importe_NP=   DB::table('nota_pedidos')
        ->whereBetween('nota_pedidos.fecha',array($fecha_desde,$fecha_hasta) ) ->where('estado', '=', 'Pendiente')->sum('nota_pedidos.total');

    }
    public function obtener_totales_lineas($id_pedido)
    {
        return $total=   DB::table('nota_pedidos')
        ->join('renglones_notapedidos as r','nota_pedidos.id','=','r.pedido_id')
        ->join('productos as p','r.producto_id','=','p.id')        
        ->where('nota_pedidos.id',$id_pedido)->sum('r.total_linea');
    }
    public function generaordenesfabricacion($id_pedido)
    {
        // if tipo_presupuesto = Muebles o tipo_presupuesto = Productos
       //  Verificar si ya genero las ordenes de fabric ->  
 
       DB::insert('insert into ordenes_fabricacion ( fecha_orden, observaciones, estado,
        fecha_entrada_proceso, fecha_salida_proceso, id_producto,cantidad, id_pedido)
        select  now(), null , "Pendiente", null, null, id_producto , cantidad, id_pedido
        from renglones_notapedidos inner join productos p on p.id = renglones_notapedidos.id_producto
        inner join rubros r on r.id = p.rubro_id
        where id_pedido =  '.$id_pedido. ' and r.categoria = "Elaboración Propia" ') ;
      
        $redirect = redirect()->back();

        return $redirect->with([
            'message'    => __('voyager::generic.successfully_updated')." {}",
            'alert-type' => 'error',
        ]);
    }

    // POST BR(E)AD
    public function update(Request $request, $id)
    {
        //dd('function update'); 
        //dd($request['detalles_string']);
        $tabla_detalles=unserialize($request['detalles_string']);
        //dd($tabla_detalles);
        // die;
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Compatibility with Model binding.
        $id = $id instanceof \Illuminate\Database\Eloquent\Model ? $id->{$id->getKeyName()} : $id;

        $model = app($dataType->model_name);
        $query = $model->query();
        if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
            $query = $query->{$dataType->scope}();
        }
        if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
            $query = $query->withTrashed();
        }

        $data = $query->findOrFail($id);

        // Check permission
        $this->authorize('edit', $data);

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->editRows, $dataType->name, $id)->validate();

        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<       <>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<    <<<<<>    >>>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   <<<<<>>>    >>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   <<<<<>>>    >>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   <<<<<>>>    >>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<               <<<<<>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   <<<<<>>>    >>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   <<<<<>>>    >>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   <<<<<>>>    >>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   <<<<<>>>    >>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
       

        $data->id_vendedor=auth()->id();
        $data->totalgravado = $request['totalgravado']; 
        
      // dd($request['totalgravado']);
      //  $data->gravadocondescuento = $data->totalgravado - $request['descuento']; 
      //  $data->monto_iva = ($data->gravadocondescuento )  * 0.21 ; 
        $data->monto_iva = ($request['totalgravado'] +  $request['descuento'] )  * 0.21 ; 
        $data->total = $request['totalgravado'] +  $request['descuento'] + $data->monto_iva;
       
        $data->save();
        
        //dd('function update');
        //  dd($request['detalles_string']);
        $tabla_detalles=unserialize($request['detalles_string']);
        //dd($tabla_detalles);  
        $this->eliminar_renglones_de_pedido($data->id);
        $this->cargar_renglones_de_pedido( $tabla_detalles,$data->id);
          

        // Get fields with images to remove before updating and make a copy of $data
        $to_remove = $dataType->editRows->where('type', 'image')
            ->filter(function ($item, $key) use ($request) {
                return $request->hasFile($item->field);
            });
        $original_data = clone($data);

        $this->insertUpdateData($request, $slug, $dataType->editRows, $data);

        // Delete Images
        $this->deleteBreadImages($original_data, $to_remove);

        event(new BreadDataUpdated($dataType, $data));

        if (auth()->user()->can('browse', app($dataType->model_name))) {
            $redirect = redirect()->route("voyager.{$dataType->slug}.index");
        } else {
            $redirect = redirect()->back();
        }

        return $redirect->with([
            'message'    => __('voyager::generic.successfully_updated')." {$dataType->getTranslatedAttribute('display_name_singular')}",
            'alert-type' => 'success',
        ]);
    }

    //***************************************
    //
    //                   /\
    //                  /  \
    //                 / /\ \
    //                / ____ \
    //               /_/    \_\
    //
    //
    // Add a new item of our Data Type BRE(A)D
    //
    //****************************************

    public function create(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
                            ? new $dataType->model_name()
                            : false;

        foreach ($dataType->addRows as $key => $row) {
            $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'add', $isModelTranslatable);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        $id_filtro_pedido=0 ; //$id;
        $renglones = null;
        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable','renglones','id_filtro_pedido'));
      //  return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
    }

    /**
     * POST BRE(A)D - Store data.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
      
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        // Validate fields with ajax
      

        $val = $this->validateBread($request->all(), $dataType->addRows)->validate();
       
        $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());
        
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<    ACTUALIZANDO LOS TOTALES      >>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

        $data->id_vendedor=auth()->id();
        $data->monto_iva=0;
        $data->total=$request['total_general'];
        $data->totalgravado=$request['total_general']; 
        $data->save();

        event(new BreadDataAdded($dataType,  $data));

        if (!$request->has('_tagging')) {
            if (auth()->user()->can('browse', $data)) {
                $redirect = redirect()->route("voyager.{$dataType->slug}.index");
            } else {
                $redirect = redirect()->back();
            }

            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<          CARGANDO LAS LINEAS             <<<<<<<<<<<<<<<<<<<<<>>>>>>>
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

            
            $tabla_detalles=unserialize($request['detalles_string']);
           // dd($request['detalles_string']);
            $this->cargar_renglones_de_pedido( $tabla_detalles,$data->id);
            
            
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

           

            return  $redirect->with([
                'message'    => __('voyager::generic.successfully_added_new')." {$dataType->getTranslatedAttribute('display_name_singular')}",
                'alert-type' => 'success',
            ]);
        } else {
            return response()->json(['success' => true, 'data' => $data]);
        }
    }

    public function eliminar_renglones_de_pedido($id_pedido)
    {
        DB::table('renglones_notapedidos')->where('id_pedido', '=', $id_pedido)->delete();
    }

    public function cargar_renglones_de_pedido($tabla_detalles,$id_pedido)
    {
       
      // dd($tabla_detalles);  
        foreach ($tabla_detalles as $r) {
             
            $renglon_np=new renglones_notapedido();
            //$renglon_np->pedido_id=$id_pedido;
            $renglon_np->id_pedido=$id_pedido; 
            $renglon_np->cantidad=$r['cantidad'];
           // $renglon_np->precio=$r['precio'];
            $renglon_np->id_producto=$r['id_producto'];
            $renglon_np->total_linea=$r['total-linea'];
            $renglon_np->iva=21;
            $renglon_np->save();              

        }
    }


    //***************************************
    //                _____
    //               |  __ \
    //               | |  | |
    //               | |  | |
    //               | |__| |
    //               |_____/
    //
    //         Delete an item BREA(D)
    //
    //****************************************

    public function destroy(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Init array of IDs
        $ids = [];
        if (empty($id)) {
            // Bulk delete, get IDs from POST
            $ids = explode(',', $request->ids);
        } else {
            // Single item delete, get ID from URL
            $ids[] = $id;
        }
        foreach ($ids as $id) {
            $data = call_user_func([$dataType->model_name, 'findOrFail'], $id);

            // Check permission
            $this->authorize('delete', $data);

            $model = app($dataType->model_name);
            if (!($model && in_array(SoftDeletes::class, class_uses_recursive($model)))) {
                $this->cleanup($dataType, $data);
            }
        }

        $displayName = count($ids) > 1 ? $dataType->getTranslatedAttribute('display_name_plural') : $dataType->getTranslatedAttribute('display_name_singular');

        $res = $data->destroy($ids);
        $data = $res
            ? [
                'message'    => __('voyager::generic.successfully_deleted')." {$displayName}",
                'alert-type' => 'success',
            ]
            : [
                'message'    => __('voyager::generic.error_deleting')." {$displayName}",
                'alert-type' => 'error',
            ];

        if ($res) {
            event(new BreadDataDeleted($dataType, $data));
        }

        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }

    public function restore(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $model = app($dataType->model_name);
        $this->authorize('delete', $model);

        // Get record
        $query = $model->withTrashed();
        if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
            $query = $query->{$dataType->scope}();
        }
        $data = $query->findOrFail($id);

        $displayName = $dataType->getTranslatedAttribute('display_name_singular');

        $res = $data->restore($id);
        $data = $res
            ? [
                'message'    => __('voyager::generic.successfully_restored')." {$displayName}",
                'alert-type' => 'success',
            ]
            : [
                'message'    => __('voyager::generic.error_restoring')." {$displayName}",
                'alert-type' => 'error',
            ];

        if ($res) {
            event(new BreadDataRestored($dataType, $data));
        }

        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }

    //***************************************
    //
    //  Delete uploaded file
    //
    //****************************************

    public function remove_media(Request $request)
    {
        try {
            // GET THE SLUG, ex. 'posts', 'pages', etc.
            $slug = $request->get('slug');

            // GET file name
            $filename = $request->get('filename');

            // GET record id
            $id = $request->get('id');

            // GET field name
            $field = $request->get('field');

            // GET multi value
            $multi = $request->get('multi');

            $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

            // Load model and find record
            $model = app($dataType->model_name);
            $data = $model::find([$id])->first();

            // Check if field exists
            if (!isset($data->{$field})) {
                throw new Exception(__('voyager::generic.field_does_not_exist'), 400);
            }

            // Check permission
            $this->authorize('edit', $data);

            if (@json_decode($multi)) {
                // Check if valid json
                if (is_null(@json_decode($data->{$field}))) {
                    throw new Exception(__('voyager::json.invalid'), 500);
                }

                // Decode field value
                $fieldData = @json_decode($data->{$field}, true);
                $key = null;

                // Check if we're dealing with a nested array for the case of multiple files
                if (is_array($fieldData[0])) {
                    foreach ($fieldData as $index=>$file) {
                        // file type has a different structure than images
                        if (!empty($file['original_name'])) {
                            if ($file['original_name'] == $filename) {
                                $key = $index;
                                break;
                            }
                        } else {
                            $file = array_flip($file);
                            if (array_key_exists($filename, $file)) {
                                $key = $index;
                                break;
                            }
                        }
                    }
                } else {
                    $key = array_search($filename, $fieldData);
                }

                // Check if file was found in array
                if (is_null($key) || $key === false) {
                    throw new Exception(__('voyager::media.file_does_not_exist'), 400);
                }

                $fileToRemove = $fieldData[$key]['download_link'] ?? $fieldData[$key];

                // Remove file from array
                unset($fieldData[$key]);

                // Generate json and update field
                $data->{$field} = empty($fieldData) ? null : json_encode(array_values($fieldData));
            } else {
                if ($filename == $data->{$field}) {
                    $fileToRemove = $data->{$field};

                    $data->{$field} = null;
                } else {
                    throw new Exception(__('voyager::media.file_does_not_exist'), 400);
                }
            }

            $row = $dataType->rows->where('field', $field)->first();

            // Remove file from filesystem
            if (in_array($row->type, ['image', 'multiple_images'])) {
                $this->deleteBreadImages($data, [$row], $fileToRemove);
            } else {
                $this->deleteFileIfExists($fileToRemove);
            }

            $data->save();

            return response()->json([
                'data' => [
                    'status'  => 200,
                    'message' => __('voyager::media.file_removed'),
                ],
            ]);
        } catch (Exception $e) {
            $code = 500;
            $message = __('voyager::generic.internal_error');

            if ($e->getCode()) {
                $code = $e->getCode();
            }

            if ($e->getMessage()) {
                $message = $e->getMessage();
            }

            return response()->json([
                'data' => [
                    'status'  => $code,
                    'message' => $message,
                ],
            ], $code);
        }
    }

    /**
     * Remove translations, images and files related to a BREAD item.
     *
     * @param \Illuminate\Database\Eloquent\Model $dataType
     * @param \Illuminate\Database\Eloquent\Model $data
     *
     * @return void
     */
    protected function cleanup($dataType, $data)
    {
        // Delete Translations, if present
        if (is_bread_translatable($data)) {
            $data->deleteAttributeTranslations($data->getTranslatableAttributes());
        }

        // Delete Images
        $this->deleteBreadImages($data, $dataType->deleteRows->whereIn('type', ['image', 'multiple_images']));

        // Delete Files
        foreach ($dataType->deleteRows->where('type', 'file') as $row) {
            if (isset($data->{$row->field})) {
                foreach (json_decode($data->{$row->field}) as $file) {
                    $this->deleteFileIfExists($file->download_link);
                }
            }
        }

        // Delete media-picker files
        $dataType->rows->where('type', 'media_picker')->where('details.delete_files', true)->each(function ($row) use ($data) {
            $content = $data->{$row->field};
            if (isset($content)) {
                if (!is_array($content)) {
                    $content = json_decode($content);
                }
                if (is_array($content)) {
                    foreach ($content as $file) {
                        $this->deleteFileIfExists($file);
                    }
                } else {
                    $this->deleteFileIfExists($content);
                }
            }
        });
    }

    /**
     * Delete all images related to a BREAD item.
     *
     * @param \Illuminate\Database\Eloquent\Model $data
     * @param \Illuminate\Database\Eloquent\Model $rows
     *
     * @return void
     */
    public function deleteBreadImages($data, $rows, $single_image = null)
    {
        $imagesDeleted = false;

        foreach ($rows as $row) {
            if ($row->type == 'multiple_images') {
                $images_to_remove = json_decode($data->getOriginal($row->field), true) ?? [];
            } else {
                $images_to_remove = [$data->getOriginal($row->field)];
            }

            foreach ($images_to_remove as $image) {
                // Remove only $single_image if we are removing from bread edit
                if ($image != config('voyager.user.default_avatar') && (is_null($single_image) || $single_image == $image)) {
                    $this->deleteFileIfExists($image);
                    $imagesDeleted = true;

                    if (isset($row->details->thumbnails)) {
                        foreach ($row->details->thumbnails as $thumbnail) {
                            $ext = explode('.', $image);
                            $extension = '.'.$ext[count($ext) - 1];

                            $path = str_replace($extension, '', $image);

                            $thumb_name = $thumbnail->name;

                            $this->deleteFileIfExists($path.'-'.$thumb_name.$extension);
                        }
                    }
                }
            }
        }

        if ($imagesDeleted) {
            event(new BreadImagesDeleted($data, $rows));
        }
    }

    /**
     * Order BREAD items.
     *
     * @param string $table
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function order(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('edit', app($dataType->model_name));

        if (empty($dataType->order_column) || empty($dataType->order_display_column)) {
            return redirect()
            ->route("voyager.{$dataType->slug}.index")
            ->with([
                'message'    => __('voyager::bread.ordering_not_set'),
                'alert-type' => 'error',
            ]);
        }

        $model = app($dataType->model_name);
        $query = $model->query();
        if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
            $query = $query->withTrashed();
        }
        $results = $query->orderBy($dataType->order_column, $dataType->order_direction)->get();

        $display_column = $dataType->order_display_column;

        $dataRow = Voyager::model('DataRow')->whereDataTypeId($dataType->id)->whereField($display_column)->first();

        $view = 'voyager::bread.order';

        if (view()->exists("voyager::$slug.order")) {
            $view = "voyager::$slug.order";
        }

        return Voyager::view($view, compact(
            'dataType',
            'display_column',
            'dataRow',
            'results'
        ));
    }

    public function update_order(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('edit', app($dataType->model_name));

        $model = app($dataType->model_name);

        $order = json_decode($request->input('order'));
        $column = $dataType->order_column;
        foreach ($order as $key => $item) {
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $i = $model->withTrashed()->findOrFail($item->id);
            } else {
                $i = $model->findOrFail($item->id);
            }
            $i->$column = ($key + 1);
            $i->save();
        }
    }

    public function action(Request $request)
    {
        $slug = $this->getSlug($request);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $action = new $request->action($dataType, null);

        return $action->massAction(explode(',', $request->ids), $request->headers->get('referer'));
    }

    /**
     * Get BREAD relations data.
     *
     * @param Request $request
     *
     * @return mixed
     */
    public function relation(Request $request)
    {
        $slug = $this->getSlug($request);
        $page = $request->input('page');
        $on_page = 50;
        $search = $request->input('search', false);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $method = $request->input('method', 'add');

        $model = app($dataType->model_name);
        if ($method != 'add') {
            $model = $model->find($request->input('id'));
        }

        $this->authorize($method, $model);

        $rows = $dataType->{$method.'Rows'};
        foreach ($rows as $key => $row) {
            if ($row->field === $request->input('type')) {
                $options = $row->details;
                $model = app($options->model);
                $skip = $on_page * ($page - 1);

                $additional_attributes = $model->additional_attributes ?? [];

                // Apply local scope if it is defined in the relationship-options
                if (isset($options->scope) && $options->scope != '' && method_exists($model, 'scope'.ucfirst($options->scope))) {
                    $model = $model->{$options->scope}();
                }

                // If search query, use LIKE to filter results depending on field label
                if ($search) {
                    // If we are using additional_attribute as label
                    if (in_array($options->label, $additional_attributes)) {
                        $relationshipOptions = $model->get();
                        $relationshipOptions = $relationshipOptions->filter(function ($model) use ($search, $options) {
                            return stripos($model->{$options->label}, $search) !== false;
                        });
                        $total_count = $relationshipOptions->count();
                        $relationshipOptions = $relationshipOptions->forPage($page, $on_page);
                    } else {
                        $total_count = $model->where($options->label, 'LIKE', '%'.$search.'%')->count();
                        $relationshipOptions = $model->take($on_page)->skip($skip)
                            ->where($options->label, 'LIKE', '%'.$search.'%')
                            ->get();
                    }
                } else {
                    $total_count = $model->count();
                    $relationshipOptions = $model->take($on_page)->skip($skip)->get();
                }

                $results = [];

                if (!$row->required && !$search && $page == 1) {
                    $results[] = [
                        'id'   => '',
                        'text' => __('voyager::generic.none'),
                    ];
                }

                // Sort results
                if (!empty($options->sort->field)) {
                    if (!empty($options->sort->direction) && strtolower($options->sort->direction) == 'desc') {
                        $relationshipOptions = $relationshipOptions->sortByDesc($options->sort->field);
                    } else {
                        $relationshipOptions = $relationshipOptions->sortBy($options->sort->field);
                    }
                }

                foreach ($relationshipOptions as $relationshipOption) {
                    $results[] = [
                        'id'   => $relationshipOption->{$options->key},
                        'text' => $relationshipOption->{$options->label},
                    ];
                }

                return response()->json([
                    'results'    => $results,
                    'pagination' => [
                        'more' => ($total_count > ($skip + $on_page)),
                    ],
                ]);
            }
        }

        // No result found, return empty array
        return response()->json([], 404);
    }

    protected function findSearchableRelationshipRow($relationshipRows, $searchKey)
    {
        return $relationshipRows->filter(function ($item) use ($searchKey) {
            if ($item->details->column != $searchKey) {
                return false;
            }
            if ($item->details->type != 'belongsTo') {
                return false;
            }

            return !$this->relationIsUsingAccessorAsLabel($item->details);
        })->first();
    }

    protected function getSortableColumns($rows)
    {
        return $rows->filter(function ($item) {
            if ($item->type != 'relationship') {
                return true;
            }
            if ($item->details->type != 'belongsTo') {
                return false;
            }

            return !$this->relationIsUsingAccessorAsLabel($item->details);
        })
        ->pluck('field')
        ->toArray();
    }

    protected function relationIsUsingAccessorAsLabel($details)
    {
        return in_array($details->label, app($details->model)->additional_attributes ?? []);
    }
}