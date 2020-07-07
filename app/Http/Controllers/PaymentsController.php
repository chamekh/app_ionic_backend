<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Users;
use App\Payments;
Use \Carbon\Carbon;

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
        try {
            $payment = new Payments() ;
            $payment->user_id        = $user->id ; 
            $payment->amount         = 9 ; 
            $payment->method         = $request->method ;  
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
