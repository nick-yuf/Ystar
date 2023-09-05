<?php

namespace App\Admin\Controllers;

use App\Models\CarModel;
use App\Models\PayeesModel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;

class PayeesController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '';

    public function __construct()
    {
        $this->title = __('Payees');
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid(): Grid
    {
        $grid = new Grid(new PayeesModel());

        $grid->column(PayeesModel::F_id, __('ID'))->sortable();
        $grid->column(PayeesModel::F_name, __('Name'));
        $grid->column(PayeesModel::F_phone, __('Contact info'));

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
        $form = new Form(new PayeesModel());

        $form->text(PayeesModel::F_name, __('Name'))->required();
        $form->text(PayeesModel::F_phone, __('Contact info'))->required();
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
