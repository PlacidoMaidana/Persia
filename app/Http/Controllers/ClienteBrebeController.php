<?php

namespace App\Http\Controllers;

use TCG\Voyager\Facades\Voyager;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class ClienteBrebeController extends \TCG\Voyager\Http\Controllers\VoyagerBaseController //extends Controller
{
    //
    public function nuevo( $pedido )    
    {
        $Nota_pedido_id=3;
        $slug='clientes';
        $dataType = DB::table('data_types')->where('slug', '=', $slug)->first();
       
        // Check permission
        $this->authorize('add', app($dataType->model_name));

        // $dataTypeContent = (DB::table('data_types')
        // ->join('data_rrows as r','data_types.id','=','r.data_type_id')
        // ->select('r.field', 'r.type', 'r.display_name', 'r.required'))
        // ->where('r.data_type_id','=',13);

        $dataTypeContent = DB::table('data_rows')
        ->select('field', 'type', 'display_name', 'required')
        ->where('data_type_id','=',13)->get();
     

        //dd($dataTypeContent);
        


        return view('vendor.voyager.clientes.fichaCliente_NotaPedido', compact( 'Nota_pedido_id',
                     'dataType',
                     'dataTypeContent'  ));
    }

    public function clientes_elegir()
    {
        return datatables()->of(DB::table('clientes')
        ->select([  'clientes.id',
                'clientes.nombre',
                'clientes.cuit',
                'clientes.direccion'                
              ]))
    ->addColumn('seleccionar',"vendor/voyager/nota-pedidos/boton_seleccionarCliente")
    ->rawColumns(['seleccionar'])     
    ->toJson();   
           
    }


}
