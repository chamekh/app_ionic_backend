<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Categories extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [ 
    ]; 

    protected $hidden = [
        'created_at',
        'updated_at',
        'category_id'
    ];
    
    public function category()
    {
        return $this->belongTo('App\Prestataires','id','category_id');
    } 
    public function prestataires() { 
        return $this->hasMany('App\Prestataires','category_id' ); 
    }
 
}