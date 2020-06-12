<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Prestataires extends Model
{
    
    protected $table = 'prestataires';
    protected $fillable = [ 
    ];  
    protected $hidden = [
        'created_at',
        'updated_at',
        'category_id',
        'user_id',
    ];

    
    public function user()
    {
        return $this->hasOne('App\Users','id','user_id');
    } 
    public function category()
    {
        return $this->hasOne('App\Categories','id','category_id');
    }
    public function payments()
    {
        return $this->hasMany('App\Payments','prestataire_id','id');
    } 

    public function details() { 
        return $this->belongsTo('App\Users','user_id'); 
    } 

}