<?php

namespace App\Http\Livewire;

use Livewire\Component;

class EmbebidoComponent extends Component
{
    
    public $producto;
    public $cantidad;
    public $precio;
    public $total_linea;

    public $detalles=array();
    public $detalles_string="El hombre nace y muere a veces sin vivir";
    public $contador=5;

    public function render()
    {
       
        return view('livewire.embebido-component',['detalles'=>$this->detalles])
        ->extends('layouts.app')
        ->section('content');
        
    }
    
    public function resetImput()
    {
        $this->producto ="";
        $this->cantidad=null;
        $this->precio =null;
        
        
    }
    public function addDetalles()
    {
       $this->total_linea= floatval($this->cantidad) * floatval($this->precio);
        
       $a=array('producto'=> $this->producto,   
       'cantidad'=> $this->cantidad,
       'precio'=>  $this->precio,
       'total-linea' =>$this->total_linea);
       $this->detalles[]=$a;     
       $this->detalles_string=serialize($this->detalles);
       $this->resetImput();

   
    }

   
}
