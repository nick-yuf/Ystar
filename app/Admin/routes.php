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
        $route->resource('create', 'OrderController');
    });

    //order
    $router->group(['prefix' => 'car', 'as' => 'car.'], function (Router $route) {
        $route->resource('list', 'CarController');
    });

});
