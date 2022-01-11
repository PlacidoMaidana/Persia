<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransfbancariasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transfbancarias', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('fecha')->nullable();
            $table->string('modalidad_pago', 9)->nullable();
            $table->decimal('importe', 11, 2)->nullable();
            $table->char('tipo_mov', 20)->nullable();
            $table->integer('nro_movimiento')->nullable();
            $table->char('concepto', 100)->nullable();
            $table->integer('nro_cta')->index('FK_TransfBancarias_Cuentas_banco');
            $table->integer('nro_caja');
            $table->char('tipo', 20)->nullable();
            $table->integer('fechaprob_dep_acred')->nullable();
            $table->integer('fechareal_dep_acred')->nullable();
            $table->char('conciliado', 2)->nullable();
            $table->integer('fecha_vencimiento')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transfbancarias');
    }
}
