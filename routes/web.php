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

	$router->get('categories', ['uses' => 'CategoriesController@index', 'as' => 'categories']);

	$router->post('login',  ['uses' =>'AuthController@login', 'as' => 'login']); 
	$router->post('facebook',  ['uses' =>'UsersController@facebook', 'as' => 'facebook']); 
	$router->post('register', ['uses' => 'AuthController@register', 'as' => 'register']);

    $router->get('me', ['uses' =>'AuthController@me', 'as' => 'profile']); 
    $router->get('refreshtoken', ['uses' =>'AuthController@refresh', 'as' => 'refresh']);  

	$router->get('user/{id}', ['uses' => 'UsersController@getUser', 'as' => 'userDeatils']);
	$router->post('user/{id}', ['uses' => 'UsersController@updateUser', 'as' => 'userUpdate']); 

	$router->get('prestataires', ['uses' => 'UsersController@prestataires', 'as' => 'prestataires']); 
	$router->get('prestataires-category/{id}/{ln}/{lg}', ['uses' => 'UsersController@showPrestataireByCategoryId', 'as' => 'prestataires-category']); 
	$router->get('prestataires/avatar/{image}', ['uses' => 'UsersController@prestatairesImages', 'as' => 'prestataires_image']);

	$router->post('make_payment',  ['uses' =>'PaymentsController@store', 'as' => 'makePayment']); 
	$router->get('manage-reservation/{id}/{action}',  ['uses' =>'ReservationsController@manageReservation', 'as' => 'manageReservations']); 
	
	$router->post('reservation', ['uses' => 'ReservationsController@store', 'as' => 'makeReservation']); 
	$router->get('reservation', ['uses' => 'ReservationsController@showReservations', 'as' => 'getReservation']); 

	//$router->get('notifications',  ['uses' =>'NotificationsController@index', 'as' => 'myNotifications']);  
	//$router->get('notification/{id}',  ['uses' =>'NotificationsController@setNotficationsVue', 'as' => 'makeVueNotifications']); 
	$router->post('uploadFile', ['uses' => 'UsersController@uploadFileImage', 'as' => 'uploadFileImage']); 
});

 
 



