<div>
    {{-- The Master doesn't talk, he acts. --}}
    <div class="alert alert-primary" role="alert">
        <h4 class="alert-heading">este es mi componente</h4>
       Esta es solo una alerta de prueba.
    </div>

    @foreach ($Clientes as $item)
        {{$item->nombre}}
    @endforeach
</div>
