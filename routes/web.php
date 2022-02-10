<?php

use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/ComponenteUser', function () {
    return view('User.ComponenteUser');
});
Route::get('/embebido2', function () {
    return view('livewire.cliente');
});

Route::get('/cli-component','App\Http\livewire\cliente');
Route::get('/embebido','App\Http\livewire\pedidos\embebidocomponent');


Route::get('/embebido/{id}','App\Http\livewire\pedidos\embebidocomponent@mostrar');



Route::get('/tabla_productos_elegir', function () {
    return view('vendor.voyager.nota-pedidos.tabla_productos_elegir');
});

Route::get('/clientes_create_modal', function () {
    return view('vendor.voyager.clientes.ficha_extra');
});


Route::get('/pato', function () {
    return view('pruebas.vistaPato');
});

Route::get('/productos_elegir', function () {
     
    return datatables()->of(DB::table('productos')
    ->join('rubros as r','productos.rubro_id','=','r.id')
    ->join('subrubros as s','productos.subrubro_id','=','s.id')
    ->select(['productos.id as id', 'descripcion', 'r.rubro as rubro', 's.descripcion_subrubro as subrubro', 'preciovta']))
    ->addColumn('seleccionar','vendor\voyager\nota-pedidos\boton_seleccionar')
    ->rawColumns(['seleccionar'])   
    ->toJson();    
 
 });

 Route::get('/localidades_elegir', function () {
     
    return datatables()->of(DB::table('localidades')
    ->select(['id', 'provincia', 'localidad']))
    ->addColumn('seleccionar','vendor\voyager\localidad\boton_seleccionar')
    ->rawColumns(['seleccionar'])   
    ->toJson();    
 
 });


Route::get('/vista', function () {
    return view('vista_suelta');
});
Route::get('/productos', function () {
    return view('Livewire.productos.seleccionar-component');
});

Route::get('admin/clientes/create2/{np_create}','App\Http\Controllers\ClienteBrebeController@nuevo');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();   

   
    // Route::get('clientes/', ['App\Http\Controllers\Voyager\VoyagerMediaController@index',   'as' => 'index']);
    // Route::get('clientes/create2/{np_create}', ['App\Http\Controllers\Voyager\VoyagerBreadController@create2', 'as' => 'create2']);
    // // Route::get('clientes/', function(){ //return 'abc';
            
    // });
    //Route::get('clientes/', 'App\Http\Controllers\Voyager\VoyagerBreadController@index');
   //Route::get('clientes/create/{v}', 'App\Http\Controllers\Voyager\ClienteController@create');
});
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

