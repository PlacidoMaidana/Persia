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
        <th>tipo_factura</th>
        <th>pto_venta</th>
        <th>nro_factura</th>
        <th>fecha</th>
        <th>cuit</th>
        <th>proveedor</th>
        <th>rubro</th>
        <th>subrubro</th>
        <th>producto</th>
        <th>cantidad</th>
        <th>total_linea</th>
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
            {data: 'tipo_factura', name:'f.tipo_factura', width: '5%'},
            {data: 'pto_venta', name: 'f.pto_venta', width: '5%'},
            {data: 'nro_factura', name: 'f.nro_factura', width: '10%'},
            {data: 'fecha', name: 'f.fecha', width: '5%'},
            {data: 'cuit', name: 'c.cuit', width: '10%'},
            {data: 'razonsocial', name: 'c.razonsocial', width: '10%'},
            {data: 'rubro', name: 'r.rubro', width: '10%'},
            {data: 'descripcion_subrubro', name:'sr.descripcion_subrubro', width: '10%'},
            {data: 'descripcion', name: 'p.descripcion', width: '10%'},
            {data: 'cantidad', name: 'detalles_facturas_compras.cantidad', width: '10%'},
            {data: 'total_linea', name: 'detalles_facturas_compras.total_linea', width: '10%'},
             ]        
});

  }
</script>
<script src "/vendor/datatables/buttons.server-side.js"> </script>
@stop
