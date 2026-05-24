{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'Informe de Cuentas Corrientes de Clientes')

@section('content')



<div class="row ">
  <div class="col-md-2  ">
    <button  type="button" id="ver ventas"  onclick="excelExport()" class="btn btn-sm btn-primary" >Excel</button>
  </div>    
</div>
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
    <thead>
      <tr>
        <th>id</th>
        <th>fecha</th>
        <th>tipo presupuesto</th>
        <th>cliente</th>
        <th>cuit</th>
        <th>estado</th>
        <th>total pedido</th>
        <th>cobrado</th>
        <th>saldo</th>
      </tr>
     </thead>
    </table>

    <table id="totales" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
      <thead>
        <tr>
        <th>Tipo presupuesto</th>
        <th>pendiente de cobro</th>
        </tr>
       </thead>
      
       
      </table>

@stop

@section('css')

@stop

@section('javascript')

    <script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
    <script>
        $("#btnLimpiar").click(function(event) {
        $("#formFecha")[0].reset();
        });
    </script>



<script>

  //function filtrar() {
  $(document).ready(function(){
    //var fechas=$("#fecha_desde").val()+"hasta: "+$("#fecha_hasta").val();
    var filtro ="{{url('/informectacte_rango_de_fechas')}}";
 
    
    $('#example').dataTable( {
    "serverSide": true,
    "ajax":filtro,
    "paging": true,
    "searching": true,
    "columns":[
            {data: 'id', name: 'nota_pedidos.id', width: '5%'},
            {data: 'fecha', name: 'nota_pedidos.fecha', width: '5%'},
            {data: 'tipo_presupuesto', name: 'nota_pedidos.tipo_presupuesto', width: '5%'},
            {data: 'nombre', name: 'c.nombre', width: '10%'},
            {data: 'cuit', name: 'c.cuit', width: '10%'},
            {data: 'estado', name: 'nota_pedidos.estado',width: '10%'},
            {data: 'total', name: 'nota_pedidos.total',  render: $.fn.dataTable.render.number(",", ".", 2,'$ '), width: '10%'},
            {data: 'cobrado', name: 'cobrado', render: $.fn.dataTable.render.number(",", ".", 2,'$ '), width: '10%'},
            {data: 'saldo', name: 'saldo', render: $.fn.dataTable.render.number(",", ".", 2,'$ '), width: '10%'},
           
             ]        
    });
   

var filtrototales ="{{url('/totalesctacte_rango_de_fechas')}}";
  
 
$('#totales').dataTable({
    "serverSide": true,
    "ajax":filtrototales,
    "paging": false,
    "searching": false,
    "columns":[
           {data: 'tipo_presupuesto', name: 'A.tipo_presupuesto', width: '5%'},
               {  
                   "data": null,  
                   "render": function(data,type,row)
                     { 
                       return (numeral(data["total_ventas"] - data["total_cobrado"]).format('$ 0,0.00'))
                     }
           }           
      ]        
    });   


  });
</script>

<script>
   function excelExport()   {
       window.location.href =  "{{url('/informes_ctacte/export/')}}"+"/"+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
   }
</script>
@stop
