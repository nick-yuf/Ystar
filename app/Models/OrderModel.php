<?php
/**
 * @auther --
 * @date 2023-08-16 09:05:22
 */
namespace App\Models;

use App\Models\Common\BaseModel;

class OrderModel extends BaseModel
{
    /**
     * 表名
     */
    protected $table='ys_order';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_sn = 'sn',F_customer_name = 'customer_name',F_customer_phone = 'customer_phone',F_source = 'source',F_pay_type = 'pay_type',F_pay_sum = 'pay_sum',F_pay_currency = 'pay_currency',F_pay_status = 'pay_status',F_person_sum = 'person_sum',F_children_sum = 'children_sum',F_box_sum = 'box_sum',F_remark = 'remark',F_travel_info = 'travel_info',F_status = 'status',F_created_at = 'created_at',F_updated_at = 'updated_at',F_deleted_at = 'deleted_at';

//    protected $casts = [
//        self::F_travel_info => 'json',
//    ];


    //支付类型：1现金，2.微信, 3支付宝
    const pay_type_1 = 1, pay_type_2 = 2, pay_type_3 = 3;
    const PayTypeArray = [
        self::pay_type_1 => '现金',
        self::pay_type_2 => '微信',
        self::pay_type_3 => '支付宝',
    ];

    //客户来源：1.线下，2.小红书, 3.其他
    const source_1 = 1, source_2 = 2, source_3 = 3;
    const SourceArray = [
        self::pay_type_1 => '线下',
        self::pay_type_2 => '小红书',
        self::pay_type_3 => '其他',
    ];

    //支付货币种类：1.马币，2.人民币, 3.美元
    const pay_currency_1 = 1, pay_currency_2 = 2, pay_currency_3 = 3;
    const PayCurrencyArray = [
        self::pay_currency_1 => '马币',
        self::pay_currency_2 => '人民币',
        self::pay_currency_3 => '美元',
    ];

    //付款状态：1待结算，2已结算，3未结算
    const pay_status_1 = 1, pay_status_2 = 2, pay_status_3 = 3;
    const PayStatusArray = [
        self::pay_status_1 => '待结算',
        self::pay_status_2 => '已结算',
        self::pay_status_3 => '未结算',
    ];

    //状态：1待派单，2进行中，3完成，4作废
    const status_1 = 1, status_2 = 2, status_3 = 3, status_4 = 4;
    const StatusArray = [
        self::status_1 => '待派单',
        self::status_2 => '进行中',
        self::status_3 => '完成',
        self::status_4 => '作废',
    ];



    public function getTravelInfoAttribute($value): array
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setTravelInfoAttribute($value)
    {
        $this->attributes[self::F_travel_info] = json_encode(array_values($value));
    }

}
