<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Adresses extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [ 
    ];
    protected $hidden = [
    	'country_id',
    	'state_id'
    ];

    public function country () {
    	return $this->hasOne('App\Countries','id','country_id') ; 
    }
    public function state () {
    	return $this->hasOne('App\States','id','state_id') ; 
    }

    public function adresse() { 
        return $this->belongsTo('App\Prestataires','user_id'); 
    }
}