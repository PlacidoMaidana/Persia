<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCajaDiariaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('caja_diaria', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->dateTime('fecha_apertura')->nullable();
            $table->decimal('inicio_efectivo', 19, 2)->nullable();
            $table->decimal('inicio_cheque', 19, 2)->nullable();
            $table->decimal('inicio_tarjetas', 19, 2)->nullable();
            $table->decimal('Inicio_otros', 19, 2)->nullable();
            $table->string('cerrado', 2)->nullable();
            $table->integer('id_operador')->nullable();
            $table->decimal('total_efectivo', 11, 2)->nullable();
            $table->decimal('total_cheque', 11, 2)->nullable();
            $table->decimal('total_tarjetas', 11, 2)->nullable();
            $table->decimal('total_otros', 11, 2)->nullable();
            $table->char('observaciones', 200)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('caja_diaria');
    }
}
