<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProveedoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proveedores', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('razonsocial', 60)->nullable();
            $table->char('direccion', 100)->nullable();
            $table->char('nombre_comercial', 60)->nullable();
            $table->char('web', 60)->nullable();
            $table->char('telefono', 50)->nullable();
            $table->char('mail', 70)->nullable();
            $table->char('cuit', 15)->nullable();
            $table->char('cond_iva', 30)->nullable();
            $table->char('nombre_contacto', 50)->nullable();
            $table->char('telefono_contacto', 100)->nullable();
            $table->char('observaciones', 250)->nullable();
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('proveedores');
    }
}
