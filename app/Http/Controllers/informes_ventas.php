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
           ->leftjoin('empleados as v','v.id','=','nota_pedidos.id_vendedor')
           ->whereBetween('nota_pedidos.fecha',array($from,$to) )
           ->select(['nota_pedidos.fecha',
                     'nota_pedidos.tipo_presupuesto', 
                     'c.nombre',
                     'c.cuit',
                     'nota_pedidos.estado',
                     'nota_pedidos.estado_pago',
                     'v.apellidoynombre',
                     'nota_pedidos.total'  ]))
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

