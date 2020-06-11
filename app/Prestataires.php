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
}