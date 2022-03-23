<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class DateRangeController extends Controller
{
    function index(Request $request)
    {

     
     if(request()->ajax())
     {
      if(!empty($request->from_date))
      {
       $data = DB::table('facturas_compras')
            ->select(['facturas_compras.tipo_factura','facturas_compras.pto_venta', 'facturas_compras.nro_factura','facturas_compras.fecha'])
            ->whereBetween('facturas_compras.created_at', array($request->from_date, $request->to_date))
            ->get();

         
      }

      else
      {
       $data = DB::table('facturas_compras')
       ->select(['facturas_compras.tipo_factura','facturas_compras.pto_venta', 'facturas_compras.nro_factura','facturas_compras.fecha'])
       ->get();
      }
      return datatables()->of($data)->make(true);
     }
     
     return view('daterange');
    }
}

?>


