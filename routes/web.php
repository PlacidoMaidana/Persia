<?php

use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/enlace_simbolico', function () {
    Artisan::call('storage:link');
});

Route::get('/', function () {
    return view('welcome');
});


Route::get('/simbolico', function () {
  Artisan::call('storage:link');
   echo "el enlace simbolico fue ejecutado";
});

Route::get('/ComponenteUser', function () {
    return view('User.ComponenteUser');
});
Route::get('/embebido2', function () {
    return view('livewire.cliente');
});

Route::get('/cli-component','App\Http\Livewire\Cliente');
Route::get('/embebido','App\Http\Livewire\Pedidos\EmbebidoComponent');


Route::get('/embebido/{id}','App\Http\Livewire\pedidos\embebidocomponent@mostrar');

Route::get('/IVAcompras','App\Http\Controllers\iva_compras@index');
Route::get('/IVAventas','App\Http\Controllers\iva_ventas@index');
Route::get('/Informeventas','App\Http\Controllers\informes_ventas@index');
Route::get('/Informecompras','App\Http\Controllers\informes_compras@index');
Route::get('/Informetesoreria','App\Http\Controllers\informes_tesoreria@index');
Route::get('/informe_productos', 'App\Http\Controllers\informesProductos@index');

Route::get('/ivavtas_en_rango_de_fechas/{from}/{to}','App\Http\Controllers\iva_ventas@en_rango_de_fechas');//ruta que devuelve datos
Route::get('/ivacomprasen_rango_de_fechas/{from}/{to}','App\Http\Controllers\iva_compras@en_rango_de_fechas');//ruta que devuelve datos
Route::get('/informevtas_rango_de_fechas/{from}/{to}','App\Http\Controllers\informes_ventas@en_rango_de_fechas');//ruta que devuelve datos
Route::get('/informecompras_rango_de_fechas/{from}/{to}','App\Http\Controllers\informes_compras@en_rango_de_fechas');//ruta que devuelve datos
Route::get('/informetesoreria_rango_de_fechas/{from}/{to}','App\Http\Controllers\informes_tesoreria@en_rango_de_fechas');//ruta que devuelve datos
Route::get('/vtasproductos_en_rango_de_fechas/{from}/{to}','App\Http\Controllers\informesProductos@en_rango_de_fechas');//ruta que devuelve datos

Route::get('productos/export/{from}/{to}', 'App\Http\Controllers\informesProductos@export');
Route::get('informes_compras/export/', 'App\Http\Controllers\informes_compras@export');
Route::get('informes_ventas/export/', 'App\Http\Controllers\informes_ventas@export');
Route::get('informes_tesoreria/export/', 'App\Http\Controllers\informes_tesoreria@export');
Route::get('iva_compras/export/{from}/{to}', 'App\Http\Controllers\Iva_compras@export');
Route::get('iva_ventas/export/{from}/{to}', 'App\Http\Controllers\iva_ventas@export');


Route::get('/tabla_productos_elegir', function () {
    return view('vendor.voyager.nota-pedidos.tabla_productos_elegir');
});

Route::get('/clientes_create_modal', function () {
    return view('vendor.voyager.clientes.ficha_extra');
});

Route::get('/tabla_insumos_elegir', function () {
  return view('vendor.voyager.productos.tabla_insumos_elegir');
});

