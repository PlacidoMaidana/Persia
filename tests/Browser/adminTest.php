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
     * @group pedidos
     */
    public function testExample()
    {
        $this->browse(function (Browser $browser) {
            $browser->visit('/admin')
                    ->screenshot('PantallaInicio')
                    ->assertSee('Laravel');
        });
    }

    /**
     * A Dusk test example.
     *
     * @return void
     * @group pedidos
     */
    public function testPostLogin()
    {
        $this->browse(function (Browser $browser) {
            $browser->loginAs(User::find(1))
                    ->visit('/admin')
                    ->clickLink('Nota Pedidos')
                    ->pause(1000)
                    ->screenshot('NotaPedidos_brows')
                    ->clickLink('Edit')
                    ->pause(1000)
                    ->screenshot('NotaPedidos_ficha')
                    ->press('productos')
                    ->pause(1000)
                    ->screenshot('NotaPedidos_Modal')
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
     * @group pedidos_nuevo
     */
    public function testSeleccionarProducto()
    {
        $this->browse(function (Browser $browser) {
            $browser->loginAs(User::find(1))
            ->visit('/admin')
            ->clickLink('Nota Pedidos')
            ->pause(1000)
            ->screenshot('a')
            //->clickLink('Edit')
            ->clickLink('Add New')
            ->pause(1000)
            ->screenshot('b')            
            ->pause(1000)
            ->press('Productos')
            ->pause(1000)
            ->screenshot('c')
            ->assertSee('Piedra liston')
            ->clickLink('Seleccionar 1')//Una vez seleccionado deberia cerrar el modal pero al cargar el datatable al modal no funciona
             //->type('fecha', 'id_cliente','cantidad','observaciones')
             //->append('12/02/2022', 'Pablo',4,'Comprando piso para el baño')
             ->type('fecha','7/02/2018')
             ->select('id_cliente', 'Pablo')
             ->type('#cantidad','5')
             ->waitFor('#richtextobservaciones_ifr')
             //->driver->executeScript('tinyMCE.get(\'#tinymce\').setContent(\'<h1>Hola viejo Lobo</h1>\')')
             //->type('observaciones','este pedido es para el piso del patio')
            ->press('Agregar')
            ->pause(1000)
            ->screenshot('d')
            ->press('Save')
            ->pause(1000)
            ->screenshot('e');
        });
    }

    /**
     * A Dusk test example.
     *
     * @return void
     * @group pedidos_modal
     */
    public function testProbandoModal()
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
            ->press('Cancel')
            ->pause(200)
            ->press('productos')
            ->pause(1000)
            ->screenshot('productosElegir abrir de nuevo')
            ->assertSee('Piedra liston')
            ->clickLink('Seleccionar 1')
            ->pause(1000)
            ->screenshot('ProductoElegido');
        });
    }

    /**
     * A Dusk test example.
     *
     * @return void
     * @group pedidos
     */
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

     /**
     * A Dusk test example.
     *
     * @return void
     * @group pedidos_nuevo_cliente
     */
    public function testNuevoCliente()
    {
        $this->browse(function (Browser $browser) {
            $browser->loginAs(User::find(1))
            ->visit('/admin')
            ->clickLink('Nota Pedidos')
            ->pause(1000)
            ->screenshot('a')
            //->clickLink('Edit')
            ->clickLink('Add New')
            ->pause(1000)
            ->screenshot('b')            
            ->pause(1000)
            ->press('Productos')
            ->pause(1000)
            ->screenshot('c')
            ->assertSee('Piedra liston')
            ->clickLink('Seleccionar 1')//Una vez seleccionado deberia cerrar el modal pero al cargar el datatable al modal no funciona
             //->type('fecha', 'id_cliente','cantidad','observaciones')
             //->append('12/02/2022', 'Pablo',4,'Comprando piso para el baño')
             ->type('fecha','7/02/2018')
             ->select('id_cliente', 'Pablo')
             ->type('#cantidad','5')
             ->waitFor('#richtextobservaciones_ifr')
             //->driver->executeScript('tinyMCE.get(\'#tinymce\').setContent(\'<h1>Hola viejo Lobo</h1>\')')
             //->type('observaciones','este pedido es para el piso del patio')
            ->press('Agregar')
            ->pause(1000)
            ->screenshot('d')
            ->press('Save')
            ->pause(1000)
            ->screenshot('e');
        });
    }

    


}
