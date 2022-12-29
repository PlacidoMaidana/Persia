{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'Remitos')
@section('page_header')
    <div class="container-fluid">

       @include('voyager::multilingual.language-selector')
    </div>
@stop

@section('content')
<div class="page-content browse container-fluid">
  @include('voyager::alerts')
  <div class="row">
      <div class="col-md-12">
          <div class="panel panel-bordered">
              <div class="panel-body">


<div class="panel panel-default" style="width: 100%">
        <div class="panel-heading panel-heading-nav">
                  <ul class="nav nav-tabs">
                    <li role="presentation" class="active">
                      <a href="#one" aria-controls="one" role="tab" data-toggle="tab">Pedidos Activos</a>
                    </li>
                    <li role="presentation">
                      <a href="#two" aria-controls="two" role="tab" data-toggle="tab">Pedidos Entregados</a>
                    </li>
                  </ul>
        </div>
  <div class="panel-body" style="width: 100%">
      <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active" id="one">
                            <table id="remitos_abiertos" class="table table-striped table-bordered dt-responsive nowrap"   >
                                   <thead>
                                       <tr>
                                          <th class="dt-not-orderable">
                                          <input type="checkbox" class="select_all">
                                          </th>
                                          <th>id_pedido</th>
                                          <th>fecha</th>
                                          <th>cliente</th>
                                          <th>vendedor</th>
                                          <th>total</th>
                                          <th>estado</th>
                                          <th>accion</th>
                                        </tr>
                                     </thead>
                                    </table>
             </div>
             <div role="tabpanel" class="tab-pane fade" id="two">
              <table id="remitos_cerrados" class="table table-striped table-bordered dt-responsive nowrap"   >
                  <thead>
                      <tr>
                          <th class="dt-not-orderable">
                              <input type="checkbox" class="select_all">
                          </th>
                                          <th>id_pedido</th>
                                          <th>fecha</th>
                                          <th>cliente</th>
                                          <th>vendedor</th>
                                          <th>total</th>
                                          <th>estado</th>
                                          <th>accion</th>
                      </tr>
                   </thead>
              </table>
            </div>

      </div>
  </div>
</div>          


</div>
</div>
</div>
</div>
</div>

{{-- Single delete modal --}}
<div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
   
</div>
<div class="modal-footer">
<form action="#" id="delete_form" method="POST">
{{ method_field('DELETE') }}
{{ csrf_field() }}
<input type="submit" class="btn btn-danger pull-right delete-confirm" value="{{ __('voyager::generic.delete_confirm') }}">
</form>
<button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
</div>
</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

@stop

@section('css')

@stop

@section('javascript')
    <!-- DataTables -->
 

  <script>
    $(document).ready(function() {
        $('#remitos_abiertos').dataTable( {
             "serverSide": true,
             "ajax":"{{url('remitos_abiertos')}}",                
             "columns":[
                     {data: 'check', width: '5%'},
                     {data: 'id_pedido', name: 'nota_pedidos.id', width: '5%'},
                     {data: 'fecha', name: 'nota_pedidos.fecha', width: '5%'},
                     {data: 'nombre', name: 'clientes.nombre', width: '10%'},
                     {data: 'vendedor', name: 'empleados.apellidoynombre', width: '10%'},
                     {data: 'total', name: 'nota_pedidos.total', width: '10%'},
                     {data: 'estado', name: 'nota_pedidos.estado', width: '10%'},
                     {data: 'accion', width: '10%'},
                      ]           
        } );
    } );
  </script> 

    <script>
      $(document).ready(function() {
          $('#remitos_cerrados').dataTable( {
               "serverSide": true,
               "ajax":"{{url('remitos_cerrados')}}",                
               "columns":[
                       {data: 'check', width: '5%'},
                       {data: 'id_pedido', name: 'nota_pedidos.id', width: '5%'},
                       {data: 'fecha', name: 'nota_pedidos.fecha', width: '5%'},
                       {data: 'nombre', name: 'clientes.nombre', width: '10%'},
                       {data: 'vendedor', name: 'empleados.apellidoynombre', width: '10%'},
                       {data: 'total', name: 'nota_pedidos.total', width: '10%'},
                       {data: 'estado', name: 'nota_pedidos.estado', width: '10%'},
                       {data: 'accion', width: '10%'},
                        ]           
          } );
      } );
    </script>



@stop
