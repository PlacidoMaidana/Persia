<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\DataTables\ProductosDataTable;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Concerns\FromCollection;
use App\Exports\ProductosExport;
use Maatwebsite\Excel\Facades\Excel;


class informesProductos extends Controller

{
   public function index()
   {
      return view('informes.productos');
   }
   public function en_rango_de_fechas($from,$to)
   {

        return $datos = datatables()->of(DB::table('productos')
         ->join ('rubros','productos.rubro_id','=','rubros.id')
         ->join ('subrubros','productos.subrubro_id','=','subrubros.id')
         ->join ('renglones_notapedidos','productos.id','=','renglones_notapedidos.id_producto' )
         ->join ('nota_pedidos','renglones_notapedidos.id_pedido','=','nota_pedidos.id')
          ->whereBetween('nota_pedidos.fecha',array($from,$to) )
          ->select( 'renglones_notapedidos.id_producto',
                    'productos.descripcion',
                    'productos.preciovta',
                    'rubros.rubro',
                    'subrubros.descripcion_subrubro',
                    'productos.unidad' ,
                    DB::raw ('sum(renglones_notapedidos.cantidad) as vendido')  )
           ->groupBy('renglones_notapedidos.id_producto','productos.descripcion',
           'productos.preciovta', 'rubros.rubro', 'subrubros.descripcion_subrubro',
           'productos.unidad' )
            ->get())
            ->toJson(); 
   }
  

    public function export($desde,$hasta) 
    {
      $aa = new ProductosExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'productos.xlsx');
      //dd($aa)  ;

    } 

}