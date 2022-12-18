{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'IVA Ventas')

@section('content')


<div class="form-group col-md-2 ">
    <label for="">fecha_desde</label>
    <input type="date"  id="fecha_desde" class="form-control" placeholder="" aria-describedby="helpId">
    <small id="helpId" class="text-muted">fecha_desde</small>
</div>
<div class="form-group col-md-2 ">
    <label for="">fecha_hasta</label>
    <input type="date" id="fecha_hasta" class="form-control" placeholder="" aria-describedby="helpId">
    <small id="helpId" class="text-muted">fecha_hasta</small>
</div>

<div class="row ">
    <div class="col-md-2  ">
      <button  type="button" id="ver_IVA_vtas"  onclick="filtrar()" class="btn btn-sm btn-primary" >IVA Vtas</button>
    </div>    
</div>
<div class="row ">
  <div class="col-md-2  ">
    <button  type="button" id="ver Informe Productos"  onclick="excelExport()" class="btn btn-sm btn-primary" >Excel</button>
  </div>    
</div>

<table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
    <thead>
      <tr>
        <th>tipo_factura</th>
        <th>pto_venta</th>
        <th>nro_factura</th>
        <th>fecha</th>
        <th>cuit</th>
        <th>nombre</th>
        <th>totalGravado</th>
        <th>monto_iva21</th>
        <th>total</th>
      </tr>
     </thead>
     
    </table>

@stop

@section('css')

@stop

@section('javascript')
    <script>
        $("#btnLimpiar").click(function(event) {
        $("#formFecha")[0].reset();
        });
    </script>


    <script>
     $(document).ready(function() {
    </script> 

    <script>
    function filtrar() {
     var filtro ='/ivavtas_en_rango_de_fechas/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
    
    $('#example').dataTable( {
    "serverSide": true,
    "ajax":filtro,
    "columns":[
            {data: 'tipo_factura', name:'facturas_ventas.tipo_factura', width: '5%'},
            {data: 'pto_venta', name: 'facturas_ventas.pto_venta', width: '5%'},
            {data: 'nro_factura', name: 'facturas_ventas.nro_factura', width: '10%'},
            {data: 'fecha', name: 'facturas_ventas.fecha', width: '5%'},
            {data: 'cuit', name: 'c.cuit', width: '10%'},
            {data: 'nombre', name: 'c.nombre', width: '10%'},
            {data: 'totalGravado', name: 'facturas_ventas.totalGravado', width: '10%'},
            {data: 'monto_iva21', name:'facturas_ventas.monto_iva21', width: '10%'},
            {data: 'total', name: 'facturas_ventas.total', width: '10%'},
             ]        
});
   
  }
</script>
<script>
   function excelExport()   {
    window.location.href = '/iva_ventas/export/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
   }
</script>

@stop
