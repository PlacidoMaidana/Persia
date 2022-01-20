<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;


class ProductoFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            
            'cod_producto'=> Str::random(10),
            'descripcion'=>$this->faker->sentence(3),
            'rubro_id'=>$this->faker->numberBetween(0,9),
            'subrubro_id'=>$this->faker->numberBetween(0,9),
            'preciovta'=>$this->faker->numberBetween(200,600),
            'preciocosto'=>$this->faker->numberBetween(100,500),
            'tasa_iva'=>$this->faker->numberBetween(200,600),
            'unidad'=>Str::random(10),
            'peso'=>$this->faker->numberBetween(10,20),
            'porcgcia'=>$this->faker->numberBetween(10,30),
            'activo'=>true,
            'formula_id'=>$this->faker->numberBetween(1,3),
            'materiaprima_reventa_id'=>$this->faker->numberBetween(1,3),

            
        ];
    }
}
