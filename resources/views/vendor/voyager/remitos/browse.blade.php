{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.'Remitos')

@section('content')
<h1> Remitos - Pedidos Activos </h1>
                            <table id="remitos" class="table table-striped table-bordered dt-responsive nowrap"   >
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

                            

@stop

@section('css')

@stop

@section('javascript')
    <!-- DataTables -->
 

  <script>
    $(document).ready(function() {
        $('#remitos').dataTable( {
             "serverSide": true,
             "ajax":"{{url('remitos')}}",                
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
