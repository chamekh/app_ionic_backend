<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; 
use Illuminate\Support\Facades\Crypt;
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
    public function getUser ($id) { 
        $user = Users::where('id',$id)->with('adresse','prestataire','category')->get();
        if (!$user) {
              return response()->json([
                  'success' => false,
                  'message' => 'Sorry, user cannot be found.'
              ], 400);
        }
        return response()->json(['success'=>true,'data'=>$user]) ;  
    }

    
}
