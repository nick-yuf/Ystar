<?php
/**
 * @auther --
 * @date 2023-09-01 09:55:44
 */

namespace App\Models;

use App\Models\Common\BaseToModel;
use Illuminate\Database\Eloquent\Relations\HasOne;

class CarCaseModel extends BaseToModel
{
    use SingletonTrait;

    public $timestamps = false;

    /**
     * 表名
     */
    protected $table = 'ys_car_case';

    /*
     * 数据库字段
     */
    const F_id = 'id', F_car_id = 'car_id', F_large = 'large', F_medium = 'medium', F_small = 'small', F_adult = 'adult', F_children = 'children';


    public function car(): HasOne
    {
        return $this->hasOne(CarModel::class, CarModel::F_id, self::F_car_id);
    }


    public function getTotalByCarId($carId = 0): int
    {
        $query = $this->newQuery();
        if ($carId) {
            $query->where(self::F_car_id, $carId);
        }
        return $query->count();
    }

    public function getOneCase($adult, $children, $large, $medium, $small)
    {
        return self::query()->where([
            CarCaseModel::F_adult => $adult,
            CarCaseModel::F_children => $children,
            CarCaseModel::F_large => $large,
            CarCaseModel::F_medium => $medium,
            CarCaseModel::F_small => $small,
        ])->first();
    }

}
