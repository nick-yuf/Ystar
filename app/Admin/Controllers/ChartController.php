<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Layout\Content;
use Encore\Admin\Widgets\Box;

class ChartController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '';

    public function __construct()
    {
        $this->title = __('Chart');
    }

    public function index(Content $content)
    {
        return $content
            ->header('Chartjs')
            ->body(new Box('Bar chart', view('admin.chartjs')));
    }

}
