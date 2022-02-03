<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Moldes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Moldes', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->char('descripcion', 100)->nullable();
            $table->integer('cant_moldes')->nullable();
            $table->decimal('mt2_por_molde', 12 ,3)->nullable();
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
        Schema::dropIfExists('Moldes');
    }
}
