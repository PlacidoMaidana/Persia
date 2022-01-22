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
Route::get('/embebido/{id}','App\Http\livewire\pedidos\embebidocomponent@mostrar');

Route::get('/tabla_productos_elegir', function () {
    return view('vendor.voyager.nota-pedidos.tabla_productos_elegir');
});
Route::get('/productos_elegir', function () {
     
    return datatables()->of(DB::table('productos')
    ->join('rubros as r','productos.rubro_id','=','r.id')
    ->join('subrubros as s','productos.subrubro_id','=','s.id')
    ->select(['productos.id', 'descripcion', 'r.rubro', 's.descripcion_subrubro', 'preciovta']))
    ->addColumn('seleccionar','vendor\voyager\nota-pedidos\boton_seleccionar')
    ->rawColumns(['seleccionar'])   
    ->toJson();    
 
 });


Route::get('/vista', function () {
    return view('vista_suelta');
});
Route::get('/productos', function () {
    return view('Livewire.productos.seleccionar-component');
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
