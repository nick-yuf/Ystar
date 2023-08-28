<?php

namespace App\Http\Controllers;

use Session;

class LanguageController extends Controller
{
    /**
     * 语言切换
     *
     * @param string $lang config/language.php
     */
    public function switchLanguage($lang) {
        if(array_key_exists($lang,config('language'))) {
            Session::put('applocale',$lang);
        }else {
            Session::put('applocale','ch');
        }

        return redirect()->back();
    }
}
