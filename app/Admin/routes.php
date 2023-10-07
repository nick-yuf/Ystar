<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix' => config('admin.route.prefix'),
    'namespace' => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
//    'as' => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');

    //order
    $router->group(['prefix' => 'order'], function (Router $route) {
        $route->resource('list', 'OrderController')->names('order#list');
        $route->get('tab-form', 'OrderController@tabForm')->name('order#tab-form');
    });

    //car
    $router->group(['prefix' => 'car'], function (Router $route) {
        $route->resource('list', 'CarController')->names('car#list');
        $route->resource('case-list', 'CarCaseController')->names('car#case-list');
    });

    //payees
    $router->group(['prefix' => 'payees'], function (Router $route) {
        $route->resource('list', 'PayeesController');
    });

    //luggage
    $router->group(['prefix' => 'luggage'], function (Router $route) {
        $route->resource('list', 'LuggageController')->names('luggage#list');
    });

    //chart
    $router->group(['prefix' => 'chart'], function (Router $route) {
        $route->resource('index', 'ChartController@index')->names('chart#index');
    });
});
