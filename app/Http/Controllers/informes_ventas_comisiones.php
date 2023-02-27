<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Exports\Informe_ventasExportComisiones;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;

class informes_ventas_comisiones extends Controller
{
     public function index()
     {
        // $vendedores=  ['Alba','Tito','Lucas','Luciana'];
        // return view('informes.informes_ventas_comisiones', compact('vendedores'));
        return view('informes.informes_ventas_comisiones');
        
     }

     public function en_rango_de_fechas($from,$to,$vend)
     {
        return $datos = datatables()->of(DB::table('nota_pedidos')
            ->join('clientes as c','c.id','=','nota_pedidos.id_cliente')
            ->leftjoin('empleados as v','v.id','=','nota_pedidos.id_vendedor')
            ->leftjoin('empleados as v2','v2.id','=','nota_pedidos.id_vendedor_2')
            ->whereBetween('nota_pedidos.fecha',array($from,$to) )
            ->where(function ($query) use ($vend){
               $query->where('nota_pedidos.id_vendedor','=',$vend)
                     ->orwhere('nota_pedidos.id_vendedor_2','=',$vend);
               })
            ->where(function ($query2) {
               $query2->where('nota_pedidos.estado','=','Entregado')
                     ->orwhere('nota_pedidos.estado','=','Pendiente Entrega');
               })
            ->select(['nota_pedidos.fecha',
            'nota_pedidos.tipo_presupuesto', 
            'c.nombre',
            'c.cuit',
            'nota_pedidos.estado',
            'v.apellidoynombre',
            'v2.apellidoynombre',
            'nota_pedidos.totalgravado'  ]))
   ->toJson();  
     }

/*
    public function en_rango_de_fechas($from,$to,$vend)
    {
       return $datos = datatables()->of(DB::table('nota_pedidos')
           ->join('clientes as c','c.id','=','nota_pedidos.id_cliente')
           ->leftjoin('empleados as v','v.id','=','nota_pedidos.id_vendedor')
           ->leftjoin('empleados as v2','v2.id','=','nota_pedidos.id_vendedor_2')
           ->whereBetween('nota_pedidos.fecha',array($from,$to) )
           ->where('nota_pedidos.id_vendedor','=',$vend)
           ->orwhere('nota_pedidos.id_vendedor_2','=',$vend)
           ->where('nota_pedidos.estado','=','Entregado')
           ->orwhere('nota_pedidos.estado','=','Pendiente Entrega')
           ->select(['nota_pedidos.fecha',
                     'nota_pedidos.tipo_presupuesto', 
                     'c.nombre',
                     'c.cuit',
                     'nota_pedidos.estado',
                     'v.apellidoynombre',
                     'v2.apellidoynombre as vendedor2',
                     'nota_pedidos.totalgravado'  ]))
            ->toJson();  
         }

          */
   public function totalesen_rango_de_fechas($from,$to,$vend)      
    { 
            return $totales = datatables()->of(DB::table('nota_pedidos')
            ->join('tipos_presupuestos as tp','tp.desc_tipo','=','nota_pedidos.tipo_presupuesto')
            ->leftjoin('empleados as v','v.id','=','nota_pedidos.id_vendedor')
            ->whereBetween('nota_pedidos.fecha',array($from,$to) )
            ->where('nota_pedidos.id_vendedor','=',$vend)
            ->orwhere('nota_pedidos.id_vendedor_2','=',$vend)
            ->groupBy('nota_pedidos.tipo_presupuesto', 'tp.porc_comision')
            ->select(['nota_pedidos.tipo_presupuesto',
                      'tp.porc_comision',
                       DB::raw('SUM(IF(nota_pedidos.estado="Pendiente Entrega", totalgravado, NULL)) AS Pendiente_Entrega'),
                       DB::raw('SUM(IF(nota_pedidos.estado="Entregado", totalgravado, NULL)) AS Entregado'),
                       DB::raw('SUM(IF(nota_pedidos.estado="Pendiente Entrega" or nota_pedidos.estado="Entregado" , totalgravado, NULL)) AS total_ventas'),
                       DB::raw('SUM(IF(nota_pedidos.estado="Pendiente Entrega" or nota_pedidos.estado="Entregado" , totalgravado * tp.porc_comision/100 , NULL)) AS comision'),

                        ]))
             ->toJson();  
            
 

    }
    public function export($desde,$hasta,$vendedor) 
    {
      $aa = new Informe_ventasExportComisiones();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
      $aa->vendedor=$vendedor;
       return Excel::download($aa, 'informe_ventas_comisiones.xlsx');
     // dd($aa)  ;

    } 
    
}

