<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;  
use App\Users;
use App\Adresses;
use App\Prestataires; 
use Illuminate\Support\Facades\Auth;  
     
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
                        ->with('adresse','prestataire','prestataire.category')
                        ->get(); 

        if (!$users) {
              return response()->json([
                  'success' => false,
                  'message' => 'Sorry, user cannot be found.'
              ], 400);
        }
        return response()->json(['success'=>true,'data'=>$users]) ;
    }
    public function getUser ($id) { 
        $user = Users::where('id',$id)->with('adresse','reservations','prestataire','prestataire.category','prestataire.payments')->get();
        if (!$user) {
              return response()->json([
                  'success' => false,
                  'message' => 'Sorry, user cannot be found.'
              ], 400);
        }
        return response()->json(['success'=>true,'data'=>$user]) ;  
    }

    
}
