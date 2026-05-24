<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Maatwebsite\Excel\Concerns\FromCollection;
use App\Exports\Iva_ventasExport;
use Maatwebsite\Excel\Facades\Excel;


class iva_ventas extends Controller
{
     public function index()
     {
        return view('informes.iva_ventas');
     }
 
    public function en_rango_de_fechas($from,$to)
    {
      
       return $datos = datatables()->of(DB::table('facturas_ventas')
           ->join('clientes as c','c.id','=','facturas_ventas.id_cliente')
           ->whereBetween('facturas_ventas.created_at',array($from,$to) )
           ->select(['facturas_ventas.tipo_factura',
                     'facturas_ventas.pto_venta', 
                     'facturas_ventas.nro_factura', 
                     'facturas_ventas.fecha',
                     'c.cuit',
                     'c.nombre',
                     'facturas_ventas.totalGravado',
                     'facturas_ventas.monto_iva21',
                     'facturas_ventas.total'  ]))
            ->toJson();  
     
    }
    public function export($desde,$hasta) 
    {
      $aa = new Iva_ventasExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'iva_ventas.xlsx');
      //dd($aa)  ;

    } 
    
}

