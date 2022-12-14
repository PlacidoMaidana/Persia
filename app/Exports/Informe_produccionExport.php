<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Informe_produccionExport implements FromCollection
{
    public $desde;
    public $hasta;
 
    
    public function collection()
    {
       
       return DB::table('ordenes_fabricacion')
       ->join ('productos','ordenes_fabricacion.id_producto','=','productos.id')
       ->join ('rubros','productos.rubro_id','=','rubros.id')
       ->join ('subrubros','productos.subrubro_id','=','subrubros.id')
       ->join('nota_pedidos','nota_pedidos.id','=','ordenes_fabricacion.id_pedido')
       ->whereBetween('ordenes_fabricacion.fecha_orden',array($this->desde,$this->hasta) )
           ->select(['ordenes_fabricacion.fecha_orden',
                     'ordenes_fabricacion.id_pedido', 
                     'rubros.rubro',
                     'subrubros.descripcion_subrubro',
                     'productos.descripcion',
                     'ordenes_fabricacion.cantidad', 
                     'productos.unidad',
                     'ordenes_fabricacion.estado', 
                     'ordenes_fabricacion.fecha_entrada_proceso', 
                     'ordenes_fabricacion.fecha_salida_proceso', 
                     'nota_pedidos.fecha_entrega' ])
           ->get()  ;
  
    }
}