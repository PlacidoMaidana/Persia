<?php

namespace App\Http\Livewire\Pedidos;

use Livewire\Component;

class EmbebidoComponent extends Component
{
    public $id_producto;
    public $producto;
    public $cantidad;
    public $precio;
    public $total_linea;
    public $total_general=0;

    public $detalles=array();
    public $detalles_string;
    public $contador=5;


    protected $listeners = ['actualiza' => 'seleccion_producto'];


    public function render()
    {
       
        return view('livewire.pedidos.embebido-component',['detalles'=>$this->detalles])
        ->extends('layouts.app')//extends('voyager::master') //
        ->section('content');
       
        
    }
    
    public function resetImput()
    {
        $this->id_producto =null;
        $this->producto ="";
        $this->cantidad=null;
        $this->precio =null;
        
        
    }

    

    public function addDetalles()
    {
       
       $this->total_linea= floatval($this->cantidad) * floatval($this->precio);
        
       $a=array('id_producto'=> $this->id_producto,
       'producto'=> $this->producto,   
       'cantidad'=> $this->cantidad,
       'precio'=>  $this->precio,
       'total-linea' =>$this->total_linea);
       $this->detalles[]=$a;     
       $this->detalles_string=serialize($this->detalles);
       $this->total_general+=$this->total_linea;
       //$this->resetImput();

   
    }

   
    
    public function quitar($index)
    {
       unset($this->detalles[$index]);
       $this->detalles_string=serialize($this->detalles);
       $this->total_general-=$this->total_linea;

    }

    public function seleccion_producto($id,$nombre,$precio)
    {
       session()->flash("mensaje","se selecciono correctamente");
      $this->id_producto =$id;
      $this->producto =$nombre;
      $this->precio =$precio;
    }
    
   
}
