<?php
/**
 * @auther --
 * @date 2023-09-05 05:41:59
 */
namespace App\Models;

use App\Models\Common\BaseToModel;

class CarPriceModel extends BaseToModel
{

    use SingletonTrait;

    public $timestamps = false;

    /**
     * 表名
     */
    protected $table='ys_car_price';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_car_id = 'car_id',F_type = 'type',F_custom_price = 'custom_price',F_commission_price = 'commission_price',F_extra_fees = 'extra_fees',F_timeout_fees = 'timeout_fees',F_service_area = 'service_area';
    //类型：1接送机，2包车，3单程接送
    const type_1 = 1, type_2 = 2, type_3 = 3;
    const TypeArray = [
        self::type_1 => 'Airport',
        self::type_2 => 'Charter',
        self::type_3 => 'One way',
    ];
}
