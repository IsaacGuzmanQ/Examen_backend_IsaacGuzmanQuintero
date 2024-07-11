<?php

use App\Http\Controllers\UsuarioController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


    Route::middleware('auth:sanctum')->get('/user', function(Request $request){
        return $request->user();
    });

    Route::controller(UsuarioController::class)->group(function (){
        Route::get("/Usuarios", "index");
        Route::post("/Usuario", "store");
        Route::get("/Usuario/{id}", "show");
        Route::put("/Usuario/{id}", "update");
        Route::delete("/Usuario/{id}", "destroy");
    });
