<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class BasesListones extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Bases_listones', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('desc_formula_base' , 50)->nullable(); 
            $table->unsignedBigInteger('id_producto')->nullable();
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
        Schema::dropIfExists('Bases_listones');
    }
}
