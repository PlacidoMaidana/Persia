<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetalleOrdenFabricacionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detalle_orden_fabricacion', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('id_orden_fabricacion')->index('FK_Detalle_Orden_Fabricacion_Ordenes_Fabricacion');
            $table->integer('id_producto')->index('FK_Detalle_Orden_Fabricacion_Productos');
            $table->decimal('cantidad', 20, 2)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('detalle_orden_fabricacion');
    }
}