Route::get('/insumos_elegir', function () {
     
  return datatables()->of(DB::table('productos')
  ->join('rubros as r','productos.rubro_id','=','r.id')
  ->join('subrubros as s','productos.subrubro_id','=','s.id')
  ->where('r.categoria','=', 'Materia Prima')
  ->select(['productos.id as id', 'descripcion', 's.descripcion_subrubro as subrubro']))
  ->addColumn('seleccionar','vendor/voyager/productos/boton_seleccionar')
  ->rawColumns(['seleccionar'])   
  ->toJson();    

});
Route::get('/productos_elegir', function () {
     
    return datatables()->of(DB::table('productos')
    ->join('rubros as r','productos.rubro_id','=','r.id')
    ->join('subrubros as s','productos.subrubro_id','=','s.id')
    ->select(['productos.id as id', 'descripcion', 'r.rubro as rubro', 's.descripcion_subrubro as subrubro', 'preciovta']))
    ->addColumn('seleccionar','vendor/voyager/nota-pedidos/boton_seleccionar')
    ->rawColumns(['seleccionar'])   
    ->toJson();    
 
 });

 
 Route::get('/localidades_elegir', function () {
     
    return datatables()->of(DB::table('localidades')
    ->select(['id', 'provincia', 'localidad']))
    ->addColumn('seleccionar','vendor/voyager/localidad/boton_seleccionar')
    ->rawColumns(['seleccionar'])   
    ->toJson();    
 
 });

 Route::get('/subrubro_elegir', function () {     
    //  $d =DB::table('subrubros as s')
    //  ->join('rubros','rubros.id','=','s.rubro_id')
    //  ->select(['rubros.id as id_rubro', 'rubros.rubro','s.id as id_subrubro','s.descripcion_subrubro'])->get();

    return datatables()->of(DB::table('rubros')
    ->join('subrubros as s','rubros.id','=','s.rubro_id')
    ->select(['rubros.id as id_rubro', 'rubros.rubro','s.id as id_subrubro','s.descripcion_subrubro']))
    ->addColumn('seleccionar','vendor/voyager/rubros/boton_seleccionar')
    ->rawColumns(['seleccionar'])   
    ->toJson();   

   
    // dd($d);
 
 });
/////////////////////////////////////////// 
//      IMPRESION DE PRESUPUESTO O PEDIDO
///////////////////////////////////////////
 Route::get('pedidos/export/{id_ped}', 'App\Http\Controllers\Voyager\PedidosController@createPDF');

 Route::get('/exportar_pedidos', function () {     
  return datatables()->of(DB::table('nota_pedidos')
  ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
  ->where('nota_pedidos.estado','=', 'Entregado')
  ->select([  'nota_pedidos.id as id_pedido',
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
            ]))              
  ->toJson();   

});

/////////////////////////////////////////// 
//      IMPRESION DE ORDEN DE FABRICACION 
///////////////////////////////////////////
Route::get('ordenes_fabricacion/export/{id_ped}', 'App\Http\Controllers\Voyager\OrdenesFabricController@createPDF');

Route::get('/exportar_ordenes_fabricacion', function () {     
 return datatables()->of(DB::table('ordenes_fabricacion') 
 ->join('nota_pedidos','ordenes_fabricacion.id_pedido','=','nota_pedidos.id')
 ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
 ->join('productos','ordenes_fabricacion.id_producto','=','productos.id')
 ->where('ordenes_fabricacion.estado','!=', 'Entregado')
 ->select([  'ordenes_fabricacion.id as id_orden',
             'ordenes_fabricacion.fecha',
             'clientes.nombre',
             'clientes.id as id_cliente',
             'ordenes_fabricacion.id_producto',
             'ordenes_fabricacion.cantidad',
             'productos.descripcion'
           ]))              
 ->toJson();   

});


