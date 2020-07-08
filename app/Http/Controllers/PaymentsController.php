<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Users;
use App\Payments;
Use \Carbon\Carbon;
use Stripe;

class PaymentsController extends Controller
{
    /**
     * Create a new controller instance.   
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    } 

    public function store (Request $request) {  


        $user = Auth::user() ; 

        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        Stripe\Charge::create ([
            "amount" => 9 * 100,
            "currency" => "usd",
            "source" => $request->stripeToken,
            "description" => "Test payment from itsolutionstuff.com." 
        ]);

        try {
            $payment = new Payments() ;
            $payment->user_id        = $user->id ; 
            $payment->amount         = 9 ; 
            $payment->method         = 'STRIPE' ;  
            $payment->end_at         = Carbon::now()->add(1, 'month')->toDateTimeString();  
            $payment->save() ;  

            $update_user = Users::where('id', $user->id)->update(['status' => 1]) ;  
            return response()->json(['success' =>true, 'data' =>$payment  ], 200);

        } catch (\Exception $e) {
            //return error message
            return response()->json(['success' =>false, 'message' => $e ], 409);
        }
    } 
}
