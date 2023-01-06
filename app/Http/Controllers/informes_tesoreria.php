<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Exports\informe_tesoreriaExport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;


class informes_tesoreria extends Controller
{
     public function index()
     {
        return view('informes.informes_tesoreria');
     }
 
    public function en_rango_de_fechas($from,$to)
    {

       return $datos = datatables()->of(DB::table('mov_financieros')
           -> join ('facturas_compras','mov_financieros.id_factura_compra','=','facturas_compras.id')
           ->leftjoin ('tipos_gastos','facturas_compras.id_tipo_gasto','=','tipos_gastos.id')
           ->leftjoin('empleados','empleados.id','=','mov_financieros.id_usuario')
           ->whereBetween('mov_financieros.created_at',array($from,$to) )
           ->select(['mov_financieros.fecha',
                     'empleados.apellidoynombre',
                     'mov_financieros.nro_recibo', 
                     'mov_financieros.modalidad_pago',
                     'mov_financieros.detalle',
                     'mov_financieros.tipo_movimiento',
                     'tipos_gastos.tipo1',
                     'tipos_gastos.tipo2',
                     'mov_financieros.importe_egreso',
                     'mov_financieros.importe_ingreso'  ]))
            ->toJson();  
     
    }
    public function export($desde,$hasta) 
    {
      $aa = new informe_tesoreriaExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'informe_tesoreria.xlsx');
      //dd($aa)  ;

    } 
    
}

