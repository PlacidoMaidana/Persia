<?php

namespace App\Http\Livewire\Compras;
use App\Models\Producto;
use App\Models\Factura_Compra;
use Livewire\Component;
use TCG\Voyager\Alert;
use Illuminate\Support\Facades\DB;


class Compras extends Component
{
    public $id_producto;
    public $producto;
    public $cantidad;
    public $precio;
    public $total_linea;
    public $total_general=0;
    public $detalles=array();
    public $detalles_string;
    public $renglones;
    public $iva_21=0;
    public $iva_10_5=0;
    public $iva_27=0; 
    public $iva=0;
    public $monto_perc_iibb=0;
    public $monto_percepcion_iva=0;
    public $monto_percep_ganancias=0;
    public $otros_impuestos=0;
    public $total_impuestos;
    public $total_factura;
    public $subtotal;


    protected $listeners = ['actualiza' => 'seleccion_producto'];
   
    public function mount($renglones,$id_factura)
    {
     
      //session()->flash('El producto', $renglones[0]->descripcion);
       //  dd($renglones[0]->descripcion);
       $facturaCompra = DB::table('facturas_compras')->where('id', '=', $id_factura)->first();

        // dd($facturaCompra);
      
         $this->iva_21=$facturaCompra->iva_21;
         $this->iva_10_5=$facturaCompra->iva_10_5;
         $this->iva_27=$facturaCompra->iva_27; 
         $this->iva=$this->iva_21 +$this->iva_10_5+$this->iva_27;
         $this->monto_perc_iibb=$facturaCompra->monto_perc_iibb;
         $this->monto_percepcion_iva=$facturaCompra->monto_percepcion_iva;
         $this->monto_percep_ganancias=$facturaCompra->monto_percep_ganancias;
         $this->otros_impuestos=$facturaCompra->otros_impuestos;
         $this->total_impuestos=$facturaCompra->total_impuestos;
         $this->total_factura=$facturaCompra->total_factura;
         $this->subtotal=$facturaCompra->subtotal;




            if (!is_null($renglones)) {
               $this->total_general=0;
                foreach ($renglones as $key => $value) {
                   $prod=Producto::find($value->id_producto);
                   /*var_dump($value);
                   continue;*/
                   $a=array(
                   'id_producto'=> $value->id_producto,
                   'producto'=> $value->descripcion,   
                   'cantidad'=> $value->cantidad,
                   'precio'=> $value->precio_c,
                   'total-linea'=>$value->total_linea);
                   $this->detalles[]=$a;
                   $this->detalles_string=serialize($this->detalles);
                   $this->total_general+=$value->total_linea;
                   $this->subtotal=$this->total_general;
                   $this->total_impuestos=$this->iva_10_5+$this->iva_21+$this->iva_27+$this->monto_percep_ganancias+$this->monto_percepcion_iva+$this->monto_perc_iibb+$this->otros_impuestos;
                   $this->total_factura=$this->total_general+$this->total_impuestos;
                }
            }

       }

    public function render()
    {
        
        return view('livewire.compras.compras',['detalles'=>$this->detalles])
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
           'precio'=> $value['preciovta'],
           'total-linea'=>$value['total_linea']);
         $this->detalles[]=$a; 

         $this->total_general+=$value['total_linea'];
         $this->subtotal=$this->total_general;
         $this->total_impuestos=$this->iva_10_5+$this->iva_21+$this->iva_27+$this->monto_percep_ganancias+$this->monto_percepcion_iva+$this->monto_perc_iibb+$this->otros_impuestos;
         $this->total_factura=$this->total_general+$this->total_impuestos;
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
       $this->subtotal=$this->total_general;
       $this->total_impuestos=$this->iva_10_5+$this->iva_21+$this->iva_27+$this->monto_percep_ganancias+$this->monto_percepcion_iva+$this->monto_perc_iibb+$this->otros_impuestos;
       $this->total_factura=$this->total_general+$this->total_impuestos;
       //$this->resetImput();
     }

    public function quitar($index)
    {
       //dd($this->detalles[$index]);
       $this->total_general-=$this->detalles[$index]['total-linea'];
       unset($this->detalles[$index]);
       $this->detalles_string=serialize($this->detalles);
       $this->subtotal=$this->total_general;
       $this->total_impuestos=$this->iva_10_5+$this->iva_21+$this->iva_27+$this->monto_percep_ganancias+$this->monto_percepcion_iva+$this->monto_perc_iibb+$this->otros_impuestos;
       $this->total_factura=$this->total_general+$this->total_impuestos;
       
    }

    public function seleccion_producto($id,$nombre,$precio)
    {
            
      $this->id_producto =$id;
      $this->producto =$nombre;
     // $this->precio = $precio;
    }
    



}
