<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Disciplina;
use App\Models\Turno;
use App\Models\Modulo;
use App\Models\Funcionario;

class Curso extends Model {
    
    protected $fillable = ['nome', 'sigla', 'turno_id', 'funcionario_id'];
	public $timestamps = false;

    public function turno(){
    	return $this->belongsTo(Turno::class);
    }

    public function modulos(){
        return $this->hasMany(Modulo::class)->orderBy('modulos.nome','asc');
    }

    public function disciplinas(){
        return $this->modulos()
            ->join('disciplinas', 'modulos.id','=','disciplinas.modulo_id')
            ->get();
    }

    public function coordenador(){
    	return $this->belongsTo(Funcionario::class, 'funcionario_id');
    }

    public function hasCoordenador(){
        return !is_null(($this->coordenador));
    }
}