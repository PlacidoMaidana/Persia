<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Relaciones extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('clientes', function (Blueprint $table) {
            $table->foreign('id_localidad')->references('id')->on('Localidades');
        });

        Schema::table('detalles_facturas_compras', function (Blueprint $table) {
            $table->foreign('id_factura_compra')->references('id')->on('facturas_compras');
        });
        Schema::table('detalles_facturas_compras', function (Blueprint $table) {
            $table->foreign('id_producto')->references('id')->on('productos');
        });
        Schema::table('facturas_compras', function (Blueprint $table) {
            $table->foreign('id_tipo_gasto')->references('id')->on('tipos_gastos');
        });
        Schema::table('facturas_compras', function (Blueprint $table) {
            $table->foreign('id_jurisdiccion')->references('id')->on('jurisdicciones');

        });
        Schema::table('facturas_compras', function (Blueprint $table) {
            $table->foreign('id_proveedor')->references('id')->on('proveedores');
            
        });
        Schema::table('facturas_ventas', function (Blueprint $table) {
            $table->foreign('id_cliente')->references('id')->on('clientes');
        });  


        Schema::table('nota_pedidos', function (Blueprint $table) {
            $table->foreign('id_cliente')->references('id')->on('clientes');
        });
        Schema::table('nota_pedidos', function (Blueprint $table) {
            $table->foreign('id_vendedor')->references('id')->on('empleados');
        });

        Schema::table('ordenes_fabricacion', function (Blueprint $table) {
            $table->foreign('id_producto')->references('id')->on('productos');
        });
        Schema::table('ordenes_fabricacion', function (Blueprint $table) {
            $table->foreign('id_renglon_pedido')->references('id')->on('renglones_notapedidos');
        });

        Schema::table('productos', function (Blueprint $table) {
            $table->foreign('rubro_id')->references('id')->on('rubros');
        });
        Schema::table('productos', function (Blueprint $table) {
            $table->foreign('subrubro_id')->references('id')->on('subrubros');
        });
        Schema::table('productos', function (Blueprint $table) {
            $table->foreign('id_molde')->references('id')->on('moldes');
        });

        Schema::table('renglones_notapedidos', function (Blueprint $table) {
            $table->foreign('id_pedido')->references('id')->on('nota_pedidos')->onDelete('cascade')->onUpdate('cascade');
        });
        Schema::table('renglones_notapedidos', function (Blueprint $table) {
            $table->foreign('id_producto')->references('id')->on('productos');
        });
        Schema::table('renglones_notapedidos', function (Blueprint $table) {
            $table->foreign('id_factura')->references('id')->on('facturas_ventas');
        });
        Schema::table('subrubros', function (Blueprint $table) {  
        $table->foreign('rubro_id')->references('id')->on('rubros');
        });


        Schema::table('Dosificaciones', function (Blueprint $table) {
        $table->foreign('id_producto_componente')->references('id')->on('productos');
        });
        Schema::table('Dosificaciones', function (Blueprint $table) {
        $table->foreign('id_base')->references('id')->on('Bases_listones');
         });       
         Schema::table('Bases_listones', function (Blueprint $table) {
            $table->foreign('id_producto')->references('id')->on('productos');
        });

        Schema::table('mov_financieros', function (Blueprint $table) {
            $table->foreign('id_cuenta_bancaria')->references('id')->on('cuentas_bancos');
        });
        Schema::table('mov_financieros', function (Blueprint $table) {
            $table->foreign('id_jurisdiccion')->references('id')->on('jurisdicciones');
        });
        Schema::table('mov_financieros', function (Blueprint $table) {
            $table->foreign('id_caja')->references('id')->on('cajas_diarias');
        });
        Schema::table('mov_financieros', function (Blueprint $table) {
            $table->foreign('id_factura_compra')->references('id')->on('facturas_compras');
        });
        Schema::table('mov_financieros', function (Blueprint $table) {
            $table->foreign('id_nota_pedido')->references('id')->on('nota_pedidos');
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
