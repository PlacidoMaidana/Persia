<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePagosProveedoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pagos_proveedores', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('id_op')->index('FK_Pagos_Proveedores_Ordenes_Pago');
            $table->integer('id_transbancaria')->nullable()->index('FK_Pagos_Proveedores_TransfBancarias');
            $table->dateTime('fecha')->nullable();
            $table->decimal('monto', 19, 2)->nullable();
            $table->string('modalidad_pago', 24)->nullable();
            $table->integer('id_cheque')->nullable()->index('FK_Pagos_Proveedores_ChequesTerceros');
            $table->dateTime('fecha_vencimiento')->nullable();
            $table->integer('id_cta')->nullable()->index('FK_Pagos_Proveedores_Cuentas_banco');
            $table->string('observaciones', 99)->nullable();
            $table->char('concepto_retencion', 10)->nullable();
            $table->dateTime('fecha_retencion')->nullable();
            $table->char('nro_retencion', 20)->nullable();
            $table->integer('jurisdiccion')->nullable()->index('FK_Pagos_Proveedores_jurisdicciones');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pagos_proveedores');
    }
}
