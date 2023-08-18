<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/**
 * @var $api Dingo\Api\Routing\Router
 */
$api = app('Dingo\Api\Routing\Router');

$api->version(
    'v1',   //这里的version是版本，里面的v1是在env里面定义好的。
    [
        'namespace' => 'App\Api\Controllers',
        'middleware' => [],
    ],

    function ($api) {
        /**
         * @var $api Dingo\Api\Routing\Router
         */

        $api->group(['prefix' => 'home'], function ($api) {
            $api->any('create-model', 'HomeController@createModel')->name('createModel');
        });

    }
);

