<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCuentasBancoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cuentas_bancos', function (Blueprint $table) {
            $table->id();
            $table->char('banco', 50)->nullable();
            $table->char('sucursal', 50)->nullable();
            $table->char('tipo_cta', 20)->nullable();
            $table->char('nro_cuenta', 20)->nullable();
            $table->char('cbu', 25)->nullable();
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
        Schema::dropIfExists('cuentas_bancos');
    }
}
