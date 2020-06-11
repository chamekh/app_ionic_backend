<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Reservations;
Use \Carbon\Carbon;


class ReservationsController extends Controller
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

            $res = new Reservations() ;
            $res->reservation_date   = $request->reservation_date ; 
            $res->user_id            = $user->id ; 
            $res->prestataire_id     = $request->prestataire_id ; 
            $res->status             = $request->status ;       
            $res->save() ; 

            return response()->json(['success' =>true, 'data' =>$res  ], 200);

        } catch (\Exception $e) {
            //return error message
            return response()->json(['success' =>false, 'message' => $e ], 409);
        }
    }
    public function manageReservation ($id,$action = 0) {
        $user = Auth::user() ;

        $reservation = Reservations::find($id) ; 

        if ($reservation && $reservation->prestataire_id == $user->id) { 
            $reservation->status =  $action ; 
            $reservation->updated_at = Carbon::now()->toDateTimeString(); 
            if ((int) $action === 0) { 
                $reservation->deleted_at = Carbon::now()->toDateTimeString(); 
            }
            $reservation->save() ; 
            return response()->json(['success' =>true, 'data' =>$reservation  ], 200);
        }

        return response()->json(['success' =>false, 'message' => $reservation ], 403);
        //return response()->json(['success' =>false, 'message' => 'failed' ], 403);
    } 
}
