<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Informe_ventasExport implements FromCollection
{
    public $desde;
    public $hasta;
 
    
    public function collection()
    {
       
       return DB::table('nota_pedidos')
       ->join('clientes','nota_pedidos.id_cliente','=','clientes.id')
       ->whereBetween('nota_pedidos.fecha',array($this->desde,$this->hasta) )
       ->select([  'nota_pedidos.id as id_pedido',
       'nota_pedidos.fecha',
       'clientes.nombre',
       'clientes.id as id_cliente',
       'nota_pedidos.totalgravado',
       'nota_pedidos.total',
       'nota_pedidos.monto_iva',
       'nota_pedidos.id_factura',
       'nota_pedidos.observaciones',
       'nota_pedidos.descuento',
       'nota_pedidos.estado' ])
           ->get()  ;
  
    }
}