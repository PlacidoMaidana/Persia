<?php

namespace App\Http\Livewire;

use Livewire\Component;

class Pato extends Component
{
    public $texto;
    public function render()
    {
        return view('livewire.pato')
        ->extends('layouts.app')//extends('voyager::master') //
        ->section('content');
    }

    public function escribe_texto()
    {
        $this->texto="Si te postran diez veces te levantas otras diez.....";
    }
}
