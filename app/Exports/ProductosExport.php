<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class ProductosExport implements FromCollection
{
    public $desde;
    public $hasta;
 
    
    public function collection()
    {
        return DB::table('productos')
        ->join ('rubros','productos.rubro_id','=','rubros.id')
        ->join ('subrubros','productos.subrubro_id','=','subrubros.id')
        ->join ('renglones_notapedidos','productos.id','=','renglones_notapedidos.id_producto' )
        ->join ('nota_pedidos','renglones_notapedidos.id_pedido','=','nota_pedidos.id')
         ->whereBetween('nota_pedidos.fecha',array($this->desde,$this->hasta) )
         ->select( 'renglones_notapedidos.id_producto',
                   'productos.descripcion',
                   'productos.preciovta',
                   'rubros.rubro',
                   'subrubros.descripcion_subrubro',
                   'productos.unidad' ,
                   DB::raw ('sum(renglones_notapedidos.cantidad) as vendido')  )
          ->groupBy('renglones_notapedidos.id_producto','productos.descripcion',
          'productos.preciovta', 'rubros.rubro', 'subrubros.descripcion_subrubro',
          'productos.unidad' )
           ->get()  ;
  
    }
}