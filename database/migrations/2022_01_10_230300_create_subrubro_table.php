<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubrubroTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subrubros', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('rubro_id')->index('FK_SubRubro_Rubro');
            $table->char('descripcion_subrubro', 50)->nullable();
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
        Schema::dropIfExists('subrubros');
    }
}
