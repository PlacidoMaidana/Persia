<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCobranzasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cobranzas', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('id_recibo')->index('FK_Cobranzas_Recibos_cobranzas');
            $table->smallInteger('pto_vta');
            $table->integer('nro_recibo');
            $table->integer('nro_caja')->index('FK_Cobranzas_Caja_Diaria');
            $table->dateTime('fecha')->nullable();
            $table->decimal('monto', 11, 2)->nullable();
            $table->string('modalidad_pago', 19)->nullable();
            $table->integer('nro_cheque')->index('FK_Cobranzas_ChequesTerceros');
            $table->dateTime('fecha_vto')->nullable();
            $table->integer('id_transbancaria')->nullable()->index('FK_Cobranzas_TransfBancarias');
            $table->integer('nro_cta')->index('FK_Cobranzas_Cuentas_banco');
            $table->char('concepto_retencion', 10)->nullable();
            $table->char('nro_retencion', 20)->nullable();
            $table->dateTime('fecha_retencion')->nullable();
            $table->integer('jurisdiccion')->nullable()->index('FK_Cobranzas_jurisdicciones');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cobranzas');
    }
}
