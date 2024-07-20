<?php

namespace App\Admin\Controllers;

use App\Common\Library\util;
use App\Http\Controllers\Controller;
use App\Models\OrderModel;
use Encore\Admin\Form\Field\Button;
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

        $z = date('Y-m');
        $a = date('Y-m', strtotime('-11 months'));
        $begin = new \DateTime($a);
        $end = new \DateTime($z);
        $end = $end->modify('+1 month');
        $interval = new \DateInterval('P1M');
        $daterange = new \DatePeriod($begin, $interval, $end);
        $y = [];
        foreach ($daterange as $month1) {
            $y[] = $month1->format('Y-m');
        }


        for ($i = 0; $i < 12; $i++) {
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
            $unPay = OrderModel::getInstance()->getSumWithMonth($begin, $end, [OrderModel::pay_status_1, OrderModel::pay_status_3], [], OrderModel::F_expect_price);
            $orderTotalArray[] = $payFinish;

            $tableData[] = [
                $v, $monthTotal, $monthFinisTotal, $monthIngTotal, $monthDelTotal, $payFinish, $unPay
            ];
        }

        //总收入
        $totalPay = OrderModel::getInstance()->getSumWithMonth('', '', [OrderModel::pay_status_2], [OrderModel::status_9]);
        //佣金
        $totalDriver = OrderModel::getInstance()->getSumWithMonth('', '', [OrderModel::pay_status_2], [OrderModel::status_9], OrderModel::F_driver_commission);
        //营收
        $paySum = $totalPay - $totalDriver;


        $chartParams = [
            'y' => $y,
            'labels' => array_values($statusArray),
            'data' => $chartData,
            'orderTotalArray' => array_reverse($orderTotalArray),
        ];

        $box = new Box();
        $box->title('[' . __('Total orders') . '：' . $orderTotal . ']、[' . __('Revenue') . '：' . $totalPay . ']、[' . __('Driver commission') . '：' . $totalDriver . ']、[' . __('Profit') . '：' . $paySum . ']');
        $box->content(view('chart.orderq', $chartParams));
        $box->footer(new Table(
            [__('Month'), __('Total orders'), __('Finished orders'), __('Unfinished orders'), __('Canceled orders'), __('Settled'), __('Uncleared')],
            $tableData
        ));

        $box->collapsable();

        $box->solid();

        $box->scrollable();

        return $content
            ->header('chart')
            ->description(__('Statistics'))
            ->body($box);
    }


    public function chart(Content $content)
    {

    }


}
