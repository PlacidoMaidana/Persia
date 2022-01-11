<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdenesPagoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ordenes_pago', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->smallInteger('pto_vta');
            $table->integer('nro_op');
            $table->dateTime('fecha');
            $table->integer('id_proveedor');
            $table->char('concepto', 100)->nullable();
            $table->decimal('total', 11, 2)->nullable();
            $table->integer('id_usuario')->nullable();
            $table->integer('id_caja')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ordenes_pago');
    }
}
