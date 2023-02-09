<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Informe_flujofinancieroExport implements FromCollection
{
    public $anio;
     
    public function collection()
    {

      return DB::table('mov_financieros')
      -> join ('facturas_compras','mov_financieros.id_factura_compra','=','facturas_compras.id')
      ->leftjoin ('tipos_gastos','facturas_compras.id_tipo_gasto','=','tipos_gastos.id')
      -> where ('mov_financieros.tipo_movimiento','=','Gastos/Egresos')
      ->select('id_tipo_gasto', 'tipos_gastos.tipo1', 'tipos_gastos.tipo2', 
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=1 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Ene'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=2 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Feb'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=3 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Mar'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=4 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Abr'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=5 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS May'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=6 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Jun'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=7 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Jul'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=8 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Ago'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=9 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Sep'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=10 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Octu'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=11 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Nov'),
               DB::raw('SUM(IF(MONTH(mov_financieros.fecha)=12 and year(mov_financieros.fecha)= '.$this->anio.', importe_egreso, NULL)) AS Dic'))
               ->groupBy('id_tipo_gasto','tipos_gastos.tipo1', 'tipos_gastos.tipo2')
               ->get()  ;
           
    }
    
}