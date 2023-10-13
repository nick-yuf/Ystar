<!DOCTYPE html>
<html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>Home</title>
    <link rel="stylesheet" href="{{ asset('assets/css/nicepage.css') }}" media="screen">
    <link rel="stylesheet" href="{{ asset('assets/css/Home.css') }}" media="screen">
    <meta name="generator" content="Nicepage 5.16.3, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">


    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
    <meta data-intl-tel-input-cdn-path="intlTelInput/"></head>
<body data-home-page="Home.html" data-home-page-title="Home" class="u-body u-xl-mode" data-lang="en"><header class="u-clearfix u-header u-header" id="sec-aa71"><div class="u-clearfix u-sheet u-valign-middle-lg u-valign-middle-md u-valign-middle-sm u-valign-middle-xl u-sheet-1">
        <a href="#" class="u-image u-logo u-image-1">
            <img src="{{ asset('assets/images/default-logo.png') }}" class="u-logo-image u-logo-image-1">
        </a>
    </div></header>
<section class="u-clearfix u-container-align-center-lg u-container-align-center-md u-container-align-center-sm u-container-align-center-xl u-section-1" id="carousel_5c31">
    <div class="u-clearfix u-sheet u-sheet-1">
        <div class="data-layout-selected u-clearfix u-expanded-width u-layout-wrap u-layout-wrap-1">
            <div class="u-layout" style="">
                <div class="u-layout-row" style="">
                    <div class="u-align-left-xs u-container-style u-layout-cell u-size-60 u-layout-cell-1">
                        <div class="u-container-layout u-valign-bottom-lg u-valign-bottom-md u-valign-bottom-sm u-valign-bottom-xl u-container-layout-1">
                            <h6 class="u-text u-text-default u-text-palette-1-base u-text-2"> &nbsp;{{ \App\Models\OrderModel::rtnEnumVal(\App\Models\OrderModel::StatusArray,$data[\App\Models\OrderModel::F_status]) }}</h6>
                            <p class="u-align-left-xs u-text u-text-default u-text-3">
                                <span style="font-weight: 700;"> &nbsp; &nbsp;{{ \App\Models\OrderModel::rtnEnumVal(\App\Models\OrderModel::CustomerTypeArray,$data[\App\Models\OrderModel::F_customer_type]) }} {{empty($data[\App\Models\OrderModel::F_trip_info])?'-':$data[\App\Models\OrderModel::F_trip_info][0][\App\Models\OrderTripModel::F_use_begin_time]??'-'}}</span>
                                <br>•  {{empty($data[\App\Models\OrderModel::F_trip_info])?'-':$data[\App\Models\OrderModel::F_trip_info][0][\App\Models\OrderTripModel::F_begin_address]}}<br>•  {{empty($data[\App\Models\OrderModel::F_trip_info])?'-':$data[\App\Models\OrderModel::F_trip_info][0][\App\Models\OrderTripModel::F_finish_address]??'-'}}<br>
                                <br><b>
                      <span style="font-size: 0.875rem;">航班号：<span style="font-weight: 400;">{{$data[\App\Models\OrderModel::F_trip_info][0][\App\Models\OrderTripModel::F_flight_number]??'-'}}</span>
                      </span><br>
                                    <span style="font-size: 0.875rem;">航班时间：<span style="font-weight: 400;">{{empty($data[\App\Models\OrderModel::F_trip_info])?'-':$data[\App\Models\OrderModel::F_trip_info][0][\App\Models\OrderTripModel::F_reach_time]??'-'}}</span>
                      </span><br>
                                    <span style="font-size: 0.875rem;">订单车型：<span style="font-weight: 400;">{{ $data['car'][\App\Models\CarModel::F_car_type]??'-' }}</span>
                      </span><br>
                                    <span style="font-size: 0.875rem;">成人数量：<span style="font-weight: 400;">{{ $data[\App\Models\OrderModel::F_person_sum] }}</span>
                      </span><br>
                                    <span style="font-size: 0.875rem;">儿童数量：<span style="font-weight: 400;">{{ $data[\App\Models\OrderModel::F_children_sum] }}</span>
                      </span><br>
                                    <span style="font-size: 0.875rem;">行李数量：<span style="font-weight: 400;">{{ $data[\App\Models\OrderModel::F_box_sum] }}</span>
                      </span><br>
                                    <span style="font-size: 0.875rem;">订单价格：<span style="font-weight: 400;">{{ $data[\App\Models\OrderModel::F_expect_price] }}</span>
                      </span><br>
                                    <span style="font-size: 0.875rem;">收款人：<span style="font-weight: 400;">{{ $data['payees'][\App\Models\PayeesModel::F_name]??'-' }}</span>
                      </span><br>

                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        @switch($data[\App\Models\OrderModel::F_status])
            @case(\App\Models\OrderModel::status_1)
                <a href="javascript:void" onclick="changeStatus({{\App\Models\OrderModel::status_3}})" class="u-btn u-button-style u-btn-1">已调度</a>
                @break;
            @case(\App\Models\OrderModel::status_3)
                <a href="javascript:void"  onclick="changeStatus({{\App\Models\OrderModel::status_5}})" class="u-btn u-button-style u-btn-1">已到达</a>
                @break;
            @case(\App\Models\OrderModel::status_5)
                <a href="javascript:void"  onclick="changeStatus({{\App\Models\OrderModel::status_7}})" class="u-btn u-button-style u-btn-1">已送达</a>
                @break;
        @endswitch


        <div class="u-align-center-xs u-border-3 u-border-grey-dark-1 u-expanded-width-xs u-line u-line-horizontal u-line-1"></div>
    </div>
</section>
<script>
    function changeStatus(s){
        $.ajax({
            url: "/api/order/change-status",
            method: "POST",
            dataType: "json",
            data:{
                id:  {{$data[\App\Models\OrderModel::F_id]}},
                status: s
            },
            success: function(data) {
                // 请求成功时的处理代码
                if(data['statusCode'] === 200) {
                    alert('操作成功');
                    location.reload();
                } else {
                    alert('操作失败');
                }
            },
            error: function(xhr, status, errorThrown){
                alert('请求失败');
            }
        });
    }
</script>


<footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-1f32"><div class="u-clearfix u-sheet u-valign-middle-xs u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1"> Yottis Star</p>
    </div></footer>
<section class="u-backlink u-clearfix u-grey-80">
    <a class="u-link" href="#" target="_blank">
        <span>Trip info</span>
    </a>
    <p class="u-text">
        <span>created with</span>
    </p>
    <a class="u-link" href="" target="_blank">
        <span>Yottis Star</span>
    </a>.
</section>
<script src="{{ asset('assets/js/jquery.min.js') }}"></script>

</body></html>
