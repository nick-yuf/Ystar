<?php

namespace App\Admin\Forms\Order;

use App\Common\Library\util;
use App\Exceptions\ApiException;
use App\Models\CarCaseModel;
use App\Models\OrderModel;
use App\Models\OrderTripModel;
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

        $trip = array_values($data['Trip'][OrderModel::F_trip_info] ?? []);
        $case = $data['Car'] ?? [];
        $adult = $data['Car']['person_sum'] ?? 0;
        $children = $data['Car']['children_sum'] ?? 0;
        $large = $data['Car']['large'] ?? 0;
        $medium = $data['Car']['medium'] ?? 0;
        $small = $data['Car']['small'] ?? 0;
        $carId = $data['Car']['car_id'] ?? 0;

        $orderId = OrderModel::getInstance()->addOne([
            OrderModel::F_customer_name => $data['Basic'][OrderModel::F_customer_name],
            OrderModel::F_customer_phone => $data['Basic'][OrderModel::F_customer_phone],
            OrderModel::F_source => $data['Basic'][OrderModel::F_source],
            OrderModel::F_customer_type => $data['Basic'][OrderModel::F_customer_type],
            OrderModel::F_remark => $data['Basic'][OrderModel::F_remark],
            OrderModel::F_status => $data['Basic'][OrderModel::F_status],
            OrderModel::F_sn => $data['Basic'][OrderModel::F_sn],
            OrderModel::F_user_id => $data['Basic'][OrderModel::F_user_id],
            OrderModel::F_trip_info => json_encode($trip),
            OrderModel::F_case_info => json_encode($case),
            OrderModel::F_person_sum => $adult,
            OrderModel::F_children_sum => $children,
            OrderModel::F_box_sum => $large + $medium + $small,
            OrderModel::F_expect_price => (int)$data['Pay'][OrderModel::F_expect_price],
            OrderModel::F_timeout_fees => (int)$data['Pay'][OrderModel::F_timeout_fees],
            OrderModel::F_append_fees => (int)$data['Pay'][OrderModel::F_append_fees],
            OrderModel::F_payment_price => (int)$data['Pay'][OrderModel::F_payment_price],
            OrderModel::F_driver_commission => (int)$data['Pay'][OrderModel::F_driver_commission],
            OrderModel::F_pay_type => $data['Pay'][OrderModel::F_pay_type],
            OrderModel::F_pay_currency => $data['Pay'][OrderModel::F_pay_currency],
            OrderModel::F_pay_status => $data['Pay'][OrderModel::F_pay_status],
            OrderModel::F_payees_id => $data['Pay'][OrderModel::F_payees_id],
            OrderModel::F_car_id => $carId,
        ]);

        if (!empty($trip)) {
            foreach ($trip as $key => $val) {
                if (!isset($val[OrderTripModel::F_reach_time])) {
                    $trip[$key][OrderTripModel::F_reach_time] = null;
                }

                if (!isset($val[OrderTripModel::F_flight_number])) {
                    $trip[$key][OrderTripModel::F_flight_number] = "";
                }
                unset($trip[$key]['_remove_']);
                $trip[$key][OrderTripModel::F_order_id] = $orderId;
            }
            OrderTripModel::getInstance()->newQuery()->where(OrderTripModel::F_order_id, $orderId)->delete();
            OrderTripModel::getInstance()->addBatch($trip);
        }

        if (isset($data['Car']['save_case'])) {
            $caseData = [
                CarCaseModel::F_adult => $adult,
                CarCaseModel::F_children => $children,
                CarCaseModel::F_large => $large,
                CarCaseModel::F_medium => $medium,
                CarCaseModel::F_small => $small,
            ];
            $data = CarCaseModel::getInstance()->newQuery()->where($caseData)->first();

            if (!$data) {
                $caseData[CarCaseModel::F_car_id] = $carId;
                CarCaseModel::getInstance()->addOne($caseData);
            }
        }

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
