<?php


namespace Database\Seeders;

use App\Models\Rubro;
use Database\Factories\RubroFactory;
use Illuminate\Database\Seeder;

class RubroSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
            Rubro::factory()->count(10)->create();
    }
}
