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
        Stripe\Stripe::setApiKey('sk_test_OwWM7x1bF20kLX9JN153mXC400Amfhg649');

        try {  
            $customer = \Stripe\Customer::create(array( 
                'email' => $user->email, 
                'source'  => $request->stripeToken 
            )); 
        }catch(Exception $e) {  
            $api_error = $e->getMessage();  
        }
 
        if(empty($api_error) && $customer){   
            try {  
                $charge = \Stripe\Charge::create(array( 
                    'customer' => $customer->id, 
                    'amount'   => 9*100, 
                    'currency' => 'eur', 
                    'description' => "Home institute" 
                )); 
            }catch(Exception $e) {  
                $api_error = $e->getMessage();  
            } 
             
            if(empty($api_error) && $charge){  
                $chargeJson = $charge->jsonSerialize(); 
            }


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
                return response()->json(['success' =>false, 'message' => $e ], 403);
            }

        }else{ 
            return response()->json(['success' =>false, 'message' => $api_error ], 403);
        }
    } 
}
