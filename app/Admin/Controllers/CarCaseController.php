<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Car\CarCaseEdit;
use App\Models\CarCaseModel;
use App\Models\CarModel;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Illuminate\Support\MessageBag;

class CarCaseController extends BaseController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '';

    public function __construct()
    {
        $this->title = __('Car') . __('Case');
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid(): Grid
    {
        $grid = new Grid(new CarCaseModel());
        $carId = request('carId', 0);
        $grid->model()->where(CarCaseModel::F_car_id, $carId);

        $grid->column(CarCaseModel::F_large, __('Luggage') . '（L）');
        $grid->column(CarCaseModel::F_medium, __('Luggage') . '（M）');
        $grid->column(CarCaseModel::F_small, __('Luggage') . '（S）');
        $grid->column(CarCaseModel::F_adult, __('Adult'));
        $grid->column(CarCaseModel::F_children, __('Children'));

        $grid->actions(function ($actions) use ($carId) {
            $actions->add(new CarCaseEdit($carId));
            $actions->disableView();
            $actions->disableEdit();
            $actions->disableDelete();
        });

        $grid->disableExport();
        $grid->disableCreateButton();
        $grid->tools(function (Grid\Tools $tools) use ($carId) {
            $url = $this->getRouteByName('car#list');
            $createUrl = $this->getRouteByName('car#case-list', 'create', ['carId' => $carId]);
            $tools->append('<a class="btn btn-sm btn-success" href="' . $createUrl . '" ><i class="fa fa-plus"></i><span class="hidden-xs">  ' . trans('admin.new') . '</span></a>');
            $tools->append('<a class="btn btn-sm btn-default" href="' . $url . '">' . trans('admin.back_to_list') . '</a>');
        });


        $grid->header(function ($query) use ($carId) {
            $car = CarModel::getInstance()->getOneById($carId);
            return "<b style='padding: 20px;color:green '>" . $car[CarModel::F_car_type] . __('Case') . __('Library') . "</b>";
        });
        return $grid;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form(): Form
    {
        $form = new Form(new CarCaseModel());
        $carId = request('carId', 0);

        $form->select(CarCaseModel::F_car_id, __('Car'))->options('/api/car/select-list')->value($carId);
        $form->number(CarCaseModel::F_large, __('Luggage') . '（L）')->default(0);
        $form->number(CarCaseModel::F_medium, __('Luggage') . '（M）')->default(0);
        $form->number(CarCaseModel::F_small, __('Luggage') . '（S）')->default(0);
        $form->number(CarCaseModel::F_adult, __('Adult'))->default(0);
        $form->number(CarCaseModel::F_children, __('Children'))->default(0);

        $form->saving(function (Form $form) {
            $case = CarCaseModel::getInstance()->getOneCase(
                $form->adult,
                $form->children,
                $form->large,
                $form->medium,
                $form->small
            );

            if ($case) {
                $json = [
                    'title' => __('Warning'),
                    'message' => __('Case already exist'),
                    'status' => false
                ];
                $error = new MessageBag($json);
                return back()->with(compact('error'));
            }

            return $form;
        });

        $form->footer(function (Form\Footer $footer) {
            // 去掉`查看`checkbox
            $footer->disableViewCheck();
            // 去掉`继续编辑`checkbox
            $footer->disableEditingCheck();
            // 去掉`继续创建`checkbox
            $footer->disableCreatingCheck();
        });

        $url = $this->getRouteByName('car#case-list', 'index', ['carId' => $carId]);
        $form->header(function (Form\Tools $actions) use ($url) {
            $actions->disableList();
            $actions->append('<a class="btn btn-sm btn-default" href="' . $url . '">' . trans('admin.back_to_list') . '</a>');
            $actions->disableView();
            $actions->disableDelete();
        });

        return $form;
    }
}
