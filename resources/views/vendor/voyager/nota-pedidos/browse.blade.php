{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->getTranslatedAttribute('display_name_plural'))

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="{{ $dataType->icon }}"></i> {{ $dataType->getTranslatedAttribute('display_name_plural') }}
        </h1>
        @can('add', app($dataType->model_name))
            <a href="{{ route('voyager.'.$dataType->slug.'.create') }}" class="btn btn-success btn-add-new">
                <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
            </a>
           
        @endcan
        @can('delete', app($dataType->model_name))
            @include('voyager::partials.bulk-delete')
            <a id="operar" href="javascript:;" class="btn btn-danger delete"> Borrar seleccionados</a>
        @endcan
        <a href="{{url('pedidos/export')}}" class="btn btn-warning">Exportar</a>
       
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
                        @if ($isServerSide)
                            <form method="get" class="form-search">
                                <div id="search-input">
                                    <div class="col-2">
                                        <select id="search_key" name="key">
                                            @foreach($searchNames as $key => $name)
                                                <option value="{{ $key }}" @if($search->key == $key || (empty($search->key) && $key == $defaultSearchKey)) selected @endif>{{ $name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-2">
                                        <select id="filter" name="filter">
                                            <option value="contains" @if($search->filter == "contains") selected @endif>contains</option>
                                            <option value="equals" @if($search->filter == "equals") selected @endif>=</option>
                                        </select>
                                    </div>
                                    <div class="input-group col-md-12">
                                        <input type="text" class="form-control" placeholder="{{ __('voyager::generic.search') }}" name="s" value="{{ $search->value }}">
                                        <span class="input-group-btn">
                                            <button class="btn btn-info btn-lg" type="submit">
                                                <i class="voyager-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                                @if (Request::has('sort_order') && Request::has('order_by'))
                                    <input type="hidden" name="sort_order" value="{{ Request::get('sort_order') }}">
                                    <input type="hidden" name="order_by" value="{{ Request::get('order_by') }}">
                                @endif
                            </form>
                        @endif
                     
                    {{-- tabla de pedidos pendientes --}}

                    {{-- <div class="container"> --}}
                        
                        <div class="panel panel-default" style="width: 100%">
                          <div class="panel-heading panel-heading-nav">
                            <ul class="nav nav-tabs">
                              <li role="presentation" class="active">
                                <a href="#one" aria-controls="one" role="tab" data-toggle="tab">Positivos Abiertos</a>
                              </li>
                              <li role="presentation">
                                <a href="#two" aria-controls="two" role="tab" data-toggle="tab">Positivos Cerrados</a>
                              </li>
                              <li role="presentation">
                                <a href="#three" aria-controls="three" role="tab" data-toggle="tab">Negativos o Rechazados</a>
                              </li>
                              <li role="presentation">
                                <a href="#four" aria-controls="four" role="tab" data-toggle="tab">Pedidos Pendientes</a>
                              </li>
                              
                            </ul>
                          </div>
                          <div class="panel-body" style="width: 100%">
                            <div class="tab-content">
                              <div role="tabpanel" class="tab-pane fade in active" id="one">
                                <table id="pedidos_pendientes" class="table table-striped table-bordered dt-responsive nowrap"  style="width:100%;" >
                                    <thead style="width:100%;">
                                      <tr >
                                          <th class="dt-not-orderable">
                                              <input type="checkbox" class="select_all">
                                          </th>
                                          <th>id_pedido</th>
                                          <th>fecha</th>
                                          <th>tipo</th>
                                          <th>cliente</th>
                                          <th>vendedor</th>
                                          <th>total</th>
                                          <th>estado</th>
                                          <th>observaciones</th>
                                          <th>accion</th>
                                        </tr>
                                    </thead>
                                    
                                </table>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="two">
                                <table id="pedidos_terminados" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%;"  >
                                    <thead style="width:100%;">
                                        <tr>
                                            <th class="dt-not-orderable">
                                                <input type="checkbox" class="select_all">
                                            </th>
                                            <th>id_pedido</th>
                                            <th>fecha</th>
                                            <th>tipo</th>
                                            <th>cliente</th>
                                            <th>vendedor</th>
                                            <th>total</th>
                                            <th>estado</th>
                                            <th>observaciones</th>
                                            <th>accion</th>
                                        </tr>
                                     </thead>
                                    </table>
                              </div>
                              <div role="tabpanel" class="tab-pane fade" id="three">
                                <table id="pedidos_negativos" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%;"   >
                                    <thead style="width:100%;">
                                        <tr>
                                            <th class="dt-not-orderable">
                                                <input type="checkbox" class="select_all">
                                            </th>
                                            <th>id_pedido</th>
                                            <th>fecha</th>
                                            <th>tipo</th>
                                            <th>cliente</th>
                                            <th>vendedor</th>
                                            <th>total</th>
                                            <th>estado</th>
                                            <th>observaciones</th>
                                            <th>accion</th>
                                        </tr>
                                     </thead>
                                    </table>
                              </div>
                              <div role="tabpanel" class="tab-pane fade" id="four">
                                <table id="pedidos_abiertos" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%;"  >
                                    <thead style="width:100%;">
                                        <tr>
                                            <th class="dt-not-orderable">
                                                <input type="checkbox" class="select_all">
                                            </th>
                                            <th>id_pedido</th>
                                            <th>fecha</th>
                                            <th>tipo</th>
                                            <th>cliente</th>
                                            <th>vendedor</th>
                                            <th>total</th>
                                            <th>estado</th>
                                            <th>observaciones</th>
                                            <th>accion</th>
                                        </tr>
                                     </thead>
                                 
                                    </table>
                              </div>
                               
                              </div>
                            </div>
                          </div>
                        {{-- </div> --}}

                  
                    
{{-- 
<div class="card">
    <div class="card-body">
        <h5 class="card-title">Cantidad de pedidos:</h5>
        <h5 class="card-title">Importe total acumulado:</h5>
    </div>
</div>
--}}

                        @if ($isServerSide)
                            <div class="pull-left">
                                <div role="status" class="show-res" aria-live="polite">{{ trans_choice(
                                    'voyager::generic.showing_entries', $dataTypeContent->total(), [
                                        'from' => $dataTypeContent->firstItem(),
                                        'to' => $dataTypeContent->lastItem(),
                                        'all' => $dataTypeContent->total()
                                    ]) }}</div>
                            </div>
                            <div class="pull-right">
                                {{ $dataTypeContent->appends([
                                    's' => $search->value,
                                    'filter' => $search->filter,
                                    'key' => $search->key,
                                    'order_by' => $orderBy,
                                    'sort_order' => $sortOrder,
                                    'showSoftDeleted' => $showSoftDeleted,
                                ])->links() }}
                            </div>
                        @endif
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
        $(document).ready(function () {
            @if (!$dataType->server_side)
                var table = $('#dataTable').DataTable({!! json_encode(
                    array_merge([
                        "order" => $orderColumn,
                        "language" => __('voyager::datatable'),
                        "columnDefs" => [
                            ['targets' => 'dt-not-orderable', 'searchable' =>  false, 'orderable' => false],
                        ],
                    ],
                    config('voyager.dashboard.data_tables', []))
                , true) !!});
            @else
                $('#search-input select').select2({
                    minimumResultsForSearch: Infinity
                });
            @endif

            @if ($isModelTranslatable)
                $('.side-body').multilingual();
                //Reinitialise the multilingual features when they change tab
                $('#dataTable').on('draw.dt', function(){
                    $('.side-body').data('multilingual').init();
                })
            @endif
            $('.select_all').on('click', function(e) {
                $('input[name="row_id"]').prop('checked', $(this).prop('checked')).trigger('change');
            });
        });


        var deleteFormAction;
        $('td').on('click', '.delete', function (e) {
            $('#delete_form')[0].action = '{{ route('voyager.'.$dataType->slug.'.destroy', '__id') }}'.replace('__id', $(this).data('id'));
            $('#delete_modal').modal('show');
        });

        @if($usesSoftDeletes)
            @php
                $params = [
                    's' => $search->value,
                    'filter' => $search->filter,
                    'key' => $search->key,
                    'order_by' => $orderBy,
                    'sort_order' => $sortOrder,
                ];
            @endphp
            $(function() {
                $('#show_soft_deletes').change(function() {
                    if ($(this).prop('checked')) {
                        $('#dataTable').before('<a id="redir" href="{{ (route('voyager.'.$dataType->slug.'.index', array_merge($params, ['showSoftDeleted' => 1]), true)) }}"></a>');
                    }else{
                        $('#dataTable').before('<a id="redir" href="{{ (route('voyager.'.$dataType->slug.'.index', array_merge($params, ['showSoftDeleted' => 0]), true)) }}"></a>');
                    }

                    $('#redir')[0].click();
                })
            })
        @endif
        $('input[name="row_id"]').on('change', function () {
            var ids = [];
            $('input[name="row_id"]').each(function() {
                if ($(this).is(':checked')) {
                    ids.push($(this).val());
                }
            });
            $('.selected_ids').val(ids);
        });
    </script>


<script>
    $(document).ready(function() {
        $('#pedidos_pendientes').dataTable( {
             "serverSide": true,
             "scrollX": true,
             "scrollCollapse": true,
             "paging": true,
             "searching": true,
             "ordering": true,
             "responsive": true,
             "colReorder": true,
             "orderCellsTop": true,
             "ajax":"{{url('pedidos_pendientes')}}",                
             "columns":[
                     {data: 'check', width: '5%'},
                     {data: 'id_pedido', name: 'nota_pedidos.id', width: '5%'},
                     {data: 'fecha', name: 'nota_pedidos.fecha', width: '5%'},
                     {data: 'tipo', name: 'nota_pedidos.tipo_presupuesto', width: '5%'},
                     {data: 'nombre', name: 'clientes.nombre', width: '10%'},
                     {data: 'vendedor', name: 'empleados.apellidoynombre', width: '10%'},
                     {data: 'total', name: 'nota_pedidos.total', width: '10%'},
                     {data: 'estado', name: 'nota_pedidos.estado', width: '10%'},
                     {data: 'observaciones', name: 'nota_pedidos.observaciones', width: '10%'},
                     {data: 'accion', width: '10%'},
                      ]           
        } );
    } );

   
</script> 
<script>
    $(document).ready(function() {
        $('#pedidos_terminados').dataTable( {
            "serverSide": true,
             "scrollX": true,
             "scrollCollapse": true,
             "paging": true,
             "searching": true,
             "ordering": true,
             "responsive": true,
             "colReorder": true,
             "orderCellsTop": true,
             "ajax":"{{url('pedidos_terminados')}}",                
             "columns":[
                     {data: 'check', width: '5%'},
                     {data: 'id_pedido', name: 'nota_pedidos.id', width: '5%'},
                     {data: 'fecha', name: 'nota_pedidos.fecha', width: '5%'},
                     {data: 'tipo', name: 'nota_pedidos.tipo_presupuesto', width: '5%'},
                     {data: 'nombre', name: 'clientes.nombre', width: '10%'},
                     {data: 'vendedor', name: 'empleados.apellidoynombre', width: '10%'},
                     {data: 'total', name: 'nota_pedidos.total', width: '10%'},
                     {data: 'estado', name: 'nota_pedidos.estado', width: '10%'},
                     {data: 'observaciones', name: 'nota_pedidos.observaciones', width: '10%'},
                     {data: 'accion', width: '10%'},
                      ]           
        } );
    } );
 </script> 
 <script>
    $(document).ready(function() {
        $('#pedidos_negativos').dataTable( {
             "serverSide": true,
             "scrollX": true,
             "scrollCollapse": true,
             "paging": true,
             "searching": true,
             "ordering": true,
             "responsive": true,
             "colReorder": true,
             "orderCellsTop": true,
             "ajax":"{{url('pedidos_negativos')}}",                
             "columns":[
                     {data: 'check', width: '5%'},
                     {data: 'id_pedido', name: 'nota_pedidos.id', width: '5%'},
                     {data: 'fecha', name: 'nota_pedidos.fecha', width: '5%'},
                     {data: 'tipo', name: 'nota_pedidos.tipo_presupuesto', width: '5%'},
                     {data: 'nombre', name: 'clientes.nombre', width: '10%'},
                     {data: 'vendedor', name: 'empleados.apellidoynombre', width: '10%'},
                     {data: 'total', name: 'nota_pedidos.total', width: '10%'},
                     {data: 'estado', name: 'nota_pedidos.estado', width: '10%'},
                     {data: 'observaciones', name: 'nota_pedidos.observaciones', width: '10%'},
                     {data: 'accion', width: '10%'},
                      ]           
        } );
    } );
</script> 
<script>
    $(document).ready(function() {
        $('#pedidos_abiertos').dataTable( {
            "serverSide": true,
            "scrollX": true,
             "scrollCollapse": true,
             "paging": true,
             "searching": true,
             "ordering": true,
             "responsive": true,
             "colReorder": true,
             "orderCellsTop": true,
             "ajax":"{{url('pedidos_abiertos')}}",                
             "columns":[
                     {data: 'check', width: '5%'},
                     {data: 'id_pedido', name: 'nota_pedidos.id', width: '5%'},
                     {data: 'fecha', name: 'nota_pedidos.fecha', width: '5%'},
                     {data: 'tipo', name: 'nota_pedidos.tipo_presupuesto', width: '5%'},
                     {data: 'nombre', name: 'clientes.nombre', width: '10%'},
                     {data: 'vendedor', name: 'empleados.apellidoynombre', width: '10%'},
                     {data: 'total', name: 'nota_pedidos.total', width: '10%'},
                     {data: 'estado', name: 'nota_pedidos.estado', width: '10%'},
                     {data: 'observaciones', name: 'nota_pedidos.observaciones', width: '10%'},
                     {data: 'accion', width: '10%'},
                      ]           
        } );
    } );
</script> 

<script>

    function filtrar() {
      //var fechas=$("#fecha_desde").val()+"hasta: "+$("#fecha_hasta").val();
      var filtro ='http://127.0.0.1:8000/informecompras_rango_de_fechas/'+$("#fecha_desde").val()+'/'+$("#fecha_hasta").val();
    
      $('#example').dataTable( {
        "serverSide": true,
             "scrollX": true,
             "scrollCollapse": true,
             "paging": true,
             "searching": true,
             "ordering": true,
             "responsive": true,
             "colReorder": true,
             "orderCellsTop": true,
             "ajax":filtro,
             "columns":[
              {data: 'tipo_factura', name:'f.tipo_factura', width: '5%'},
              {data: 'pto_venta', name: 'f.pto_venta', width: '5%'},
              {data: 'nro_factura', name: 'f.nro_factura', width: '10%'},
              {data: 'fecha', name: 'f.fecha', width: '5%'},
              {data: 'cuit', name: 'c.cuit', width: '10%'},
              {data: 'razonsocial', name: 'c.razonsocial', width: '10%'},
              {data: 'rubro', name: 'r.rubro', width: '10%'},
              {data: 'descripcion_subrubro', name:'sr.descripcion_subrubro', width: '10%'},
              {data: 'descripcion', name: 'p.descripcion', width: '10%'},
              {data: 'cantidad', name: 'detalles_facturas_compras.cantidad', width: '10%'},
              {data: 'total_linea', name: 'detalles_facturas_compras.total_linea', width: '10%'},
               ]        
  });
  
    }
  </script>
  <script src "/vendor/datatables/buttons.server-side.js"> </script>
  

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
                var displayName = count > 1 ? 'Nota Pedidos' : 'Nota Pedido';
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
