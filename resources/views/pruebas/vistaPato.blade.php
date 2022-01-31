@extends('layouts.app')
@section('content')

<div class="container">
  <h1>Hola viejo lobo</h1>

  @livewire('pedidos.embebido-component');

  {{-- @livewire('pato'); --}}
</div>

@endsection