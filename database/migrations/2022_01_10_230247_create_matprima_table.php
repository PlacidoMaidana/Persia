<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatprimaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('matprimas', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('cod_proveedor');
            $table->char('cod_matprima', 40);
            $table->char('descripcion', 100)->nullable();
            $table->integer('id_rubro')->index('FK_MatPrima_Rubromp');
            $table->integer('id_subrubro')->index('FK_MatPrima_SubRubroMP');
            $table->decimal('volumen', 5, 1)->nullable();
            $table->char('unidad', 20)->nullable();
            $table->char('unidad_bulto', 255)->nullable();
            $table->decimal('peso', 9, 2)->nullable();
            $table->decimal('preciounit', 15, 8)->nullable();
            $table->decimal('preciounit_dolar', 12, 5)->nullable();
            $table->decimal('porc_iva', 7, 2)->nullable();
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
        Schema::dropIfExists('matprimas');
    }
}
