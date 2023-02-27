<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Informe_egresosExport implements FromCollection
{
    public $desde;
    public $hasta;
 
   
    public function collection()
    {
       
       return DB::table('mov_financieros')
       ->leftjoin ('facturas_compras','mov_financieros.id_factura_compra','=','facturas_compras.id')
       ->leftjoin ('tipos_gastos','facturas_compras.id_tipo_gasto','=','tipos_gastos.id')
       ->leftjoin('users','users.id','=','mov_financieros.id_usuario')
       ->whereBetween('mov_financieros.fecha', array($this->desde,$this->hasta) )
       ->where('mov_financieros.tipo_movimiento','=','Gastos-Egresos')
       ->select(['mov_financieros.fecha',
                 'users.name',
                 'mov_financieros.modalidad_pago',
                 'mov_financieros.detalle',
                 'mov_financieros.tipo_movimiento',
                 'tipos_gastos.tipo1',
                 'tipos_gastos.tipo2',
                 'mov_financieros.importe_egreso' ])
           ->get()  ;
  
    }
}