<?php

namespace App\Http\Livewire\Productos;
use App\Models\Producto;
use App\Models\Dosificacion;
use Livewire\Component;
use TCG\Voyager\Alert;
use Illuminate\Support\Facades\DB;

class embebidofabpropia extends Component
{
    public $id_producto;
    public $producto;
    public $cantidad;
    public $color;
    public $unidad;
    public $detalles=array();
    public $detalles_string;
    public $contador=5;
    public $renglones;

    protected $listeners = ['actualiza' => 'seleccion_producto'];

    public function mount($renglones) //, $id_producto
    {
         //session()->flash('El producto', $renglones[0]->descripcion);
         //  dd($renglones[0]->descripcion);
     //$producto = DB::table('productos')->where('id', '=', $id_producto)->first();
        // dd($producto);


            if (!is_null($renglones)) {
               foreach ($renglones as $key => $value) {
                   $prod=Producto::find($value->id_insumo_producto);

                   $a=array(
                   'id_producto'=> $value->id_insumo_producto,
                   'producto'=> $value->descripcion,   
                   'color'=> $value->color,   
                   'cantidad'=> $value->cant_unid_produc,
                   'unidad'=> $value->unidad_consumo_produccion); 
                    $this->detalles[]=$a;
                    $this->detalles_string=serialize($this->detalles);
                   }
            }
           
    }

    public function render()
    {
         return view('livewire.Productos.embebido-fabpropia',['detalles'=>$this->detalles])
        ->extends('layouts.app')//extends('voyager::master') //
        ->section('content');
    }

    public function editar_renglones($renglones)
    {
      
      foreach ($renglones as $key => $value) {
         $prod=Producto::find($value['id_producto']);
       
         $a=array(
           'id_producto'=> $value['id_insumo_producto'],
           'producto'=> $value['descripcion'],   
           'color'=> $value['color'],
           'cantidad'=> $value['cant_unid_produc'],
           'unidad'=> $value['unidad_consumo_produccion']); 
            $this->detalles[]=$a; 
      }
    }
    
    public function resetImput()
    {
        $this->id_producto =null;
        $this->producto ="";
        $this->color=null;
        $this->cantidad=null;
        $this->unidad =null;
    }
    public function addDetalles()
    {
        $a=array('id_producto'=> $this->id_producto,
       'producto'=> $this->producto,   
       'color'=> $this->color,
       'cantidad'=> $this->cantidad,
       'unidad'=>  $this->unidad);
       $this->detalles[]=$a;     
       $this->detalles_string=serialize($this->detalles);
      //$this->resetImput();
    }  
    public function quitar($index)
    {
       //dd($this->detalles[$index]);
       unset($this->detalles[$index]);
       $this->detalles_string=serialize($this->detalles);
    }

    public function seleccion_producto($id,$nombre)
    {
      $this->id_producto =$id;
      $this->producto =$nombre;
      
    }
    
   
}
