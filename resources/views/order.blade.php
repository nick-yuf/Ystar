<!DOCTYPE HTML>
<html>
<head>
    <title>Elements Reference - Massively by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="{{ asset('assets/css/main.css') }}" />
    <noscript><link rel="stylesheet" href="{{ asset('assets/css/noscript.css') }}" /></noscript>
</head>
<body class="is-preload">

@if(empty($data))
    <header id="header">
        <a href="#" class="logo">Sorry, ID wrong!</a>
    </header>
    {{exit}}
@endif

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <a href="#" class="logo">Yottis Star</a>
    </header>

    <!-- Nav -->
    <nav id="nav">
        <ul class="links">
            <li class="active"><a href="#">order info</a></li>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">

        <!-- Post -->
        <section class="post">

            <div class="row">
                <div class="col-6 col-12-small">

                    <h3>客户信息</h3>
                    <ul>
                        <li><b>{{__('Customer name')}}</b>：{{ $data[\App\Models\OrderModel::F_customer_name] }}</li>
                        <li><b>{{__('Person') . __('Sum')}}</b>：{{ $data[\App\Models\OrderModel::F_person_sum] }}</li>
                        <li><b>{{__('Children') . __('Sum')}}</b>：{{ $data[\App\Models\OrderModel::F_children_sum] }}</li>
                        <li><b>{{__('Luggage') . __('Sum')}}</b>：{{ $data[\App\Models\OrderModel::F_box_sum] }}</li>
                        <li><b>{{__('Expect price')}}</b>：{{ $data[\App\Models\OrderModel::F_expect_price] }}</li>
                        <li><b>{{__('Car')}}</b>：{{ $data['car'][\App\Models\CarModel::F_car_type] }}</li>
                        <li><b>{{__('Payees')}}</b>：{{ $data['payees'][\App\Models\PayeesModel::F_name] }}</li>
                        <li><b>{{__('Created at')}}</b>：{{ $data[\App\Models\OrderModel::F_created_at] }}</li>
                    </ul>
                </div>
            </div>


            <h3>行程详情</h3>
            <div class="table-wrapper">
                <table>
                    <thead>
                    <tr>
                        <th>{{__('Use begin time')}}</th>
                        <th>{{__('Flight number')}}</th>
                        <th>{{__('Reach time')}}</th>
                        <th>{{__('Begin address')}}</th>
                        <th>{{__('Finish address')}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($data[\App\Models\OrderModel::F_trip_info] as $key => $value)
                    <tr>
                        <td>{{$value[\App\Models\OrderTripModel::F_use_begin_time]??'-'}}</td>
                        <td>{{$value[\App\Models\OrderTripModel::F_flight_number]??'-'}}</td>
                        <td>{{$value[\App\Models\OrderTripModel::F_reach_time]??'-'}}</td>
                        <td>{{$value[\App\Models\OrderTripModel::F_begin_address]??'-'}}</td>
                        <td>{{$value[\App\Models\OrderTripModel::F_finish_address]??'-'}}</td>
                    </tr>
                    </tbody>
                    @endforeach
                </table>
            </div>

            <form method="post" action="#">
                    <div class="col-12">
                        <ul class="actions">
                            <li><input type="submit" value="更新状态" class="primary" /></li>
                            <li><input type="reset" value="Reset" /></li>
                        </ul>
                    </div>
            </form>




<!-- Scripts -->
<script src="{{ asset('assets/css/jquery.min.js') }}"></script>
<script src="{{ asset('assets/css/jquery.scrollex.min.js') }}"></script>
<script src="{{ asset('assets/css/jquery.scrolly.min.js') }}"></script>
<script src="{{ asset('assets/css/browser.min.js') }}"></script>
<script src="{{ asset('assets/css/breakpoints.min.js') }}"></script>
<script src="{{ asset('assets/css/util.js') }}"></script>
<script src="{{ asset('assets/css/main.js') }}"></script>

</body>
</html>
