<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class SubrubroFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'rubro_id'=>$this->faker->numberBetween(0,9),
            'descripcion_subrubro'=>$this->faker->sentence(3),
        ];
    }
}
