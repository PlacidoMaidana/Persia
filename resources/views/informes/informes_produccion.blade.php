{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'Informe de Produccion')

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
    <button  type="button" id="ver produccion"  onclick="excelExport()" class="btn btn-sm btn-primary" >Excel</button>
  </div>    
</div>

<table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
    <thead>
      <tr>
        <th>fecha orden</th>
        <th>Nota Pedido</th>
        <th>rubro</th>
        <th>subrubro</th>
        <th>Producto</th>
        <th>Cantidad</th>
        <th>unidad</th>
        <th>Estado</th>
        <th>fecha entrada proceso</th>
        <th>fecha salida</th>
        <th>fecha entrega</th>
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
    var filtro = "{{url('/informeproduccion_rango_de_fechas/')}}"+"/"+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
   
    $('#example').DataTable( {
    "serverSide": true,
    "ajax":filtro,
    "paging": true,
    "searching": true,
    "columns":[
            {data: 'fecha_orden', name: 'ordenes_fabricacion.fecha_orden', width: '5%'},
            {data: 'id_pedido', name: 'ordenes_fabricacion.id_pedido', width: '5%'},
            {data: 'rubro', name: 'rubros.rubro', width: '10%'},
            {data: 'descripcion_subrubro', name: 'subrubros.descripcion_subrubro', width: '10%'},
            {data: 'descripcion', name: 'productos.descripcion',width: '10%'},
            {data: 'cantidad', name: 'ordenes_fabricacion.cantidad',width: '10%'},
            {data: 'unidad', name:'productos.unidad',width: '10%'},
            {data: 'estado', name:'ordenes_fabricacion.estado', width: '10%'},
            {data: 'fecha_entrada_proceso', name:'ordenes_fabricacion.fecha_entrada_proceso', width: '10%'},
            {data: 'fecha_salida_proceso', name:'ordenes_fabricacion.fecha_salida_proceso', width: '10%'},
            {data: 'fecha_entrega', name:'nota_pedidos.fecha_entrega', width: '10%'},
          ]        
});
   
  }
</script>
<script>
   function excelExport()   {    
    window.location.href = "{{url('/informes_produccion/export/')}}"+"/"+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
   }
</script>
@stop