<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMovimientosFondosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('movimientos_fondos', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->dateTime('fecha')->nullable();
            $table->integer('id_caja_origen')->index('FK_Movimientos_Fondos_Caja_Diaria1');
            $table->tinyInteger('id_usuario_origen')->nullable();
            $table->integer('id_caja_destino')->nullable()->index('FK_Movimientos_Fondos_Caja_Diaria');
            $table->tinyInteger('id_usuario_destino')->nullable();
            $table->decimal('importe', 11, 2)->nullable();
            $table->string('modalidad_pago', 9)->nullable();
            $table->integer('nro_cheque')->nullable();
            $table->char('concepto', 100)->nullable();
            $table->char('confirmado', 2)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('movimientos_fondos');
    }
}
