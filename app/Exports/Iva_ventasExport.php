<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Iva_ventasExport implements FromCollection
{
    public $desde;
    public $hasta;
 
    
    public function collection()
    {
       return DB::table('facturas_ventas')
       ->join('clientes as c','c.id','=','facturas_ventas.id_cliente')
       ->whereBetween('facturas_ventas.created_at',array($this->desde,$this->hasta) )
       ->select(['facturas_ventas.tipo_factura',
                 'facturas_ventas.pto_venta', 
                 'facturas_ventas.nro_factura', 
                 'facturas_ventas.fecha',
                 'c.cuit',
                 'c.nombre',
                 'facturas_ventas.totalGravado',
                 'facturas_ventas.monto_iva21',
                 'facturas_ventas.total'  ])
           ->get()  ;
  
    }
}