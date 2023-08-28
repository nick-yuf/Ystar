<?php

namespace App\Admin\Actions\Order;

use Encore\Admin\Actions\RowAction;

class Share extends RowAction
{
    public $name = '分享';

    public function href(): string
    {
        $this->name = __('Share');

        return "/admin/order/info?id={$this->getKey()}";
    }

}
