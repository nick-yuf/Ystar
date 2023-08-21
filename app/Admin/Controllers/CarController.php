<?php

namespace App\Admin\Controllers;

use App\Models\CarModel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;

class CarController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'order';

    public function __construct()
    {
        $this->title .= ' ' . __('order');
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid(): Grid
    {
        $grid = new Grid(new CarModel());

        $grid->column(CarModel::F_id, __('ID'))->sortable();
        $grid->column(CarModel::F_name, __('车型名称'));

        $grid->disableExport();

        $grid->actions(function ($actions) {
            $actions->disableView();
        });

        return $grid;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form(): Form
    {
        $form = new Form(new CarModel());

        $form->text(CarModel::F_name, __('车型名称'))->required();
        $form->footer(function ($footer) {
            // 去掉`查看`checkbox
            $footer->disableViewCheck();
            // 去掉`继续编辑`checkbox
            $footer->disableEditingCheck();
            // 去掉`继续创建`checkbox
            $footer->disableCreatingCheck();
        });

        return $form;
    }
}
