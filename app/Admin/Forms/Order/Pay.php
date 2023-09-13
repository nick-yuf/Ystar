<?php

namespace App\Admin\Forms\Order;

use App\Common\Library\util;
use App\Models\OrderModel;
use Encore\Admin\Widgets\StepForm;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class Pay extends StepForm
{
    /**
     * The form title.
     *
     * @var string
     */
    public $title = '';


    public function __construct($data = [])
    {
        $this->title = __('Pay');
        parent::__construct($data);
    }

    /**
     * Handle the form request.
     *
     * @param Request $request
     *
     * @return RedirectResponse
     */
    public function handle(Request $request): RedirectResponse
    {
        $data = $this->all();

        $orderModel = new OrderModel();

//        $order = $orderModel->addOne([
//            OrderModel::F_customer_name => 1
//        ]);

//        $order = OrderModel::getInstance()->save([
//            OrderModel::F_customer_name => $data['Basic'][OrderModel::F_customer_name],
//            OrderModel::F_customer_phone => $data['Basic'][OrderModel::F_customer_phone],
//            OrderModel::F_source => $data['Basic'][OrderModel::F_source],
//            OrderModel::F_customer_type => $data['Basic'][OrderModel::F_customer_type],
//            OrderModel::F_remark => $data['Basic'][OrderModel::F_remark],
//            OrderModel::F_status => $data['Basic'][OrderModel::F_status],
//            OrderModel::F_sn => $data['Basic'][OrderModel::F_sn],
//            OrderModel::F_user_id => $data['Basic'][OrderModel::F_user_id],
//            OrderModel::F_trip_info => $data['Trip'][OrderModel::F_trip_info]??[],
//            OrderModel::F_case_info => $data['Car'],
//            OrderModel::F_person_sum => $data['Car']['person_sum'],
//            OrderModel::F_children_sum => $data['Car']['children_sum'],
//            OrderModel::F_box_sum => $data['Car']['large']+$data['Car']['medium']+$data['Car']['small'],
//        ]);

//        $orderId = 1;
//        $trip = $data['Trip'][OrderModel::F_trip_info];
//        if (!empty($trip)) {
//            foreach ($trip as $key => $val) {
//                $trip[$key][OrderTripModel::F_order_id] = $orderId;
//
//                if (!isset($trip[$key][OrderTripModel::F_reach_time])) {
//                    $trip[$key][OrderTripModel::F_reach_time] = null;
//                }
//
//                if (!isset($trip[$key][OrderTripModel::F_flight_number])) {
//                    $trip[$key][OrderTripModel::F_flight_number] = "";
//                }
//            }
//            OrderTripModel::getInstance()->newQuery()->where(OrderTripModel::F_order_id, $orderId)->delete();
//            OrderTripModel::getInstance()->addBatch($trip);
//        }


        dd($data);


        $this->clear();
        admin_toastr('success');
        return redirect()->to('admin/order/list');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->select(OrderModel::F_pay_type, __('Pay type'))->options(util::setLang(OrderModel::PayTypeArray))->default(OrderModel::pay_type_1);
        $this->radio(OrderModel::F_pay_currency, __('Pay currency'))->options(util::setLang(OrderModel::PayCurrencyArray))->default(OrderModel::pay_currency_1);
        $this->select(OrderModel::F_pay_status, __('Pay status'))->options(util::setLang(OrderModel::PayStatusArray))->default(OrderModel::pay_status_1);
        $this->currency(OrderModel::F_expect_price, __('Expect price'))->required();
        $this->currency(OrderModel::F_payment_price, __('Payment price'))->required();
        $this->currency(OrderModel::F_timeout_fees, __('Timeout fees'));
        $this->currency(OrderModel::F_append_fees, __('Append fees'));
        $this->currency(OrderModel::F_driver_commission, __('Driver commission'));
        $this->select(OrderModel::F_payees_id, __('Payees'))->options('/api/payees/select-list')->required();

    }


}
