<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Exports\Informe_ventasExport;
use App\Exports\Informe_ctacteExport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;

class informes_ventas extends Controller
{
     public function index()
     {
        return view('informes.informes_ventas');
     }
 
     public function index_ctacte()
     {
        return view('informes.informes_ctacte');
     }

    public function en_rango_de_fechas($from,$to)
    {
       return $datos = datatables()->of(DB::table('nota_pedidos')
           ->leftjoin('clientes as c','c.id','=','nota_pedidos.id_cliente')
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
                     DB::raw('nota_pedidos.total - coalesce(SUM(mov_financieros.importe_ingreso),0) as saldo' ),
                       ]))
            ->filterColumn('cobrado', function($query, $keyword) {
                        $query->havingRaw("SUM(mov_financieros.importe_ingreso) = ?", $keyword);
                    })
            ->filterColumn('saldo', function($query, $keyword) {
                      $query->havingRaw("nota_pedidos.total - coalesce(SUM(mov_financieros.importe_ingreso),0) = ?", $keyword);
                  })
            ->toJson();    
    }

    public function ctacte_en_rango_de_fechas()
    {
     
      return $datos = datatables()->of(DB::table('nota_pedidos')
           ->leftjoin('clientes as c','c.id','=','nota_pedidos.id_cliente')
           ->leftjoin ('mov_financieros','mov_financieros.id_nota_pedido','=','nota_pedidos.id')
           ->leftjoin('empleados as v','v.id','=','nota_pedidos.id_vendedor')
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
                     DB::raw('nota_pedidos.total - coalesce(SUM(mov_financieros.importe_ingreso),0) as saldo' ),
                     ])    )
                     ->filterColumn('cobrado', function($query, $keyword) {
                      $query->havingRaw("SUM(mov_financieros.importe_ingreso) = ?", $keyword);
                      })
                    ->filterColumn('saldo', function($query, $keyword) {
                        $query->havingRaw("nota_pedidos.total - coalesce(SUM(mov_financieros.importe_ingreso),0) = ?", $keyword);
                      }) 
         
            ->toJson();  
            
    }
    public function totalesen_rango_de_fechas($from,$to)      
    { 
            return $totales = datatables()->of(DB::table('nota_pedidos')
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
    public function totalesctacte_en_rango_de_fechas()      
      { 

                      return $totales = datatables()->of(DB::table(DB::raw(
                        '(SELECT nota_pedidos.tipo_presupuesto, nota_pedidos.id, nota_pedidos.total, SUM(mov_financieros.importe_ingreso) as cobrado
                         FROM nota_pedidos LEFT JOIN mov_financieros ON mov_financieros.id_nota_pedido = nota_pedidos.id 
                         WHERE (nota_pedidos.estado = "Entregado" OR nota_pedidos.estado = "Pendiente Entrega")
                         GROUP BY nota_pedidos.id, nota_pedidos.tipo_presupuesto, nota_pedidos.total
                         HAVING total <> COALESCE(SUM(mov_financieros.importe_ingreso), 0)) AS A'))
                         ->select('A.tipo_presupuesto', DB::raw('SUM(A.total) AS total_ventas'), DB::raw('SUM(A.cobrado) AS total_cobrado'))
                         ->groupBy('A.tipo_presupuesto'))                      
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
    public function ctacteexport() 
    {
      $aa = new Informe_ctacteExport();
       return Excel::download($aa, 'informe_ctacte.xlsx');
     // dd($aa)  ;

    } 
    
}

