<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Informe_tesoreriaExport implements FromCollection
{
    public $desde;
    public $hasta;
 
    
    public function collection()
    {
       
       return DB::table('mov_financieros')
           ->leftjoin('empleados','empleados.id','=','mov_financieros.id_usuario')
           ->leftjoin('tipos_gastos','tipos_gastos.id','=','mov_financieros.id_tipo_gasto')
           ->whereBetween('mov_financieros.created_at',array($this->desde,$this->hasta) )
           ->select(['mov_financieros.fecha',
                     'empleados.apellidoynombre',
                     'mov_financieros.nro_op', 
                     'mov_financieros.nro_recibo', 
                     'mov_financieros.modalidad_pago',
                     'mov_financieros.detalle',
                     'mov_financieros.tipo_movimiento',
                     'tipos_gastos.tipo1',
                     'tipos_gastos.tipo2',
                     'mov_financieros.importe_egreso',
                     'mov_financieros.importe_ingreso' ])
           ->get()  ;
  
    }
}