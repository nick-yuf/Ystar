<?php

namespace App\Admin\Forms\Order;

use App\Common\Library\util;
use App\Models\OrderModel;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Widgets\StepForm;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class Basic extends StepForm
{
    /**
     * The form title.
     *
     * @var string
     */
    public $title = '';


    public function __construct($data = [])
    {
        $this->title = __('Basic');
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
        $this->text(OrderModel::F_customer_name, __('Customer name'));
        $this->text(OrderModel::F_customer_phone, __('Customer phone'));
        $this->select(OrderModel::F_source, __('Source'))->options(util::setLang(OrderModel::SourceArray))->default(OrderModel::source_1);
        $this->select(OrderModel::F_customer_type, __('Customer type'))->options(util::setLang(OrderModel::CustomerTypeArray))->default(OrderModel::customer_type_1);
        $this->textarea(OrderModel::F_remark, __('Notes'))->rows(3);
        $this->radio(OrderModel::F_status, __('Order') . __('Status'))->options(util::setLang(OrderModel::StatusArray))->default(OrderModel::status_1);
        $this->hidden(OrderModel::F_sn)->default('YS' . date('YmdHis'));
        $this->hidden(OrderModel::F_user_id)->default(Admin::user()->id);
    }
}
