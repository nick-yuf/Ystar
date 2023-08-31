<?php

namespace App\Api\Logic;

use App\Exceptions\ApiException;
use App\Logic\BaseLogic;
use App\Models\CarModel;
use App\Models\OrderModel;
use App\Models\PayeesModel;

class OrderLogic extends BaseLogic
{

    /**
     * @desc changeStatus
     * @param $id
     * @param $status
     * @return array
     * @throws ApiException
     */
    public function changeStatus($id, $status): array
    {
        $data = OrderModel::getInstance()->getOneById($id);
        if (!$data) {
            throw new ApiException('ID error.');
        }

        OrderModel::getInstance()->updateById($id, [
            OrderModel::F_status => $status
        ]);
        return ['success'];
    }


}
