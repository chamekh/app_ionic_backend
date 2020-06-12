<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
Use \Carbon\Carbon;
use App\Notifications;


class NotificationsController extends Controller
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

    public function index () { 
    	try {
    		$user = Auth::user();
    		$notifs = Notifications::where('user_id',$user->id)->get();
    		$count  = $notifs->count() ;  
            return response()->json(['success' =>true, 'data' => compact( 'notifs', 'count') ], 200);
        }catch (\Exception $e) {
            return response()->json(['success' =>false, 'message' => $e ], 404);
        } 
    }
    public function store (Request $request) {
        
        try {
            $notif = new Notifications() ;
            $notif->notif_text = $request->notif_text ; 
            $notif->notif_type = $request->notif_type ; 
            $notif->user_id    = $request->user_id ; 
            $notif->save() ; 
            return response()->json(['success' =>true], 200); 
        }catch (\Exception $e) {
            return response()->json(['success' =>false], 403);
        }
    }

    public function setNotficationsVue ($id) { 
    	try {
	        $notif = Notifications::find($id) ;
	        $notif->vu_at = Carbon::now()->toDateTimeString(); 
	        $notif->save() ; 
	        return response()->json(['success' =>true], 200); 
        }catch (\Exception $e) {
            return response()->json(['success' =>false], 403);
        }
    }
}

