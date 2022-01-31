<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Subrubro extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::table('subrubro', function (Blueprint $table) {
            $table->dropColumn('id_rubro');
            $table->dropIndex('FK_SubRubro_Rubro');
           
            $table->foreign('rubro_id')->references('id')->on('rubro');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
