<?php
/**
 * @auther --
 * @date 2025-01-26 12:51:15
 */
namespace App\Models;

use App\Models\Common\BaseModel;

class OrderPlatformModel extends BaseModel
{
    use SingletonTrait;
    /**
     * 表名
     */
    protected $table='ys_order_platform';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_order_id = 'order_id',F_platform_order_id = 'platform_order_id';


}
