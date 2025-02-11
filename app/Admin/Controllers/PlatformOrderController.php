<?php

namespace App\Admin\Controllers;

use App\Models\OrderModel;
use App\Models\PlatformOrderModel;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Widgets\Table;

class PlatformOrderController extends BaseController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '平台订单';

    public function __construct()
    {
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
            return "<font color='red'>".$this->payment_amount . '</font> ' . PlatformOrderModel::rtnEnumVal(PlatformOrderModel::CurrencyArray,$this->currency);
        });

        $grid->column(PlatformOrderModel::F_platform_fee,__('Platform'). __('Fee'))->editable();
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
        $form->text(PlatformOrderModel::F_payment_amount, __('Payment').__('Amount'))->default('');
        $form->text(PlatformOrderModel::F_platform_fee, __('Platform').__('Fee'))->default('');

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

        return $form;
    }


}
