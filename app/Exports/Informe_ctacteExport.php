<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Informe_ctacteExport implements FromCollection
{
    public $desde;
    public $hasta;
 
    
    public function collection()
    {
       
     return DB::table('nota_pedidos')
           ->join('clientes as c','c.id','=','nota_pedidos.id_cliente')
           ->leftjoin('empleados as v','v.id','=','nota_pedidos.id_vendedor')
           ->leftjoin ('mov_financieros','mov_financieros.id_nota_pedido','=','nota_pedidos.id')
            ->whereBetween('nota_pedidos.fecha',array($this->desde,$this->hasta))
           ->where(function ($query2) {
               $query2->where('nota_pedidos.estado','=','Entregado')
                      ->orwhere('nota_pedidos.estado','=','Pendiente Entrega');
            })
          
           ->groupBy('nota_pedidos.id','nota_pedidos.fecha','nota_pedidos.tipo_presupuesto','c.nombre','c.cuit','nota_pedidos.estado','nota_pedidos.total' )
           ->havingRaw('nota_pedidos.total <> coalesce(SUM(mov_financieros.importe_ingreso),0)')
           ->select(['nota_pedidos.id',
                     'nota_pedidos.fecha',
                     'nota_pedidos.tipo_presupuesto', 
                     'c.nombre',
                     'c.cuit',
                     'nota_pedidos.estado',
                     'nota_pedidos.total',
                     DB::raw('SUM(mov_financieros.importe_ingreso) as cobrado'),
                     DB::raw('nota_pedidos.total - coalesce(SUM(mov_financieros.importe_ingreso),0)' ),
                       ])
              ->get()  ;
  
    }
}