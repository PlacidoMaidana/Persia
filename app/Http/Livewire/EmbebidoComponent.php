<?php

namespace App\Http\Livewire;

use Livewire\Component;

class EmbebidoComponent extends Component
{
    
    public $producto ="";
    public $cantidad ="";
    public $precio ="";
    public $total_linea ="";

    public $detalles=array();

    public function render()
    {
       
        return view('livewire.embebido-component',['detalles'=>$this->detalles])
        ->extends('layouts.app')
        ->section('content');
    }
    
    public function addDetalles()
    {
        $det=array(
            'producto'=>  $this->producto  ,   
            'cantidad'=>  $this->cantidad,
            'precio'=>  $this->precio,
            'total-linea' => $this->total_linea, 
          );
        $this->detalles[]=$det;
    }

   
}
