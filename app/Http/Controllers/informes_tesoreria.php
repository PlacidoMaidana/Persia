<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class informes_tesoreria extends Controller
{
     public function index()
     {
        return view('informes.informes_tesoreria');
     }
 
    public function en_rango_de_fechas($from,$to)
    {

       return $datos = datatables()->of(DB::table('mov_financieros')
           ->whereBetween('mov_financieros.created_at',array($from,$to) )
           ->select(['mov_financieros.fecha',
                     'mov_financieros.nro_op', 
                     'mov_financieros.nro_recibo', 
                     'mov_financieros.modalidad_pago',
                     'mov_financieros.detalle',
                     'mov_financieros.tipo_movimiento',
                     'mov_financieros.importe_egreso',
                     'mov_financieros.importe_ingreso'  ]))
            ->toJson();  
     
    }

    
}

