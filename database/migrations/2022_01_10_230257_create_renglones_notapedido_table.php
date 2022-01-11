<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRenglonesNotapedidoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('renglones_notapedido', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('id_pedido')->index('FK_Renglones_NotaPedido_Nota_Pedido');
            $table->integer('id_producto')->index('FK_Renglones_NotaPedido_Productos');
            $table->decimal('cantidad', 19, 2)->nullable();
            $table->decimal('total_linea', 19, 3)->nullable();
            $table->decimal('porc_dto', 5, 2)->nullable();
            $table->decimal('iva', 5, 2)->nullable();
            $table->integer('id_factura')->nullable()->index('FK_Renglones_NotaPedido_Factura_Venta');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('renglones_notapedido');
    }
}
