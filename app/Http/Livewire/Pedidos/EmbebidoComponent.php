<?php

namespace App\Http\Livewire\Pedidos;
use App\Models\Producto;
use App\Models\OrdenesFabricacion;
use App\Models\nota_pedido;
use Livewire\Component;
use TCG\Voyager\Alert;

class EmbebidoComponent extends Component
{
    public $id_producto;
    public $producto;
    public $cantidad;
    public $unidad;
    public $precio;
    public $total_linea;
    public $estado;

    public $totalgravado=0;
    public $modVenta='';
    public $descuento1=0;    
    public $descuento=0;
    public $gravadocondescuento=0;
    public $totalconiva=0;
    public $monto_iva=0;
    public $total=0;

    public $detalles=array();
    public $detalles_string;
    public $contador=5;
    public $renglones;


    protected $listeners = ['actualiza' => 'seleccion_producto','totales'=>'CalculosTotales'];

    public function mount($renglones)
    {

              if (!is_null($renglones)) {
               $id_pedido=($renglones[0]->id_pedido);
               $pedido=nota_pedido::find($id_pedido);
         
               $this->totalgravado=0;
                foreach ($renglones as $key => $value) {
                   $prod=Producto::find($value->id_producto);
                   $ord_fab = OrdenesFabricacion::select('estado')
                        ->where('id_pedido', '=', $id_pedido)
                        ->Where('id_producto', '=', $value->id_producto)
                        ->first();
                  if (empty($ord_fab->estado) )
                      { 
                       $estado = "";
                      } 
                    else 
                      {
                      $estado= $ord_fab->estado;
                      }
                    
                 
                   $a=array(
                   'id_producto'=> $value->id_producto,
                   'producto'=> $value->descripcion,   
                   'cantidad'=> $value->cantidad,
                   'unidad'=> $value->unidad,
                   'precio'=> $value->precio, 
                   'total-linea'=>$value->total_linea,
                   'estado'=>  $estado);
                   $this->detalles[]=$a;
                   $this->detalles_string=serialize($this->detalles);
                   $this->totalgravado+=$value->total_linea;
                }
                // dd($renglones,$this->detalles);
                $this->CalculosTotales($this->modVenta,$this->descuento1);
              }
    }

    

    public function render()
    {

        return view('livewire.Pedidos.embebido-component',['detalles'=>$this->detalles])
        ->extends('layouts.app')//extends('voyager::master') //
        ->section('content');
    }

    public function editar_renglones($renglones)
    {
   
      $this->totalgravado=0;
      $id_pedido=($renglones[0]->id_pedido);
      $pedido=nota_pedido::find($id_pedido);
      foreach ($renglones as $key => $value) {
         $prod=Producto::find($value['id_producto']);
       
         $a=array(
           'id_producto'=> $value['id_producto'],
           'producto'=> $value['descripcion'],   
           'cantidad'=> $value['cantidad'],
           'unidad'=> $value['unidad'],
           'precio'=> $value['precio'], 
           'total-linea'=>$value['total_linea'],
           'estado'=>$value['estado']
          );
         $this->detalles[]=$a; 
         $this->totalgravado+=$value['total_linea'];
      }
      $this->CalculosTotales($this->modVenta,$this->descuento1);
    }
    
    public function resetImput()
    {
        $this->id_producto =null;
        $this->producto ="";
        $this->cantidad=null;
        $this->precio =null;
        $this->estado =null;
        
    }

    public function addDetalles()
    {
   
      $this->total_linea= floatval($this->cantidad) * floatval($this->precio);
      
       $a=array('id_producto'=> $this->id_producto,
       'producto'=> $this->producto,   
       'cantidad'=> $this->cantidad,
       'unidad'=> $this->unidad,
       'precio'=>  $this->precio,
       'total-linea' =>$this->total_linea,
       'estado' =>$this->estado);
       $this->detalles[]=$a;     
       $this->detalles_string=serialize($this->detalles);
       $this->totalgravado+=$this->total_linea;
       $this->CalculosTotales($this->modVenta,$this->descuento1);
    }

    public function CalculosTotales($modVenta,$descuento1)
    {
       
       $this->modVenta=$modVenta;
       $this->descuento1= $descuento1;
       if (($descuento1!=0) &&  !empty($descuento1) ) {
          $this->descuento = ($this->descuento1 * $this->totalgravado) / 100 ;
         }else{
         $this->descuento = 0;
         }

       
       $this->gravadocondescuento = $this->totalgravado + $this->descuento; 
       $this->monto_iva = $this->gravadocondescuento * 0.21 ; 
       $this->totalconiva = $this->gravadocondescuento * 1.21;
      
       if ( $modVenta=="Contado") {
         $this->total=$this->gravadocondescuento ;
         }else{
          $this->total=$this->gravadocondescuento  +  $this->monto_iva;
         }
         
    }
   
    
    public function quitar($index)
    {
       //dd($this->detalles[$index]);
       $this->totalgravado-=$this->detalles[$index]['total-linea'];
       $this->CalculosTotales($this->modVenta,$this->descuento1);
       unset($this->detalles[$index]);
       $this->detalles_string=serialize($this->detalles);
    }

    public function seleccion_producto($id,$nombre,$precio,$unidad)
    {
      $this->id_producto =$id;
      $this->producto =$nombre;
      $this->precio =$precio;
      $this->unidad =$unidad;
    }
    
   
}
