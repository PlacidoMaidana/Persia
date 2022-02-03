<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetallesFacturasComprasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detalles_facturas_compras', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_factura_compra')->index();
            $table->unsignedBigInteger('id_producto')->index();
            $table->decimal('cantidad', 12, 2)->nullable();
            $table->decimal('precio_c', 15, 8)->nullable();
            $table->decimal('descuento', 11, 2)->nullable();
            $table->decimal('total_linea', 12, 3)->nullable();
            $table->string('unidad', 20)->nullable();
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
        Schema::dropIfExists('detalles_facturas_compras');
    }
}
