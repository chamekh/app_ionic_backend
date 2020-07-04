<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Categories; 


class CategoriesController extends Controller
{
    /**
     * Create a new controller instance.   
     *
     * @return void
     */
    public function __construct()
    {
       // $this->middleware('auth');
    } 

    public function index () {

        try {
            $Categories = Categories::withCount('users')->get(); 
            return response()->json(['success' =>true, 'data' => $Categories ], 200);
        }catch (\Exception $e) {
            return response()->json(['success' =>false, 'message' => $e ], 409);
        }  
    }
    public function store (Request $request) {
        try {
            $category = new Categories() ;
            $category->name = $request->name ; 
            $category->save() ; 
            return response()->json(['success' =>true, 'data' => $category ], 200);
        }catch (\Exception $e) {
            return response()->json(['success' =>false, 'message' => $e ], 409);
        }
    }
    public function show ($id) { 
        $category = Categories::find($id) ;
        return response()->json(['success' =>true, 'data' => $category ], 200); 
    }
    public function update (Request $request , $id) { 
        $category = Categories::find($id) ;
        $category->name = $request->name ; 
        $category->save() ; 
        return response()->json(['success' =>true, 'message' => $category ], 200); 
    }
}

