<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFacturaVentaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('factura_ventas', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->char('tipo_factura', 3);
            $table->integer('pto_venta');
            $table->integer('nro_factura');
            $table->integer('id_pedido');
            $table->integer('id_cliente')->nullable()->index('FK_Factura_Venta_Clientes');
            $table->dateTime('fecha')->nullable();
            $table->string('cond_venta', 33)->nullable();
            $table->decimal('total', 19, 2)->nullable();
            $table->char('cae', 20)->nullable();
            $table->decimal('monto_iva21', 19, 2)->nullable();
            $table->decimal('monto_iva10', 19, 2)->nullable();
            $table->char('tipo_factura_ref', 3)->nullable();
            $table->integer('pto_venta_ref')->nullable();
            $table->integer('nro_factura_ref')->nullable();
            $table->char('tipo_debito', 25)->nullable();
            $table->decimal('totalGravado', 12, 2)->nullable();
            $table->char('fce', 2)->nullable();
            $table->tinyInteger('cod_comprobante_afip')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('factura_venta');
    }
}
