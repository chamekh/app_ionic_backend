<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;  
use Illuminate\Http\Request;  
use App\Users;
use App\Adresses;
use App\Prestataires; 
use App\Categories; 
use Illuminate\Support\Facades\Storage; 
     
class UsersController extends Controller
{ 

    public function __construct()
    {
        $this->middleware('auth',['except' => [
            'prestatairesImages',
        ]]);
    }

    public function prestataires () { 
        $users = Users::where('user_type','>',0)
                        ->with( 
                            'category',
                            'payments'
                        ) 
                        ->get(); 

        if (!$users) {
              return response()->json([
                  'success' => false,
                  'message' => 'Sorry, user cannot be found.'
              ], 400);
        }
        return response()->json(['success'=>true,'data'=>$this->orberByDistance($users)]) ;
    } 

    public function showPrestataireByCategoryId ($id) {   
        $users = Users::where('category_id',$id) 
                ->with(
                    'category',
                    'payments'
                )
                ->get(); 
        return response()->json(['success'=>true,'data'=>$this->orberByDistance($users)]) ;
    } 

    private function orberByDistance ($array) {
        $n_array = array() ;    
        foreach ($array as $user) {
            $user->distance =   (($user ->latitude  - Auth::user()->latitude)**2)  +((($user->longitude - Auth::user()->longitude)/cos($user->latitude/57.295)) **2) **.5 / .009;
            $user->distance =   number_format((float)$user->distance, 2, '.', '');
            $n_array[] = $user ; 
        }
        usort($n_array, function($a, $b) {
            return $a['distance'] - $b['distance'];
        }); 
        return $n_array ; 
    }
    
    public function getUser ($id) { 
        $user = Users::where('id',$id)
        ->with(  
                'category',
                'payments'
            )
        ->first();
        if (!$user) {
              return response()->json([
                  'success' => false,
                  'message' => 'Sorry, user cannot be found.'
              ], 400);
        }
        return response()->json(['success'=>true,'data'=>$user]) ;  
    }

    public function prestatairesImages($id) {
        $prestataire = Users::find($id) ;  
        $path = storage_path('app/images/users/'.$prestataire->avatar) ;   
        header("Content-type: image/jpeg"); 
        echo Storage::get('images/users/'.$prestataire->avatar); 
    }
    public function updateUser (Request $request, $id) {

        $user =   Users::find($id); 

        $user->last_name    = $request->last_name;
        $user->first_name   = $request->first_name;
        $user->email        = $request->email; 
        $user->avatar       = $request->avatar;
        $user->tel          = $request->tel;
        $user->fb           = $request->fb;
        $user->insta        = $request->insta;
        $user->country      = $request->country ;
        $user->state        = $request->state ;
        $user->adresse      = $request->adresse ;
        $user->zip_code     = $request->zip_code ;   
        $user->bio          = $request->bio; 

        if ($request->password) { 
            $user->password     = app('hash')->make($request->password, ['rounds' => 12]);
        }

        $user->save();

        return response()->json(['success'=>true,'data'=>$user]) ; 
    }
    
}
