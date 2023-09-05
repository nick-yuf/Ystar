<?php

namespace App\Admin\Controllers;

use App\Models\LuggageModel;
use Encore\Admin\Form;
use Encore\Admin\Grid;

class LuggageController extends BaseController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '';

    public function __construct()
    {
        $this->title = __('Luggage');
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid(): Grid
    {
        $grid = new Grid(new LuggageModel());

        $grid->column(LuggageModel::F_desc, __('Description'));
        $grid->column(LuggageModel::F_size, __('Size'));
        $grid->column(LuggageModel::F_ratio, __('Ratio'));
        $grid->column(LuggageModel::F_type, __('Type'))
            ->editable('select', LuggageModel::rtnEnumLang(LuggageModel::TypeArray))->dot([
                LuggageModel::type_large => 'danger',
                LuggageModel::type_medium => 'warning',
                LuggageModel::type_small => 'success',
            ]);
        $grid->disableExport();

        $grid->actions(function ($actions) {
            $actions->disableView();
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
        $form = new Form(new LuggageModel());

        $form->text(LuggageModel::F_desc, __('Description'))->required();
        $form->text(LuggageModel::F_size, __('Size'))->required();
        $form->text(LuggageModel::F_ratio, __('Ratio'))->required();
        $form->radio(LuggageModel::F_type, __('Type'))->options($this->setLang(LuggageModel::TypeArray))->default(LuggageModel::type_large);

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
