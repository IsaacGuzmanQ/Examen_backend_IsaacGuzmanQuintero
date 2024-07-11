<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model {

    public $table = "usuarios";
    public $primaryKey = "ID";

    protected $fillable = [
        'Name',
        'Email',
        'Password'
    ];

    protected $connection = 'mysql';
    public $timestamps = false;

    public function informacionUsuarios(){
        return $this->belongsTo(InformacionUsuario::class, "Fk_Usuario");
    }
}
