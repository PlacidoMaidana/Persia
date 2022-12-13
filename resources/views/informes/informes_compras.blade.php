{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'Informe de Compras')

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
      <button  type="button" id="informe_compras"  onclick="filtrar()" class="btn btn-sm btn-primary" >Filtrar compras</button>
    </div>    
</div>
<a href="informes_compras/export/" class="btn btn-sm btn-primary">Excel</a>

<table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
    <thead>
      <tr>
        <th>fecha</th>
        <th>proveedor</th>
        <th>cuit</th>
        <th>tipo_factura</th>
        <th>pto_venta</th>
        <th>nro_factura</th>
        <th>total factura</th>
        <th>estado pago</th>
        <th>tipo gasto 1</th>
        <th>tipo gasto 2</th>
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
    //var fechas=$("#fecha_desde").val()+"hasta: "+$("#fecha_hasta").val();
    var filtro ='/informecompras_rango_de_fechas/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
  
    $('#example').dataTable( {
    "serverSide": true,
    "ajax":filtro,
    "paging": true,
    "searching": true,
    "columns":[
            {data: 'fecha', name: 'facturas_compras.fecha', width: '5%'},
            {data: 'razonsocial', name: 'c.razonsocial', width: '10%'},
            {data: 'cuit', name: 'c.cuit', width: '10%'},
            {data: 'tipo_factura', name:'facturas_compras.tipo_factura', width: '5%'},
            {data: 'pto_venta', name: 'facturas_compras.pto_venta', width: '5%'},
            {data: 'nro_factura', name: 'facturas_comprasf.nro_factura', width: '10%'},
            {data: 'total_factura', name: 'facturas_compras.total_factura', width: '10%'},
            {data: 'estado_pago', name: 'facturas_compras.estado_pago', width: '10%'},
            {data: 'tipo1', name: 'tg.tipo1', width: '10%'},
            {data: 'tipo2', name: 'tg.tipo2', width: '10%'},
             ]        
});

  }
</script>
<script src "/vendor/datatables/buttons.server-side.js"> </script>
@stop
