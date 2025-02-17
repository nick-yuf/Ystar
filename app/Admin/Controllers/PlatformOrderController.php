<?php

namespace App\Admin\Controllers;

use App\Models\OrderModel;
use App\Models\PlatformOrderModel;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Widgets\Table;
use Encore\Admin\Widgets;

class PlatformOrderController extends BaseController
{
    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content): Content
    {
        $total = PlatformOrderModel::getInstance()->getSumByPaymentAmount();
        $totalIn = PlatformOrderModel::getInstance()->getSumByPaymentAmount(1);
        $totalOut = PlatformOrderModel::getInstance()->getSumByPaymentAmount(0);

        $fee = PlatformOrderModel::getInstance()->getSumByFee();
        $feeIn = PlatformOrderModel::getInstance()->getSumByFee(1);
        $feeOut = PlatformOrderModel::getInstance()->getSumByFee(0);

        $currency = '人民币';
        $box1 = new Widgets\Box('账单统计', '   <div class="box-body no-padding">
        <ul class="nav nav-pills nav-stacked">
            <li><a href="#">
            <i class="fa fa-map-marker text-red"></i> 平台营收:
            <i class="fa  text-red"></i> 总额：<span style="color: red;font-weight:bold">'.$total.'</span> '.$currency.' ｜
            <i class="fa  text-red"></i> 已入账：<span style="color: red;font-weight:bold">'.$totalIn.'</span> '.$currency.' ｜
            <i class="fa  text-red"></i> 未入账：<span style="color: red;font-weight:bold">'.$totalOut.'</span> '.$currency.'
            </a></li>
            <li><a href="#">
            <i class="fa fa-map-marker text-red"></i> 平台服务费:
            <i class="fa  text-red"></i> 总额：<span style="color: red;font-weight:bold">'.$fee['sum'].'</span> '.$currency.' ｜
            <i class="fa  text-red"></i> 已入账：<span style="color: red;font-weight:bold">'.$feeIn['sum'].'</span> '.$currency.' ｜
            <i class="fa  text-red"></i> 未入账：<span style="color: red;font-weight:bold">'.$feeOut['sum'].'</span> '.$currency.'
            </a></li>
            <li>
        </ul>
    </div>','<p style="margin-left: 15px">注明：<br>
    1. 已入账：金额结算到公共银行账户上<br>
    2. 未入账：金额结算在平台账户对应的支付账号内<br>
    3. 服务费：闲鱼平台，基础软件服务费计算方式（付款金额*0.6%），软件服务费当月超10单且总收入超1万（付款金额*1%）</p>');

        return $content
            ->title(__('Platform').__('Order'))
            ->description(__('List'))
            ->row($box1->style('primary')->collapsable())
            ->row($this->grid());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid(): Grid
    {
        $grid = new Grid(new PlatformOrderModel());
        $grid->model()->orderByDesc(PlatformOrderModel::F_id);
        $grid->paginate(10);

        $grid->column(PlatformOrderModel::F_id,__('ID'));
        $grid->column(PlatformOrderModel::F_customer_order_id,__('Customer').__('Tag'));
        $grid->column(PlatformOrderModel::F_payment_amount,__('Payment'). __('Amount'))->display(function () {
            $status = $this->payment_amount_status ? "<span class='label label-success'>已入账</span> ":"<span class='label label-danger'>未入账</span>";

            return $status." <span style='color: red'>".$this->payment_amount . '</span> ' .
                PlatformOrderModel::rtnEnumVal(PlatformOrderModel::CurrencyArray,$this->currency);
        });

        $grid->column(PlatformOrderModel::F_platform_fee,__('Platform'). __('Fee'))->display(function () {
            $status = $this->platform_fee_status ? "<span class='label label-success'>已入账</span> ":"<span class='label label-danger'>未入账</span>";

            return $status." <span style='color: red'>".$this->platform_fee . '</span>';
        });
        $grid->column(PlatformOrderModel::F_platform_fee_rate,__('Fee').__('Rate'))->color('blue')->suffix('%');
        $grid->column(PlatformOrderModel::F_platform_type,__('Platform'). __('Type'))
            ->editable('select', PlatformOrderModel::rtnEnumLang(PlatformOrderModel::PlatformTypeArray));

        $grid->column('111', __('Related').__('Order'))->expand(function ($model) {
            $tableTitle = [__('ID'),__('Customer name'), __('Order').__('Status'), __('Payment').__('Status'), __('Type')];
            $res = OrderModel::getInstance()->getDataByPlatformOrderId($model->id,10);
            $data = $res->map(function ($item){
               return [
                   $item[OrderModel::F_id],
                   $item[OrderModel::F_customer_name],
                   OrderModel::rtnEnumVal(OrderModel::StatusArray,$item[OrderModel::F_status]),
                   OrderModel::rtnEnumVal(OrderModel::PayStatusArray,$item[OrderModel::F_pay_status]),
                   OrderModel::rtnEnumVal(OrderModel::CustomerTypeArray,$item[OrderModel::F_customer_type]),
               ];
            })->toArray();

            return new Table($tableTitle, $data, ['table', 'table-bordered', 'table-condensed', 'table-striped']);
        })->width(100);

        $grid->column(PlatformOrderModel::F_platform_status, __('Platform') . __('Status'))
            ->editable('select', PlatformOrderModel::rtnEnumLang(PlatformOrderModel::PlatformStatusArray))->dot([
                PlatformOrderModel::platform_status_1 => 'warning',
                PlatformOrderModel::platform_status_2 => 'default',
                PlatformOrderModel::platform_status_3 => 'warning',
                PlatformOrderModel::platform_status_4 => 'success',
                PlatformOrderModel::platform_status_5 => 'danger',
            ]);
        $grid->column(PlatformOrderModel::F_travel_status, __('Travel') . __('Status'))
            ->editable('select', PlatformOrderModel::rtnEnumLang(PlatformOrderModel::TravelStatusArray))->dot([
                PlatformOrderModel::travel_status_1 => 'default',
                PlatformOrderModel::travel_status_2 => 'warning',
                PlatformOrderModel::travel_status_3 => 'success',
                PlatformOrderModel::travel_status_4 => 'danger',
            ]);
        $grid->column(PlatformOrderModel::F_created_at, __('Created at'))->display(function ($val) {
            return date('Y-m-d', strtotime($val));
        });
        //行操作
        $grid->actions(function ($actions) {
            $actions->disableView();
//            $actions->disableDelete();
        });

        //底部统计
        $grid->footer(function () {
            $data = $data1 = [];
            foreach (PlatformOrderModel::PlatformStatusArray as $k => $v) {
                $count = PlatformOrderModel::getInstance()->getTotalByPlatformStatus($k);
                $data[__($v)] = $count;
            }
            foreach (PlatformOrderModel::TravelStatusArray as $k => $v) {
                $count1 = PlatformOrderModel::getInstance()->getTotalByTravelStatus($k);
                $data1[__($v)] = $count1;
            }
            return view('admin.order-platform', compact('data','data1'));
        });

        return $grid;
    }



    /**
     * Make a form builder.
     *
     */
    protected function form(): Form
    {
        $form = new Form(new PlatformOrderModel());

        $form->text(PlatformOrderModel::F_customer_order_id, __('Customer'))->default('');

        $form->select(PlatformOrderModel::F_platform_type, __('Platform').__('Type'))
            ->options($this->setLang(PlatformOrderModel::PlatformTypeArray))
            ->default(PlatformOrderModel::platform_type_1);
        $form->text(PlatformOrderModel::F_payment_amount, __('Payment').__('Amount'))->default(0);
        $states = [
            'on'  => ['value' => 0, 'text' => '未入', 'color' => 'danger'],
            'off' => ['value' => 1, 'text' => '已入', 'color' => 'success'],
        ];
        $form->switch(PlatformOrderModel::F_payment_amount_status, __('Payment').__('Amount').'入账状态')->states($states);
        $form->rate(PlatformOrderModel::F_platform_fee_rate, __('Platform').__('Fee').__('Rate'))->default(0.6)->width(1);

        $form->text(PlatformOrderModel::F_platform_fee, __('Platform').__('Fee'))->disable();
        $form->switch(PlatformOrderModel::F_platform_fee_status, __('Platform').__('Fee').'入账状态')->states($states);

        $form->select(PlatformOrderModel::F_currency, __('Currency'))
            ->options($this->setLang(PlatformOrderModel::CurrencyArray))
            ->default(PlatformOrderModel::currency_1);
        $form->radio(PlatformOrderModel::F_platform_status, __('Platform').__('Status'))
            ->options($this->setLang(PlatformOrderModel::PlatformStatusArray))
            ->default(PlatformOrderModel::platform_status_2);
        $form->radio(PlatformOrderModel::F_travel_status,__('Travel').__('Status'))
            ->options($this->setLang(PlatformOrderModel::TravelStatusArray))
            ->default(PlatformOrderModel::travel_status_1);

        $form->footer(function ($footer) {
            $footer->disableViewCheck();
            $footer->disableEditingCheck();
            $footer->disableCreatingCheck();
        });

        $form->header(function ($actions) {
            $actions->disableView();
            $actions->disableDelete();
        });

        $form->saving(function (Form $form) {
            if ($form->platform_type == PlatformOrderModel::platform_type_1) {
                $fee = number_format($form->payment_amount * $form->platform_fee_rate/100,2);
                $form->platform_fee = $fee;
            }
        });

        return $form;
    }


}
