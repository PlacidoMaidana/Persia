<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotaPedidoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nota_pedidos', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->smallInteger('sucursal');
            $table->integer('nro_pedido');
            $table->dateTime('fecha')->nullable();
            $table->integer('id_cliente')->nullable()->index('FK_Nota_Pedido_Clientes');
            $table->string('cond_venta', 34)->nullable();
            $table->decimal('totalgravado', 12, 2)->nullable();
            $table->decimal('total', 19, 2)->nullable();
            $table->decimal('monto_iva', 9, 2)->nullable();
            $table->integer('id_vendedor')->nullable();
            $table->integer('id_vendedor')->nullable()->index('FK_vendedor');
            $table->char('aprobado', 2)->nullable();
            $table->integer('id_factura')->nullable();
            $table->char('despachado', 2)->nullable();
            $table->char('observaciones', 255)->nullable();
            $table->integer('id_orden_fabricacion')->nullable()->index('FK_Nota_Pedido_Ordenes_Fabricacion');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('nota_pedido');
    }
}
