<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormulasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('formulas', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->char('descripcion', 100)->nullable();
            $table->char('observacion', 200)->nullable();
            $table->string('manual_procedimiento', 250)->nullable();
            $table->decimal('residual', 9, 2)->nullable();
            $table->integer('cant_moldes')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('formulas');
    }
}
