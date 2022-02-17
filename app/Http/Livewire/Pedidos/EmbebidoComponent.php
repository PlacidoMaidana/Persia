<?php

namespace App\Http\Livewire\Pedidos;
use App\Models\Producto;
use Livewire\Component;
use TCG\Voyager\Alert;

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
    public $renglones;


    protected $listeners = ['actualiza' => 'seleccion_producto'];

    public function mount($renglones)
    {
      //session()->flash('El producto', $renglones[0]->descripcion);
         //  dd($renglones[0]->descripcion);

            if (!is_null($renglones)) {
               $this->total_general=0;
                foreach ($renglones as $key => $value) {
                   $prod=Producto::find($value->id_producto);

                   $a=array(
                   'id_producto'=> $value->id_producto,
                   'producto'=> $value->descripcion,   
                   'cantidad'=> $value->cantidad,
                   'precio'=> $prod['preciovta'], //$renglones->precio,
                   'total-linea'=>$value->total_linea);
                   $this->detalles[]=$a;
                   $this->detalles_string=serialize($this->detalles);
                   $this->total_general+=$value->total_linea;
                }
            }

            
    }

    public function render()
    {
        
        return view('livewire.pedidos.embebido-component',['detalles'=>$this->detalles])
        ->extends('layouts.app')//extends('voyager::master') //
        ->section('content');
        
      
        
    }

    public function editar_renglones($renglones)
    {
    
      
      
      $this->total_general=0;
     
      foreach ($renglones as $key => $value) {
         $prod=Producto::find($value['id_producto']);
       
         $a=array(
           'id_producto'=> $value['id_producto'],
           'producto'=> $value['descripcion'],   
           'cantidad'=> $value['cantidad'],
           'precio'=> $prod['preciocosto'], //$renglones->precio,
           'total-linea'=>$value['total_linea']);
         $this->detalles[]=$a; 

         $this->total_general+=$value['total_linea'];
      }
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
       //dd($this->detalles[$index]);
       $this->total_general-=$this->detalles[$index]['total-linea'];
       unset($this->detalles[$index]);
       $this->detalles_string=serialize($this->detalles);
       
      

    }

    public function seleccion_producto($id,$nombre,$precio)
    {
      
      $this->id_producto =$id;
      $this->producto =$nombre;
      $this->precio =$precio;
    }
    
   
}
