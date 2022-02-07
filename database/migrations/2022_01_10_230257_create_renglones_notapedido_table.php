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
        Schema::create('renglones_notapedidos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_pedido')->index('FK_Renglones_NotaPedido_Nota_Pedido');
            $table->unsignedBigInteger('id_producto')->index('FK_Renglones_NotaPedido_Productos');
            $table->decimal('cantidad', 19, 2)->nullable();
            $table->decimal('total_linea', 19, 3)->nullable();
            $table->decimal('iva', 5, 2)->nullable();
            $table->unsignedBigInteger('id_factura')->nullable()->index('FK_Renglones_NotaPedido_Factura_Venta');
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
        Schema::dropIfExists('renglones_notapedidos');
    }
}
