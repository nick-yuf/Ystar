<?php

namespace App\Admin\Controllers;

use App\Models\OrderModel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

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

        $grid->column(OrderModel::F_id, __('订单ID'))->sortable();
        $grid->column(OrderModel::F_customer_name, __('客户姓名'));
        $grid->column(OrderModel::F_status, __('订单状态'))->using([
            0 => '--',
            1 => '待分配',
            2 => '进行中',
            3 => '完成',
            4 => '作废',
        ], '未知')->label([
            0 => 'warning',
            1 => 'warning',
            2 => 'primary',
            3 => 'success',
            4 => 'default',
        ]);

        $grid->column('', __('行程详情'))->modal('行程详情', function ($val) {
            return new Table(['抵达时间', '航班号', '接送起点', '接送目的地'], $val->travel_info);
        });

        $grid->column(OrderModel::F_created_at, __('创建时间'))->display(function ($val) {
            return date('Y-m-d H:i:s', strtotime($val));
        });

        $grid->disableExport();
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

        $show->field(OrderModel::F_sn, __('订单编号'));
        $show->field(OrderModel::F_customer_name, __('客户姓名'));
        $show->field(OrderModel::F_customer_phone, __('客户联系方式'));
        $show->field(OrderModel::F_source, __('客户来源'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::SourceArray, $val);
        });
        $show->field(OrderModel::F_person_sum, __('成人'));
        $show->field(OrderModel::F_children_sum, __('儿童'));
        $show->field(OrderModel::F_box_sum, __('行李数'));
        $show->field(OrderModel::F_pay_type, __('支付类型'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::PayTypeArray, $val);
        });
        $show->field(OrderModel::F_pay_currency, __('支付货币种类'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::PayCurrencyArray, $val);
        });
        $show->field(OrderModel::F_pay_status, __('付款状态'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::PayStatusArray, $val);
        });
        $show->field(OrderModel::F_status, __('订单状态'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::StatusArray, $val);
        });
        $show->field(OrderModel::F_created_at, __('创建时间'));
        $show->field(OrderModel::F_updated_at, __('更新时间'));

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

        $form->text(OrderModel::F_customer_name, __('客户姓名'))->required();
        $form->text(OrderModel::F_customer_phone, __('客户联系方式'))->required();
        $form->select(OrderModel::F_source, __('客户来源'))->options(OrderModel::SourceArray)->default(OrderModel::source_1);
        $form->number(OrderModel::F_person_sum, __('成人'))->max(100)->default(0);
        $form->number(OrderModel::F_children_sum, __('儿童'))->max(100)->default(0);
        $form->number(OrderModel::F_box_sum, __('行李数'))->max(100)->default(0);
        $form->select(OrderModel::F_pay_type, __('支付类型'))->options(OrderModel::PayTypeArray)->default(OrderModel::pay_type_1);
        $form->select(OrderModel::F_pay_currency, __('支付货币种类'))->options(OrderModel::PayCurrencyArray)->default(OrderModel::pay_currency_1);
        $form->select(OrderModel::F_pay_status, __('付款状态'))->options(OrderModel::PayStatusArray)->default(OrderModel::pay_status_1);
        $form->radio(OrderModel::F_status, __('订单状态'))->options(OrderModel::StatusArray)->default(OrderModel::status_1);

        $form->text(OrderModel::F_remark, __('备注内容'));
        $form->table(OrderModel::F_travel_info, '行程内容', function ($form) {
            $form->datetime('reach_time', __('抵达时间'));
            $form->text('flight_number', __('航班号'));
            $form->text('begin_address', __('接送起点'));
            $form->text('finish_address', __('接送目的地'));
        })->rules('required|array');

        $form->saving(function (Form $form) {
            if(empty($form->travel_info)) {
                $form->travel_info = [];
            }
            if(empty($form->remark)) {
                $form->remark = '';
            }
        });

        return $form;
    }
}
