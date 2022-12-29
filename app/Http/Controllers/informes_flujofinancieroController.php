<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Exports\Informe_flujofinancieroExport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;


class informes_flujofinancieroController extends Controller
{
     public function index()
     {
        return view('informes.informes_flujofinanciero');
     }
 
    public function en_rango_de_fechas($anio)
    {
      /*
      return $egresosmes = datatables()->of(DB::table('mov_financieros')
      ->join ('tipos_gastos','mov_financieros.id_tipo_gasto','=','tipos_gastos.id')
      -> where ('mov_financieros.tipo_movimiento','=','Gastos/Egresos')
      ->select(['id_tipo_gasto', 'tipos_gastos.tipo1', 'tipos_gastos.tipo2', 
               DB::raw('SUM(IF(MONTH(fecha)=1 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Ene'),
               DB::raw('SUM(IF(MONTH(fecha)=2 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Feb'),
               DB::raw('SUM(IF(MONTH(fecha)=3 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Mar'),
               DB::raw('SUM(IF(MONTH(fecha)=4 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Abr'),
               DB::raw('SUM(IF(MONTH(fecha)=5 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS May'),
               DB::raw('SUM(IF(MONTH(fecha)=6 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Jun'),
               DB::raw('SUM(IF(MONTH(fecha)=7 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Jul'),
               DB::raw('SUM(IF(MONTH(fecha)=8 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Ago'),
               DB::raw('SUM(IF(MONTH(fecha)=9 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Sep'),
               DB::raw('SUM(IF(MONTH(fecha)=10 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Octu'),
               DB::raw('SUM(IF(MONTH(fecha)=11 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Nov'),
               DB::raw('SUM(IF(MONTH(fecha)=12 and year(mov_financieros.fecha)= '.$anio.', importe_egreso, NULL)) AS Dic')] )
            
               ->groupBy('id_tipo_gasto','tipos_gastos.tipo1', 'tipos_gastos.tipo2'))
            ->toJson();  
            */
          

            $total_ingresos= DB::table('mov_financieros')
                     -> where ('mov_financieros.tipo_movimiento','=','Cobranza/Ingresos')
                     ->select([DB::raw('"INGRESOS TOTAL" as tipo'),
                     DB::raw('" " as tipo1'),
                     DB::raw('" " as tipo2'), 
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=1 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Ene'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=2 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Feb'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=3 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Mar'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=4 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Abr'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=5 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS May'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=6 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Jun'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=7 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Jul'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=8 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Ago'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=9 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Sep'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=10 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Octu'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=11 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Nov'),
                              DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=12 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Dic')] )
                              ->groupBy('tipo','tipo1','tipo2');

            $total_egresos= DB::table('mov_financieros')
                              -> where ('mov_financieros.tipo_movimiento','=','Gastos/Egresos')
                              ->select([DB::raw('"EGRESOS TOTAL" as tipo'),
                              DB::raw('" " as tipo1'),
                              DB::raw('" " as tipo2'), 
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=1 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Ene'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=2 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Feb'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=3 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Mar'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=4 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Abr'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=5 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS May'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=6 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Jun'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=7 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Jul'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=8 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Ago'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=9 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Sep'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=10 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Octu'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=11 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Nov'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=12 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Dic')] )
                                       ->groupBy('tipo','tipo1','tipo2');    

            $total_margen= DB::table('mov_financieros')
                                      ->select([DB::raw('"MARGEN TOTAL" as tipo'),
                                       DB::raw('" " as tipo1'),
                                       DB::raw('" " as tipo2'), 
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=1 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Ene'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=2 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Feb'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=3 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Mar'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=4 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Abr'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=5 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS May'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=6 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Jun'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=7 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Jul'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=8 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Ago'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=9 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Sep'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=10 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Octu'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=11 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Nov'),
                                                DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=12 and year(mov_financieros.fecha)= '.$anio.', coalesce(importe_ingreso,0)-coalesce(importe_egreso,0), NULL)) AS Dic')] )
                                                ->groupBy('tipo','tipo1','tipo2');                            

            $egresos= DB::table('mov_financieros')
                     ->leftjoin ('tipos_gastos','mov_financieros.id_tipo_gasto','=','tipos_gastos.id')
                     -> where ('mov_financieros.tipo_movimiento','=','Gastos/Egresos')
                     ->select([DB::raw('"EGRESOS" as tipo'),
                             'tipos_gastos.tipo1', 'tipos_gastos.tipo2', 
                              DB::raw('SUM(IF(MONTH(fecha)=1 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Ene'),
                              DB::raw('SUM(IF(MONTH(fecha)=2 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Feb'),
                              DB::raw('SUM(IF(MONTH(fecha)=3 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Mar'),
                              DB::raw('SUM(IF(MONTH(fecha)=4 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Abr'),
                              DB::raw('SUM(IF(MONTH(fecha)=5 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS May'),
                              DB::raw('SUM(IF(MONTH(fecha)=6 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Jun'),
                              DB::raw('SUM(IF(MONTH(fecha)=7 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Jul'),
                              DB::raw('SUM(IF(MONTH(fecha)=8 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Ago'),
                              DB::raw('SUM(IF(MONTH(fecha)=9 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Sep'),
                              DB::raw('SUM(IF(MONTH(fecha)=10 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Octu'),
                              DB::raw('SUM(IF(MONTH(fecha)=11 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Nov'),
                              DB::raw('SUM(IF(MONTH(fecha)=12 and year(mov_financieros.fecha)= '.$anio.', importe_egreso*-1, NULL)) AS Dic')] )
                              ->groupBy('tipo','tipos_gastos.tipo1', 'tipos_gastos.tipo2');

            $egresosingresos= DB::table('mov_financieros')
                              ->join ('nota_pedidos','mov_financieros.id_nota_pedido','=','nota_pedidos.id')
                              -> where ('mov_financieros.tipo_movimiento','=','Cobranza/Ingresos')
                              ->select([DB::raw('"INGRESOS" as tipo'),
                                      'mov_financieros.tipo_movimiento as tipo1','nota_pedidos.tipo_presupuesto as tipo2', 
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=1 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Ene'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=2 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Feb'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=3 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Mar'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=4 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Abr'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=5 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS May'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=6 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Jun'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=7 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Jul'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=8 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Ago'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=9 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Sep'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=10 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Octu'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=11 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Nov'),
                                       DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=12 and year(mov_financieros.fecha)= '.$anio.', importe_ingreso, NULL)) AS Dic')] )
                                       ->groupBy('tipo','mov_financieros.tipo_movimiento','nota_pedidos.tipo_presupuesto')
                                       ->union($total_margen)
                                       ->union($total_egresos)
                                       ->union($egresos)
                                       ->union($total_ingresos);

      return $egresosingresos = datatables()->of($egresosingresos)
               ->toJson();  
           
    }
    
    
    public function export($anio) 
    {
      $aa = new informe_flujofinancieroExport();
      $aa->anio=$anio;
     
       return Excel::download($aa, 'informe_flujo_financiero.xlsx');
      //dd($aa)  ;

    } 
   
    
}

