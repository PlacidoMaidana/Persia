@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
  
@endphp
{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))
@section('page_header')
    <h1 class="page-title">
       
         REGISTRO DE EGRESOS 
       
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-6">

                <div class="panel panel-bordered">
                    <!-- form start -->
                    <form role="form"
                            class="form-edit-add"
                            action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
                            method="POST" enctype="multipart/form-data">
                          
                        <!-- PUT Method if we are editing -->
                        @if($edit)
                            {{ method_field("PUT") }}
                        @endif

                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <h3> DATOS DEL PAGO </h3>
      
                        <div class="panel-body">

                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <!-- Adding / Editing -->
                            @php
                                $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                            @endphp

                            @foreach($dataTypeRows as $row)
                                <!-- GET THE DISPLAY OPTIONS -->
                                @php
                                    $display_options = $row->details->display ?? NULL;
                                    if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                        $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                    }
                                @endphp
                                @if (isset($row->details->legend) && isset($row->details->legend->text))
                                    <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                @endif

                                
                                @if (( $row->getTranslatedAttribute('display_name')=='Id Nota Pedido'  )||
                                     ( $row->getTranslatedAttribute('display_name')=='Tipo Movimiento'  )||
                                     ( $row->getTranslatedAttribute('display_name')=='Importe Ingreso'  )||
                                     ( $row->getTranslatedAttribute('display_name')=='Nro Recibo'  )||
                                     ( $row->getTranslatedAttribute('display_name')=='Pto Vta'    )||
                                     ( $row->getTranslatedAttribute('display_name')=='Id Caja'    )
                                )
                                   @php
                                       continue;
                                   @endphp
                                @endif

                                <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 3 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                    {{ $row->slugify }}
                                    <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                                    @include('voyager::multilingual.input-hidden-bread-edit-add')
                                    @if (isset($row->details->view))
                                        @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                    @elseif ($row->type == 'relationship')
                                        @include('voyager::formfields.relationship', ['options' => $row->details])
                                    @else
                                        {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                    @endif

                                    @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                        {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                    @endforeach
                                    @if ($errors->has($row->field))
                                        @foreach ($errors->get($row->field) as $error)
                                            <span class="help-block">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>
                            @endforeach
                            <div class="row">
                            </div> 

                            <br>
                            <h3> DATOS DEL COMPROBANTE </h3> 
                            <div class="form-group  col-md-3 ">
                                <label class="control-label" for="name">Fecha Factura</label>
                                <input type="date"  name="fecha_factura"  class="form-control" value= {{$datos_fcompra->fecha}} >
                            </div>

                            <div class="form-group col-md-2">
                                <label for="">Tipo factura</label>
                                <select name="tipo_factura"  id="tipo_factura"  class="form-control  form-select"  aria-label="Default select example" >
                                    <option selected value ="{{$datos_fcompra->tipo_factura}}">{{$datos_fcompra->tipo_factura}} </option>
                                    <option value="A">A </option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                    <option value="NDA">NDA</option>
                                    <option value="NDB">NDB</option>
                                    <option value="NDC">NDC</option>
                                    <option value="INT">INT</option>
                                    
                                  </select>
                            </div>
                           
                            
                            <div class="form-group col-md-2">
                                <label for="">Pto vta</label>
                                <input type="text" name="pto_vta"  id="pto_vta" class="form-control " value= "{{$datos_fcompra->pto_venta}}"  > 
                            </div>
                            <div class="form-group col-md-2">
                                <label for="">Nro factura</label>
                                <input type="text" name="nro_factura"  id="nro_factura" class="form-control " value= "{{$datos_fcompra->nro_factura}}"  > 
                            </div>
                            <div class="row">
                            </div> 
                            <div class="form-group col-md-4">
                                    <label for="">Proveedor</label>
                                    <input type="text" name="nombre_prov" id="nombre_prov" required class="form-control " value="{{$datos_fcompra->razonsocial}}"    > 
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-primary" id="proveedor_buscar">
                                Proveedor
                                </button>
                                <input type="hidden" id="id_proveedor" name="id_proveedor">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Tipo Gasto</label>
                                <input type="text" name="nombre_tipo_gasto" id="nombre_tipo_gasto" required class="form-control " value= "{{$datos_fcompra->tipo1}} - {{$datos_fcompra->tipo2}}"  > 
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-primary" id="tipogasto_buscar">
                                Tipo Gasto
                                </button>
                                <input type="hidden" id="id_tipo_gasto" name="id_tipo_gasto">
                            </div>
                            <div class="row">
                            </div> 
                            <div class="form-group col-md-2 ">
                                <label class="control-label" for="name">Subtotal</label>
                                <input type="text" name="subtotal" id="subtotal" class="form-control" value= "{{$datos_fcompra->subtotal}}"   >
                            </div>
                            <div class="form-group col-md-2 ">
                                <label class="control-label" for="name">Iva </label>
                               <input type="text" name="iva" id="iva" class="form-control"  value= "{{$datos_fcompra->iva}}">
                            </div>
                            <div class="form-group col-md-2   ">
                                <label class="control-label" for="name">Otros Impuestos</label>
                                <input type="text" name="otros_impuestos"  id="otros_impuestos" class="form-control" value= "{{$datos_fcompra->otros_impuestos}}" >
                            </div>
                            <div class="form-group  col-md-2 ">
                                <label class="control-label" for="name">Total Factura</label>
                                <input type="text" name="total_factura"  id="total_factura" class="form-control" value= "{{$datos_fcompra->total_factura}}">
                            </div>
                            <div class="form-group  col-md-12 ">
                                <label class="control-label" for="name">Observaciones</label>
                                <input type="text" name="observaciones" id="observaciones" required  class="form-control"  value= "{{$datos_fcompra->observaciones}}" >
                            </div>
                
                        </div><!-- panel-body -->
                        <div class="modal fade modal-warning" id="modalproveedor" v-if="allowCrop">
                            <div class="modal-dialog"  style="min-width: 90%">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Seleccione un proveedor</h4>
                                    </div>
                                
                                    <div id="x34" class="modal-body">
                                        <div class="card" style="min-width: 70%">
                                            <img class="card-img-top" src="holder.js/100x180/" alt="">
                                            <div class="card-body">
                                                <h4 class="card-title">Proveedores</h4>
                                                <table id="tab_proveedores" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
                                                    <thead>
                                                      <tr>
                                                          <th>id</th>
                                                          <th>Razon Social</th>
                                                          <th>Direccion</th>
                                                          <th>Nombre comercial</th>
                                                          <th>telefono</th>
                                                          <th>cuit</th>
                                                          <th>seleccionar</th>
                                                      </tr>
                                                     </thead>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" id="salir" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    </div>
                                </div>
                            </div>
                          </div>
                          
                          <!-- Modal --> 
                          <div class="modal fade modal-warning" id="modaltipogasto" v-if="allowCrop">
                           <div class="modal-dialog"  style="min-width: 90%">
                               <div class="modal-content">
                                   <div class="modal-header">
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                       <h4 class="modal-title">Seleccione un Tipo de Gasto</h4>
                                   </div>
                               
                                   <div id="x34" class="modal-body">
                                       <div class="card" style="min-width: 70%">
                                           <img class="card-img-top" src="holder.js/100x180/" alt="">
                                           <div class="card-body">
                                               <h4 class="card-title">Tipos de Gasto</h4>
                                               <table id="tab_tipogasto" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
                                                   <thead>
                                                     <tr>
                                                         <th>id</th>
                                                         <th>tipo 1</th>
                                                         <th>Tipo 2</th>
                                                         <th>seleccionar</th>
                                                     </tr>
                                                    </thead>
                                               </table>
                                           </div>
                                       </div>
                                   </div>
                                   <div class="modal-footer">
                                       <button type="button" id="salir" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                   </div>
                               </div>
                           </div>
                         </div>                                      
              
                       <!-- Modal --> 
                        <input type="hidden" name="id_factura_compra" value="{{$datos_fcompra->id_factura_compra}}">
                        <input type="hidden" name="id_proveedor" value="{{$datos_fcompra->id_proveedor}}">
                        <input type="hidden" name="id_tipo_gasto" value="{{$datos_fcompra->id_tipo_gasto}}">
                        <input type="hidden" name="id_usuario" value="{{$usuario}}">
                        <input type="hidden" name="id_nota_pedido" value=0>
                        <input type="hidden" name="tipo_movimiento" value="Gastos/Egresos">
                    
                        <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                            @stop
                            @yield('submit-buttons')
                        </div>
                    </form>

                    <iframe id="form_target" name="form_target" style="display:none"></iframe>
                    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                            enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                        <input name="image" id="upload_file" type="file"
                                 onchange="$('#my_form').submit();this.value='';">
                        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                        {{ csrf_field() }}
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
        var params = {};
        var $file;

        function deleteHandler(tag, isMulti) {
          return function() {
            $file = $(this).siblings(tag);

            params = {
                slug:   '{{ $dataType->slug }}',
                filename:  $file.data('file-name'),
                id:     $file.data('id'),
                field:  $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
          };
        }

        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                } else if (elt.type != 'date') {
                    elt.type = 'text';
                    $(elt).datetimepicker({
                        format: 'L',
                        extraFormats: [ 'YYYY-MM-DD' ]
                    }).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
                $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>


<script>
    $('#proveedor_buscar').on('click',function(){
        $('#modalproveedor').modal({show:true});
    });
   </script> 

  <script>
    $('#tipogasto_buscar').on('click',function(){
        $('#modaltipogasto').modal({show:true});
    });
   </script> 


    <script>
    $(document).ready(function() {
        $('#tab_proveedores').dataTable( {
             "serverSide": true,
             "ajax":"{{url('/proveedores_elegir')}}",                
             "columns":[
                     {data: 'id', name: 'proveedores.id', width: '50px'},
                     {data: 'razonsocial', name: 'proveedores.razonsocial', width: '205px'},
                     {data: 'direccion', name: 'proveedores.direccion', width: '30px'},
                     {data: 'nombre_comercial', name: 'proveedores.nombre_comercial', width: '205px'},
                     {data: 'telefono', name: 'proveedores.telefono', width: '205px'},
                     {data: 'cuit', name: 'proveedores.cuit', width: '205px'},
                     {data: 'seleccionar', name: 'seleccionar', width: '150px'},
                                              
                      ]           
        } );
    } );
    </script> 

  <script>
    $(document).ready(function() {
        $('#tab_tipogasto').dataTable( {
             "serverSide": true,
             "ajax":"{{url('/tipogasto_elegir')}}",                
             "columns":[
                     {data: 'id', name: 'tipos_gastos.id', width: '50px'},
                     {data: 'tipo1', name: 'tipos_gastos.tipo1', width: '205px'},
                     {data: 'tipo2', name: 'tipos_gastos.tipo2', width: '30px'},
                     {data: 'seleccionar', name: 'seleccionar', width: '150px'},
                      ]           
        } );
    } );

    </script> 


     <script>
        function elegir_proveedor(id,razonsocial) {   
            $('#modalproveedor').modal('hide');  
            $('#nombre_prov').val(razonsocial);            
            $('#id_proveedor').val(id);
  
          }
    </script>
        <script>
            function elegir_tipogasto(id,tipo1,tipo2) {   
                $('#modaltipogasto').modal('hide');  
                $('#nombre_tipo_gasto').val(tipo1+'-'+tipo2);            
                $('#id_tipo_gasto').val(id);
      
              }
        </script>


@stop
