<?php

namespace App\Admin\Controllers;

use App\Common\Library\util;
use App\Http\Controllers\Controller;
use App\Models\OrderModel;
use Encore\Admin\Layout\Content;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\Table;

class HomeController extends Controller
{
    public function index(Content $content): Content
    {
        $statusArray = OrderModel::rtnEnumLang(OrderModel::StatusArray);
        $groupData = OrderModel::getInstance()->groupByStatus()->mapWithKeys(function ($item) {
            return [$item['status'] => $item['count']];
        })->toArray();

        $chartData = [];
        $orderTotal = 0;
        foreach ($statusArray as $k => $v) {
            $count = $groupData[$k] ?? 0;
            $orderTotal += $count;
            $chartData [] = [
                'status' => $k,
                'desc' => $v,
                'count' => $count
            ];
        }

        $chartParams = [
            'labels' => array_values($statusArray),
            'data' => $chartData
        ];

        for ($i = 0; $i < 6; $i++) {
            $month[] = date('Y-m', strtotime('-' . $i . 'month'));//包含本月
        }

        $tableData = [];
        //查询最近半年数据
        foreach ($month as $v) {
            $times = util::getMonthBeginAndEnd(strtotime($v));
            $begin = date('Y-m-d', $times['begin']);
            $end = date('Y-m-d', $times['end']);

            //单月总单数
            $monthTotal = OrderModel::getInstance()->getTotalByTime($begin, $end, []);

            //单月完成单数
            $monthFinisTotal = OrderModel::getInstance()->getTotalByTime($begin, $end, [OrderModel::status_9]);
            //进行中单数
            $monthIngTotal = OrderModel::getInstance()->getTotalByTime($begin, $end, [OrderModel::status_1, OrderModel::status_3, OrderModel::status_5, OrderModel::status_7]);
            //作废单数
            $monthDelTotal = OrderModel::getInstance()->getTotalByTime($begin, $end, [OrderModel::status_11]);
            //单月已结算
            $payFinish = OrderModel::getInstance()->getSumWithMonth($begin, $end, [OrderModel::pay_status_2], []);
            //单月未结算
            $unPay = OrderModel::getInstance()->getSumWithMonth($begin, $end, [OrderModel::pay_status_1, OrderModel::pay_status_3], []);

            $tableData[] = [
                $v, $monthTotal, $monthFinisTotal, $monthIngTotal, $monthDelTotal, $payFinish, $unPay
            ];
        }

        //总收入
        $totalPay = OrderModel::getInstance()->getSumWithMonth('', '', [OrderModel::pay_status_2], [OrderModel::status_9]);

        return $content
            ->header('chart')
            ->description('统计')
            ->body(new Box('订单总数：' . $orderTotal . ';总收入：' . $totalPay, view('chart.order', $chartParams),
                new Table(
                    ['月份', '总单数', '完成单数', '进行中单数', '作废单数', '单月已结算', '单月未结算'],
                    $tableData
                )
            ));
    }


    public function chart(Content $content)
    {

    }


}
