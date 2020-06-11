<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Prestataires extends Model
{
    
    protected $table = 'prestataires';
    protected $fillable = [ 
    ]; 
    protected $hidden = [ 
        'user_id',
    ];

    public function category()
    {
        return $this->hasOne('App\Categories','id','category_id');
    }
    public function payments()
    {
        return $this->hasMany('App\Payments','prestataire_id','id');
    }
}