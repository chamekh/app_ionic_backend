<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;   
use Illuminate\Support\Facades\Auth;  
use App\Users; 
use Illuminate\Support\Str; 
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

     
class AuthController extends Controller
{  
    public function __construct()
    {
        $this->middleware('auth:api', [
            'except' => [
                'login',
                'register',
                'forgot',
                'resetPassword',
                'checkCodeToken',
                'facebookLogin'
            ]
        ]);
    }

    public function login(Request $request)
    {
        $credentials = $request->only(['email', 'password']);

        if (! $token = Auth::attempt($credentials)) {
            return response()->json(['error' => 'Login or password incorect ! '], 403);
        } 
        return $this->respondWithToken($token);
    }

    public function facebookLogin (Request $request) {
       
        $userData = Users::where('fb_id',$request->fb_id)->first();  
        if (! $token = Auth::fromUser($userData)) {
            return response()->json(['error' => 'Login or password incorect ! '], 403);
        }
        return $this->respondWithToken($token);  
    }
    
    public function me()
    {    
        try {  
            $user = Users::where('id',Auth::user()->id) 
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
                $user->bio          = $request->bio;
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

    public function forgot (Request $request) {

        $email = $request->only('email');
        $user  = Users::where('email',$email)->first();  
        $token = Str::random(6);   
        $mail_sent = $this->send_mail($token,$user->email) ; 
        $update_user = Users::where('id',$user->id)->update(['token_reset' => $token]) ; 
        return response()->json(['success'=>true,'data'=>$update_user],200) ;   
    }
    public function checkCodeToken (Request $request) {
        $token = $request->code ; 
        $isExist = Users::where('token_reset',$token)->first(); 
        if ($isExist) {
            return response()->json(['success'=>true,'data'=>true],200) ;
        }else{
            return response()->json(['success'=>false,'data'=>false],200) ;
        }
    }
    public function resetPassword (Request $request) { 
        try {
            $isUpdated = Users::where('token_reset',$request->code)->update(['password' => app('hash')->make($request->password, ['rounds' => 12]) , 'token_reset'=> '' ]); 
            return response()->json(['success'=>true,'data'=>$isUpdated],200) ; 
        } catch (\Exception $e) {
            //return error message
            return response()->json(['success' =>false, 'message' => $e ], 404);
        }
    }

    public function send_mail ($code,$email) {
        $mail = new PHPMailer(true);
        try {
            //Server settings
            $mail->SMTPDebug = 0;                                 // Enable verbose debug output
            $mail->isSMTP();                                      // Set mailer to use SMTP
            $mail->Host = 'smtp.gmail.com';                       // Specify main and backup SMTP servers
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            $mail->Username = 'chamekhala@gmail.com';             // SMTP username
            $mail->Password = 'misterdark';                       // SMTP password
            $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
            $mail->Port = 587;                                    // TCP port to connect to

            //Recipients 
            $mail->setFrom('chamekhala@gmail.com', 'Mailer');
            $mail->addAddress($email);     // Add a recipient   
             
            //Content
            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = 'Réinitialisation du mot de passe';
            $mail->Body    = 'Code : '.$code ; 

            $mail->send();
            return true ; 
        } catch (Exception $e) {
            return false ; 
        }
    }
}