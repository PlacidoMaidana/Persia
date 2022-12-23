<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Exports\Informe_produccionExport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;

class informes_produccion extends Controller
{
     public function index()
     {
        return view('informes.informes_produccion');
     }
 
    public function en_rango_de_fechas($from,$to)
    { 
       return $datos = datatables()->of(DB::table('ordenes_fabricacion')
       ->join ('productos','ordenes_fabricacion.id_producto','=','productos.id')
       ->join ('rubros','productos.rubro_id','=','rubros.id')
       ->join ('subrubros','productos.subrubro_id','=','subrubros.id')
       ->join('nota_pedidos','nota_pedidos.id','=','ordenes_fabricacion.id_pedido')
           ->whereBetween('ordenes_fabricacion.fecha_orden',array($from,$to) )
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
                     'nota_pedidos.fecha_entrega'
                      ]))
            ->toJson();  
     
    }
    public function export($desde,$hasta) 
    {
      $aa = new Informe_produccionExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'informe_produccion.xlsx');
     // dd($aa)  ;

    } 
    
}

