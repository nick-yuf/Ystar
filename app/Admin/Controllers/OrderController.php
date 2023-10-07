<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Order\Share;
use App\Admin\Extensions\OrderExporter;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Encore\Admin\Widgets\MultipleSteps;
use App\Admin\Forms\Order;
use App\Models\CarModel;
use App\Models\OrderModel;
use App\Models\OrderTripModel;
use App\Models\PayeesModel;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Widgets\Table;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\MessageBag;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;

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
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid(): Grid
    {
        $grid = new Grid(new OrderModel());
        $grid->model()->orderByDesc(OrderModel::F_id);
        $grid->paginate(10);

        $grid->column(OrderModel::F_id, __('ID'));
        $grid->column(OrderModel::F_status, __('Order') . __('Status'))
            ->editable('select', OrderModel::rtnEnumLang(OrderModel::StatusArray))->dot([
                OrderModel::status_1 => 'warning',
                OrderModel::status_3 => 'primary',
                OrderModel::status_5 => 'primary',
                OrderModel::status_7 => 'primary',
                OrderModel::status_9 => 'success',
                OrderModel::status_11 => 'danger',
            ]);
        $grid->column(OrderModel::F_pay_status, __('Pay') . __('Status'))
            ->editable('select', OrderModel::rtnEnumLang(OrderModel::PayStatusArray))->dot([
                OrderModel::pay_status_1 => 'warning',
                OrderModel::pay_status_2 => 'primary',
                OrderModel::pay_status_3 => 'danger',
            ]);

        $grid->column('222', __('Customer info'))->modal(__('Customer info'), function ($model) {
            return new Table(['#' . __('Param') . '#', '#' . __('Value') . '#'], [
                [__('Customer name'), $model[OrderModel::F_customer_name]],
                [__('Customer phone'), $model[OrderModel::F_customer_phone]],
                [__('Person') . __('Sum'), $model[OrderModel::F_person_sum]],
                [__('Children') . __('Sum'), $model[OrderModel::F_children_sum]],
                [__('Luggage') . __('Sum'), $model[OrderModel::F_box_sum]],
                [__('Expect price'), $model[OrderModel::F_expect_price]],
                [__('Car'), $model['car'] ? $model['car'][CarModel::F_car_type] : "-"],
                [__('Payees'), $model['payees'] ? $model['payees'][PayeesModel::F_name] : "-"],
            ], ['table', 'table-bordered', 'table-condensed', 'table-striped']);
        });
        $grid->column('111', __('Trip info'))->expand(function ($model) {
            return new Table(
                [__('Use begin time'), __('Flight number'), __('Reach time'), __('Begin address'), __('Finish address')],
                $model->trip_info,
                ['table', 'table-bordered', 'table-condensed', 'table-striped']
            );
        });

        $grid->column('333333', __('Share'))->display(function () {
            $url = env('APP_URL');
            return "<a href='{$url}/admin/order/info?id={$this->id}' target='_blank'><span class='fa fa-link'></span></a>";
        });

        $grid->column('user.name', __('User'));

        $grid->column(OrderModel::F_created_at, __('Created at'))->display(function ($val) {
            return date('Y-m-d', strtotime($val));
        });

        $grid->tools(function (Grid\Tools $tools) {
            $url = $this->getRouteByName('order#tab-form', '');
            $tools->append('<a class="btn btn-sm btn-success" href="' . $url . '" ><i class="fa fa-plus"></i><span class="hidden-xs">  智能' . trans('admin.new') . '</span></a>');
        });

        //行操作
        $grid->actions(function ($actions) {
            $actions->disableView();
            $actions->disableDelete();
            $actions->add(new Share());
        });

        //数据导出
        $grid->exporter(new OrderExporter());

        //快捷搜索
        $grid->selector(function (Grid\Tools\Selector $selector) {
            $cars = CarModel::getInstance()->getAll()->mapWithKeys(function ($item) {
                return [
                    $item[CarModel::F_id] => $item[CarModel::F_car_type]
                ];
            })->toArray();
            $selector->select(OrderModel::F_status, __('Status'), OrderModel::rtnEnumLang(OrderModel::StatusArray));
            $selector->select(OrderModel::F_customer_type, __('Customer type'), OrderModel::rtnEnumLang(OrderModel::CustomerTypeArray));
            $selector->select(OrderModel::F_car_id, __('Car'), OrderModel::rtnEnumLang($cars));
        });

        //底部统计
        $grid->footer(function () {
            $data = [];
            foreach (OrderModel::StatusArray as $k => $v) {
                $count = OrderModel::getInstance()->getTotalByStatus($k);
                $data[__($v)] = $count;
            }
            return view('admin.order-header', compact('data'));
        });

        return $grid;
    }

    protected function tabForm(Content $content): Content
    {
        $forms = [
            'Basic' => Order\Basic::class,
            'Trip' => Order\Trip::class,
            'Car' => Order\Car::class,
            'Pay' => Order\Pay::class,
        ];

        $s = request('step');
        $title = [];
        foreach ($forms as $k => $v) {
            if (empty($s) && $k == 'Basic') {
                $title[] = '<b style="font-size: 18px">' . __($k) . '</b>';
            } else {
                $title[] = $s == $k && !empty($s) ? '<b style="font-size: 18px">' . __($k) . '</b>' : '<span style="font-size: 18px">' . __($k) . '</span>';
            }
        }

        return $content
            ->title(implode('&nbsp;<span style="font-size: 18px">></span>&nbsp;', $title))
            ->body(MultipleSteps::make($forms));
    }

    /**
     * Make a form builder.
     *
     */
    protected function form(): Form
    {
        $form = new Form(new OrderModel());

        $form->text(OrderModel::F_customer_name, __('Customer name'))->default('');
        $form->text(OrderModel::F_customer_phone, __('Customer phone'))->default('');
        $form->select(OrderModel::F_source, __('Source'))->options($this->setLang(OrderModel::SourceArray))->default(OrderModel::source_1);
        $form->number(OrderModel::F_person_sum, __('Person') . __('Sum'))->max(100)->default(0);
        $form->number(OrderModel::F_children_sum, __('Children') . __('Sum'))->max(100)->default(0);
        $form->number(OrderModel::F_box_sum, __('Luggage') . __('Sum'))->max(100)->default(0);
        $form->select(OrderModel::F_customer_type, __('Customer type'))->options($this->setLang(OrderModel::CustomerTypeArray))->default(OrderModel::customer_type_1);
        $form->select(OrderModel::F_pay_type, __('Pay type'))->options($this->setLang(OrderModel::PayTypeArray))->default(OrderModel::pay_type_1);
        $form->select(OrderModel::F_pay_currency, __('Pay currency'))->options($this->setLang(OrderModel::PayCurrencyArray))->default(OrderModel::pay_currency_1);
        $form->select(OrderModel::F_pay_status, __('Pay status'))->options($this->setLang(OrderModel::PayStatusArray))->default(OrderModel::pay_status_1);
        $form->radio(OrderModel::F_status, __('Order') . __('Status'))->options($this->setLang(OrderModel::StatusArray))->default(OrderModel::status_1);
        $form->currency(OrderModel::F_expect_price, __('Expect price'))->width('100px');
        $form->currency(OrderModel::F_timeout_fees, __('Timeout fees'));
        $form->currency(OrderModel::F_append_fees, __('Append fees'));
        $form->currency(OrderModel::F_payment_price, __('Payment price'));
        $form->currency(OrderModel::F_driver_commission, __('Driver commission'));
        $form->select(OrderModel::F_payees_id, __('Payees'))->options('/api/payees/select-list')->required();
        $form->select(OrderModel::F_car_id, __('Car'))->options('/api/car/select-list')->required();

        $form->textarea(OrderModel::F_remark, __('Notes'))->rows(3);
        $form->table(OrderModel::F_trip_info, __('Trip info'), function ($table) {
            $table->datetime(OrderTripModel::F_use_begin_time, __('Use begin time'));
//            $table->datetime(OrderTripModel::F_use_finish_time, __('Use finish time'));
            $table->text(OrderTripModel::F_flight_number, __('Flight number'));
            $table->datetime(OrderTripModel::F_reach_time, __('Reach time'));
            $table->text(OrderTripModel::F_begin_address, __('Begin address'));
            $table->text(OrderTripModel::F_finish_address, __('Finish address'));
        })->setGroupClass(['table1', 'table-bordered', 'table-condensed', 'table-striped']);

        $form->hidden(OrderModel::F_sn)->default('YS' . date('YmdHis'));
        $form->hidden(OrderModel::F_user_id)->default(Admin::user()->id);

        $form->saving(function (Form $form) {
            if ($form->model()->getAttribute(OrderModel::F_status) == OrderModel::status_9 && Auth::guard('admin')->id() != 4) {
                $json = [
                    'title' => __('Warning'),
                    'message' => __('Only edit not finish order'),
                    'status' => false
                ];
                if ($form->input('_editable')) {
                    return response()->json($json);
                }
                $error = new MessageBag($json);
                return back()->with(compact('error'));
            }
            if (empty($form->model()->getAttribute(OrderModel::F_trip_info))) {
                $form->model()->setAttribute(OrderModel::F_trip_info, []);
            }
            if (empty($form->model()->getAttribute(OrderModel::F_case_info))) {
                $form->model()->setAttribute(OrderModel::F_case_info, []);
            }
            return $form;
        });

        $form->saved(function (Form $form) {
            $trip = $form->model()->getAttribute(OrderModel::F_trip_info);
            $orderId = $form->model()->getAttribute(OrderModel::F_id);
            if (!empty($trip)) {
                foreach ($trip as $key => $val) {
                    $trip[$key][OrderTripModel::F_order_id] = $orderId;

                    if (!isset($trip[$key][OrderTripModel::F_reach_time])) {
                        $trip[$key][OrderTripModel::F_reach_time] = null;
                    }

                    if (!isset($trip[$key][OrderTripModel::F_flight_number])) {
                        $trip[$key][OrderTripModel::F_flight_number] = "";
                    }
                }
                OrderTripModel::getInstance()->newQuery()->where(OrderTripModel::F_order_id, $orderId)->delete();
                OrderTripModel::getInstance()->addBatch($trip);
            }
        });


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


    /**
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    public function info()
    {
        $id = request()->get('id');

        $data = OrderModel::getInstance()->getOneById($id);

        return view('order', [
            'data' => $data
        ]);
    }
}
