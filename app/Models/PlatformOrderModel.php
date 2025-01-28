<?php
/**
 * @auther --
 * @date 2025-01-27 11:12:50
 */
namespace App\Models;

use App\Models\Common\BaseModel;

class PlatformOrderModel extends BaseModel
{
    use SingletonTrait;

    /**
     * 表名
     */
    protected $table='ys_platform_order';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_platform_type = 'platform_type',F_platform_fee = 'platform_fee',F_payment_amount = 'payment_amount',F_currency = 'currency',F_platform_status = 'platform_status',F_travel_status = 'travel_status',F_customer_order_id = 'customer_order_id',F_created_at = 'created_at',F_updated_at = 'updated_at',F_deleted_at = 'deleted_at';


    //平台类型：1 闲鱼
    const platform_type_1 = 1;
    const PlatformTypeArray = [
        self::platform_type_1 => '闲鱼',
    ];

    //币种：1 人民币
    const currency_1 = 1;
    const CurrencyArray = [
        self::currency_1 => '人民币',
    ];

    //平台订单状态：1未付款，2已付款，3已发货，4已成交，5已退款
    const platform_status_1 = 1, platform_status_2 = 2, platform_status_3 = 3, platform_status_4 = 4, platform_status_5 = 5;
    const PlatformStatusArray = [
        self::platform_status_1 => '未付款',
        self::platform_status_2 => '已付款',
        self::platform_status_3 => '已发货',
        self::platform_status_4 => '已成交',
        self::platform_status_5 => '已退款',
    ];

    //行程状态：1待开始，2进行中，3已完成，4终止
    const travel_status_1 = 1, travel_status_2 = 2, travel_status_3 = 3, travel_status_4 = 4, travel_status_5 = 5;
    const TravelStatusArray = [
        self::travel_status_1 => '待开始',
        self::travel_status_2 => '进行中',
        self::travel_status_3 => '已完成',
        self::travel_status_4 => '终止',
    ];


    public function getData($limit,$notId)
    {
        $query = self::query()->where(self::F_id,'<>',$notId);

        return $query
            ->limit($limit)
            ->orderBy(self::F_id,'desc')
            ->get();
    }

    public function getOneById($id)
    {
        if(empty($id)) return [];
        return self::query()
            ->where(self::F_id, $id)
            ->first();
    }

}
