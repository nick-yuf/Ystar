<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        $content->title('概览');
        $content->description('Y-star');
        $content->breadcrumb(
            ['text' => '概览', 'url' => '/admin'],
        );

        $content->row(Dashboard::title());


        return $content;
    }
}
