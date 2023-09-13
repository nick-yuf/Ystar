<?php

namespace App\Admin\Forms\Order;

use App\Models\OrderModel;
use Encore\Admin\Widgets\StepForm;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class Car extends StepForm
{
    /**
     * The form title.
     *
     * @var string
     */
    public $title = '';

    public function __construct($data = [])
    {
        $this->title = __('Car type');
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
        $title = $this->title.__('Recommend');
        $this->number(OrderModel::F_person_sum, __('Adult') . __('Sum'))->max(100)->attribute('id','adult')->default(0);
        $this->number(OrderModel::F_children_sum, __('Children') . __('Sum'))->max(100)->attribute('id','children')->default(0);
        $this->number('large', __('Luggage') . '（L）')->max(100)->attribute('id','large')->default(0);
        $this->number('medium', __('Luggage') . '（M）')->max(100)->attribute('id','medium')->default(0);
        $this->number('small', __('Luggage') . '（S）')->max(100)->attribute('id','small')->default(0);
        $this->html("<a class='btn btn-sm btn-primary' href='#' onclick='recommend()'>".$title."</a> &nbsp; <input type='checkbox' name='save_case' value='1' />".trans('admin.save') .__('Case'));
        $this->hidden('message_alert')->default('<div id="alert_div" class="alert alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><h4><i class="icon fa fa-info"></i>'.$title.'</h4><p id="recommend_car"></p>')->attribute('id','message_alert');
        $this->html('
<script>
function recommend () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        url: "/api/car/recommend",
        data: JSON.stringify({
            adult:$("#adult").val(),
            children:$("#children").val(),
            large:$("#large").val(),
            medium:$("#medium").val(),
            small:$("#small").val(),
        }),
        success: function(msg){
            $("#alert_div").remove();
            $(".content").prepend($("#message_alert").val());
            if(msg.statusCode === 200) {
               $("#recommend_car").append(msg.data.carType);
            } else {
                $("#recommend_car").append(msg.message);
                $("#alert_div").removeClass("alert-info").addClass("alert-error");
            }
        }
    });
}
</script>
');
        $this->select(OrderModel::F_car_id, __('Car'))->options('/api/car/select-list')->required();

    }

}
