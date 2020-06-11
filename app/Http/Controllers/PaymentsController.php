<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
        try {
            $payment = new Payments() ;
            $payment->prestataire_id = $request->prestataire_id ; 
            $payment->amount         = $request->amount ; 
            $payment->method         = $request->method ; 
            $payment->payed_at       = Carbon::now()->toDateTimeString();  
            $payment->end_at         = Carbon::now()->add(1, 'month')->toDateTimeString();  
            $payment->save() ; 

            return response()->json(['success' =>true, 'data' =>$payment  ], 200);

        } catch (\Exception $e) {
            //return error message
            return response()->json(['success' =>false, 'message' => $e ], 409);
        }
    }
}
