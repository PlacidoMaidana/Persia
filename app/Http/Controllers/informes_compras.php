<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Yajra\Datatables\ButtonsServiceProvider;
use App\Exports\informe_comprasExport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;

class informes_compras extends Controller
{
     public function index()
     {
        return view('informes.informes_compras');
     }
 
    public function en_rango_de_fechas($from,$to)
    {

       return $datos = datatables()->of(DB::table('facturas_compras')
           ->join('proveedores as c','c.id','=','facturas_compras.id_proveedor')
           ->join('tipos_gastos as tg','tg.id','=','facturas_compras.id_tipo_gasto')
           ->whereBetween('facturas_compras.created_at',array($from,$to) )
           ->select(['facturas_compras.fecha',
                     'c.razonsocial',
                     'c.cuit',
                     'facturas_compras.tipo_factura',
                     'facturas_compras.pto_venta', 
                     'facturas_compras.nro_factura', 
                     'facturas_compras.total_factura', 
                     'facturas_compras.estado_pago', 
                     'tg.tipo1', 
                     'tg.tipo2'  ])) 
         
            ->toJson();  
     
    }
    public function export($desde,$hasta) 
    {
      $aa = new Informe_comprasExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'informe_compras.xlsx');
      //dd($aa)  ;

    } 
    
}

