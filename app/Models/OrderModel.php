<?php
/**
 * @auther --
 * @date 2023-08-16 09:05:22
 */

namespace App\Models;

use App\Models\Common\BaseModel;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Support\Facades\DB;

class OrderModel extends BaseModel
{
    use SingletonTrait;

    /**
     * 表名
     */
    protected $table = 'ys_order';

    /*
     * 数据库字段
     */
    const F_id = 'id', F_sn = 'sn', F_customer_name = 'customer_name', F_customer_phone = 'customer_phone', F_customer_type = 'customer_type', F_expect_price = 'expect_price', F_timeout_fees = 'timeout_fees', F_append_fees = 'append_fees', F_payment_price = 'payment_price', F_driver_commission = 'driver_commission', F_source = 'source', F_pay_type = 'pay_type', F_pay_sum = 'pay_sum', F_pay_currency = 'pay_currency', F_pay_status = 'pay_status', F_person_sum = 'person_sum', F_children_sum = 'children_sum', F_box_sum = 'box_sum', F_remark = 'remark', F_trip_info = 'trip_info', F_case_info = 'case_info', F_user_id = 'user_id', F_payees_id = 'payees_id', F_car_id = 'car_id', F_status = 'status', F_created_at = 'created_at', F_updated_at = 'updated_at', F_deleted_at = 'deleted_at';

    public function car(): HasOne
    {
        return $this->hasOne(CarModel::class, CarModel::F_id, self::F_car_id);
    }

    public function payees(): HasOne
    {
        return $this->hasOne(PayeesModel::class, PayeesModel::F_id, self::F_payees_id);
    }

    public function user(): HasOne
    {
        return $this->hasOne(AdminUsersModel::class, AdminUsersModel::F_id, self::F_user_id);
    }


    //客户类型：1接机，2送机，3包车
    const customer_type_1 = 1, customer_type_2 = 2, customer_type_3 = 3;
    const CustomerTypeArray = [
        self::customer_type_1 => 'Airport Pickup',
        self::customer_type_2 => 'Airport delivery',
        self::customer_type_3 => 'Chartered bus',
    ];

    //支付类型：1现金，2.微信, 3支付宝
    const pay_type_1 = 1, pay_type_2 = 2, pay_type_3 = 3;
    const PayTypeArray = [
        self::pay_type_1 => 'Cash',
        self::pay_type_2 => 'WeChat pay',
        self::pay_type_3 => 'Alipay',
    ];

    //客户来源：1.线下，2.小红书, 3.其他
    const source_1 = 1, source_2 = 2, source_3 = 3, source_4 = 4, source_5 = 5;
    const SourceArray = [
        self::source_1 => 'The face',
        self::source_2 => 'Axon',
        self::source_3 => 'Embassy',
        self::source_4 => 'Red',
        self::source_5 => 'Visitor',
    ];

    //支付货币种类：1.马币，2.人民币, 3.美元
    const pay_currency_1 = 1, pay_currency_2 = 2, pay_currency_3 = 3;
    const PayCurrencyArray = [
        self::pay_currency_1 => 'Ringgit',
        self::pay_currency_2 => 'RMB',
        self::pay_currency_3 => 'Dollar',
    ];

    //付款状态：1待结算，2已结算，3未结算
    const pay_status_1 = 1, pay_status_2 = 2, pay_status_3 = 3;
    const PayStatusArray = [
        self::pay_status_1 => 'Pending',
        self::pay_status_2 => 'Settled',
        self::pay_status_3 => 'Uncleared',
    ];

    //状态：1待调度, 3已调度, 5已到达，7已送达, 9完成, 11作废
    const status_1 = 1, status_3 = 3, status_5 = 5, status_7 = 7, status_9 = 9, status_11 = 11;
    const StatusArray = [
        self::status_1 => 'Standby',
        self::status_3 => 'Dispatched',
        self::status_5 => 'Arrived',
        self::status_7 => 'Delivered',
        self::status_9 => 'Finish',
        self::status_11 => 'Cancel',
    ];

    public function getTripInfoAttribute($value): array
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setTripInfoAttribute($value)
    {
        $this->attributes[self::F_trip_info] = json_encode(array_values($value));
    }

    public function getCaseInfoAttribute($value): array
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setCaseInfoAttribute($value)
    {
        $this->attributes[self::F_case_info] = json_encode(array_values($value));
    }


    public function getOneById($id)
    {
        return self::query()
            ->where(self::F_id, $id)
            ->first();
    }

    public function getTotalByStatus($status = 0): int
    {
        return self::query()
            ->where(self::F_status, $status)
            ->count();
    }

    public function getTotalByTime($start, $end): int
    {
        return self::query()
            ->whereDate(self::F_created_at, '>=', $start)
            ->whereDate(self::F_created_at, '<=', $end)
            ->count();
    }

    public function getSumWithMonth($start, $end, $payStatus, $status): int
    {
        $query = self::query();
        if ($start) {
            $query->whereDate(self::F_created_at, '>=', $start);
        }
        if ($end) {
            $query->whereDate(self::F_created_at, '<=', $end);
        }
        if ($status) {
            $query->whereIn(self::F_status, $status);
        }
        if ($payStatus) {
            $query->whereIn(self::F_pay_status, $payStatus);
        }
        return $query->sum(self::F_payment_price);
    }


    public function groupByStatus()
    {
        return self::query()
            ->groupBy(self::F_status)
            ->select(DB::raw('COUNT(*) AS count'), self::F_status)
            ->get();
    }
}
