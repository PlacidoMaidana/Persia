<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Subrubro;

class Rubro extends Model
{
    use HasFactory;

    public function Subrubros(Type $var = null)
    {
        return $this->hasMany(Subrubro::class);
    }
}
