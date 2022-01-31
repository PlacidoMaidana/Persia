<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class RubroFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'rubro'=>$this->faker->sentence(3),
        ];
    }
}
