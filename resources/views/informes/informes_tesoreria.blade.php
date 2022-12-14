{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'Informe de Movimientos Financieros')

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
      <button  type="button" id="informe tesoreria"  onclick="filtrar()" class="btn btn-sm btn-primary" >Filtrar movimientos</button>
    </div>    
</div>
<div class="row ">
  <div class="col-md-2  ">
    <button  type="button" id="ver tesoreria"  onclick="excelExport()" class="btn btn-sm btn-primary" >Excel</button>
  </div>    
</div>
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
    <thead>
      <tr>
        <th>fecha</th>
        <th>Operador</th>
        <th>nro_op</th> 
        <th>nro_recibo</th> 
        <th>modalidad_pago</th>
        <th>detalle</th>
        <th>tipo_movimiento</th>
        <th>Tipo gasto 1</th>
        <th>Tipo gasto 2</th>
        <th>importe_egreso</th>
        <th>importe_ingreso</th>  ]))
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
    var filtro ='http://127.0.0.1:8000/informetesoreria_rango_de_fechas/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
  
    $('#example').dataTable( {
    "serverSide": true,
    "ajax":filtro,
    "paging": true,
    "searching": true,
    "columns":[
            {data: 'fecha', name: 'mov_financieros.fecha', width: '5%'},
            {data: 'apellidoynombre', name: 'empleados.apellidoynombre', width: '5%'},
            {data: 'nro_op', name: 'mov_financieros.nro_op', width: '10%'},
            {data: 'nro_recibo', name: 'mov_financieros.nro_recibo', width: '10%'},
            {data: 'modalidad_pago', name: 'mov_financieros.modalidad_pago', width: '10%'},
            {data: 'detalle', name:'mov_financieros.detalle', width: '10%'},
            {data: 'tipo_movimiento', name: 'mov_financieros.tipo_movimiento', width: '10%'},
            {data: 'tipo1', name: 'tipos_gastos.tipo1', width: '10%'},
            {data: 'tipo2', name: 'tipos_gastos.tipo2', width: '10%'},
            {data: 'importe_egreso', name: 'mov_financieros.importe_egreso', width: '10%'},
            {data: 'importe_ingreso', name: 'mov_financieros.importe_ingreso', width: '10%'},
             ]        
});
   
  }
</script>

<script>
   function excelExport()   {
    window.location.href = 'http://127.0.0.1:8000/informes_tesoreria/export/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
   }
</script>
@stop
