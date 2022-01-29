<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenglonesNotapedidos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         //Agregando integridad referencial a los renglones de notas de pedido
         Schema::table('renglones_notapedidos', function (Blueprint $table) {
           
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
