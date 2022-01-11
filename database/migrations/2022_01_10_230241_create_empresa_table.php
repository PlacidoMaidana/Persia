<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmpresaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empresa', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->string('razon_social', 30)->nullable();
            $table->string('direccion', 30)->nullable();
            $table->char('cp', 20)->nullable();
            $table->char('nombre_comercial', 100)->nullable();
            $table->char('web', 100)->nullable();
            $table->char('e_mail', 100)->nullable();
            $table->char('localidad', 30)->nullable();
            $table->char('provincia', 30)->nullable();
            $table->integer('actividad_principal')->nullable();
            $table->string('cuit', 13);
            $table->char('cond_iva', 20)->nullable();
            $table->dateTime('fecha_vto_iva')->nullable();
            $table->char('agente_percepcion_iva', 2)->nullable();
            $table->char('agente_percep_dgr', 2)->nullable();
            $table->dateTime('inicio_act')->nullable();
            $table->tinyInteger('lineas_factura')->nullable();
            $table->char('logo', 200)->nullable();
            $table->decimal('importe_max_fce', 13, 2)->nullable();
            $table->decimal('cbu', 22, 0)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('empresa');
    }
}
