

<div>
    {{-- Stop trying to control. --}}


    <div class="card">
        <img class="card-img-top" src="holder.js/100x180/" alt="">
        <div class="card-body">
            <h4 class="card-title">Componente de pato</h4>
            <p class="card-text">{{$texto}}</p>
            <button wire:click="escribe_texto"> escribe </button>
            <button wire:click.prevent="escribe_texto()">+</button>

        </div>
    </div>



</div>


