<?php

namespace App; 

use Illuminate\Database\Eloquent\Model; 

class Rating extends Model  
{
    
    protected $table = 'rating';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['created_at','updated_at'];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [
        'user_id', 
        'presta_id',  
    ]; 
 
    public function rating() 
    {
        return $this->hasMany('App\User','user_id','id');
    } 
}
