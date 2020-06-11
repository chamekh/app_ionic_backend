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
        //
    }

    public function index () {
        $Categories = Categories::all();
        return ($Categories);
    }
}
