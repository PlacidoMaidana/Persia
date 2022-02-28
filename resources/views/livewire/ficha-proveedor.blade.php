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
                @if ( ( $item->field=='created_at')||( $item->field=='updated_at')||( $item->field=='id')||
                      ( $item->field=='mail')||( $item->field=='cuit')||( $item->field=='direccion')
                      )
                        @php
                            continue;
                        @endphp
                @else 
                    <div class="form-group">
                        <label for="my-input">{{ $item->display_name}}</label>
                        <input wire:model="{{ $item->field}}" class="form-control" type="{{ $item->type}}" name="{{ $item->field}}">
                    </div>
                                   
                 @endif
    
            @endforeach
             <button type="button" wire:click="guardar" id="guardar_proveedor"class="btn btn-primary">+ proveedor </button>
    
             
    
    
        </div>
    </div>
    
    
    
    </div>
    
    
    
    
    