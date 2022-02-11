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
        @if (( $item->field=='created_at')||( $item->field=='updated_at')||( $item->field=='id')||( $item->field=='id_localidad')||
             ( $item->field=='registro_fce')||( $item->field=='cond_iva')||( $item->field=='cliente_hasone_localidad_relationship')||( $item->field=='cp')
            )
            @php
                continue;
            @endphp
        @else
        <form action="">
        
            <div class="form-group">
                <label for="my-input">{{ $item->display_name}}</label>
                <input wire:model="{{ $item->field}}" class="form-control" type="{{ $item->type}}" name="{{ $item->field}}">
            </div>
        </form>
            
        @endif

        @endforeach
         <button type="button" wire:click="guardar" id="guardar_cliente"class="btn btn-primary">+ cliente </button>
    </div>
</div>



</div>
