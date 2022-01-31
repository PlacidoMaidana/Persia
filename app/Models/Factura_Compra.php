<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Factura_Compra extends Model
{
    protected $table = 'facturas_compras';
    use HasFactory;
    public function matprima() {
        
        return $this->belongsToMany('App\Models\matprima','detalle_factura_compra', 'id_factura_compra','id_articulo')->withPivot('id','cantidad','precio_c');
    }
    public function detalle_factura_compra() {
        return $this -> hasMany(Detalle_Factura_Compra::class);
    }
    public function tipo_gasto() {
        return $this -> belongsto(tipo_gasto::class);
    }
}
