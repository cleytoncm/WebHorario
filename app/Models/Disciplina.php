<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Disciplina as Curso;

class Disciplina extends Model{

    protected $fillable = ['nomeDisplinas', 'iniciaisDisplinas', 'cargaHoraria'];

    public $timestamps = false;

    public function cursos(){
        return $this->belongsToMany(Curso::class, 'cursos_disciplinas');
    }
    
}