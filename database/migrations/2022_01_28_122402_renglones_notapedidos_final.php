<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenglonesNotapedidosFinal extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Creando las restricciones de integridad on delete cascade
       // Schema::dropIfExists('renglones_notapedidos');
        Schema::create('renglones_notapedidos', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('pedido_id');
            $table->integer('producto_id')->index('FK_Renglones_NotaPedido_Productos');
            $table->decimal('cantidad', 19, 2)->nullable();
            $table->decimal('total_linea', 19, 3)->nullable();
            $table->decimal('porc_dto', 5, 2)->nullable();
            $table->decimal('iva', 5, 2)->nullable();
            $table->integer('id_factura')->nullable()->index('FK_Renglones_NotaPedido_Factura_Venta');
            $table->timestamps();
            $table->foreign('pedido_id')->references('id')->on('nota_pedidos')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
