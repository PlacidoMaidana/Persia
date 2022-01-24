<?php

namespace Tests\Browser;

use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Laravel\Dusk\Browser;
use Tests\DuskTestCase;

class adminTest extends DuskTestCase
{
    /**
     * A Dusk test example.
     *
     * @return void
     */
    public function testExample()
    {
        $this->browse(function (Browser $browser) {
            $browser->visit('/admin')
                    ->screenshot('PantallaPato')
                    ->assertSee('Laravel');
        });
    }

    /**
     * A Dusk test example.
     *
     * @return void
     */
    public function testPostLogin()
    {
        $this->browse(function (Browser $browser) {
            $browser->loginAs(User::find(1))
                    ->visit('/admin')
                    ->clickLink('Nota Pedidos')
                    ->pause(1000)
                    ->screenshot('BrowsNotaPedidos')
                    ->clickLink('Edit')
                    ->pause(1000)
                    ->screenshot('fichaNotaPedidos')
                    ->press('productos')
                    ->pause(1000)
                    ->screenshot('productosElegir')
                    ->assertSee('Piedra liston');
        });
    }

     /**
     * A Dusk test example.
     *
     * @return void
     */
    public function testNotaPedido()
    {
        $this->browse(function (Browser $browser) {
            $browser->loginAs(User::find(1))
                    ->visit('/admin/nota-pedidos')
                    ->pause(1000)
                    ->screenshot('NotasPedido')
                    ->assertSee('Dashboard');
        });
    }

     /**
     * A Dusk test example.
     *
     * @return void
     */
    public function testSeleccionarProducto()
    {
        $this->browse(function (Browser $browser) {
            $browser->loginAs(User::find(1))
            ->visit('/admin')
            ->clickLink('Nota Pedidos')
            ->pause(1000)
            ->screenshot('BrowsNotaPedidos')
            ->clickLink('Edit')
            ->pause(1000)
            ->screenshot('fichaNotaPedidos')
            ->press('productos')
            ->pause(1000)
            ->screenshot('productosElegir')
            ->assertSee('Piedra liston')
            ->clickLink('Seleccionar 1')
            ->pause(1000)
            ->screenshot('ProductoElegido');
        });
    }

    public function testRutaDeLaTabla()
    {
        $this->browse(function (Browser $browser) {
            $browser->loginAs(User::find(1))
                    ->visit('/tabla_productos_elegir')
                    ->pause(1000)
                    ->screenshot('Datos de la tabla')
                    ->assertSee('Piedra liston');
        });
    }


}
