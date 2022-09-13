<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormasPagoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('FormasPago', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('Forma_pago_Muebles', 250);
            $table->char('Forma_pago_Obras', 250);
            $table->char('Forma_pago_Productos', 250);
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
        Schema::dropIfExists('FormasPago');
    }
}
