<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Exports\informe_tesoreriaExport;
use App\Exports\informe_ingresosExport;
use App\Exports\informe_egresosExport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromCollection;


class informes_tesoreria extends Controller
{
     public function index()
     {
        return view('informes.informes_tesoreria');
     }
     public function index_ing()
     {
        $total=' ';
        return view('informes.informes_ingresos', compact('total'));
       

     }
     public function index_egr()
     {
        $total=' ';
        return view('informes.informes_egresos', compact('total'));
     }
 
    public function en_rango_de_fechas($from,$to)
    {

       return $datos = datatables()->of(DB::table('mov_financieros')
           ->leftjoin ('facturas_compras','mov_financieros.id_factura_compra','=','facturas_compras.id')
           ->leftjoin ('tipos_gastos','facturas_compras.id_tipo_gasto','=','tipos_gastos.id')
           ->leftjoin('empleados','empleados.id','=','mov_financieros.id_usuario')
           ->whereBetween('mov_financieros.fecha',array($from,$to) )
           ->select(['mov_financieros.fecha',
                     'empleados.apellidoynombre',
                     'mov_financieros.nro_recibo', 
                     'mov_financieros.modalidad_pago',
                     'mov_financieros.detalle',
                     'mov_financieros.tipo_movimiento',
                     'tipos_gastos.tipo1',
                     'tipos_gastos.tipo2',
                     'mov_financieros.importe_egreso',
                     'mov_financieros.importe_ingreso'  ]))
            ->toJson();  
     
    }
    public function egr_en_rango_de_fechas($from,$to)
    {

       return $datos = datatables()->of(DB::table('mov_financieros')
           ->leftjoin ('facturas_compras','mov_financieros.id_factura_compra','=','facturas_compras.id')
           ->leftjoin ('tipos_gastos','facturas_compras.id_tipo_gasto','=','tipos_gastos.id')
           ->leftjoin('users','users.id','=','mov_financieros.id_usuario')
           ->whereBetween('mov_financieros.fecha',array($from,$to) )
           ->where('mov_financieros.tipo_movimiento','=','Gastos-Egresos')
           ->select(['mov_financieros.fecha',
                     'users.name',
                     'mov_financieros.modalidad_pago',
                     'mov_financieros.detalle',
                     'mov_financieros.tipo_movimiento',
                     'tipos_gastos.tipo1',
                     'tipos_gastos.tipo2',
                     'mov_financieros.importe_egreso'
                       ]))
            ->toJson();  
            $total=DB::table ('mov_financieros') ->sum('importe_egreso')    ->where('mov_financieros.tipo_movimiento','=','Gastos-Egresos') ->whereBetween('mov_financieros.fecha',array($from,$to) );
     
    }
    public function ing_en_rango_de_fechas($from,$to)
    {

       return $datos = datatables()->of(DB::table('mov_financieros')
          ->leftjoin ('nota_pedidos','nota_pedidos.id','=','mov_financieros.id_nota_pedido')
          ->leftjoin ('clientes','clientes.id','=','nota_pedidos.id_cliente')
           ->leftjoin('users','users.id','=','mov_financieros.id_usuario')
           ->whereBetween('mov_financieros.fecha',array($from,$to) )
           ->where('mov_financieros.tipo_movimiento','=','Cobranza/Ingresos')
           ->select(['mov_financieros.fecha',
                     'users.name',
                     'mov_financieros.nro_recibo', 
                     'mov_financieros.modalidad_pago',
                     'mov_financieros.detalle',
                     'mov_financieros.tipo_movimiento',
                     'clientes.nombre',
                     'mov_financieros.importe_ingreso'  ]))
            ->toJson();  
    }        
    
     public function ing_totales_en_rango_de_fechas($from,$to)
    {
      /*
       return $datos = datatables()->of(DB::table('mov_financieros')
           ->leftjoin('users','users.id','=','mov_financieros.id_usuario')
           ->whereBetween('mov_financieros.fecha',array($from,$to) )
           ->where('mov_financieros.tipo_movimiento','=','Cobranza/Ingresos')
           ->groupBy('users.name')
           ->select([ 'users.name',
           DB::raw('SUM(IF(mov_financieros.modalidad_pago="Efectivo", importe_ingreso, NULL)) AS efectivo'),
           DB::raw('SUM(IF(mov_financieros.modalidad_pago="Cheque", importe_ingreso, NULL)) AS cheque'),
           DB::raw('SUM(IF(mov_financieros.modalidad_pago="Transferencia", importe_ingreso, NULL)) AS transferencia'),
           DB::raw('SUM(IF(mov_financieros.modalidad_pago="Tarjeta Débito", importe_ingreso, NULL)) AS tarjeta_debito'),
           DB::raw('SUM(IF(mov_financieros.modalidad_pago="Tarjeta Crédito", importe_ingreso, NULL)) AS tarjeta_credito'),
           DB::raw('SUM(IF(mov_financieros.modalidad_pago="Retenciones", importe_ingreso, NULL)) AS retenciones'),
           DB::raw('SUM(mov_financieros.importe_ingreso) AS total_cobrado'),
             ]))
            ->toJson();  
            */
            return $datos = datatables()->of(DB::table('mov_financieros')
             ->whereBetween('mov_financieros.fecha',array($from,$to) )
            ->where('mov_financieros.tipo_movimiento','=','Cobranza/Ingresos')
            ->select([ 
            DB::raw('SUM(IF(mov_financieros.modalidad_pago="Efectivo", importe_ingreso, NULL)) AS efectivo'),
            DB::raw('SUM(IF(mov_financieros.modalidad_pago="Cheque", importe_ingreso, NULL)) AS cheque'),
            DB::raw('SUM(IF(mov_financieros.modalidad_pago="Transferencia", importe_ingreso, NULL)) AS transferencia'),
            DB::raw('SUM(IF(mov_financieros.modalidad_pago="Tarjeta Débito", importe_ingreso, NULL)) AS tarjeta_debito'),
            DB::raw('SUM(IF(mov_financieros.modalidad_pago="Tarjeta Crédito", importe_ingreso, NULL)) AS tarjeta_credito'),
            DB::raw('SUM(IF(mov_financieros.modalidad_pago="Retenciones", importe_ingreso, NULL)) AS retenciones'),
            DB::raw('SUM(mov_financieros.importe_ingreso) AS total_cobrado'),
              ]))
             ->toJson();  
           
    }

    public function export($desde,$hasta) 
    {
      $aa = new informe_tesoreriaExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'informe_tesoreria.xlsx');
      //dd($aa)  ;

    } 
    public function ing_export($desde,$hasta) 
    {
      $aa = new informe_ingresosExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'informe_ingresos.xlsx');
      //dd($aa)  ;

    } 
    public function egr_export($desde,$hasta) 
    {
      $aa = new informe_egresosExport();
      $aa->desde=$desde;
      $aa->hasta=$hasta;
       return Excel::download($aa, 'informe_egresos.xlsx');
      //dd($aa)  ;

    } 
    
}

