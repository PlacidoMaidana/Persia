<?php

namespace Tests\Browser;

use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Laravel\Dusk\Browser;

use Tests\DuskTestCase;

class pedidos extends DuskTestCase
{
    /**
     * A Dusk test example.
     *
     * @return void
     */
    public function testPedido()
    {
          

        $this->browse(function (Browser $browser) {
            $browser->visit('/')
            ->screenshot('Brows')
            ->assertSee('Laravel');
            // $browser->loginAs(User::find(1))
            //         ->visit('http://127.0.0.1:8000/admin/')
            //         ->screenshot('Brows');
                    //->press('.edit')
                    //->screenshot('Brows');
                    //->assertSee('Laravel');
        });
    }
}
