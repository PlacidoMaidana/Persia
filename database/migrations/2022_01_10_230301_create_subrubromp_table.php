<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubrubrompTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subrubromp', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('id_rubromp')->index('FK_SubRubroMP_SubRubroMP');
            $table->char('descrip_subrubromp', 50);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('subrubromp');
    }
}
