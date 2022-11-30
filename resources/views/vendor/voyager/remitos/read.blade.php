
{{-- @extends('voyager::master') --}}
@extends('layouts.voyager2')
{{-- @extends('layouts.app') --}}

@section('page_title', __('voyager::generic.view').' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
       
        @can('browse', $dataTypeContent)
        <a href="{{ route('voyager.'.$dataType->slug.'.index') }}" class="btn btn-warning">
            <i class="glyphicon glyphicon-list"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.return_to_list') }}</span>
        </a>
        <div class="col-auto">
            <button type="button" class="btn btn-primary" id="boton_cobranzas"
            data-bs-toggle="modal" data-bs-target="#cobranzas">
            Cobranzas
            </button>
          </div>
        {{--
            <a id="cobranzas"   href="{{url('/CobranzasPedido/.4')}}" class="btn btn-primary">Cobranzas</a>
        --}}
        <a id="imprime_remito"   href="{{url('/remitos/export/'.$id)}}" class="btn btn-primary">Imprime Remito</a>
        
        @endcan
    </h1>

    <div class="modal fade modal-warning" id="modal_cobranzas" v-if="allowCrop">
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
    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-12">
              
                 <h1> REMITOS </h1> 
                

                <div class="panel panel-bordered" style="padding-bottom:5px;">
                    <!-- form start -->
                    
                    <div class="row">
                        <div class="col">
                            
                            @for($i=0;$i<count($dataType->readRows)-2; $i+=2)
                            
                            
                            <div class="row">
                                <div class="col-md-6">
                                    @php

                                    //dd($dataType->readRows);die();

                                    $row=$dataType->readRows[$i];
                                    if ($dataTypeContent->{$row->field.'_read'}) {
                                        $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_read'};
                                    }
                                    @endphp

                                    <div class="panel-heading" style="border-bottom:0;">
                                    <h3 class="panel-title">{{ $row->getTranslatedAttribute('display_name') }}</h3>
                                    </div>
    
                                    <div class="panel-body" style="padding-top:0;">
                                        @if (isset($row->details->view))
                                            @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => 'read', 'view' => 'read', 'options' => $row->details])
                                        @elseif($row->type == "image")
                                            <img class="img-responsive"
                                                 src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                                        @elseif($row->type == 'multiple_images')
                                            @if(json_decode($dataTypeContent->{$row->field}))
                                                @foreach(json_decode($dataTypeContent->{$row->field}) as $file)
                                                    <img class="img-responsive"
                                                         src="{{ filter_var($file, FILTER_VALIDATE_URL) ? $file : Voyager::image($file) }}">
                                                @endforeach
                                            @else
                                                <img class="img-responsive"
                                                     src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                                            @endif
                                        @elseif($row->type == 'relationship')
                                             @include('voyager::formfields.relationship', ['view' => 'read', 'options' => $row->details])
                                        @elseif($row->type == 'select_dropdown' && property_exists($row->details, 'options') &&
                                                !empty($row->details->options->{$dataTypeContent->{$row->field}})
                                        )
                                            <?php echo $row->details->options->{$dataTypeContent->{$row->field}};?>
                                        @elseif($row->type == 'select_multiple')
                                            @if(property_exists($row->details, 'relationship'))
                                    
                                                @foreach(json_decode($dataTypeContent->{$row->field}) as $item)
                                                    {{ $item->{$row->field}  }}
                                                @endforeach
                                    
                                            @elseif(property_exists($row->details, 'options'))
                                                @if (!empty(json_decode($dataTypeContent->{$row->field})))
                                                    @foreach(json_decode($dataTypeContent->{$row->field}) as $item)
                                                        @if (@$row->details->options->{$item})
                                                            {{ $row->details->options->{$item} . (!$loop->last ? ', ' : '') }}
                                                        @endif
                                                    @endforeach
                                                @else
                                                    {{ __('voyager::generic.none') }}
                                                @endif
                                            @endif
                                        @elseif($row->type == 'date' || $row->type == 'timestamp')
                                            @if ( property_exists($row->details, 'format') && !is_null($dataTypeContent->{$row->field}) )
                                                {{ \Carbon\Carbon::parse($dataTypeContent->{$row->field})->formatLocalized($row->details->format) }}
                                            @else
                                                {{ $dataTypeContent->{$row->field} }}
                                            @endif
                                        @elseif($row->type == 'checkbox')
                                            @if(property_exists($row->details, 'on') && property_exists($row->details, 'off'))
                                                @if($dataTypeContent->{$row->field})
                                                <span class="label label-info">{{ $row->details->on }}</span>
                                                @else
                                                <span class="label label-primary">{{ $row->details->off }}</span>
                                                @endif
                                            @else
                                            {{ $dataTypeContent->{$row->field} }}
                                            @endif
                                        @elseif($row->type == 'color')
                                            <span class="badge badge-lg" style="background-color: {{ $dataTypeContent->{$row->field} }}">{{ $dataTypeContent->{$row->field} }}</span>
                                        @elseif($row->type == 'coordinates')
                                            @include('voyager::partials.coordinates')
                                        @elseif($row->type == 'rich_text_box')
                                            @include('voyager::multilingual.input-hidden-bread-read')
                                            {!! $dataTypeContent->{$row->field} !!}
                                        @elseif($row->type == 'file')
                                            @if(json_decode($dataTypeContent->{$row->field}))
                                                @foreach(json_decode($dataTypeContent->{$row->field}) as $file)
                                                    <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($file->download_link) ?: '' }}">
                                                        {{ $file->original_name ?: '' }}
                                                    </a>
                                                    <br/>
                                                @endforeach
                                            @else
                                                <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($row->field) ?: '' }}">
                                                    {{ __('voyager::generic.download') }}
                                                </a>
                                            @endif
                                        @else
                                            @include('voyager::multilingual.input-hidden-bread-read')
                                            <p>{{ $dataTypeContent->{$row->field} }}</p>
                                        @endif
                                    </div><!-- panel-body -->
                                    
                                </div>
                                <div class="col-md-6">
                                    @php
                                    $row=$dataType->readRows[$i+1];
                                    if ($dataTypeContent->{$row->field.'_read'}) {
                                        $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_read'};
                                    }
                                    @endphp
                                    
                                    <div class="panel-heading" style="border-bottom:0;">
                                        <h3 class="panel-title">{{ $row->getTranslatedAttribute('display_name') }}</h3>
                                    </div>
            
                                    <div class="panel-body" style="padding-top:0;">
                                        @if (isset($row->details->view))
                                            @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => 'read', 'view' => 'read', 'options' => $row->details])
                                        @elseif($row->type == "image")
                                            <img class="img-responsive"
                                                 src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                                        @elseif($row->type == 'multiple_images')
                                            @if(json_decode($dataTypeContent->{$row->field}))
                                                @foreach(json_decode($dataTypeContent->{$row->field}) as $file)
                                                    <img class="img-responsive"
                                                         src="{{ filter_var($file, FILTER_VALIDATE_URL) ? $file : Voyager::image($file) }}">
                                                @endforeach
                                            @else
                                                <img class="img-responsive"
                                                     src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                                            @endif
                                        @elseif($row->type == 'relationship')
                                             @include('voyager::formfields.relationship', ['view' => 'read', 'options' => $row->details])
                                        @elseif($row->type == 'select_dropdown' && property_exists($row->details, 'options') &&
                                                !empty($row->details->options->{$dataTypeContent->{$row->field}})
                                        )
                                            <?php echo $row->details->options->{$dataTypeContent->{$row->field}};?>
                                        @elseif($row->type == 'select_multiple')
                                            @if(property_exists($row->details, 'relationship'))
            
                                                @foreach(json_decode($dataTypeContent->{$row->field}) as $item)
                                                    {{ $item->{$row->field}  }}
                                                @endforeach
            
                                            @elseif(property_exists($row->details, 'options'))
                                                @if (!empty(json_decode($dataTypeContent->{$row->field})))
                                                    @foreach(json_decode($dataTypeContent->{$row->field}) as $item)
                                                        @if (@$row->details->options->{$item})
                                                            {{ $row->details->options->{$item} . (!$loop->last ? ', ' : '') }}
                                                        @endif
                                                    @endforeach
                                                @else
                                                    {{ __('voyager::generic.none') }}
                                                @endif
                                            @endif
                                        @elseif($row->type == 'date' || $row->type == 'timestamp')
                                            @if ( property_exists($row->details, 'format') && !is_null($dataTypeContent->{$row->field}) )
                                                {{ \Carbon\Carbon::parse($dataTypeContent->{$row->field})->formatLocalized($row->details->format) }}
                                            @else
                                                {{ $dataTypeContent->{$row->field} }}
                                            @endif
                                        @elseif($row->type == 'checkbox')
                                            @if(property_exists($row->details, 'on') && property_exists($row->details, 'off'))
                                                @if($dataTypeContent->{$row->field})
                                                <span class="label label-info">{{ $row->details->on }}</span>
                                                @else
                                                <span class="label label-primary">{{ $row->details->off }}</span>
                                                @endif
                                            @else
                                            {{ $dataTypeContent->{$row->field} }}
                                            @endif
                                        @elseif($row->type == 'color')
                                            <span class="badge badge-lg" style="background-color: {{ $dataTypeContent->{$row->field} }}">{{ $dataTypeContent->{$row->field} }}</span>
                                        @elseif($row->type == 'coordinates')
                                            @include('voyager::partials.coordinates')
                                        @elseif($row->type == 'rich_text_box')
                                            @include('voyager::multilingual.input-hidden-bread-read')
                                            {!! $dataTypeContent->{$row->field} !!}
                                        @elseif($row->type == 'file')
                                            @if(json_decode($dataTypeContent->{$row->field}))
                                                @foreach(json_decode($dataTypeContent->{$row->field}) as $file)
                                                    <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($file->download_link) ?: '' }}">
                                                        {{ $file->original_name ?: '' }}
                                                    </a>
                                                    <br/>
                                                @endforeach
                                            @else
                                                <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($row->field) ?: '' }}">
                                                    {{ __('voyager::generic.download') }}
                                                </a>
                                            @endif
                                        @else
                                            @include('voyager::multilingual.input-hidden-bread-read')
                                            <p>{{ $dataTypeContent->{$row->field} }}</p>
                                        @endif
                                    </div><!-- panel-body -->
                                    {{-- 
                                    @if(!$loop->last)
                                        <hr style="margin:0;">
                                    @endif
                                    --}}


                                </div>
                               
                            </div>
                                
                            <hr style="margin:0;">


                            @endfor
  
                        </div>
                        <div class="col">
                            <table class="table">
                                <thead>
                                  <tr>
                                    <th>id</th>
                                    <th>rubro</th>
                                    <th>producto</th>
                                    <th>cantidad</th>
                                    <th>unidad</th>
                                    <th>precio unitario</th>
                                    <th>importe</th>
                                    <th>estado fabricacion</th>
                                                                                 
                                  </tr>
                                </thead>
                                <tbody>
                                 
                                  
                                 @foreach ($renglones as $index=>$item)
                                  <tr>
                                    <td scope="row">{{$item->id_producto}}</td>
                                    <td scope="row">{{$item->rubro}}</td>
                                    <td scope="row">{{$item->descripcion}}</td>
                                    <td>{{$item->cantidad}}</td>
                                    <td>{{$item->unidad}}</td>
                                    <td>{{number_format($item->preciovta, 2, '.', ',')}}</td>
                                    <td>{{number_format($item->total_linea, 2, '.', ',')}}</td>
                                    <td scope="row">{{$item->estado_fabricacion}}</td>
                                    </tr>  
                                 @endforeach 
                                
                                 
                                </tbody>
                              </table>
                                                                  
                            </div>
                        </div>
 
                        </div>
                    </div>

                   
                </div>

            </div>
        </div>
    </div>


@stop

@section('javascript')
    @if ($isModelTranslatable)
        <script>
            $(document).ready(function () {
                $('.side-body').multilingual();
            });
        </script>
    @endif
    <script>
        var deleteFormAction;
        $('.delete').on('click', function (e) {
            var form = $('#delete_form')[0];

            if (!deleteFormAction) {
                // Save form action initial value
                deleteFormAction = form.action;
            }

            form.action = deleteFormAction.match(/\/[0-9]+$/)
                ? deleteFormAction.replace(/([0-9]+$)/, $(this).data('id'))
                : deleteFormAction + '/' + $(this).data('id');

            $('#delete_modal').modal('show');
        });

    </script>
        <script>
            
            $(document).ready(function() {
                $('#example_cobranzas').dataTable( {
                     "serverSide": true,
                     "ajax":"{{url('/cobranzas_notapedido/'.$id)}}",
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
            $('#boton_cobranzas').on('click',function(){
                $('#modal_cobranzas').modal({show:true});
            });
        </script> 
@stop
