<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proveedor extends Model
{
    protected $table = 'proveedores';
    protected $fillable = [
        'razon social',
        'direccion',
        'actividad_principal',
        'nombre_comercial', 
        'id_localidad',
        'web' ,
        'teefono',
        'mail',
        'cuit',
        'cond_iva',
        'agente_percepcion_iva',
        'porcentaje_percep_iva',
        'agente_percep_dgr',
        'porcentaje_percep_dgr',
        'nombre_contacto',
        'telefono_contacto',
        'observaciones',
    ];

    use HasFactory;
}
