{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'Informe Productos')


@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
          Informe Productos
        </h1>

      </div>
@stop

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
    <button  type="button" id="ver Informe Productos"  onclick="filtrar()" class="btn btn-sm btn-primary" >Buscar</button>
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
          <th>codigo</th>
          <th>descripcion</th>
          <th>preciovta</th>
          <th>rubro</th>
          <th>descripcion_subrubro</th>
          <th>unidad</th>
          <th>cantidad vendida</th>
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
  var filtro ='/vtasproductos_en_rango_de_fechas/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
 
        $('#example').dataTable( {
          "serverSide":true,
          "ajax":filtro,
          "columns":[
            {data: 'id_producto', name: 'renglones_notapedidos.id_producto', width: '5%'},
            {data: 'descripcion', name: 'productos.descripcion', width: '5%'},
            {data: 'preciovta', name: 'productos.preciovta', width: '10%'},
            {data: 'rubro', name: 'rubros.rubro', width: '5%'},
            {data: 'descripcion_subrubro', name: 'subrubros.descripcion_subrubro', width: '10%'},
            {data: 'unidad', name: 'productos.unidad', width: '10%'}, 
            {data: 'vendido', name: 'vendido', width: '10%'}, ]           
        } );
    }
  


</script>
<script>
   function excelExport()   {
    window.location.href = '/productos/export/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
   }
</script>
@stop
