<?php
/**
 * @auther --
 * @date 2023-08-16 09:05:22
 */
namespace App\Models;

use App\Models\Common\BaseModel;

class OrderBranchsModel extends BaseModel
{
    /**
     * 表名
     */
    protected $table='ys_order';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_sn = 'sn',F_customer_name = 'customer_name',F_customer_phone = 'customer_phone',F_source = 'source',F_pay_type = 'pay_type',F_pay_sum = 'pay_sum',F_pay_currency = 'pay_currency',F_pay_status = 'pay_status',F_person_sum = 'person_sum',F_children_sum = 'children_sum',F_box_sum = 'box_sum',F_remark = 'remark',F_status = 'status',F_created_at = 'created_at',F_updated_at = 'updated_at',F_deleted_at = 'deleted_at';


}
