<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class ResponseTransFormMiddleware
{
    //下划线转驼峰
    public function handle(Request $request, Closure $next)
    {
        $response = $next($request);
        $json = json_encode($response->original);
        return $this->changeHump(json_decode($json, true));
    }


    //转换驼峰(只转key)
    public function changeHump($params)
    {
        if (is_array($params)) {
            foreach ($params as $key => $value) {
                unset($params[$key]);
                $params[$this->convertUnderline($key)] = is_array($value) ? $this->changeHump($value) : $value;
            }
        }
        return $params;
    }

    public function convertUnderline($str)
    {
        return preg_replace_callback('/([-_]+([a-z]))/i', function ($matches) {
            return strtoupper($matches[2]);
        }, $str);
    }
}
