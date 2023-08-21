<?php
/**
 * @auther --
 * @date 2023-08-21 09:05:16
 */
namespace App\Models;

use App\Models\Common\BaseModel;

class PayeesModel extends BaseModel
{
    /**
     * 表名
     */
    protected $table='ys_payees';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_name = 'name',F_phone = 'phone',F_created_at = 'created_at',F_updated_at = 'updated_at',F_deleted_at = 'deleted_at';


}
