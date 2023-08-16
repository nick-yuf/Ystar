<?php

namespace App\Admin\Controllers;

use App\Models\OrderModel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class OrderController extends AdminController
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
        $grid = new Grid(new OrderModel());

        $grid->column('sn', __('订单编号'))->sortable();
        $grid->column(OrderModel::F_customer_name, __('客户姓名'));
        $grid->column(OrderModel::F_status, __('订单状态'))->using([
            0 => '--',
            1 => '等待派单',
            2 => '进行中',
            3 => '完成',
            4 => '作废',
        ], '未知')->label([
            0 => 'warning',
            1 => 'info',
            2 => 'danger',
            3 => 'success',
            4 => 'warning',
        ]);

        $grid->column('created_at', __('创建时间'))->display(function ($val) {
            return date('Y-m-d H:i:s', strtotime($val));
        });
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed   $id
     * @return Show
     */
    protected function detail($id): Show
    {
        $show = new Show(OrderModel::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form(): Form
    {
        $form = new Form(new OrderModel());

        $form->display('id', __('ID'));
        $form->display('created_at', __('Created At'));
        $form->display('updated_at', __('Updated At'));

        return $form;
    }
}
