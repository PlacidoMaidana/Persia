<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetalleFacturaCompraTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detalle_factura_compra', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('id_factura_compra')->index('FK_Detalle_Factura_Compra_Factura_Compra');
            $table->integer('id_articulo')->index('FK_Detalle_Factura_Compra_MatPrima');
            $table->decimal('cantidad', 12, 2)->nullable();
            $table->decimal('precio_c', 15, 8)->nullable();
            $table->decimal('descuento', 11, 2)->nullable();
            $table->decimal('total_linea', 12, 3)->nullable();
            $table->string('unidad', 20)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('detalle_factura_compra');
    }
}
