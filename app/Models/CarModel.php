<?php
/**
 * @auther --
 * @date 2023-08-21 09:05:25
 */
namespace App\Models;

use App\Models\Common\BaseModel;

class CarModel extends BaseModel
{
    /**
     * 表名
     */
    protected $table='ys_car';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_car_type = 'car_type',F_desc = 'desc',F_transfer_fees = 'transfer_fees',F_rental_fees = 'rental_fees',F_images = 'images',F_created_at = 'created_at',F_updated_at = 'updated_at',F_deleted_at = 'deleted_at';


}
