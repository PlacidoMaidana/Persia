<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePersonalTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personal', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->string('apellidoynombre', 100)->nullable();
            $table->char('cuil', 20)->nullable();
            $table->char('dni', 20)->nullable();
            $table->dateTime('fecha_ingreso')->nullable();
            $table->string('categoria', 30)->nullable();
            $table->string('estado', 5)->nullable();
            $table->dateTime('fecha_nacimiento')->nullable();
            $table->string('estadocivil', 14)->nullable();
            $table->string('domicilio', 100)->nullable();
            $table->string('telefonos', 50)->nullable();
            $table->string('observaciones', 249)->nullable();
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
        Schema::dropIfExists('personal');
    }
}
