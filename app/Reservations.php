<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Reservations extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [ 
    ]; 

    protected $hidden = [
        'user_id',
        'prestataire_id',
    ];

    public function reservations()
    {
        return $this->belongTo('App\Users','id','user_id');
    }
    public function prestataire()
    {
        return $this->hasOne('App\Users','id','prestataire_id');
    }
}