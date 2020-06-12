<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class States extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [ 
    ]; 

    protected $hidden = [ 
        'country_id'
    ];
    
    public function states()
    {
        return $this->belongTo('App\Adresses','id','state_id');
    } 
}