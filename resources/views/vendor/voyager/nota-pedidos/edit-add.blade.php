@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
@endphp

{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')
{{-- @extends('layouts.app') --}}



@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    {{-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css"> --}}
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>

    <a href="{{url('admin/factura-ventas/create')}}" class="btn btn-primary">Facturar</a>

    <a id="imprime"   href="{{url('/pedidos/export/'.$id_filtro_pedido)}}" class="btn btn-primary">Imprime Presupuesto</a>

    {{-- <a href="{{url('/vercobranzas')}}" class="btn btn-primary">Cobranzas > </a>--}}

    <a id="cobranzas"   href="{{url('/CobranzasPedido/'.$id_filtro_pedido)}}" class="btn btn-primary">Cobranzas</a>
    

    <div class="modal fade modal-warning" id="cobranzas" v-if="allowCrop">
      <div class="modal-dialog"  style="min-width: 90%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Cobranzas del pedido</h4>
            </div>
                  
            <div id="x34" class="modal-body">
                <div class="card" style="min-width: 70%">
                    <img class="card-img-top" src="holder.js/100x180/" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Cobranzas</h4>
                       <table id="example_cobranzas" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
                            <thead>
                              <tr>
                                  <th>id</th>
                                  <th>fecha</th>
                                  <th>detalle</th>
                                  <th>importe</th>
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

  @include('voyager::multilingual.language-selector')
  @stop
@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">
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
                        <div class="row">
                            <div class="col-md-6">
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
        
                                    @for ($i = 0; $i < count($dataTypeRows); $i++)
                                    
                                             @php
                                             $row=$dataTypeRows[$i];
                                                 $display_options = $row->details->display ?? NULL;
                                                 if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                                     $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                                 }
                                             @endphp
                                             @if (isset($row->details->legend) && isset($row->details->legend->text))
                                                 <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                             @endif
                                             
                                             @if ($row->getTranslatedAttribute('display_name')=='cliente')
                                                {{-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                                                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<      Boton + cliente          <<<<<<<<<<<<<<<<<<<<<<<<<
                                                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                              <<<<<<<<<<<<<<<<<<<<<<<<
                                                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< --}}
                                                    

                                                          <!-- Modal -->
                                                        
                                                            <div class="modal fade modal-warning" id="modal_cliente" v-if="allowCrop">
                                                               <div class="modal-dialog"  style="min-width: 50%">
                                                                   <div class="modal-content">
                                                                
                                                                       <div class="modal-header">
                                                                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                           <h4 class="modal-title">Nuevo cliente</h4>
                                                                       </div>
                                                                   
                                                                       <div id="x34" class="modal-body">

                                                                           <livewire:ficha-cliente /> 

                                                                       </div>
                                                                   
                                                                       <div class="modal-footer">
                                                                           <button type="button" id="salir" class="btn btn-default" data-dismiss="modal">Cancel</button>

                                                                       </div>
                                                                   </div>
                                                               </div>
                                                             </div>	
                                    

                                                 <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 6 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                                    {{ $row->slugify }}
                                                    <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}
                                                          <!-- Button trigger modal -->
                                                          <button type="button" id="cliente" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_cliente">
                                                            + Cliente
                                                          </button>
                                                        {{-- <a href="{{url('admin/clientes/create2/si')}}" class="btn btn-light">+ Cliente</a> --}}
                                                    
                                                    
                                                    </label>
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
                                                @php
                                                    continue;
                                                @endphp
                                             @endif

                                             <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 6 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
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
                                             @php
                                          
                                             $id_notapedido=$id_filtro_pedido;
                                         @endphp
                                    @endfor
    
                                </div><!-- panel-body -->
                        </div>
                            <div class="col-md-6"><!-- panel-detalles -->
                                <div class="col">
                                    <!-- Button trigger modal -->
                                        
                                    @section('modal_elejir') <!-- Modal seleccionar producto -->
                                     
                                     <!-- Modal --> 
                                     <div class="modal fade modal-warning" id="productos" v-if="allowCrop">
                                         <div class="modal-dialog"  style="min-width: 90%">
                                             <div class="modal-content">
                                            
                                                 <div class="modal-header">
                                                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                     <h4 class="modal-title">Seleccione un producto</h4>
                                                 </div>
                                             
                                                 <div id="x34" class="modal-body">
                                                     <div class="card" style="min-width: 70%">
                                                         <img class="card-img-top" src="holder.js/100x180/" alt="">
                                                         <div class="card-body">
                                                             <h4 class="card-title">Productos</h4>
                                                             <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
                                                                 <thead>
                                                                   <tr>
                                                                       <th>id</th>
                                                                       <th>descripcion</th>
                                                                       <th>rubro</th>
                                                                       <th>subrubro</th>
                                                                       <th>preciovta</th>
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
                                       <div class="modal fade modal-warning" id="modal_ordenes_fabricacion" v-if="allowCrop">
                                           <div class="modal-dialog"  style="min-width: 90%">
                                               <div class="modal-content">
                                              
                                                   <div class="modal-header">
                                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                       <h4 class="modal-title">Ordenes de Fabricacion</h4>
                                                   </div>
                                               
                                                   <div id="x34" class="modal-body">
                                                       <div class="card" style="min-width: 70%">
                                                           <img class="card-img-top" src="holder.js/100x180/" alt="">
                                                           <div class="card-body">

                                                              
                                                               <a id="btn_genera_ordenes_fabricacion"   href="{{url('ordenes_fabricacion/generar_orden/'.$id_filtro_pedido)}}" class="btn btn-primary">
                                                                Genera Ordenes de Fabricacion 
                                                               </a>

                                                                <table id="ordenes_fabricacion" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
                                                                   <thead>
                                                                     <tr>
                                                                         <th>pedido</th>
                                                                         <th>fecha</th>
                                                                         <th>producto</th>
                                                                         <th>rubro</th>
                                                                         <th>subrubro</th>
                                                                         <th>mt2 solicitados</th>
 
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

                                        @stop  
                                   
                                    {{-- Campos que no se cargan en la vista pero se modificaran en el controlador --}}
                                        <input type="hidden" name="id_vendedor">
                                        <input type="hidden" name="monto_iva">
                                        <input type="hidden" name="total">
                                        <input type="hidden" name="totalgravado">

                                       
                                         

                                    {{-- FORMULARIO EMBEBIDO --}}
                                                                     
                                    @if (isset($renglones))
                                        @livewire('pedidos.embebido-component', ['renglones' => $renglones])
                                    @else
                                        @livewire('pedidos.embebido-component',['renglones' => null])
                                    @endif
                                    
                                </div>
                               
                            </div>
                       
                        </div>
                     
                        <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                               
                                <button type="button" class="btn btn-primary" id="btn_ordenes_fabricacion" >
                                 Genera Orden Fabricacion   
                                </button>

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

    {{-- >>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        >>>>>>>>>><<<<<<    MODALES   LOCALIDADES      <<<<<<<<<
        >>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        >>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< --}}

        <!-- Modal --> 
        <div class="modal fade modal-warning" id="modal_localidad" v-if="allowCrop">
            <div class="modal-dialog"  style="min-width: 30%">
                <div class="modal-content">
                     <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Seleccione la localidad</h4>
                     </div>
                 
                     <div id="x34" class="modal-body">
                    <div class="card" style="min-width: 40%">
                        <img class="card-img-top" src="holder.js/100x180/" alt="">
                        <div class="card-body">
                        
                            <table id="localidades_elegir" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
                                <thead>
                                  <tr>
                                      <th>id</th>
                                      <th>Provincia</th>
                                      <th>Localidad</th>
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

    {{-- <<<<<<<<<<<<<<<<<<<<<<<    FIN MODAL LOCALIDADES    >>>>>>>>>>>>>>>>>>>>>>>>>>>> --}}



   
@stop

@section('javascript')
 
    {{-- <!-- jQuery -->
    <script src="//code.jquery.com/jquery.js"></script>
    <!-- DataTables -->
    <script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <!-- App scripts --> --}}
{{--
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
     <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js"></script> --}}
  
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
    $('#productos_buscar').on('click',function(){
        $('#productos').modal({show:true});
    });
   </script> 
    <script>
    $('#btn_ordenes_fabricacion').on('click',function(){
            $('#modal_ordenes_fabricacion').modal({show:true});
        });
    </script> 

    <script>
        $('#cobranzas_boton').on('click',function(){
        $('#cobranzas').modal({show:true});
     });
   </script> 

   <script>
    $('#cliente').on('click',function(){
        $('#modal_cliente').modal({show:true});
    
    });
    $('#guardar_cliente').on('click',function(){
        $('#modal_cliente').modal('hide');
    
    });
   </script> 
  
    {{-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
       <<<<<<<<<<<<<<<< script localidades  <<<<<<<<<<<<<<<<<<
       <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< --}}
   <script>
    $('#localidad').on('click',function(){
        $('#modal_localidad').modal({show:true});
    });
    </script> 
 

    <script>
    $(document).ready(function() {
        $('#localidades_elegir').dataTable( {
             "serverSide": true,
             "ajax":"{{url('/localidades_elegir')}}",
             "columns":[
                     {data:'id' } ,
                     {data:'provincia' },
                     {data:'localidad' } ,
                     {data:'seleccionar' }                             
                      ]           
        } );
     } );

     </script> 
    <script>
    $(document).ready(function() {
        $('#example_cobranzas').dataTable( {
             "serverSide": true,
             "ajax":"{{url('/cobranzas_notapedido/'.$id_notapedido)}}",
             "columns":[
                     {data:'id' } ,
                     {data:'fecha' },
                     {data:'detalle' } ,
                     {data:'importe_ingreso' }                             
                      ]           
        } );
    } );

     </script> 

    <script>

      
    $(document).ready(function() {
        $('#btn_ordenes_fabricacion').hide();
       if ($('[name="estado"]').val()=="Pendiente Entrega") {
          $('#btn_ordenes_fabricacion').show();
       }  
    } );

    </script> 




     <script>
       function elegir_localidad(id,provincia,localidad) {     
        $('#descripcion_localidad').html(localidad+'('+provincia+')');
        $('#modal_localidad').modal('hide');
        Livewire.emit('localidad_elegida',id);  
        }
     </script>

     <script>
        $(document).ready(function() {
            $('#example').dataTable( {
                 "serverSide": true,
                 "ajax":"{{url('/productos_elegir')}}",                
                 "columns":[
                         {data: 'id', name: 'productos.id', width: '50px'},
                         {data: 'descripcion', name: 'productos.descripcion', width: '205px'},
                         {data: 'rubro', name: 'r.rubro', width: '30px'},
                         {data: 'subrubro', name: 's.descripcion_subrubro', width: '205px'},
                         {data: 'preciovta', name: 'productos.preciovta', width: '205px'},
                         {data: 'seleccionar', name: 'seleccionar', width: '150px'},
                                                  
                          ]           
            } );
        } );
    
     </script> 
     <script> 
        $(document).ready(function() {
            $('#ordenes_fabricacion').dataTable( {
                 "serverSide": true,
                 "ajax":"{{url('/ordenes_fabricacion_pedido/'.$id_filtro_pedido)}}",                
                 "columns":[
                         {data: 'pedido', name: 'ordenes_fabricacion.id_pedido', width: '50px'},
                         {data: 'fecha', name: 'ordenes_fabricacion.fecha_orden', width: '50px'},
                         {data: 'producto', name: 'productos.descripcion', width: '205px'},
                         {data: 'rubro', name: 'r.rubro', width: '30px'},
                         {data: 'subrubro', name: 's.descripcion_subrubro', width: '205px'},
                         {data: 'cantidad', name: 'ordenes_fabricacion.cantidad', width: '205px'},                                             
                          ]           
            } );
        } );
    
     </script>

     <script>
        // Cambiar el tamaño de la caja de edicion de texto
        $(document).ready(function(){
        
        $('#richtextobservaciones').height(50);

        });
     </script>

@stop
