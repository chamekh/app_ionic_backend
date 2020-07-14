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

    public function showPrestataireByCategoryId ($id,$ln,$lg) {   
        $users = Users::where('category_id',$id) 
                ->where('status',1)
                ->with(
                    'category',
                    'payments'
                )
                ->get(); 
        return response()->json(['success'=>true,'data'=>$this->orberByDistance($users,$ln,$lg)]) ;
    } 

    private function orberByDistance ($array,$ln,$lg) {
        $n_array = array() ;    
        foreach ($array as $user) {
            $user->distance =   (($user ->latitude  - $ln)**2)  +((($user->longitude - $lg)/cos($user->latitude/57.295)) **2) **.5 / .009;
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

    public function prestatairesImages($image) {  
        $path = storage_path('app/images/users/'.$image) ; 
        return response(Storage::get('images/users/'.$image), 200, ['Content-Type' => 'image/jpeg']);
    }
    public function updateUser (Request $request, $id) {

        $user =   Users::find($id); 

        $user->last_name    = $request->last_name;
        $user->first_name   = $request->first_name;
        $user->email        = $request->email;  
        $user->tel          = $request->tel;
        $user->fb           = $request->fb;
        $user->insta        = $request->insta;
        $user->country      = $request->country ;
        $user->state        = $request->state ;
        $user->adresse      = $request->adresse ;
        $user->zip_code     = $request->zip_code ;   
        $user->bio          = $request->bio; 

        if ($request->avatar) {
            $new_name = $user->avatar ; 
            if (preg_match('/^data:image\/(\w+);base64,/', $request->avatar )) {
                $data = substr($request->avatar, strpos($request->avatar, ',') + 1);   
                $data = base64_decode($data);
                $new_name = 'U-' . time() . '.' . 'png'; 
                $path_to_save = 'images/users/' ;  
                Storage::disk('local')->put($path_to_save.$new_name, $data);  
            } 
            $user->avatar       = $new_name;
        } 
        if ($request->password && $request->old_password) { 
            if (app('hash')->make($request->old_password, ['rounds' => 12]) == $user->password) {
                $user->password     = app('hash')->make($request->password, ['rounds' => 12]);
            }else{
                return response()->json(['success'=>false,'msg'=>'current password incorrect !']) ;
            }
        } 
        $user->save(); 
        return response()->json(['success'=>true,'data'=>$user]) ; 
    } 
}
