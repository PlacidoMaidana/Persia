<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->char('cod_producto', 15);
            $table->char('descripcion', 50)->nullable();
            $table->integer('id_rubro')->index('FK_Productos_Rubro');
            $table->integer('id_subrubro')->index('FK_Productos_SubRubro');
            $table->decimal('preciovta', 19, 3)->nullable();
            $table->decimal('preciocosto', 19, 3)->nullable();
            $table->decimal('tasa_iva', 5, 2)->nullable();
            $table->char('unidad', 100)->nullable();
            $table->decimal('peso', 7, 2)->nullable();
            $table->decimal('porcgcia', 5, 2)->nullable();
            $table->char('activo', 2)->nullable();
            $table->integer('id_formula')->nullable()->index('FK_Productos_Formulas');
            $table->char('id_materiaprima_reventa', 40)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('productos');
    }
}
