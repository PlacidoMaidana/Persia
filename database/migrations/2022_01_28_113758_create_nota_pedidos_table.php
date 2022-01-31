<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotaPedidosTable extends Migration
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
            $table->dateTime('fecha')->nullable();
            $table->integer('id_cliente')->nullable()->index('FK_Nota_Pedido_Clientes');
            $table->decimal('totalgravado', 12, 2)->nullable();
            $table->decimal('total', 19, 2)->nullable();
            $table->decimal('monto_iva', 9, 2)->default(0.00);
            $table->integer('id_vendedor')->nullable();
            $table->char('aprobado', 2)->default('No');
            $table->integer('id_factura')->nullable();
            $table->char('observaciones', 255)->nullable();
            $table->integer('id_orden_fabricacion')->nullable()->index('FK_Nota_Pedido_Ordenes_Fabricacion');
            $table->timestamps();
            $table->timestamp('deleted_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('nota_pedidos');
    }
}
