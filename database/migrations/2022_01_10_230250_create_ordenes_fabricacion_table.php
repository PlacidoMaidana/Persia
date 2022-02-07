<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdenesFabricacionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ordenes_fabricacion', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->dateTime('fecha_orden')->nullable();
            $table->char('observaciones', 200)->nullable();
            $table->char('estado', 10)->nullable();
            $table->dateTime('fecha_entrada_proceso')->nullable();
            $table->dateTime('fecha_salida_proceso')->nullable();
            $table->unsignedBigInteger('id_producto')->nullable();
            $table->decimal('cantidad' , 18, 2)->nullable();
            $table->unsignedBigInteger('id_renglon_pedido')->nullable();
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
        Schema::dropIfExists('ordenes_fabricacion');
    }
}
