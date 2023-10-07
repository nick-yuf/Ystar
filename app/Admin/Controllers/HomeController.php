<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\Table;

class HomeController extends Controller
{
    public function index(Content $content)
    {
//        return $content
//            ->header('Dashboard')
//            ->description('Description...')
//            ->body(function (Row $row) {
////                $row->column(6, function (Column $column) {
////                    $column->row(Dashboard::title());
//////                    $column->row(new Examples\Tickets());
////                });
//
//                $row->column(6, function (Column $column) {
//                    $column->row(function (Row $row) {
//                        $row->column(6, new Examples\NewUsers());
//                        $row->column(6, new Examples\NewDevices());
//                    });
//
//                    $column->row(new Examples\Sessions());
//                    $column->row(new Examples\ProductOrders());
//                });
//            });

        return $content
            ->header('chart')
            ->description('介绍')
            ->body(new Box('Bar chart', view('chart.order'), new Table(['111','内容22222'],[[111,222],[111,222],[111,222]])));

//
//        $rowsji[] = [
//            'name' => 1111,
//            'baoguang' => 12,
//            'dianji' => 11,
//            'jihuo' => 111,
//            'zhuce' => 111,
//            'liucun'=> 11,
//            'qidong' =>111,
//            'zliucun' => 11
//        ];
//        $rowszuo [] = [
//            'name' => 1111,
//            'baoguang' => 12,
//            'dianji' => 11,
//            'jihuo' => 111,
//            'zhuce' => 111,
//            'liucun'=> 11,
//            'qidong' =>111,
//            'zliucun' => 11
//        ];
//
//        return $content
//            ->title('Dashboard')
//            ->description('介绍')
//            ->view('chart.order',['title' => $rowsji[0]['name'].' 数据统计','label'=>"今日/昨日",'','rowsji'=>$rowsji,'rowszuo'=>$rowszuo]);
    }


    public function chart(Content $content)
    {
        return $content
            ->header('Chartjs')
            ->body(new Box('Bar chart', view('admin.chartjs')));
    }


}
