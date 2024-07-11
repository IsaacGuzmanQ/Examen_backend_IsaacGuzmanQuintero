<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InformacionUsuario extends Model
{
    public $table = "informacion_usuario";
    public $primaryKey = "IDInformacion";
    protected $connection = 'mysql';
    public $timestamps = false;

   protected $fillable = [
        'Direccion',
        'Telefono',
        'FechaNacimiento',
        'Fk_Usuario'
    ];

    public function usuarios(){
        return $this->hasOne(Usuario::class, "ID");
    }
}
