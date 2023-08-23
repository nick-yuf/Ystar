<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;

class BaseController extends AdminController
{


    function setLang($array = array()): array
    {
        return collect($array)->map(function ($item) {
            return __($item);
        })->toArray();
    }

}
