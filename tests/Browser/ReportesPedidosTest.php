<?php

namespace Tests\Browser;

use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Laravel\Dusk\Browser;
use Tests\DuskTestCase;

class ReportesPedidosTest extends DuskTestCase
{
    /**
     * A Dusk test example.
     * 
     * @return void
     * @group reporte
     * 
     */
    public function testExample()
    {
        $this->browse(function (Browser $browser) {
            $browser->loginAs(User::find(1))
            ->visit('/admin/nota-pedidos/4/edit/')
            ->press('#imprime')
            ->assertSee('4')
            ->pause(1000)
            ->screenshot('DetalleDePedido');
            });
    }


    /**
     * A Dusk test example.
     * 
     * @return void
     * @group pato
     * 
     */
    public function testPato()
    {
        $this->browse(function (Browser $browser) {
            $browser->loginAs(User::find(1))
            ->visit('/pato')
            // ->value('#nombre_producto','Producto de prueba')
            // ->value('#cantidad',4)
            // ->value('#precio',300)
            ->pause(1000)
            ->assertSee('escribe')
            ->screenshot('Pato')
            ->press('escribe')            
            ->pause(1000)
            ->assertSee('Si te postran diez veces te levantas')
            ->screenshot('escribio');
        });
    }

}
