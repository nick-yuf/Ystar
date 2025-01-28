<?php

namespace App\Api\Logic;

use App\Exceptions\ApiException;
use App\Logic\BaseLogic;
use App\Models\CarModel;
use App\Models\OrderModel;
use App\Models\PayeesModel;
use App\Models\PlatformOrderModel;

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


    /**
     * @desc changeStatus
     * @param $limit
     * @param $id
     * @return array
     */
    public function platformOrder($limit,$id): array
    {
        $data = PlatformOrderModel::getInstance()->getData($limit,$id);
        if (!$data) {
            return [];
        }
        $one = PlatformOrderModel::getInstance()->getOneById($id);
        if($one) {
            $platformName = PlatformOrderModel::rtnEnumVal(PlatformOrderModel::PlatformTypeArray,$one[PlatformOrderModel::F_platform_type]);
            $one = [
                [
                'id' => $one[PlatformOrderModel::F_id],
                'text' => '「'.$platformName.'」'. $one[PlatformOrderModel::F_customer_order_id],
                ]
            ];
        } else {
            $one = [];
        }

        $array = $data->map(function ($item) {
            $platformName = PlatformOrderModel::rtnEnumVal(PlatformOrderModel::PlatformTypeArray,$item[PlatformOrderModel::F_platform_type]);
            return [
                'id' => $item[PlatformOrderModel::F_id],
                'text' => '「'.$platformName.'」'. $item[PlatformOrderModel::F_customer_order_id],
            ];
        })->toArray();

        return array_merge($array,$one);
    }

}
