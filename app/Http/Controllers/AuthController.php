<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;   
 use Illuminate\Support\Facades\Auth;  
use App\Users;
use App\Adresses;
use App\Prestataires; 
     
class AuthController extends Controller
{ 

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login','register']]);
    }
    public function login(Request $request)
    {
        $credentials = $request->only(['email', 'password']);

        if (! $token = Auth::attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }
    public function me()
    {
        return response()->json(Auth::user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        Auth::logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    } 
    public function register (Request $request) {
        
        $this->validate($request, [
            'last_name' => 'required|string',
            'first_name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required',
        ]);

        try {  
            $adresse = new Adresses();
            $adresse->country_id  =  $request->country_id ;
            $adresse->state_id    =  $request->state_id ;
            $adresse->adresse     =  $request->adresse ;
            $adresse->zip_code    =  $request->zip_code ;
            $adresse->latitude    =  $request->latitude ;
            $adresse->longitude   =  $request->longitude ; 

            if ($adresse->save()) {

                $user = new Users();
                $user->last_name    = $request->last_name;
                $user->first_name   = $request->first_name;
                $user->email        = $request->email;
                $user->password     = app('hash')->make($request->password, ['rounds' => 12]);
                $user->avatar       = $request->avatar;
                $user->tel          = $request->tel;
                $user->fb           = $request->fb;
                $user->insta        = $request->insta;
                $user->user_type    = $request->user_type;
                $user->adresse_id   = $adresse->id; 
                $user->save();

                if ($request->user_type ==1) { 
                    $prestataires = new Prestataires() ;
                    $prestataires->category_id = $request->category_id;
                    $prestataires->user_id     = $user->id; 
                    $prestataires->save(); 

                    $user->user_type    = $request->user_type;
                    $user->save();
                }  
            }

            return response()->json([
                  'success' => true,
                  'data' => $user->id
              ], 200);
        } catch (\Exception $e) {
            //return error message
            return response()->json(['success' =>false, 'message' => $e ], 409);
        }
    }
}