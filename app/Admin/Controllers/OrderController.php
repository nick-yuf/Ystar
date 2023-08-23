<?php

namespace App\Admin\Controllers;

use App\Models\OrderModel;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class OrderController extends BaseController
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

        $grid->column(OrderModel::F_id, __('ID'))->sortable();
        $grid->column(OrderModel::F_customer_name, __('Customer name'));
        $grid->column(OrderModel::F_status, __('Status'))->using([
            0 => '--',
            1 => __('Standby'),
            2 => __('Progress'),
            3 => __('Finish'),
            4 => __('Cancel'),
        ], '未知')->label([
            0 => 'warning',
            1 => 'warning',
            2 => 'primary',
            3 => 'success',
            4 => 'default',
        ]);

        $grid->column('', __('Trip info'))->modal('Trip info', function ($val) {
            return new Table(['Reach Time', 'Flight number', 'Begin address', 'Finish address'], $val->travel_info);
        });

        $grid->column(OrderModel::F_created_at, __(OrderModel::F_created_at))->display(function ($val) {
            return date('Y-m-d H:i:s', strtotime($val));
        });

        $grid->disableExport();
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id): Show
    {
        $show = new Show(OrderModel::findOrFail($id));

        $show->field(OrderModel::F_sn, __('SN'));
        $show->field(OrderModel::F_customer_name, __('Customer name'));
        $show->field(OrderModel::F_customer_phone, __('Customer phone'));
        $show->field(OrderModel::F_source, __('Source'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::SourceArray, $val);
        });
        $show->field(OrderModel::F_person_sum, __('Person') . __('Sum'));
        $show->field(OrderModel::F_children_sum, __('Children') . __('Sum'));
        $show->field(OrderModel::F_box_sum, __('Luggage') . __('Sum'));
        $show->field(OrderModel::F_pay_type, __('Pay type'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::PayTypeArray, $val);
        });
        $show->field(OrderModel::F_pay_currency, __('Pay currency'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::PayCurrencyArray, $val);
        });
        $show->field(OrderModel::F_pay_status, __('Pay status'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::PayStatusArray, $val);
        });
        $show->field(OrderModel::F_status, __('Order') . __('Status'))->as(function ($val) {
            return OrderModel::rtnEnumVal(OrderModel::StatusArray, $val);
        });
        $show->field(OrderModel::F_created_at, __('Created at'));
        $show->field(OrderModel::F_updated_at, __('Updated at'));

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

        $form->text(OrderModel::F_customer_name, __('Customer name'))->required();
        $form->text(OrderModel::F_customer_phone, __('Customer phone'))->required();
        $form->select(OrderModel::F_source, __('Source'))->options($this->setLang(OrderModel::SourceArray))->default(OrderModel::source_1);
        $form->number(OrderModel::F_person_sum, __('Person') . __('Sum'))->max(100)->default(0);
        $form->number(OrderModel::F_children_sum, __('Children') . __('Sum'))->max(100)->default(0);
        $form->number(OrderModel::F_box_sum, __('Luggage') . __('Sum'))->max(100)->default(0);
        $form->select(OrderModel::F_pay_type, __('Pay type'))->options($this->setLang(OrderModel::PayTypeArray))->default(OrderModel::pay_type_1);
        $form->select(OrderModel::F_pay_currency, __('Pay currency'))->options($this->setLang(OrderModel::PayCurrencyArray))->default(OrderModel::pay_currency_1);
        $form->select(OrderModel::F_pay_status, __('Pay status'))->options($this->setLang(OrderModel::PayStatusArray))->default(OrderModel::pay_status_1);
        $form->radio(OrderModel::F_status, __('Order') . __('Status'))->options($this->setLang(OrderModel::StatusArray))->default(OrderModel::status_1);

        $form->text(OrderModel::F_remark, __('Notes'));
        $form->table(OrderModel::F_travel_info, __('Trip info'), function ($form) {
            $form->datetime('reach_time', __('Reach Time'));
            $form->text('flight_number', __('Flight number'));
            $form->text('begin_address', __('Begin address'));
            $form->text('finish_address', __('Finish address'));
        })->rules('required|array');

        $form->saving(function (Form $form) {
            if (empty($form->travel_info)) {
                $form->travel_info = [];
            }
            if (empty($form->remark)) {
                $form->remark = '';
            }
        });

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
