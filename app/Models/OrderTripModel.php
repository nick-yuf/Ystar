<?php
/**
 * @auther --
 * @date 2023-08-21 08:57:11
 */
namespace App\Models;

use App\Models\Common\BaseModel;

class OrderTripModel extends BaseModel
{
    /**
     * 表名
     */
    protected $table='ys_order_trip';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_order_id = 'order_id',F_reach_time = 'reach_time',F_flight_number = 'flight_number',F_begin_address = 'begin_address',F_finish_address = 'finish_address',F_car_start_time = 'car_start_time',F_car_end_time = 'car_end_time',F_status = 'status';


}
