<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;

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

}
