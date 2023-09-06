<?php

namespace App\Admin\Actions\Car;

use Encore\Admin\Actions\RowAction;

class CarCaseEdit extends RowAction
{
    public $name = '';

    public $id = '';

    public function __construct($id)
    {
        $this->id = $id;
    }

    public function href(): string
    {
        $this->name = trans('admin.edit');

        return "/admin/car/case-list/1/edit?carId=" . $this->id;
    }

}
