<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Exports\iva_comprasExport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;



class iva_compras extends Controller
{
     public function index()
     {
        return view('informes.iva_compras');
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
                      'facturas_compras.exento',
                      'facturas_compras.iva_10_5',
                      'facturas_compras.iva_21',
                      'facturas_compras.iva_27',
                      'facturas_compras.monto_perc_iibb',
                      'facturas_compras.monto_percepcion_iva',
                      'facturas_compras.monto_percep_ganancias',
                      'facturas_compras.otros_impuestos',
                      'facturas_compras.total_factura'  ]))
             ->toJson();  
      
     }
     public function export($desde,$hasta) 
    {
      $aa = new Iva_comprasExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'iva_compras.xlsx');
      //dd($aa)  ;

    } 
   
}

