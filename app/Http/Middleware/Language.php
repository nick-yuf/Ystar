<?php

namespace App\Http\Middleware;

use Closure;


use Illuminate\Http\Request;
use App;
use Session;

class Language
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Session::has('applocale') && array_key_exists(Session::get('applocale'), config('language'))) {
            App::setLocale(Session::get('applocale'));
        }
        else {
            App::setLocale('zh-CN');
        }
        return $next($request);
    }
}
