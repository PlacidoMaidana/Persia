{{--@extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->getTranslatedAttribute('display_name_plural'))

@section('page_header')
    <div class="container-fluid">
        {{--
        @can('add', app($dataType->model_name))
            <a href="{{ route('voyager.'.$dataType->slug.'.create') }}" class="btn btn-success btn-add-new">
                <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
            </a>
        @endcan
        --}}
        @can('delete', app($dataType->model_name))
            @include('voyager::partials.bulk-delete')
        @endcan
        @can('edit', app($dataType->model_name))
            @if(!empty($dataType->order_column) && !empty($dataType->order_display_column))
                <a href="{{ route('voyager.'.$dataType->slug.'.order') }}" class="btn btn-primary btn-add-new">
                    <i class="voyager-list"></i> <span>{{ __('voyager::bread.order') }}</span>
                </a>
            @endif
        @endcan
        @can('delete', app($dataType->model_name))
            @if($usesSoftDeletes)
                <input type="checkbox" @if ($showSoftDeleted) checked @endif id="show_soft_deletes" data-toggle="toggle" data-on="{{ __('voyager::bread.soft_deletes_off') }}" data-off="{{ __('voyager::bread.soft_deletes_on') }}">
            @endif
        @endcan
        @foreach($actions as $action)
            @if (method_exists($action, 'massAction'))
                @include('voyager::bread.partials.actions', ['action' => $action, 'data' => null])
            @endif
        @endforeach
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
                                
                        <a id="btn_genera_ordenes_fabricacion"   href="{{url('ordenes_fabricacion/generar_orden/'.$id_pedido)}}" class="btn btn-primary">
                            Genera Ordenes de Fabricacion 
                        </a>


                        <div class="panel panel-default" style="width: 100%">
                            <div class="panel-heading panel-heading-nav">
                              <ul class="nav nav-tabs">
                                <li role="presentation" class="active">
                                  <a href="#one" aria-controls="one" role="tab" data-toggle="tab">ordenes fabricacion del pedido</a>
                                </li>
                                                                
                              </ul>
                            </div>
                            <div class="panel-body" style="width: 100%">
                              <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="one">
                                  <table id="ordenes_fabricacion_activas"  class="table  table-bordered dt-responsive"   >
                                      <thead>
                                        <tr >
                                            <th class="dt-not-orderable">
                                                <input type="checkbox" class="select_all">
                                            </th>
                                            <th>fecha orden</th>
                                            <th>entrada proceso</th>
                                            <th>salida proceso</th>
                                            <th>id pedido</th>
                                            <th>cliente</th>
                                            <th>id orden</th>
                                            <th>descripcion</th>
                                            <th>rubro</th>
                                            <th>subrubro</th>
                                            <th>Mt2 solicitados</th>
                                            <th>Dias</th>
                                            <th>Cantidad de Unidades</th>
                                            <th>Cantidad de Paquetes</th>
                                            <th>estado</th>
                                            <th>observaciones</th>
                                            <th>accion</th>
                                          </tr>
                                      </thead>
                                      
                                  </table>
                              </div>
                              
                            </div>
                          {{-- </div> --}}

                          
                     
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
                    <h4 class="modal-title"><i class="voyager-trash"></i> {{ __('voyager::generic.delete_question') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}?</h4>
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
@if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
    <link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
@endif
@stop

@section('javascript')
    <!-- DataTables -->
    @if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
        <script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
    @endif
    

{{-- ***ENVEBIDO ***--}}

<script>

   
    //var filtro ="http://127.0.0.1:8000/ordenes_fabricacion/ordenes_por_pedido/67";
    var filtro ="{{url('/ordenes_fabricacion/ordenes_por_pedido/')}}/{{$id_pedido}}";
    $(document).ready(function() {
        $('#ordenes_fabricacion_activas').dataTable( {
             "serverSide": false,
             "scrollX": true,
             "ajax":filtro,                
             "columns":[
                     {data: 'check', width: '5%'},
                     {data: 'fecha_orden', name: 'ordenes_fabricacion.fecha_orden', width: '5%'},
                     {data: 'fecha_entrada_proceso', name: 'ordenes_fabricacion.fecha_entrada_proceso', width: '5%'},
                     {data: 'fecha_salida_proceso', name: 'ordenes_fabricacion.fecha_salida_proceso', width: '5%'},
                     {data: 'id_pedido', name: 'ordenes_fabricacion.id_pedido', width: '5%'},
                     {data: 'nombre', name: 'clientes.nombre', width: '5%'},
                     {data: 'id', name: 'ordenes_fabricacion.id', width: '5%'},
                     {data: 'descripcion', name: 'productos.descripcion', width: '5%'},
                     {data: 'rubro', name: 'rubros.rubro', width: '5%'},
                     {data: 'descripcion_subrubro', name: 'subrubros.descripcion_subrubro', width: '5%'},
                     {data: 'cantidad', name: 'ordenes_fabricacion.cantidad', width: '5%'},
                     {data: 'dias', name: 'dias', width: '5%'},
                     {data: 'unidades', name: 'unidades', width: '5%'},
                     {data: 'paquetes', name: 'paquetes', width: '5%'},
                     {data: 'estado', name: 'ordenes_fabricacion.estado', width: '5%'},
                     {data: 'observaciones', name: 'nota_pedidos.observaciones', width: '5%'},
                     {data: 'accion', width: '5%'},
        
                      ]           
        } );
    } );


 </script> 



<script>
     function borrar(id) {
            // alert(id);
            $('#delete_form')[0].action = '{{ route('voyager.'.$dataType->slug.'.destroy', '__id') }}'.replace('__id', id);
            $('#delete_modal').modal('show');
         }
        window.onload = function () {
        // Bulk delete selectors
        var $bulkDeleteBtn = $('#operar');
        $('#bulk_delete_btn').hide();
        var $bulkDeleteModal = $('#bulk_delete_modal');
        var $bulkDeleteCount = $('#bulk_delete_count');
        var $bulkDeleteDisplayName = $('#bulk_delete_display_name');
        var $bulkDeleteInput = $('#bulk_delete_input');
        // Reposition modal to prevent z-index issues
        // $bulkDeleteModal.appendTo('body');
        // Bulk delete listener
        $bulkDeleteBtn.click(function () {
            var ids = [];
            var $checkedBoxes = $('input[type=checkbox]:checked').not('.select_all');
            
            var count = $checkedBoxes.length;
            
            if (count) {
                // Reset input value
                $bulkDeleteInput.val('');
                // Deletion info
                var displayName = count > 1 ? 'Productos' : 'Producto';
                displayName = displayName.toLowerCase();
                $bulkDeleteCount.html(count);
                $bulkDeleteDisplayName.html(displayName);
                // Gather IDs
                $.each($checkedBoxes, function () {
                    var value = $(this).val();
                    ids.push(value);
                   
                })
                // Set input value
                $bulkDeleteInput.val(ids);
                // Show modal
                $bulkDeleteModal.modal('show');
            } else {
                // No row selected
                toastr.warning('You haven&#039;t selected anything to delete');
            }
        });
    }
    </script>


@stop
