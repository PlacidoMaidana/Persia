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
            $table->integer('id')->primary();
            $table->integer('id_base')->nullable();
            $table->integer('id_producto_componente')->nullable();
            $table->decimal('cant_unid_produc', 12, 5)->nullable();
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