//////////////////////////////////////////////////////////
// GRILLA DE NOTAS DE PEDIDOS
//////////////////////////////////////////////////////////

 Route::get('/pedidos_pendientes', function () {     
    return datatables()->of(DB::table('nota_pedidos')
    ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
    ->join('empleados','nota_pedidos.id_vendedor','=','empleados.id')
    ->where('nota_pedidos.estado','=', 'Pendiente Aprobacion')
    ->select([  'nota_pedidos.id as id_pedido',
                'nota_pedidos.fecha',
                'clientes.nombre',
                'clientes.id as id_cliente',
                'empleados.apellidoynombre as vendedor',
                'nota_pedidos.total',
                'nota_pedidos.estado'
              ]))
    ->addColumn('check','vendor/voyager/nota-pedidos/check_pedido')
    ->addColumn('accion','vendor/voyager/nota-pedidos/acciones_NPedidos')
    ->rawColumns(['check','accion'])     
    ->toJson();   
 
 });
 Route::get('/pedidos_terminados', function () {     
  return datatables()->of(DB::table('nota_pedidos')
  ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
  ->join('empleados','nota_pedidos.id_vendedor','=','empleados.id')
  ->where('nota_pedidos.estado','=', 'Entregado')
  ->select([  'nota_pedidos.id as id_pedido',
              'nota_pedidos.fecha',
              'clientes.nombre',
              'clientes.id as id_cliente',
              'empleados.apellidoynombre as vendedor',
              'nota_pedidos.total',
              'nota_pedidos.estado'
            ]))   
    ->addColumn('check','vendor/voyager/nota-pedidos/check_pedido')
    ->addColumn('accion','vendor/voyager/nota-pedidos/acciones_NPedidos')
    ->rawColumns(['check','accion'])   
    ->toJson();   
 
 });
 
 Route::get('/pedidos_negativos', function () {     
  return datatables()->of(DB::table('nota_pedidos')
  ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
  ->join('empleados','nota_pedidos.id_vendedor','=','empleados.id')
  ->where('nota_pedidos.estado','=', 'Rechazado')
  ->select([  'nota_pedidos.id as id_pedido',
              'nota_pedidos.fecha',
              'clientes.nombre',
              'clientes.id as id_cliente',
              'empleados.apellidoynombre as vendedor',
              'nota_pedidos.total',
              'nota_pedidos.estado'
            ]))   
    ->addColumn('check','vendor/voyager/nota-pedidos/check_pedido')
    ->addColumn('accion','vendor/voyager/nota-pedidos/acciones_NPedidos')
    ->rawColumns(['check','accion'])   
    ->toJson();   
 
 });
 Route::get('/pedidos_abiertos', function () {     
  return datatables()->of(DB::table('nota_pedidos')
  ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
  ->join('empleados','nota_pedidos.id_vendedor','=','empleados.id')
  ->where('nota_pedidos.estado','=', 'Pendiente Entrega')
  ->select([  'nota_pedidos.id as id_pedido',
              'nota_pedidos.fecha',
              'clientes.nombre',
              'clientes.id as id_cliente',
              'empleados.apellidoynombre as vendedor',
              'nota_pedidos.total',
              'nota_pedidos.estado'
            ]))   
    ->addColumn('check','vendor/voyager/nota-pedidos/check_pedido')
    ->addColumn('accion','vendor/voyager/nota-pedidos/acciones_NPedidos')
    ->rawColumns(['check','accion'])   
    ->toJson();   
 
 });
 //////////////////////////////////FIN GRILLA NOTA PEDIDOS
 Route::get('/pagar_pedidos/{id_pedido}', function ($id_pedido) {
     Session()->flash('id_pedido', $id_pedido);
     return redirect(url('admin/mov-financieros/create'));
 });
  
   Route::get('/ordenes_fabricacion_activas', function () {     
    return datatables()->of(DB::table('ordenes_fabricacion')
  ->join('productos','ordenes_fabricacion.id_producto','=','productos.id')
  ->join('rubros','productos.rubro_id','=','rubros.id')
  ->join('subrubros','productos.subrubro_id','=','subrubros.id')
  ->leftjoin('moldes','moldes.id','=','productos.id_molde')
  ->where('ordenes_fabricacion.estado','!=', 'Entregado')
  ->select( DB::raw('

                  ordenes_fabricacion.id_pedido as id_pedido,
                  ordenes_fabricacion.id as id_orden_fabricacion,
                  productos.descripcion,
                  rubros.rubro,
                  subrubros.descripcion_subrubro,
                  ordenes_fabricacion.cantidad,  
                  (ordenes_fabricacion.cantidad / (moldes.mt2_por_molde * moldes.cant_moldes)) as dias,
                    (ordenes_fabricacion.cantidad * productos.unidades_mt2) as unidades,
                    (ordenes_fabricacion.cantidad * productos.paquetes_mt2) as paquetes,                  
                  ordenes_fabricacion.fecha_orden,
                  ordenes_fabricacion.fecha_entrada_proceso,
                  ordenes_fabricacion.fecha_salida_proceso,
                  ordenes_fabricacion.estado'
                    )))
  ->addColumn('check','vendor/voyager/ordenes_fabricacion/check_ordenes_fabricacion')
  ->addColumn('accion','vendor/voyager/ordenes_fabricacion/acciones_ordenes_fabricacion')
  ->rawColumns(['check','accion'])     
  ->toJson();   
});

