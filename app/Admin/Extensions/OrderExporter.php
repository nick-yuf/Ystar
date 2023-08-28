<?php

namespace App\Admin\Extensions;

use App\Models\CarModel;
use App\Models\OrderModel;
use App\Models\PayeesModel;
use Encore\Admin\Grid\Exporters\ExcelExporter;
use Maatwebsite\Excel\Concerns\WithMapping;

/**
 * @desc ip 导出
 * Class IpsExporter
 * @package App\Admin\Extensions
 */
class OrderExporter extends ExcelExporter implements WithMapping
{
    protected $fileName = 'order.xlsx';

    protected $columns = [
        'id' => 'id',
        'customer_name' => '客户姓名',
        'customer_phone' => '客户联系方式',
        'customer_type' => '客户类型',
        'person_sum' => '乘客人数',
        'children_sum' => '儿童人数',
        'box_sum' => '行李总数',
        'expect_price' => '预计价格',
        'payment_price' => '实际付款金额',
        'payees_id' => '收款人',
        'car_id' => '车型',
//        'trip_info' => '行程内容',
        'status' => '状态',
    ];

    public function map($data): array
    {
        return [
            $data->id,
            $data->customer_name,
            $data->customer_phone,
            OrderModel::rtnEnumVal(OrderModel::CustomerTypeArray, $data->customer_type),
            $data->person_sum,
            $data->children_sum,
            $data->box_sum,
            $data->expect_price,
            $data->payment_price,
            $data['payees'][PayeesModel::F_name],
            $data['car'][CarModel::F_car_type],
//            $data->trip_info,
            OrderModel::rtnEnumVal(OrderModel::StatusArray, $data->status),
        ];
    }
}



