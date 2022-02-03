<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clientes', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->char('nombre', 50)->nullable();
            $table->string('cuit', 15)->nullable();
            $table->dateTime('fecha_alta')->nullable();
            $table->string('direccion', 100)->nullable();
            $table->string('tel', 50)->nullable();
            $table->integer('id_localidad')->nullable()->index('FK_Clientes_localidad');
            $table->string('e_mail', 50)->nullable();
            $table->char('observaciones', 255)->nullable();
            $table->char('cond_iva', 20)->nullable();
            $table->char('registro_fce', 2)->nullable();
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
        Schema::dropIfExists('clientes');
    }
}
