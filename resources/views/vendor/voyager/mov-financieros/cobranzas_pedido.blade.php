

{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->getTranslatedAttribute('display_name_plural'))

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            Cobranzas del pedido
        </h1>
        @can('add', app($dataType->model_name))
            <a href="{{url('/admin/mov-financieros/create_cobranzas/'.$pedido)}} " class="btn btn-success btn-add-new">
                <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
            </a>
           
        @endcan
        @can('delete', app($dataType->model_name))
            @include('voyager::partials.bulk-delete')
            <a id="operar" href="javascript:;" class="btn btn-danger delete"> Borrar seleccionados</a>
        @endcan
        @can('edit', app($dataType->model_name))
            @if(!empty($dataType->order_column) && !empty($dataType->order_display_column))
               
                <a href="{{ route('voyager.'.$dataType->slug.'.order') }}" class="btn btn-primary btn-add-new">
                    <i class="voyager-list"></i> <span>{{ __('voyager::bread.order') }}</span>
                </a>
            @endif
        @endcan
        @can('delete', app($dataType->model_name))
            {{-- @if($usesSoftDeletes)
                <input type="checkbox" @if ($showSoftDeleted) checked @endif id="show_soft_deletes" data-toggle="toggle" data-on="{{ __('voyager::bread.soft_deletes_off') }}" data-off="{{ __('voyager::bread.soft_deletes_on') }}">
            @endif --}}
        @endcan
        {{-- @foreach($actions as $action)
            @if (method_exists($action, 'massAction'))
                @include('voyager::bread.partials.actions', ['action' => $action, 'data' => null])
            @endif
        @endforeach --}}
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
                                                  

                            {{-- <a href="{{url('cobranzas/create')}}">Nueva Cobranzas</a> --}}


                            

                                <table id="cobranzas" class="table table-striped table-bordered dt-responsive "  >
                                    <thead>
                                      <tr >
                                          <th class="dt-not-orderable">
                                              <input type="checkbox" class="select_all">
                                          </th>
                                          <th>fecha</th>
                                          <th>Pto Vta</th>
                                          <th>Nro Recibo</th>
                                          <th>detalle</th>
                                          <th>importe ingreso</th>
                                          
                                          <th>accion</th>
                                        </tr>
                                    </thead>  
                                </table>
                            
                         
                        {{-- </div> --}}

<div class="card">
    <div class="card-body">
        <h5 class="card-title">Totales</h5>
        <p class="card-text"> ..</p>
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
    <script>
        
        var deleteFormAction;
        $('td').on('click', '.delete', function (e) {
            $('#delete_form')[0].action = '{{ route('voyager.'.$dataType->slug.'.destroy', '__id') }}'.replace('__id', $(this).data('id'));
            $('#delete_modal').modal('show');
        });

       
    </script>

 
        {{-- Scripts para borrar --}}
        <script>

            $(document).on('click', '.delete', function() {
            
            
               $('#delete_form')[0].action = '{{url("/CobranzasPedido/__id")}}'.replace('__id', $(this).data('id'));
               $('#delete_modal').modal('show');
            });
        </script>







<script>
    $(document).ready(function() {
        $('#cobranzas').dataTable( {
             "serverSide": true,
             "ajax":"{{url('/cobranzas_notapedido/'.$pedido)}}",                
             "columns":[
                     {data: 'check', width: '5%'},
                     {data: 'fecha', name: 'fecha', width: '5%'},
                     {data: 'pto_vta', name: 'fecha', width: '5%'},
                     {data: 'nro_recibo', name: 'fecha', width: '5%'},
                     {data: 'detalle', name: 'detalle', width: '10%'},
                     {data: 'importe_ingreso', name: 'importe_ingreso', width: '10%'},
                     {data: 'accion', width: '10%'},
                      ]           
        } );
    } );
</script> 





@stop
