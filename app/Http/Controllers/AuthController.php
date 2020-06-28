<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;   
 use Illuminate\Support\Facades\Auth;  
use App\Users; 
     
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
            return response()->json(['error' => 'Login or password incorect ! '], 403);
        }

        return $this->respondWithToken($token);
    }
    public function me()
    {    
        try {  
            $user = Users::where('id',Auth::user()->id)
            /*->with( 
                'category',
                'payments',
                'reservations', 
                'reservations.prestataire'
            )*/
            ->first(); 
            return response()->json(['success'=>true,'data'=>$user]) ;  
        }catch (\Exception $e) {
            return response()->json(['success' =>false, 'message' => $e ], 404);
        }
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        Auth::logout();

        return response()->json(['success'=>true, 'message' => 'Successfully logged out']);
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
           
            $user = new Users();
            $user->last_name    = $request->last_name;
            $user->first_name   = $request->first_name;
            $user->email        = $request->email;
            $user->password     = app('hash')->make($request->password, ['rounds' => 12]);
            $user->avatar       = $request->avatar;
            $user->tel          = $request->tel;
            $user->fb           = $request->fb;
            $user->insta        = $request->insta;
            $user->country     =  $request->country ;
            $user->state       =  $request->state ;
            $user->adresse     =  $request->adresse ;
            $user->zip_code    =  $request->zip_code ;
            $user->latitude    =  $request->latitude ;
            $user->longitude   =  $request->longitude ;  
            if ($request->user_type == 1) { 
                $user->user_type    = $request->user_type; 
                $user->category_id  = $request->category_id;
            }  
            $user->save();
            
            $credentials = ['email'=>$request->email, 'password'=>$request->password] ; 
            $token = Auth::attempt($credentials);

            return response()->json([
                  'success' => true,
                  'data' => $user,
                  'token' => $token
              ], 200);

        } catch (\Exception $e) {
            //return error message
            return response()->json(['success' =>false, 'message' => $e ], 409);
        }
    }
}