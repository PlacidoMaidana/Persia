<?php

namespace App\Http\Livewire;

use App\Models\Cliente;
use App\Models\Localidad;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


use Livewire\Component;

class FichaCliente extends Component
{

       // public $id;
        public $nombre;
        public $cuit;
        public $fecha_alta;
        public $direccion;
        public $cp;
        public $tel;
        public $id_localidad;
        public $e_mail;
        public $observaciones;
        public $cond_iva;
        public $registro_fce;
       // public created_at;
       // public updated_at;
       // public cliente_hasone_localidad_relationship;

       protected $listeners = ['localidad_elegida' => 'seleccion_localidad'];

    public function render()
    {

        $Nota_pedido_id=3;
        $slug='clientes';
        $dataType = DB::table('data_types')->where('slug', '=', $slug)->first();
       
        // Check permission
        //$this->authorize('add', app($dataType->model_name));

        // $dataTypeContent = (DB::table('data_types')
        // ->join('data_rrows as r','data_types.id','=','r.data_type_id')
        // ->select('r.field', 'r.type', 'r.display_name', 'r.required'))
        // ->where('r.data_type_id','=',13);

        $dataTypeContent = DB::table('data_rows')
        ->select('field', 'type', 'display_name', 'required')
        ->where('data_type_id','=',13)->get();
        
        // $localidades = Localidad::all();
        // dd($localidades);

        //dd($dataTypeContent);
        


        return view('livewire.ficha-cliente',compact('Nota_pedido_id','dataType',
           'dataTypeContent'));
    }

    public function guardar()
    {
        $cliente=new Cliente();
        $cliente->nombre=$this->nombre;
        $cliente->cuit=$this->cuit;
        $cliente->fecha_alta=$this->fecha_alta;
        $cliente->direccion=$this->direccion;
        $cliente->tel=$this->tel;
        $cliente->e_mail=$this->e_mail;
        $cliente->observaciones=$this->observaciones;
        $cliente->id_localidad=$this->id_localidad;
        
        $cliente->save();
    }

    public function seleccion_localidad($id_localidad)
    {
      
      $this->id_localidad =$id_localidad;
      
    }

}
