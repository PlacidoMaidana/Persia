<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DataTypesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('data_types')->delete();
        
        \DB::table('data_types')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => 'users',
                'slug' => 'users',
                'display_name_singular' => 'User',
                'display_name_plural' => 'Users',
                'icon' => 'voyager-person',
                'model_name' => 'TCG\\Voyager\\Models\\User',
                'policy_name' => 'TCG\\Voyager\\Policies\\UserPolicy',
                'controller' => 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController',
                'description' => '',
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            1 => 
            array (
                'id' => 2,
                'name' => 'menus',
                'slug' => 'menus',
                'display_name_singular' => 'Menu',
                'display_name_plural' => 'Menus',
                'icon' => 'voyager-list',
                'model_name' => 'TCG\\Voyager\\Models\\Menu',
                'policy_name' => NULL,
                'controller' => '',
                'description' => '',
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            2 => 
            array (
                'id' => 3,
                'name' => 'roles',
                'slug' => 'roles',
                'display_name_singular' => 'Role',
                'display_name_plural' => 'Roles',
                'icon' => 'voyager-lock',
                'model_name' => 'TCG\\Voyager\\Models\\Role',
                'policy_name' => NULL,
                'controller' => 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController',
                'description' => '',
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            3 => 
            array (
                'id' => 4,
                'name' => 'categories',
                'slug' => 'categories',
                'display_name_singular' => 'Category',
                'display_name_plural' => 'Categories',
                'icon' => 'voyager-categories',
                'model_name' => 'TCG\\Voyager\\Models\\Category',
                'policy_name' => NULL,
                'controller' => '',
                'description' => '',
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            4 => 
            array (
                'id' => 5,
                'name' => 'posts',
                'slug' => 'posts',
                'display_name_singular' => 'Post',
                'display_name_plural' => 'Posts',
                'icon' => 'voyager-news',
                'model_name' => 'TCG\\Voyager\\Models\\Post',
                'policy_name' => 'TCG\\Voyager\\Policies\\PostPolicy',
                'controller' => '',
                'description' => '',
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            5 => 
            array (
                'id' => 6,
                'name' => 'pages',
                'slug' => 'pages',
                'display_name_singular' => 'Page',
                'display_name_plural' => 'Pages',
                'icon' => 'voyager-file-text',
                'model_name' => 'TCG\\Voyager\\Models\\Page',
                'policy_name' => NULL,
                'controller' => '',
                'description' => '',
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
            6 => 
            array (
                'id' => 13,
                'name' => 'clientes',
                'slug' => 'clientes',
                'display_name_singular' => 'Cliente',
                'display_name_plural' => 'Clientes',
                'icon' => NULL,
                'model_name' => 'App\\Models\\Cliente',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}',
                'created_at' => '2022-01-11 20:35:14',
                'updated_at' => '2022-01-11 21:00:04',
            ),
            7 => 
            array (
                'id' => 16,
                'name' => 'nota_pedidos',
                'slug' => 'nota-pedidos',
                'display_name_singular' => 'Nota Pedido',
                'display_name_plural' => 'Nota Pedidos',
                'icon' => NULL,
                'model_name' => 'App\\Models\\nota_pedido',
                'policy_name' => NULL,
                'controller' => 'App\\Http\\Controllers\\voyager\\PedidosController',
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}',
                'created_at' => '2022-01-12 22:34:43',
                'updated_at' => '2022-01-27 00:55:42',
            ),
            8 => 
            array (
                'id' => 17,
                'name' => 'empleados',
                'slug' => 'empleados',
                'display_name_singular' => 'Empleado',
                'display_name_plural' => 'Empleados',
                'icon' => NULL,
                'model_name' => 'App\\Models\\Empleado',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}',
                'created_at' => '2022-01-12 22:40:47',
                'updated_at' => '2022-01-12 22:48:03',
            ),
            9 => 
            array (
                'id' => 18,
                'name' => 'rubros',
                'slug' => 'rubros',
                'display_name_singular' => 'Rubro',
                'display_name_plural' => 'Rubros',
                'icon' => NULL,
                'model_name' => 'App\\Models\\Rubro',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}',
                'created_at' => '2022-01-15 21:04:32',
                'updated_at' => '2022-01-15 21:04:32',
            ),
            10 => 
            array (
                'id' => 19,
                'name' => 'subrubros',
                'slug' => 'subrubros',
                'display_name_singular' => 'Subrubro',
                'display_name_plural' => 'Subrubros',
                'icon' => NULL,
                'model_name' => 'App\\Models\\Subrubro',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}',
                'created_at' => '2022-01-15 21:05:02',
                'updated_at' => '2022-01-18 12:39:51',
            ),
            11 => 
            array (
                'id' => 20,
                'name' => 'productos',
                'slug' => 'productos',
                'display_name_singular' => 'Producto',
                'display_name_plural' => 'Productos',
                'icon' => NULL,
                'model_name' => 'App\\Models\\Producto',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}',
                'created_at' => '2022-01-18 11:30:46',
                'updated_at' => '2022-01-18 12:38:56',
            ),
        ));
        
        
    }
}