<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class EmbebidoComponente extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    // public function test_embebido()
    // {
    //     $response = $this->get('/productos_elegir');
    //     $response->assertSee('Piedra liston modelo persia');
    //     $response->assertStatus(200);
    // }

    /**
     * Provando la ruta y la vista que sera de la tabla.
     *
     * @return void
     */
    public function test_tabla_productos_elegir()
    {
        $response = $this->get('/tabla_productos_elegir');
        $response->assertSee('carosos');
        $response->assertStatus(200);
    }
}
