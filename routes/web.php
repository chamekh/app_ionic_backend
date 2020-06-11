<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});



$router->group(['prefix' => 'api'], function () use ($router) { 
    $router->get('me', ['uses' =>'AuthController@me', 'as' => 'profile']); 
    $router->get('users', ['uses' => 'UsersController@index', 'as' => 'all_users']);
	$router->get('user/{id}', ['uses' => 'UsersController@getUser', 'as' => 'userDeatils']);

	$router->post('login',  ['uses' =>'AuthController@login', 'as' => 'login']); 
	$router->post('register', ['uses' => 'AuthController@register', 'as' => 'register']); 
	$router->get('categories', ['uses' => 'CategoriesController@index', 'as' => 'categories']);

});




