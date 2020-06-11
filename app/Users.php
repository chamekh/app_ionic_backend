<?php

namespace App;

use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Model;
use Laravel\Lumen\Auth\Authorizable; 

use Tymon\JWTAuth\Contracts\JWTSubject;

class Users extends Model implements AuthenticatableContract, AuthorizableContract,JWTSubject
{
    use Authenticatable, Authorizable;

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
        'password',
        'adresse_id',
    ];

     public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    public function adresse()
    {
        return $this->hasOne('App\Adresses','id','adresse_id');
    }
    public function prestataire () { 
        return $this->hasOne('App\Prestataires','id','user_type'); 
    }
    public function category () {
        return $this->hasOneThrough(
            'App\Categories',
            'App\Prestataires',
            'category_id',   
            'id', 
            'id'
        ); 
    } 
}
