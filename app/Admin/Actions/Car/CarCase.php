<?php

namespace App\Admin\Actions\Car;

use Encore\Admin\Actions\RowAction;

class CarCase extends RowAction
{
    public $name = '';

    public function href(): string
    {
        $this->name = __('Case');

        return "/admin/car/case-list?carId={$this->getKey()}";
    }

}
