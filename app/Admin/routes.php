<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');

    //order
    $router->group(['prefix' => 'order', 'as' => 'order.'], function (Router $route) {
        $route->resource('list', 'OrderController');
//        $route->get('info', 'OrderController@info');
    });

    //car
    $router->group(['prefix' => 'car', 'as' => 'car.'], function (Router $route) {
        $route->resource('list', 'CarController');
    });

    //payees
    $router->group(['prefix' => 'payees', 'as' => 'payees.'], function (Router $route) {
        $route->resource('list', 'PayeesController');
    });

});