Route::get('/ordenes_fabricacion_cerradas', function () {     
  return datatables()->of(DB::table('ordenes_fabricacion')
->join('productos','ordenes_fabricacion.id_producto','=','productos.id')
->join('rubros','productos.rubro_id','=','rubros.id')
->join('subrubros','productos.subrubro_id','=','subrubros.id')
->leftjoin('moldes','moldes.id','=','productos.id_molde')
->where('ordenes_fabricacion.estado','=', 'Entregado')
->select( DB::raw('

                ordenes_fabricacion.id_pedido as id_pedido,
                ordenes_fabricacion.id as id_orden_fabricacion,
                productos.descripcion,
                rubros.rubro,
                subrubros.descripcion_subrubro,
                ordenes_fabricacion.cantidad,  
                (ordenes_fabricacion.cantidad / (moldes.mt2_por_molde * moldes.cant_moldes)) as dias,
                  (ordenes_fabricacion.cantidad * productos.unidades_mt2) as unidades,
                  (ordenes_fabricacion.cantidad * productos.paquetes_mt2) as paquetes,                  
                ordenes_fabricacion.fecha_orden,
                ordenes_fabricacion.fecha_entrada_proceso,
                ordenes_fabricacion.fecha_salida_proceso,
                ordenes_fabricacion.estado'
                  )))
->addColumn('check','vendor/voyager/ordenes_fabricacion/check_ordenes_fabricacion')
->addColumn('accion','vendor/voyager/ordenes_fabricacion/acciones_ordenes_fabricacion')
->rawColumns(['check','accion'])     
->toJson();   
});



