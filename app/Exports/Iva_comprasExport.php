<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class Iva_comprasExport implements FromCollection
{
    public $desde;
    public $hasta;
 
    
    public function collection()
    {
       return DB::table('facturas_compras')
       ->join('proveedores as p','p.id','=','facturas_compras.id_proveedor')
       ->whereBetween('facturas_compras.created_at',array($this->desde,$this->hasta) )
       ->select(['facturas_compras.tipo_factura',
                 'facturas_compras.pto_venta', 
                 'facturas_compras.nro_factura', 
                 'facturas_compras.fecha',
                 'p.cuit',
                 'facturas_compras.subtotal',
                 'facturas_compras.exento',
                 'facturas_compras.iva_10_5',
                 'facturas_compras.iva_21',
                 'facturas_compras.iva_27',
                 'facturas_compras.monto_perc_iibb',
                 'facturas_compras.monto_percepcion_iva',
                 'facturas_compras.monto_percep_ganancias',
                 'facturas_compras.otros_impuestos',
                 'facturas_compras.total_factura'  ])
           ->get()  ;
  
    }
}