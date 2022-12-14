<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Informe_comprasExport implements FromCollection
{
    public $desde;
    public $hasta;
 
    
    public function collection()
    {
       
       return DB::table('facturas_compras')
       ->join('proveedores as p','p.id','=','facturas_compras.id_proveedor')
       ->join('tipos_gastos as t','t.id','=','facturas_compras.id_tipo_gasto')
       ->whereBetween('facturas_compras.fecha',array($this->desde,$this->hasta) )
       ->select(['facturas_compras.fecha',
                 'p.razonsocial',
                 'p.cuit',
                 'facturas_compras.tipo_factura',
                 'facturas_compras.pto_venta', 
                 'facturas_compras.nro_factura', 
                 'facturas_compras.total_factura',
                 'facturas_compras.estado_pago',
                 't.tipo1',
                 't.tipo2' ])
           ->get()  ;
  
    }
}