/*
  Route::get('/ordenes_fabricacion_cerradas', function () {     
    return datatables()->of(DB::table('ordenes_fabricacion')
    ->join('productos','ordenes_fabricacion.id_producto','=','productos.id')
    ->join('rubros','productos.rubro_id','=','rubros.id')
    ->join('subrubros','productos.subrubro_id','=','subrubros.id')
    ->leftjoin('moldes','moldes.id','=','productos.id_molde')
    ->where('ordenes_fabricacion.estado','=', 'Entregado')
    ->select([  'ordenes_fabricacion.id as id_orden_fabricacion',
                'productos.descripcion',
                'rubros.rubro',
                'subrubros.descripcion_subrubro',
                'ordenes_fabricacion.cantidad',
                '(ordenes_fabricacion.cantidad / (moldes.mt2_por_molde * moldes.cant_moldes)) as dias',
                '(ordenes_fabricacion.cantidad / productos.unidades_mt2) as unidades',
                '(ordenes_fabricacion.cantidad / productos.paquetes_mt2) as paquetes',
                'ordenes_fabricacion.fecha_orden',
                'ordenes_fabricacion.fecha_entrada_proceso',
                'ordenes_fabricacion.fecha_salida_proceso',
                'ordenes_fabricacion.estado'

              ]))
    ->addColumn('check','vendor\voyager\ordenes_fabricacion\check_ordenes_fabricacion')
    ->addColumn('accion','vendor\voyager\ordenes_fabricacion\acciones_ordenes_fabricacion')
    ->rawColumns(['check','accion'])     
    ->toJson();   
  });
*/

 Route::get('/productos_para_venta', function () {     
    return datatables()->of(DB::table('productos')
    ->join('rubros','productos.rubro_id','=','rubros.id')
    ->join('subrubros','productos.subrubro_id','=','subrubros.id')
    ->where('rubros.categoria','=', 'Productos Reventa')
    ->select([  'productos.id as id_producto',
                'productos.descripcion',
                'rubros.rubro',
                'subrubros.descripcion_subrubro',
                'productos.preciovta',
                'productos.unidad',
                'productos.activo',
                'rubros.categoria'
              ]))
    ->addColumn('check','vendor/voyager/productos/check_productos')
    ->addColumn('accion','vendor/voyager/productos/acciones_productosrevta')
    ->rawColumns(['check','accion'])     
    ->toJson();   
  });

  Route::get('/admin/productos/{id_producto}/editrevta', 'App\Http\Controllers\Voyager\ProductosController@editrevta');

  Route::get('/fabricacion_propia', function () {     
    return datatables()->of(DB::table('productos')
    ->join ('rubros','productos.rubro_id','=','rubros.id')
    ->join ('subrubros','productos.subrubro_id','=','subrubros.id')
    ->where('rubros.categoria','=', 'Elaboración Propia')
    ->select([  'productos.id as id_producto',
                'productos.descripcion',
                'rubros.rubro',
                'subrubros.descripcion_subrubro',
                'productos.preciovta',
                'productos.unidad',
                'productos.activo', 
                'rubros.categoria'
              ]))
    ->addColumn('check','vendor/voyager/productos/check_productos')
    ->addColumn('accion','vendor/voyager/productos/acciones_FP')
    ->rawColumns(['check','accion'])     
    ->toJson();   

 });

  Route::get('/admin/productos/{id_producto}/editFP', 'App\Http\Controllers\Voyager\ProductosController@editFP');

  Route::get('/materia_prima', function () {     
    return datatables()->of(DB::table('productos')
    ->join ('rubros','productos.rubro_id','=','rubros.id')
    ->join ('subrubros','productos.subrubro_id','=','subrubros.id')
    ->where('rubros.categoria','=', 'Materia Prima')
    ->select([  'productos.id as id_producto',
                'productos.descripcion',
                'rubros.rubro',
                'subrubros.descripcion_subrubro',
                'productos.preciovta',
                'productos.unidad',
                'productos.activo', 
                'rubros.categoria'
              ]))
    ->addColumn('check','vendor/voyager/productos/check_productos')
    ->addColumn('accion','vendor/voyager/productos/acciones_MP')
    ->rawColumns(['check','accion'])     
    ->toJson();   
 });

 Route::get('/admin/productos/{id_producto}/editMP', 'App\Http\Controllers\Voyager\ProductosController@editMP');


///////////////////////////////////////////////////
//                COBRANZAS DE NOTAS DE PEDIDO
////////////////////////////////////////////////////

Route::get('/CobranzasPedido/{pedido}', 'App\Http\Controllers\Voyager\MovFinancieroController@CobranzasPedido');

Route::get('/cobranzas_notapedido/{id_notapedido}', function ($id_notapedido) {
     
 return datatables()->of(DB::table('mov_financieros')
 ->select(['mov_financieros.id as id', 'fecha', 'detalle', 'importe_ingreso'])
 ->where('id_nota_pedido' , '=' ,$id_notapedido))
 ->addColumn('check','vendor/voyager/mov-financieros/check')
 ->addColumn('accion','vendor/voyager/mov-financieros/acciones_ingresos')
 ->rawColumns(['check','accion'])  
 ->toJson();    

}); 

///////////////////////////////////////////////////
//                  MOVIMIENTOS FINANCIEROS 
////////////////////////////////////////////////////



 Route::get('/admin/movimientos_financieros/{id}/ingresos', 'App\Http\Controllers\Voyager\MovFinancieroController@Ingresos');

 Route::get('/Ingresos', function () {     
  return datatables()->of(DB::table('mov_financieros')
  ->join('users','users.id','=','mov_financieros.id_usuario') 
  ->join('nota_pedidos','nota_pedidos.id','=','mov_financieros.id_nota_pedido') 
  ->join('clientes','clientes.id','=','nota_pedidos.id_cliente') 
  ->where('mov_financieros.tipo_movimiento','=', 'Cobranza/Ingresos')
  ->select([  'mov_financieros.id as id',
              'mov_financieros.id_nota_pedido as pedido',
              'clientes.nombre as cliente',
              'mov_financieros.tipo_movimiento',
              'mov_financieros.fecha',
              'mov_financieros.modalidad_pago',
              'mov_financieros.detalle',
              'mov_financieros.importe_ingreso',
              'mov_financieros.id_caja',
              'users.name'
            ]))
  ->addColumn('check','vendor/voyager/movimientos_financieros/check')
  ->addColumn('accion','vendor/voyager/movimientos_financieros/acciones_ingresos')
  ->rawColumns(['check','accion'])     
  ->toJson();   
});


