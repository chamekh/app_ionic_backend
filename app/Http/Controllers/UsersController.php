<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;  
use Illuminate\Http\Request;  
use App\Users;
use App\Adresses;
use App\Prestataires; 
use App\Categories; 
     
class UsersController extends Controller
{ 

    public function __construct()
    {
        $this->middleware('auth');
    } 
    public function index () {
        $users = Users::with('adresse')->get(); 
        if (!$users) {
              return response()->json([
                  'success' => false,
                  'message' => 'Sorry, user cannot be found.'
              ], 400);
        }
        return response()->json(['success'=>true,'data'=>$users]) ;
    }
    public function prestataires () { 
        $users = Users::where('user_type','>',0)
                        ->with(
                            'adresse',
                            'adresse.country',
                            'adresse.state', 
                            'prestataire.category' 
                        ) 
                        ->get(); 

        if (!$users) {
              return response()->json([
                  'success' => false,
                  'message' => 'Sorry, user cannot be found.'
              ], 400);
        }
        return response()->json(['success'=>true,'data'=>$users]) ;
    }
    public function showPrestataireByCategoryId ($id) {
        $users = Categories::where('id',$id) 
                ->with(
                    /*'adresse',
                    'adresse.country',
                    'adresse.state', */ 
                    'prestataires.user' ,
                    'prestataires.user.adresse' ,
                    'prestataires.user.adresse.country' ,
                    'prestataires.user.adresse.state' ,
                )
                ->get();  
        return response()->json(['success'=>true,'data'=>$users]) ;
    }
    public function getUser ($id) { 
        $user = Users::where('id',$id)
        ->with(
                'adresse',
                'adresse.country',
                'adresse.state',
                'reservations', 
                'prestataire.category',
                'prestataire.payments'
            )
        ->get();
        if (!$user) {
              return response()->json([
                  'success' => false,
                  'message' => 'Sorry, user cannot be found.'
              ], 400);
        }
        return response()->json(['success'=>true,'data'=>$user]) ;  
    }

    
}
