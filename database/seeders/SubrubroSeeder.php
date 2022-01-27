<?php

namespace Database\Seeders;

use App\Models\Subrubro;
use Illuminate\Database\Seeder;

class SubrubroSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Subrubro::factory()->count(10)->create();
    }
}