//
Route::get('/admin/movimientos_financieros/{id}/egresos', 'App\Http\Controllers\Voyager\MovFinancieroController@Egresos');

Route::get('/Egresos', function () {     
  return datatables()->of(DB::table('mov_financieros')
  ->join('Tipos_gastos','Tipos_gastos.id','=','mov_financieros.id_tipo_gasto')
  ->join('users','users.id','=','mov_financieros.id_usuario') 
  ->where('mov_financieros.tipo_movimiento','=', 'Gastos/Egresos')
  ->select([  'mov_financieros.id as id',
              'mov_financieros.tipo_movimiento',
              'mov_financieros.fecha',
              'mov_financieros.modalidad_pago',
              'Tipos_gastos.tipo1',
              'Tipos_gastos.tipo2',
              'mov_financieros.detalle',
              'mov_financieros.importe_egreso',
              'mov_financieros.id_caja',
              'users.name'
            ]))
  ->addColumn('check','vendor/voyager/movimientos_financieros/check')
  ->addColumn('accion','vendor/voyager/movimientos_financieros/acciones_egresos')
  ->rawColumns(['check','accion'])     
  ->toJson();   
});



Route::get('/admin/movimientos_financieros/{id}/edit_otrosmov', 'App\Http\Controllers\Voyager\MovFinancieroController@Otros_movfinancieros');
Route::get('/Otros_movfinancieros', function () {     
  return datatables()->of(DB::table('mov_financieros')
  ->join('users','users.id','=','mov_financieros.id_usuario') 
  ->whereNotIn('mov_financieros.tipo_movimiento', ['Gastos/Egresos', 'Cobranza/Ingresos'])
  ->select([  'mov_financieros.id as id',
              'mov_financieros.tipo_movimiento',
              'mov_financieros.fecha',
              'mov_financieros.modalidad_pago',
              'mov_financieros.detalle',
              'mov_financieros.importe_ingreso',
              'mov_financieros.importe_egreso',
              'mov_financieros.id_caja',
              'users.name'
            ]))
  ->addColumn('check','vendor/voyager/movimientos_financieros/check')
  ->addColumn('accion','vendor/voyager/movimientos_financieros/acciones_otrosmov')
  ->rawColumns(['check','accion'])     
  ->toJson();   
});



///////////////////////


Route::get('/vista', function () {
    return view('vista_suelta');
});

Route::get('/productos', function () {
    return view('Livewire.productos.seleccionarcomponent');
});

Route::get('admin/clientes/create2/{np_create}','App\Http\Controllers\ClienteBrebeController@nuevo');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();   

});
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

//+------------------------------------------------------------------+
//|                   Rutas de acción de cobranzas                   |
//+------------------------------------------------------------------+
Route::get('/admin/mov-financieros/{id_movimiento}/edit_cobranzas', 'App\Http\Controllers\Voyager\MovFinancieroController@edit_cobranzas');
Route::get('/admin/mov-financieros/create_cobranzas/{id_pedido}', 'App\Http\Controllers\Voyager\MovFinancieroController@cobranzas_create');
 
//Route::get('admin/movimientos_financieros/create','App\Http\Controllers\Voyager\MovFinancieroController@cobranzas_create');
//Route::get('pagos/{id}/edit','App\Http\Controllers\ClienteBrebeController@nuevo');




