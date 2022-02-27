<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RenglonesNotapedidosTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('renglones_notapedidos')->delete();
        
        \DB::table('renglones_notapedidos')->insert(array (
            0 => 
            array (
                'id' => 17,
                'id_pedido' => 3,
                'id_producto' => 2,
                'cantidad' => '5.00',
                'total_linea' => '1500.000',
                'iva' => '21.00',
                'id_factura' => NULL,
                'created_at' => '2022-02-26 15:57:34',
                'updated_at' => '2022-02-26 15:57:34',
            ),
            1 => 
            array (
                'id' => 18,
                'id_pedido' => 2,
                'id_producto' => 2,
                'cantidad' => '30.00',
                'total_linea' => '9000.000',
                'iva' => '21.00',
                'id_factura' => NULL,
                'created_at' => '2022-02-26 15:57:49',
                'updated_at' => '2022-02-26 15:57:49',
            ),
            2 => 
            array (
                'id' => 20,
                'id_pedido' => 1,
                'id_producto' => 2,
                'cantidad' => '12.00',
                'total_linea' => '3600.000',
                'iva' => '21.00',
                'id_factura' => NULL,
                'created_at' => '2022-02-27 14:37:20',
                'updated_at' => '2022-02-27 14:37:20',
            ),
            3 => 
            array (
                'id' => 21,
                'id_pedido' => 1,
                'id_producto' => 2,
                'cantidad' => '4.00',
                'total_linea' => '1200.000',
                'iva' => '21.00',
                'id_factura' => NULL,
                'created_at' => '2022-02-27 14:37:20',
                'updated_at' => '2022-02-27 14:37:20',
            ),
            4 => 
            array (
                'id' => 22,
                'id_pedido' => 4,
                'id_producto' => 1,
                'cantidad' => '3.00',
                'total_linea' => '3600.000',
                'iva' => '21.00',
                'id_factura' => NULL,
                'created_at' => '2022-02-27 14:38:50',
                'updated_at' => '2022-02-27 14:38:50',
            ),
            5 => 
            array (
                'id' => 23,
                'id_pedido' => 4,
                'id_producto' => 5,
                'cantidad' => '3.00',
                'total_linea' => '900.000',
                'iva' => '21.00',
                'id_factura' => NULL,
                'created_at' => '2022-02-27 14:38:50',
                'updated_at' => '2022-02-27 14:38:50',
            ),
        ));
        
        
    }
}