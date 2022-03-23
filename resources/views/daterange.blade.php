@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'IVA Ventas')

@section('content')

     <h3 align="center">IVA COMPRAS CON FILTROS POR FECHA</h3>
     <br />
            <br />
            <div class="row input-daterange">
                <div class="col-md-4">
                    <input type="date" name="from_date" id="from_date" class="form-control" placeholder="Fecha Desde"  />
                </div>
                <div class="col-md-4">
                    <input type="date" name="to_date" id="to_date" class="form-control" placeholder="Fecha Hasta"  />
                </div>
                <div class="col-md-4">
                    <button type="button" name="filter" id="filter2" class="btn btn-primary">Filtrar</button>
                    <button type="button" name="refresh" id="refresh" class="btn btn-default">Refrescar</button>
                </div>
            </div>
            <br />
   <div class="table-responsive">
    <table class="table table-bordered table-striped" id="order_table">
           <thead>
            <tr>
                <th>tipo_factura</th>
                <th>pto_venta</th>
                <th>nro_factura</th>
                <th>fecha</th>
            </tr>
           </thead>
       </table>
   </div>
</div>

@stop

@section('css')

@stop

@section('javascript')
<script>


 load_data();

 function load_data(from_date = '', to_date = '')
 {
  $('#order_table').dataTable({
   "processing": true,
   "serverSide": true,
   "ajax": {
         "url" :'{{ route("daterange.index") }}',
         "data" :{from_date:from_date, to_date:to_date}
   },
   "columns": [
                     {data: 'tipo_factura', name:'facturas_compras.tipo_factura', width: '5%'},
                     {data: 'pto_venta', name: 'facturas_compras.pto_venta', width: '5%'},
                     {data: 'nro_factura', name: 'facturas_compras.nro_factura', width: '10%'},
                     {data: 'fecha', name: 'facturas_compras.fecha', width: '5%'},
   ]
  });
 }

 $('#filter').click(function(){
  var from_date = $('#from_date').val();
  var to_date = $('#to_date').val();
  alert(from_date);
  //var from_date = 2022-01-30;
  //var to_date = 2018-03-29;
  if(from_date != '' &&  to_date != '')
  {
   $('#order_table').dataTable().destroy();
  
   load_data(from_date, to_date);
  }
  else
  {
   alert('Both Date is required');
  }
 });
  
  $('#refresh').click(function(){
  $('#from_date').val('');
  $('#to_date').val('');
  $('#order_table').dataTable().destroy();
  load_data();
 });

});
</script>

<script>

$('#filter2').click(function(){
  var from_date = $('#from_date').val();
  var to_date = $('#to_date').val();
  if(from_date != '' &&  to_date != '')
  {
     
  // $('#order_table').DataTable().destroy();
   load_data(from_date, to_date);
  }
  else
  {
   alert('Both Date is required');
  }
 
 });
</script>

@stop
