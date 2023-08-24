<?php

namespace App\Api\Logic;

use App\Logic\BaseLogic;
use App\Models\CarModel;

class CarLogic extends BaseLogic
{

    /**
     * @desc list
     * @return array
     */
    public function list(): array
    {
        $data = CarModel::query()->get();

        if (!$data) {
            return [];
        }


        return $data->map(function ($item) {
            return [
                'id' => $item[CarModel::F_id],
                'text' => $item[CarModel::F_car_type],
            ];
        })->toArray();
    }


}
