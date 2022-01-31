<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('permissions')->delete();
        
        \DB::table('permissions')->insert(array (
            0 => 
            array (
                'id' => 1,
                'key' => 'browse_admin',
                'table_name' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            1 => 
            array (
                'id' => 2,
                'key' => 'browse_bread',
                'table_name' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            2 => 
            array (
                'id' => 3,
                'key' => 'browse_database',
                'table_name' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            3 => 
            array (
                'id' => 4,
                'key' => 'browse_media',
                'table_name' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            4 => 
            array (
                'id' => 5,
                'key' => 'browse_compass',
                'table_name' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            5 => 
            array (
                'id' => 6,
                'key' => 'browse_menus',
                'table_name' => 'menus',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            6 => 
            array (
                'id' => 7,
                'key' => 'read_menus',
                'table_name' => 'menus',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            7 => 
            array (
                'id' => 8,
                'key' => 'edit_menus',
                'table_name' => 'menus',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            8 => 
            array (
                'id' => 9,
                'key' => 'add_menus',
                'table_name' => 'menus',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            9 => 
            array (
                'id' => 10,
                'key' => 'delete_menus',
                'table_name' => 'menus',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            10 => 
            array (
                'id' => 11,
                'key' => 'browse_roles',
                'table_name' => 'roles',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            11 => 
            array (
                'id' => 12,
                'key' => 'read_roles',
                'table_name' => 'roles',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            12 => 
            array (
                'id' => 13,
                'key' => 'edit_roles',
                'table_name' => 'roles',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            13 => 
            array (
                'id' => 14,
                'key' => 'add_roles',
                'table_name' => 'roles',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            14 => 
            array (
                'id' => 15,
                'key' => 'delete_roles',
                'table_name' => 'roles',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            15 => 
            array (
                'id' => 16,
                'key' => 'browse_users',
                'table_name' => 'users',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            16 => 
            array (
                'id' => 17,
                'key' => 'read_users',
                'table_name' => 'users',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            17 => 
            array (
                'id' => 18,
                'key' => 'edit_users',
                'table_name' => 'users',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            18 => 
            array (
                'id' => 19,
                'key' => 'add_users',
                'table_name' => 'users',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            19 => 
            array (
                'id' => 20,
                'key' => 'delete_users',
                'table_name' => 'users',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            20 => 
            array (
                'id' => 21,
                'key' => 'browse_settings',
                'table_name' => 'settings',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            21 => 
            array (
                'id' => 22,
                'key' => 'read_settings',
                'table_name' => 'settings',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            22 => 
            array (
                'id' => 23,
                'key' => 'edit_settings',
                'table_name' => 'settings',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            23 => 
            array (
                'id' => 24,
                'key' => 'add_settings',
                'table_name' => 'settings',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            24 => 
            array (
                'id' => 25,
                'key' => 'delete_settings',
                'table_name' => 'settings',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            25 => 
            array (
                'id' => 26,
                'key' => 'browse_categories',
                'table_name' => 'categories',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            26 => 
            array (
                'id' => 27,
                'key' => 'read_categories',
                'table_name' => 'categories',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            27 => 
            array (
                'id' => 28,
                'key' => 'edit_categories',
                'table_name' => 'categories',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            28 => 
            array (
                'id' => 29,
                'key' => 'add_categories',
                'table_name' => 'categories',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            29 => 
            array (
                'id' => 30,
                'key' => 'delete_categories',
                'table_name' => 'categories',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            30 => 
            array (
                'id' => 31,
                'key' => 'browse_posts',
                'table_name' => 'posts',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            31 => 
            array (
                'id' => 32,
                'key' => 'read_posts',
                'table_name' => 'posts',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            32 => 
            array (
                'id' => 33,
                'key' => 'edit_posts',
                'table_name' => 'posts',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            33 => 
            array (
                'id' => 34,
                'key' => 'add_posts',
                'table_name' => 'posts',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            34 => 
            array (
                'id' => 35,
                'key' => 'delete_posts',
                'table_name' => 'posts',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            35 => 
            array (
                'id' => 36,
                'key' => 'browse_pages',
                'table_name' => 'pages',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            36 => 
            array (
                'id' => 37,
                'key' => 'read_pages',
                'table_name' => 'pages',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            37 => 
            array (
                'id' => 38,
                'key' => 'edit_pages',
                'table_name' => 'pages',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            38 => 
            array (
                'id' => 39,
                'key' => 'add_pages',
                'table_name' => 'pages',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            39 => 
            array (
                'id' => 40,
                'key' => 'delete_pages',
                'table_name' => 'pages',
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            40 => 
            array (
                'id' => 56,
                'key' => 'browse_clientes',
                'table_name' => 'clientes',
                'created_at' => '2022-01-11 20:35:14',
                'updated_at' => '2022-01-11 20:35:14',
            ),
            41 => 
            array (
                'id' => 57,
                'key' => 'read_clientes',
                'table_name' => 'clientes',
                'created_at' => '2022-01-11 20:35:14',
                'updated_at' => '2022-01-11 20:35:14',
            ),
            42 => 
            array (
                'id' => 58,
                'key' => 'edit_clientes',
                'table_name' => 'clientes',
                'created_at' => '2022-01-11 20:35:14',
                'updated_at' => '2022-01-11 20:35:14',
            ),
            43 => 
            array (
                'id' => 59,
                'key' => 'add_clientes',
                'table_name' => 'clientes',
                'created_at' => '2022-01-11 20:35:14',
                'updated_at' => '2022-01-11 20:35:14',
            ),
            44 => 
            array (
                'id' => 60,
                'key' => 'delete_clientes',
                'table_name' => 'clientes',
                'created_at' => '2022-01-11 20:35:14',
                'updated_at' => '2022-01-11 20:35:14',
            ),
            45 => 
            array (
                'id' => 66,
                'key' => 'browse_nota_pedidos',
                'table_name' => 'nota_pedidos',
                'created_at' => '2022-01-12 22:34:43',
                'updated_at' => '2022-01-12 22:34:43',
            ),
            46 => 
            array (
                'id' => 67,
                'key' => 'read_nota_pedidos',
                'table_name' => 'nota_pedidos',
                'created_at' => '2022-01-12 22:34:43',
                'updated_at' => '2022-01-12 22:34:43',
            ),
            47 => 
            array (
                'id' => 68,
                'key' => 'edit_nota_pedidos',
                'table_name' => 'nota_pedidos',
                'created_at' => '2022-01-12 22:34:43',
                'updated_at' => '2022-01-12 22:34:43',
            ),
            48 => 
            array (
                'id' => 69,
                'key' => 'add_nota_pedidos',
                'table_name' => 'nota_pedidos',
                'created_at' => '2022-01-12 22:34:43',
                'updated_at' => '2022-01-12 22:34:43',
            ),
            49 => 
            array (
                'id' => 70,
                'key' => 'delete_nota_pedidos',
                'table_name' => 'nota_pedidos',
                'created_at' => '2022-01-12 22:34:43',
                'updated_at' => '2022-01-12 22:34:43',
            ),
            50 => 
            array (
                'id' => 71,
                'key' => 'browse_empleados',
                'table_name' => 'empleados',
                'created_at' => '2022-01-12 22:40:47',
                'updated_at' => '2022-01-12 22:40:47',
            ),
            51 => 
            array (
                'id' => 72,
                'key' => 'read_empleados',
                'table_name' => 'empleados',
                'created_at' => '2022-01-12 22:40:47',
                'updated_at' => '2022-01-12 22:40:47',
            ),
            52 => 
            array (
                'id' => 73,
                'key' => 'edit_empleados',
                'table_name' => 'empleados',
                'created_at' => '2022-01-12 22:40:47',
                'updated_at' => '2022-01-12 22:40:47',
            ),
            53 => 
            array (
                'id' => 74,
                'key' => 'add_empleados',
                'table_name' => 'empleados',
                'created_at' => '2022-01-12 22:40:47',
                'updated_at' => '2022-01-12 22:40:47',
            ),
            54 => 
            array (
                'id' => 75,
                'key' => 'delete_empleados',
                'table_name' => 'empleados',
                'created_at' => '2022-01-12 22:40:47',
                'updated_at' => '2022-01-12 22:40:47',
            ),
            55 => 
            array (
                'id' => 76,
                'key' => 'browse_rubros',
                'table_name' => 'rubros',
                'created_at' => '2022-01-15 21:04:32',
                'updated_at' => '2022-01-15 21:04:32',
            ),
            56 => 
            array (
                'id' => 77,
                'key' => 'read_rubros',
                'table_name' => 'rubros',
                'created_at' => '2022-01-15 21:04:32',
                'updated_at' => '2022-01-15 21:04:32',
            ),
            57 => 
            array (
                'id' => 78,
                'key' => 'edit_rubros',
                'table_name' => 'rubros',
                'created_at' => '2022-01-15 21:04:32',
                'updated_at' => '2022-01-15 21:04:32',
            ),
            58 => 
            array (
                'id' => 79,
                'key' => 'add_rubros',
                'table_name' => 'rubros',
                'created_at' => '2022-01-15 21:04:32',
                'updated_at' => '2022-01-15 21:04:32',
            ),
            59 => 
            array (
                'id' => 80,
                'key' => 'delete_rubros',
                'table_name' => 'rubros',
                'created_at' => '2022-01-15 21:04:32',
                'updated_at' => '2022-01-15 21:04:32',
            ),
            60 => 
            array (
                'id' => 81,
                'key' => 'browse_subrubros',
                'table_name' => 'subrubros',
                'created_at' => '2022-01-15 21:05:02',
                'updated_at' => '2022-01-15 21:05:02',
            ),
            61 => 
            array (
                'id' => 82,
                'key' => 'read_subrubros',
                'table_name' => 'subrubros',
                'created_at' => '2022-01-15 21:05:02',
                'updated_at' => '2022-01-15 21:05:02',
            ),
            62 => 
            array (
                'id' => 83,
                'key' => 'edit_subrubros',
                'table_name' => 'subrubros',
                'created_at' => '2022-01-15 21:05:02',
                'updated_at' => '2022-01-15 21:05:02',
            ),
            63 => 
            array (
                'id' => 84,
                'key' => 'add_subrubros',
                'table_name' => 'subrubros',
                'created_at' => '2022-01-15 21:05:02',
                'updated_at' => '2022-01-15 21:05:02',
            ),
            64 => 
            array (
                'id' => 85,
                'key' => 'delete_subrubros',
                'table_name' => 'subrubros',
                'created_at' => '2022-01-15 21:05:02',
                'updated_at' => '2022-01-15 21:05:02',
            ),
            65 => 
            array (
                'id' => 86,
                'key' => 'browse_productos',
                'table_name' => 'productos',
                'created_at' => '2022-01-18 11:30:46',
                'updated_at' => '2022-01-18 11:30:46',
            ),
            66 => 
            array (
                'id' => 87,
                'key' => 'read_productos',
                'table_name' => 'productos',
                'created_at' => '2022-01-18 11:30:46',
                'updated_at' => '2022-01-18 11:30:46',
            ),
            67 => 
            array (
                'id' => 88,
                'key' => 'edit_productos',
                'table_name' => 'productos',
                'created_at' => '2022-01-18 11:30:46',
                'updated_at' => '2022-01-18 11:30:46',
            ),
            68 => 
            array (
                'id' => 89,
                'key' => 'add_productos',
                'table_name' => 'productos',
                'created_at' => '2022-01-18 11:30:46',
                'updated_at' => '2022-01-18 11:30:46',
            ),
            69 => 
            array (
                'id' => 90,
                'key' => 'delete_productos',
                'table_name' => 'productos',
                'created_at' => '2022-01-18 11:30:46',
                'updated_at' => '2022-01-18 11:30:46',
            ),
        ));
        
        
    }
}