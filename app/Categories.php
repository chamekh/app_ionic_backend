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

    public function category()
    {
        return $this->belongTo('App\Prestataires','id','category_id');
    }
 
}