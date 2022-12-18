{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'Informe de Ventas')

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
      <button  type="button" id="informe_vtas"  onclick="filtrar()" class="btn btn-sm btn-primary" >Filtrar ventas</button>
    </div>    
</div>
<div class="row ">
  <div class="col-md-2  ">
    <button  type="button" id="ver ventas"  onclick="excelExport()" class="btn btn-sm btn-primary" >Excel</button>
  </div>    
</div>
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
    <thead>
      <tr>
        <th>fecha</th>
        <th>tipo presupuesto</th>
        <th>cliente</th>
        <th>cuit</th>
        <th>estado</th>
        <th>estado pago</th>
        <th>vendedor</th>
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
    //var fechas=$("#fecha_desde").val()+"hasta: "+$("#fecha_hasta").val();
    var filtro ='/informevtas_rango_de_fechas/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
  
    $('#example').dataTable( {
    "serverSide": true,
    "ajax":filtro,
    "paging": true,
    "searching": true,
    "columns":[
            {data: 'fecha', name: 'nota_pedidos.fecha', width: '5%'},
            {data: 'tipo_presupuesto', name: 'nota_pedidos.tipo_presupuesto', width: '5%'},
            {data: 'nombre', name: 'c.nombre', width: '10%'},
            {data: 'cuit', name: 'c.cuit', width: '10%'},
            {data: 'estado', name: 'nota_pedidos.estado',width: '10%'},
            {data: 'estado_pago', name: 'nota_pedidos.estado_pago',width: '10%'},
            {data: 'apellidoynombre', name:'v.apellidoynombre',width: '10%'},
            {data: 'total', name: 'nota_pedidos.total', width: '10%'},
             ]        
});
   
  }
</script>

<script>
   function excelExport()   {
    window.location.href = '/informes_ventas/export/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
   }
</script>
@stop
