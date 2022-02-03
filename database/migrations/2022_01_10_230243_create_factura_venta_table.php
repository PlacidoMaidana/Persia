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
        Schema::create('facturas_ventas', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->char('tipo_factura', 3);
            $table->integer('pto_venta');
            $table->integer('nro_factura');
            $table->integer('id_pedido');
            $table->integer('id_cliente')->nullable()->index('FK_Factura_Venta_Clientes');
            $table->dateTime('fecha')->nullable();
            $table->decimal('total', 19, 2)->nullable();
            $table->char('cae', 20)->nullable();
            $table->decimal('monto_iva21', 19, 2)->nullable();
            $table->decimal('monto_iva10', 19, 2)->nullable();
            $table->integer('id_factura_ref')->nullable();
            $table->char('concepto', 100)->nullable();
            $table->decimal('totalGravado', 12, 2)->nullable();
            $table->tinyInteger('cod_comprobante_afip')->nullable();
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
        Schema::dropIfExists('facturas_ventas');
    }
}
