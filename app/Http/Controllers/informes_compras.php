<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Yajra\Datatables\ButtonsServiceProvider;

class informes_compras extends Controller
{
     public function index()
     {
        return view('informes.informes_compras');
     }
 
    public function en_rango_de_fechas($from,$to)
    {

       return $datos = datatables()->of(DB::table('detalles_facturas_compras')
           ->join('facturas_compras as f','f.id','=','detalles_facturas_compras.id_factura_compra')
           ->join('productos as p','p.id','=','detalles_facturas_compras.id_producto')
           ->join('rubros as r','r.id','=','p.rubro_id')
           ->join('subrubros as sr','sr.id','=','p.subrubro_id')
           ->join('proveedores as c','c.id','=','f.id_proveedor')
           ->whereBetween('f.created_at',array($from,$to) )
           ->select(['f.tipo_factura',
                     'f.pto_venta', 
                     'f.nro_factura', 
                     'f.fecha',
                     'c.cuit',
                     'c.razonsocial',
                     'r.rubro',
                     'sr.descripcion_subrubro',
                     'p.descripcion',
                     'detalles_facturas_compras.cantidad',
                     'detalles_facturas_compras.total_linea'  ])) 
         
            ->toJson();  
     
    }

    
}

