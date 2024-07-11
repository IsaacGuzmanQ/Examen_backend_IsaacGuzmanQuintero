<?php

use App\Http\Controllers\UsuarioController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});


Route::controller(UsuarioController::class)->group(function (){
    Route::get("/Usuarios", "index");
    Route::post("/Usuario", "store");
    Route::get("/Usuario/{id}", "show");
    Route::put("/Usuario/{id}", "update");
    Route::delete("/Usuario/{id}", "destroy");
});
