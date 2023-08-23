<?php

namespace App\Admin\Controllers;

use App\Models\CarModel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class CarController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '';

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
        $grid = new Grid(new CarModel());

        $grid->column(CarModel::F_id, __('ID'))->expand(function ($model) {
            return new Table(['#' . __('Param') . '#', '#' . __('Value') . '#'], [
                [__('Car type'), $model[CarModel::F_car_type]],
                [__('Description'), $model[CarModel::F_desc]],
                [__('Transfer fees'), $model[CarModel::F_transfer_fees]],
                [__('Rental fees'), $model[CarModel::F_rental_fees]],
            ], ['table', 'table-bordered', 'table-condensed', 'table-striped']);
        });

        $grid->column(CarModel::F_car_type, __('Car type'));

        $grid->disableExport();

        $grid->actions(function ($actions) {
//            $actions->disableView();
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
        $show->field(CarModel::F_transfer_fees, __('Transfer fees'));
        $show->field(CarModel::F_rental_fees, __('Rental fees'));
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
        $form->text(CarModel::F_desc, __('Description'))->required();
        $form->text(CarModel::F_transfer_fees, __('Transfer fees'))->required();
        $form->text(CarModel::F_rental_fees, __('Rental fees'))->required();
        $form->image(CarModel::F_images, __('Image'));
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
