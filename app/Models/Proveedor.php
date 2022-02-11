<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proveedor extends Model
{
    protected $table = 'proveedores';
    protected $fillable = [
        'razonsocial', 
        'direccion',
        'nombre_comercial',
        'web',
        'telefono', 
        'mail',
        'cuit', 
        'cond_iva', 
        'nombre_contacto', 
        'telefono_contacto', 
        'observaciones', 
    ];

    use HasFactory;
}
