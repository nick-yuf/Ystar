<?php
/**
 * @auther --
 * @date 2023-08-24 02:40:43
 */
namespace App\Models;

use App\Models\Common\BaseModel;

class OrderTripModel extends BaseModel
{
    use SingletonTrait;
    /**
     * 表名
     */
    protected $table='ys_order_trip';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_order_id = 'order_id',F_reach_time = 'reach_time',F_flight_number = 'flight_number',F_begin_address = 'begin_address',F_finish_address = 'finish_address',F_use_begin_time = 'use_begin_time',F_use_finish_time = 'use_finish_time',F_status = 'status',F_created_at = 'created_at',F_updated_at = 'updated_at',F_deleted_at = 'deleted_at';


}
