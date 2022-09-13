<div>
   
@php
 //   dd($dataType);
@endphp

 <!-- Adding / Editing -->

 <div class="card">
    <img class="card-img-top" src="holder.js/100x180/" alt="">
    <div class="card-body">
        
        @foreach ($dataTypeContent as $item)

             {{-- public {{ $item->field}}; </br> --}}
            @if ( ( $item->field=='created_at')||( $item->field=='updated_at')||( $item->field=='id')||( $item->field=='cliente_belongsto_localidade_relationship')||
                  ( $item->field=='registro_fce')||( $item->field=='cond_iva')||( $item->field=='cp')
                  )
                    @php
                        continue;
                    @endphp
            @else @if ($item->field=='id_localidad')
                    <div class="form-group">
                        <label for="my-input">Localidad:
                            <div id="descripcion_localidad"></div>
                            <button type="button" id="localidad" class="btn btn-primary " style="width: 134px">
                                <div class="icon voyager-zoom-in">Localidad</div> 
                            </button>
                               
                        </label>
                    <input wire:model="{{ $item->field}}" id="id_localidad" class="form-control" type="hidden" name="{{ $item->field}}">
                     
                    </div>
                @else
                <div class="form-group">
                    <label for="my-input">{{ $item->display_name}}</label>
                    <input wire:model="{{ $item->field}}" class="form-control" type="{{ $item->type}}" name="{{ $item->field}}">
                </div>
                @endif  
            
             @endif

        @endforeach
         <button type="button" wire:click="guardar" id="guardar_cliente"class="btn btn-primary">Guardar </button>

         

    </div>
</div>



</div>




