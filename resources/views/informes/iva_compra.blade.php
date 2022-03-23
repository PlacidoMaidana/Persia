{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'IVA Compras')



@section('content')
    


<table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
    <thead>
      <tr>
          <th>tipo_factura</th>
          <th>pto_venta</th>
          <th>nro_factura</th>
          <th>fecha</th>
          <th>cuit</th>
          <th>subtotal</th>
          <th>exento</th>
          <th>iva_10_5</th>
          <th>iva_21</th>
          <th>iva_27</th>
          <th>percepcion IIBB</th>
          <th>Percepcion IVA</th>
          <th>Percepcion ganancias</th>
          <th>otros_impuestos</th>
          <th>total_factura</th>
        

      </tr>
     </thead>
     
    </table>

@stop

@section('css')

@stop

@section('javascript')
<script>
    $(document).ready(function() {
        $('#example').dataTable( {
             "serverSide": true,
             "ajax":"{{url('/informes/iva_compras')}}",                
             "columns":[
                     {data: 'tipo_factura', name:'facturas_compras.tipo_factura', width: '5%'},
                     {data: 'pto_venta', name: 'facturas_compras.pto_venta', width: '5%'},
                     {data: 'nro_factura', name: 'facturas_compras.nro_factura', width: '10%'},
                     {data: 'fecha', name: 'facturas_compras.fecha', width: '5%'},
                     {data: 'cuit', name: 'p.cuit', width: '10%'},
                     {data: 'subtotal', name: 'facturas_compras.subtotal', width: '10%'},
                     {data: 'exento', name: 'facturas_compras.exento', width: '10%'},
                     {data: 'iva_10_5', name:'facturas_compras.iva_10_5', width: '10%'},
                     {data: 'iva_21', name:'facturas_compras.iva_21', width: '10%'},
                     {data: 'iva_27', name: 'facturas_compras.iva_27', width: '10%'},
                     {data: 'monto_perc_iibb', name: 'facturas_compras.monto_perc_iibb', width: '10%'},
                     {data: 'monto_percepcion_iva', name: 'facturas_compras.monto_percepcion_iva', width: '10%'},
                     {data: 'monto_percep_ganancias', name: 'facturas_compras.monto_percep_ganancias', width: '10%'},
                     {data: 'otros_impuestos', name: 'facturas_compras.otros_impuestos', width: '10%'},
                     {data: 'total_factura', name: 'facturas_compras.total_factura', width: '10%'},
                      ]           
         });
        });
 </script> 

@stop
