<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class MovFinancieros extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mov_financieros', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->dateTime('fecha')->nullable();
            $table->integer('pto_vta')->nullable();
            $table->integer('nro_recibo')->nullable();
            $table->integer('nro_op')->nullable();
            $table->unsignedBigInteger('id_nota_pedido')->nullable();
            $table->unsignedBigInteger('id_factura_compra')->nullable();
            $table->string('modalidad_pago', 19)->nullable();
            $table->integer('nro_cheque')->nullable();
            $table->dateTime('fecha_vto')->nullable();
            $table->unsignedBigInteger('id_cuenta_bancaria')->nullable();
            $table->char('detalle', 100)->nullable();
            $table->unsignedBigInteger('id_jurisdiccion')->nullable();
            $table->char('tipo_retencion',10)->nullable();
            $table->char('tipo_movimiento',10)->nullable();
            $table->decimal('importe_egreso', 11, 2)->nullable();
            $table->decimal('importe_ingreso', 11, 2)->nullable();
            $table->tinyInteger('id_usuario')->nullable();
            $table->unsignedBigInteger('id_caja')->nullable();
            $table->char('conciliado', 2)->nullable();
            $table->dateTime('fecha_real_dep_acred')->nullable();
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
        Schema::dropIfExists('mov_financieros');
    }
}
