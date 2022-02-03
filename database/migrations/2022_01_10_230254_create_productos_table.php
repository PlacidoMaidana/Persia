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
            $table->decimal('tasa_iva', 5, 2)->nullable();
            $table->char('unidad', 100)->nullable();
            $table->char('activo', 2)->nullable();
            $table->integer('id_molde')->nullable()->index('FK_Productos_Moldes');
            $table->char('manual_procedimiento', 255)->nullable();
            $table->char('unidad_consumo_produccion', 255)->nullable();
            $table->decimal('factor_conversion_unidades', 10,2)->nullable();
            $table->integer('unidades_mt2')->nullable();
            $table->integer('paquetes_mt2')->nullable();
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
        Schema::dropIfExists('productos');
    }
}
