<?php

namespace App\Http\Controllers;

use App\Models\InformacionUsuario;
use App\Models\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;


class UsuarioController extends Controller {

    public function index(){

        $actual = Carbon::now();

        $usuarios = DB::connection("mysql")
            ->table('usuarios')
            ->join('informacion_usuario', 'usuarios.ID', '=' , 'informacion_usuario.Fk_usuario')
            ->select(
                '*',
                DB::raw("TIMESTAMPDIFF(YEAR,FechaNacimiento,'".$actual."') AS Edad")
            )
            ->get();

        return response()->json($usuarios, 200);
    }

    public function store(Request $request){

        $usuario = new Usuario();

        $usuario->Name = $request->Name;
        $usuario->Email = $request->Email;
        $usuario->Password = hash('sha1', $request->Password);

        $usuario->save();

        $informacion = new InformacionUsuario();

        $informacion->Direccion = $request->Direccion;
        $informacion->Telefono = $request->Telefono;
        $informacion->FechaNacimiento = $request->FechaNacimiento;
        $informacion->Fk_usuario = $usuario->ID;

        if($usuario->save() && $informacion->save()){
            return response()->json( 201 );
        }

        return response()->json( 304 );
    }

    public function show(string $id){

        $responseCode = 404;

        $usuario = DB::connection("mysql")
            ->table('usuarios')
            ->join('informacion_usuario', 'usuarios.ID', '=' , 'informacion_usuario.Fk_usuario')
            ->where('usuarios.ID', $id)
            ->get();

        if( count( $usuario ) < 1 || is_null($usuario) ){
            $responseCode = 204;
        }

        return response()->json($usuario, $responseCode);
    }

    public function update(Request $request, string $id){
        $usuario = Usuario::find($id);



        $usuario->Name = $request->Name;

        $usuario->Email = $request->Email;
        $usuario->Password = hash('sha1', $request->Password);

        $informacion =InformacionUsuario::where("Fk_usuario", $id)->first();
        $informacion->Direccion = $request->Direccion;
        $informacion->Telefono = $request->Telefono;
        $informacion->FechaNacimiento = $request->FechaNacimiento;

        if($usuario->save() && $informacion->save()){
            Log::info($usuario );
            return response()->json( 201 );
        }

        return response()->json( 304 );
    }

    public function destroy(string $id){
        $informacion = InformacionUsuario::where("Fk_usuario", $id)->first();
        $informacion = InformacionUsuario::find($informacion->IDInformacion);
        $usuario = Usuario::find($id);



        if( $informacion->delete()){
            Log::info($usuario->delete());
            return response()->json(200);
        }

        return response()->json(304);
    }

}
