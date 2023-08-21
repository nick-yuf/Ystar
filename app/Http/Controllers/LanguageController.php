<?php

namespace App\Http\Controllers;

use Session;
use Illuminate\Http\Request;

class LanguageController extends Controller
{
    /**
     * 言語切替
     *
     * @param string $lang config/language.php のキー
     */
    public function switchLanguage($lang) {
        if(array_key_exists($lang,config('language'))) {  //登録されている言語の場合
            Session::put('applocale',$lang);
        }else {
            Session::put('applocale','ch');
        }

        return redirect()->back();
    }
}
