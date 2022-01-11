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
            $table->integer('id')->primary();
            $table->char('razonsocial', 60)->nullable();
            $table->char('direccion', 100)->nullable();
            $table->integer('actividad_principal')->nullable();
            $table->char('nombre_comercial', 60)->nullable();
            $table->integer('id_localidad')->nullable();
            $table->char('web', 60)->nullable();
            $table->char('teefono', 50)->nullable();
            $table->char('mail', 70)->nullable();
            $table->char('cuit', 15)->nullable();
            $table->char('cond_iva', 30)->nullable();
            $table->char('agente_percepcion_iva', 2)->nullable();
            $table->decimal('porcentaje_percep_iva', 7, 2)->nullable();
            $table->char('agente_percep_dgr', 2)->nullable();
            $table->decimal('porcentaje_percep_dgr', 7, 2)->nullable();
            $table->char('nombre_contacto', 50)->nullable();
            $table->char('telefono_contacto', 100)->nullable();
            $table->char('observaciones', 250)->nullable();
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
