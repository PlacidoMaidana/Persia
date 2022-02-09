
@php
 //   dd($dataType);
@endphp

 <!-- Adding / Editing -->

 <div class="card">
    <img class="card-img-top" src="holder.js/100x180/" alt="">
    <div class="card-body">
        <h4 class="card-title">Clientes</h4>
        @foreach ($dataTypeContent as $item)
        <form action="">
        
            <div class="form-group">
                <label for="my-input">{{ $item->display_name}}</label>
                <input id="{{ $item->field}}" class="form-control" type="{{ $item->type}}" name="{{ $item->field}}">
            </div>
        </form>
        @endforeach
         <button type="button" class="btn btn-primary">+ cliente </button>
    </div>
</div>







{{-- <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label> --}}

 