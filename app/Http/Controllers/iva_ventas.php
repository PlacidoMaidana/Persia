<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class iva_ventas extends Controller
{
     public function index()
     {
        return view('informes.iva_ventas');
     }
 
    public function en_rango_de_fechas($from,$to)
    {
      
       return $datos = datatables()->of(DB::table('facturas_compras')
           ->join('proveedores as p','p.id','=','facturas_compras.id_proveedor')
           ->whereBetween('facturas_compras.created_at',array($from,$to) )
           ->select(['facturas_compras.tipo_factura',
                     'facturas_compras.pto_venta', 
                     'facturas_compras.nro_factura', 
                     'facturas_compras.fecha',
                     'p.cuit',
                     'facturas_compras.subtotal',
                     'facturas_compras.iva_21',
                     'facturas_compras.total_factura'  ]))
            ->toJson();  
     
    }

    
}

