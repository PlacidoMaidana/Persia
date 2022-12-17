<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Exports\informe_flujofinancieroExport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;


class informes_flujofinanciero extends Controller
{
     public function index()
     {
        return view('informes.informes_flujofinanciero');
     }
 
    public function en_rango_de_fechas($anio)
    {
     
      return $egresosmes = datatables()->of(DB::table('mov_financieros')
      ->join ('tipos_gastos','mov_financieros.id_tipo_gasto','=','tipos_gastos.id')
      -> where ('mov_financieros.tipo_movimiento', '=' ,'Gastos/Egresos')
      //-> where (DB::raw('year(mov_financieros.fecha)', '=' ,$anio))
      ->select(['id_tipo_gasto', 'tipos_gastos.tipo1', 'tipos_gastos.tipo2', 
               DB::raw('SUM(IF(MONTH(fecha)=1, importe_egreso, NULL)) AS Ene'),
               DB::raw('SUM(IF(MONTH(fecha)=2, importe_egreso, NULL)) AS Feb'),
               DB::raw('SUM(IF(MONTH(fecha)=3, importe_egreso, NULL)) AS Mar'),
               DB::raw('SUM(IF(MONTH(fecha)=4, importe_egreso, NULL)) AS Abr'),
               DB::raw('SUM(IF(MONTH(fecha)=5, importe_egreso, NULL)) AS May'),
               DB::raw('SUM(IF(MONTH(fecha)=6, importe_egreso, NULL)) AS Jun'),
               DB::raw('SUM(IF(MONTH(fecha)=7, importe_egreso, NULL)) AS Jul'),
               DB::raw('SUM(IF(MONTH(fecha)=8, importe_egreso, NULL)) AS Ago'),
               DB::raw('SUM(IF(MONTH(fecha)=9, importe_egreso, NULL)) AS Sep'),
               DB::raw('SUM(IF(MONTH(fecha)=10, importe_egreso, NULL)) AS Octu'),
               DB::raw('SUM(IF(MONTH(fecha)=11, importe_egreso, NULL)) AS Nov'),
               DB::raw('SUM(IF(MONTH(fecha)=12, importe_egreso, NULL)) AS Dic')] )
            
               ->groupBy('id_tipo_gasto','tipos_gastos.tipo1', 'tipos_gastos.tipo2'))
            ->toJson();  
      
    }
    
    
    public function export($anio) 
    {
      $aa = new informe_flujofinancieroExport();
      $aa->desde=$anio;
     
       return Excel::download($aa, 'informe_flujo_financiero.xlsx');
      //dd($aa)  ;

    } 
   
    
}

