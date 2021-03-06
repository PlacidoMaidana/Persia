<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFacturaCompraTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('factura_compra', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->char('tipo_factura', 3);
            $table->integer('pto_venta');
            $table->integer('nro_factura');
            $table->integer('id_proveedor')->index('FK_Factura_Compra_Proveedores');
            $table->dateTime('fecha')->nullable();
            $table->char('observaciones', 200)->nullable();
            $table->integer('id_tipo_gasto')->nullable()->index('FK_Factura_Compra_Tipos_Gastos');
            $table->dateTime('fecha_carga')->nullable();
            $table->decimal('subtotal', 13, 3)->nullable();
            $table->decimal('exento', 9, 3)->nullable();
            $table->decimal('iva_10_5', 11, 3)->nullable();
            $table->decimal('iva_21', 11, 3)->nullable();
            $table->decimal('iva_27', 9, 3)->nullable();
            $table->decimal('iva', 19, 3)->nullable();
            $table->decimal('porc_percepciones_iibb', 7, 3)->nullable();
            $table->decimal('monto_perc_iibb', 19, 3)->nullable();
            $table->decimal('porcentaje_per_iva', 5, 3)->nullable();
            $table->decimal('monto_percepcion_iva', 13, 3)->nullable();
            $table->decimal('monto_percep_ganancias', 9, 3)->nullable();
            $table->decimal('otros_impuestos', 13, 3)->nullable();
            $table->decimal('total_impuestos', 13, 3)->nullable();
            $table->decimal('total_factura', 19, 3)->nullable();
            $table->dateTime('fecha_vencimiento')->nullable();
            $table->smallInteger('remito_pto_vta')->nullable();
            $table->integer('remito_nro')->nullable();
            $table->smallInteger('id_jurisdiccion')->nullable();
            $table->char('tipo_factura_ref', 3)->nullable();
            $table->integer('pto_venta_ref')->nullable();
            $table->integer('nro_factura_ref')->nullable();
            $table->char('tipo_debito', 25)->nullable();
            $table->tinyInteger('codusuario')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('factura_compra');
    }
}
