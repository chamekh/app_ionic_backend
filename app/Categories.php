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
    ];
    
    public function category()
    {
        return $this->belongTo('App\Users','id','category_id');
    } 

    public function users() { 
        return $this->hasMany('App\Users','category_id' ); 
    } 
}