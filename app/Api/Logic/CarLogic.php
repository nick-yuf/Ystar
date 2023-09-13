<?php

namespace App\Api\Logic;

use App\Exceptions\ApiException;
use App\Logic\BaseLogic;
use App\Models\CarCaseModel;
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

    /**
     * @desc  推荐车型
     * @param $adult
     * @param $children
     * @param $large
     * @param $medium
     * @param $small
     * @return array
     * @throws ApiException
     */
    public function recommend($adult, $children, $large, $medium, $small): array
    {
        $data = CarCaseModel::getInstance()->getOneCase($adult, $children, $large, $medium, $small);
        if (!$data) {
            throw new ApiException('No recommend.');
        }

        return [
            CarCaseModel::F_car_id => $data[CarCaseModel::F_car_id],
            CarModel::F_car_type => $data['car'][CarModel::F_car_type],
        ];
    }

}
