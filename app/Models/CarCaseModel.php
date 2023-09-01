<?php
/**
 * @auther --
 * @date 2023-09-01 09:55:44
 */
namespace App\Models;

use App\Models\Common\BaseToModel;

class CarCaseModel extends BaseToModel
{

    public $timestamps = false;

    /**
     * 表名
     */
    protected $table='ys_car_case';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_car_id = 'car_id',F_large = 'large',F_medium = 'medium',F_small = 'small',F_adult = 'adult',F_children = 'children';


}
