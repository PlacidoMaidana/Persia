<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Exports\Informe_ventasExport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;

class informes_ventas extends Controller
{
     public function index()
     {
        return view('informes.informes_ventas');
     }
 
    public function en_rango_de_fechas($from,$to)
    {
       return $datos = datatables()->of(DB::table('nota_pedidos')
           ->join('clientes as c','c.id','=','nota_pedidos.id_cliente')
           ->leftjoin ('mov_financieros','mov_financieros.id_nota_pedido','=','nota_pedidos.id')
           ->leftjoin('empleados as v','v.id','=','nota_pedidos.id_vendedor')
           ->whereBetween('nota_pedidos.fecha',array($from,$to) )
           ->where(function ($query2) {
               $query2->where('nota_pedidos.estado','=','Entregado')
                      ->orwhere('nota_pedidos.estado','=','Pendiente Entrega');
            })
           ->groupBy('nota_pedidos.id','nota_pedidos.fecha','nota_pedidos.tipo_presupuesto','c.nombre','c.cuit','nota_pedidos.estado','nota_pedidos.total' )
           ->select(['nota_pedidos.id',
                     'nota_pedidos.fecha',
                     'nota_pedidos.tipo_presupuesto', 
                     'c.nombre',
                     'c.cuit',
                     'nota_pedidos.estado',
                     'nota_pedidos.total',
                     DB::raw('SUM(mov_financieros.importe_ingreso) as cobrado'),
                       ]))
            ->filterColumn('cobrado', function($query, $keyword) {
                        $query->whereRaw("SUM(mov_financieros.importe_ingreso) = ?", $keyword);
                    })
            ->toJson();    
    }
    public function totalesen_rango_de_fechas($from,$to)      
    { 
            return $totales = datatables()->of(DB::table('nota_pedidos')
            ->join('tipos_presupuestos as tp','tp.desc_tipo','=','nota_pedidos.tipo_presupuesto')
            ->whereBetween('nota_pedidos.fecha',array($from,$to) )
            ->where(function ($query2) {
                 $query2->where('nota_pedidos.estado','=','Entregado')
                        ->orwhere('nota_pedidos.estado','=','Pendiente Entrega');
              })
            ->groupBy('nota_pedidos.tipo_presupuesto')
            ->select(['nota_pedidos.tipo_presupuesto',
                       DB::raw('SUM(nota_pedidos.total) AS total_ventas'),
                        ]))
             ->toJson();  
            
 

    }
    public function export($desde,$hasta) 
    {
      $aa = new Informe_ventasExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'informe_ventas.xlsx');
     // dd($aa)  ;

    } 
    
}

