<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Route;

class BaseController extends AdminController
{


    function setLang($array = array()): array
    {
        return collect($array)->map(function ($item) {
            return __($item);
        })->toArray();
    }

    /**
     * 获取路由
     * @param $name
     * @param string $action
     * @param array $param
     * @return string
     */
    function getRouteByName($name, string $action = 'index', array $param = []): string
    {
        $domain = str_replace(Request::path(), '', Request::url());
        $name .= $action ? '.' . $action : '';
        $route = Route::getRoutes()->getByName($name);
        if (empty($route)) {
            return '';
        }
        $url = $domain . $route->uri;
        if ($param) {
            $url .= '?' . http_build_query($param);
        }
        return $url;
    }
}
