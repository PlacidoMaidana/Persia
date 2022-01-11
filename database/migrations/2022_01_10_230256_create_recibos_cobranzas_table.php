<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecibosCobranzasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recibos_cobranzas', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->smallInteger('pto_vta');
            $table->integer('nro_recibo');
            $table->dateTime('fecha');
            $table->integer('id_cliente')->index('FK_Recibos_cobranzas_Clientes');
            $table->decimal('total', 11, 2)->nullable();
            $table->dateTime('fecha_cobro')->nullable();
            $table->tinyInteger('id_operador')->nullable();
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
        Schema::dropIfExists('recibos_cobranzas');
    }
}
