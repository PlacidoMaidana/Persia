<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('users')->delete();
        
        \DB::table('users')->insert(array (
            0 => 
            array (
                'id' => 1,
                'role_id' => 1,
                'name' => 'Admin',
                'email' => 'admin@admin.com',
                'avatar' => 'users/default.png',
                'email_verified_at' => NULL,
                'password' => '$2y$10$MjGViZ46sSZdiIQYPdYLFOQxnU/9TqrUnLWEEZEOzSPqOAJVKTk3S',
                'remember_token' => 'jnLAYLYdPrbi2mCNePkn3xJS6Dkdmk15zLidNuuZRccSLZLBOb8Ux2XOaQvD',
                'settings' => NULL,
                'created_at' => '2022-01-08 22:12:38',
                'updated_at' => '2022-01-08 22:12:38',
            ),
        ));
        
        
    }
}