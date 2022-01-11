<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsosDestinoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usos_destino', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('id_formula')->index('FK_Usos_Destino_Formulas');
            $table->integer('id_matprima')->index('FK_Usos_Destino_MatPrima');
            $table->decimal('cant_unid_produc', 12, 5)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usos_destino');
    }
}
