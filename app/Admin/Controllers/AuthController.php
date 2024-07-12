<?php

namespace App\Admin\Controllers;

use Encore\Admin\Facades\Admin;
use Encore\Admin\Controllers\AuthController as BaseAuthController;

class AuthController extends BaseAuthController
{
    protected $redirectTo = '/admin';

    // 定义登录后的跳转路径

    /**
     * @return string
     */
    protected function redirectPath(): string
    {
        if(Admin::user()->isRole('channel')){
            return admin_base_path('/car-channel/list');
        }

        return admin_base_path('/order/list');
    }
}
