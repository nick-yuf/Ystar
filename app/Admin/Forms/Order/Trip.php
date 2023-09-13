<?php

namespace App\Admin\Forms\Order;

use App\Models\OrderModel;
use App\Models\OrderTripModel;
use Encore\Admin\Widgets\StepForm;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class Trip extends StepForm
{
    /**
     * The form title.
     *
     * @var string
     */
    public $title = '';

    public function __construct($data = [])
    {
        $this->title = __('Trip');
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
        return $this->next($request->all());
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->table(OrderModel::F_trip_info, __('Trip info'), function ($table) {
            $table->datetime(OrderTripModel::F_use_begin_time, __('Use begin time'));
//            $table->datetime(OrderTripModel::F_use_finish_time, __('Use finish time'));
            $table->text(OrderTripModel::F_flight_number, __('Flight number'));
            $table->datetime(OrderTripModel::F_reach_time, __('Reach time'));
            $table->text(OrderTripModel::F_begin_address, __('Begin address'));
            $table->text(OrderTripModel::F_finish_address, __('Finish address'));
        })->setGroupClass(['table1', 'table-bordered', 'table-condensed', 'table-striped']);
    }

}
