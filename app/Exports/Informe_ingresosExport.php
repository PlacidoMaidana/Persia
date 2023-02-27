<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Informe_ingresosExport implements FromCollection
{
    public $desde;
    public $hasta;
 
    
    public function collection()
    {
       
       return DB::table('mov_financieros')
       ->leftjoin ('nota_pedidos','nota_pedidos.id','=','mov_financieros.id_nota_pedido')
       ->leftjoin ('clientes','clientes.id','=','nota_pedidos.id_cliente')
        ->leftjoin('users','users.id','=','mov_financieros.id_usuario')
        ->whereBetween('mov_financieros.fecha',array($this->desde,$this->hasta) )
        ->where('mov_financieros.tipo_movimiento','=','Cobranza/Ingresos')
        ->select(['mov_financieros.fecha',
                  'users.name',
                  'mov_financieros.nro_recibo', 
                  'mov_financieros.modalidad_pago',
                  'mov_financieros.detalle',
                  'mov_financieros.tipo_movimiento',
                  'clientes.nombre',
                  'mov_financieros.importe_ingreso' ])
           ->get()  ;
  
    }
}