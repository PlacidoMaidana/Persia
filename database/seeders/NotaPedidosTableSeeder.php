<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class NotaPedidosTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('nota_pedidos')->delete();
        
        \DB::table('nota_pedidos')->insert(array (
            0 => 
            array (
                'id' => 1,
                'fecha' => '2022-02-10 00:00:00',
                'id_cliente' => 1,
                'totalgravado' => '4800.00',
                'total' => '4800.00',
                'monto_iva' => '0.00',
                'id_vendedor' => 1,
                'aprobado' => 'NO',
                'id_factura' => NULL,
                'descuento' => '20.00',
                'observaciones' => '<p>Primer pedido</p>',
                'created_at' => '2022-02-10 22:57:33',
                'updated_at' => '2022-02-27 14:37:20',
                'estado' => 'Entregado',
            ),
            1 => 
            array (
                'id' => 2,
                'fecha' => '2022-02-13 00:00:00',
                'id_cliente' => 2,
                'totalgravado' => '9000.00',
                'total' => '9000.00',
                'monto_iva' => '0.00',
                'id_vendedor' => 1,
                'aprobado' => 'SI',
                'id_factura' => NULL,
                'descuento' => '20.00',
                'observaciones' => '<p>nada que decir</p>
<p>&nbsp;</p>',
                'created_at' => '2022-02-12 18:35:45',
                'updated_at' => '2022-02-26 15:57:49',
                'estado' => 'En proceso',
            ),
            2 => 
            array (
                'id' => 3,
                'fecha' => '2022-02-13 00:00:00',
                'id_cliente' => 2,
                'totalgravado' => '1500.00',
                'total' => '1500.00',
                'monto_iva' => '0.00',
                'id_vendedor' => 1,
                'aprobado' => 'SI',
                'id_factura' => NULL,
                'descuento' => '20.00',
                'observaciones' => '<p>nada que decir</p>
<p>&nbsp;</p>',
                'created_at' => '2022-02-12 18:42:34',
                'updated_at' => '2022-02-26 15:57:34',
                'estado' => 'En espera',
            ),
            3 => 
            array (
                'id' => 4,
                'fecha' => '2022-02-16 00:00:00',
                'id_cliente' => 1,
                'totalgravado' => '4500.00',
                'total' => '4500.00',
                'monto_iva' => '0.00',
                'id_vendedor' => 1,
                'aprobado' => 'SI',
                'id_factura' => NULL,
                'descuento' => '20.00',
                'observaciones' => '<p>Se eliminara</p>',
                'created_at' => '2022-02-27 14:38:50',
                'updated_at' => '2022-02-27 14:38:50',
                'estado' => 'En espera',
            ),
        ));
        
        
    }
}