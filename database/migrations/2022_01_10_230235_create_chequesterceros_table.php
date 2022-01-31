<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChequestercerosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chequesterceros', function (Blueprint $table) {
            $table->id();
            $table->char('tipo', 1)->nullable();
            $table->integer('id_cuenta_banco')->nullable();
            $table->integer('id_caja')->nullable()->index('FK_ChequesTerceros_Caja_Diaria');
            $table->string('nro_cheque', 39)->nullable();
            $table->string('banco', 49)->nullable();
            $table->string('sucursal', 49)->nullable();
            $table->dateTime('fecha_cobro')->nullable();
            $table->decimal('importe', 9, 2)->nullable();
            $table->integer('id_transf')->nullable();
            $table->char('id_pago', 10)->nullable();
            $table->string('otros_datos', 79)->nullable();
            $table->integer('fecha_emision')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chequesterceros');
    }
}
