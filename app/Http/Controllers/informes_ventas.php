<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class informes_ventas extends Controller
{
     public function index()
     {
        return view('informes.informes_ventas');
     }
 
    public function en_rango_de_fechas($from,$to)
    {

       return $datos = datatables()->of(DB::table('renglones_notapedidos')
           ->join('nota_pedidos as np','np.id','=','renglones_notapedidos.id_pedido')
           ->leftjoin('facturas_ventas as f','f.id','=','renglones_notapedidos.id_factura')
           ->join('productos as p','p.id','=','renglones_notapedidos.id_producto')
           ->join('rubros as r','r.id','=','p.rubro_id')
           ->join('subrubros as sr','sr.id','=','p.subrubro_id')
           ->join('clientes as c','c.id','=','np.id_cliente')
           ->whereBetween('np.created_at',array($from,$to) )
           ->select(['f.tipo_factura',
                     'f.pto_venta', 
                     'f.nro_factura', 
                     'np.fecha',
                     'c.cuit',
                     'c.nombre',
                     'r.rubro',
                     'sr.descripcion_subrubro',
                     'p.descripcion',
                     'renglones_notapedidos.cantidad',
                     'renglones_notapedidos.total_linea'  ]))
            ->toJson();  
     
    }

    
}

