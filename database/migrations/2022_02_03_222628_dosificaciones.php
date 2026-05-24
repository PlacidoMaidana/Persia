<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Dosificaciones extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Dosificaciones', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_producto')->nullable();
            $table->char('color' , 50)->nullable();
            $table->char('base_liston' , 10)->nullable();
            $table->unsignedBigInteger('id_insumo_producto')->nullable();
            $table->decimal('cant_unid_produc', 12, 5)->nullable();
            $table->char('unidad_consumo_produccion' , 50)->nullable();
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
        Schema::dropIfExists('Dosificaciones');
    }
}
