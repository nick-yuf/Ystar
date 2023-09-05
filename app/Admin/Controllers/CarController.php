<?php

namespace App\Admin\Controllers;

use App\Models\CarModel;
use App\Models\CarPriceModel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class CarController extends BaseController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '';

    public function __construct()
    {
        $this->title = __('Car type');
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid(): Grid
    {
        $grid = new Grid(new CarModel());

        $grid->column(CarModel::F_id, __('ID'))->expand(function ($model) {
            $model->price_info = collect($model->price_info)->map(function ($item){
                $item['type'] = CarPriceModel::rtnEnumVal(CarPriceModel::TypeArray,$item['type']);
                return $item;
            })->toArray();
            return new Table(
                [__('Type'), __('Service area'), __('Custom price'), __('Commission price'), __('Timeout fees'), __('Extra fees')],
                $model->price_info,
                ['table', 'table-bordered', 'table-condensed', 'table-striped']
            );
        });

        $grid->column(CarModel::F_car_type, __('Car type'))->modal(__('Car type'), function ($model) {
            return new Table(['#' . __('Param') . '#', '#' . __('Value') . '#'], [
                [__('Car type'), $model[CarModel::F_car_type]],
                [__('Description'), $model[CarModel::F_desc]],
                [__('Tips'), $model[CarModel::F_tips]],
            ], ['table', 'table-bordered', 'table-condensed', 'table-striped']);
        });


        $grid->disableExport();

        $grid->actions(function ($actions) {
            $actions->disableView();
        });

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
        $show = new Show(CarModel::findOrFail($id));

        $show->field(CarModel::F_car_type, __('Car type'));
        $show->field(CarModel::F_desc, __('Description'));
        $show->field(CarModel::F_images, __('Image'))->image();
        $show->field(CarModel::F_created_at, __('Created at'));
        $show->field(CarModel::F_updated_at, __('Updated at'));

        return $show;
    }


    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form(): Form
    {
        $form = new Form(new CarModel());

        $form->text(CarModel::F_car_type, __('Car type'))->required();
        $form->textarea(CarModel::F_desc, __('Description'))->rows(3);
        $form->textarea(CarModel::F_tips, __('Tips'));
        $form->image(CarModel::F_images, __('Image'));
        $form->fieldset(__('Price info'), function (Form $form) {
            $form->table(CarModel::F_price_info,  __('List'), function ($table) {
                $table->select(CarPriceModel::F_type, __('Type'))->options($this->setLang(CarPriceModel::TypeArray))->default(CarPriceModel::type_1);
                $table->text(CarPriceModel::F_service_area, __('Service area'));
                $table->text(CarPriceModel::F_custom_price, __('Custom price'))->attribute(['style'=>"width: 90px;"]);
                $table->text(CarPriceModel::F_commission_price, __('Commission price'))->attribute(['style'=>"width: 90px;"]);
                $table->currency(CarPriceModel::F_timeout_fees, __('Timeout fees'))->attribute(['style'=>"width: 65px;"]);
                $table->currency(CarPriceModel::F_extra_fees, __('Extra fees'))->attribute(['style'=>"width: 65px;"]);
            })->setGroupClass(['table1', 'table-bordered', 'table-condensed', 'table-striped']);
        });

        $form->saving(function (Form $form) {
            if (empty($form->model()->getAttribute(CarModel::F_price_info))) {
                $form->model()->setAttribute(CarModel::F_price_info, []);
            }
            return $form;
        });

        $form->saved(function (Form $form) {
            $prices = $form->model()->getAttribute(CarModel::F_price_info);
            $carId = $form->model()->getAttribute(CarModel::F_id);
            if (!empty($prices)) {
                foreach ($prices as $key => $val) {
                    $prices[$key][CarPriceModel::F_car_id] = $carId;
                }
                CarPriceModel::getInstance()->newQuery()->where(CarPriceModel::F_car_id, $carId)->delete();
                CarPriceModel::getInstance()->addBatch($prices);
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

        $form->header(function ($actions) {
            $actions->disableView();
            $actions->disableDelete();
        });

        return $form;
    }
}
