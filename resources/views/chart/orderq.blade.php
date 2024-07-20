<div class="card">
    <div class="card-body">
        <canvas id="visitors-chart"></canvas>
    </div>
</div>
<script>
    $(function () {
        var ctx = document.getElementById("visitors-chart").getContext('2d');
        var myChart = new Chart(ctx, {
            data: {
                labels: [@foreach($y as $k => $v)'{{$v}}',@endforeach],
                datasets: [{
                    type: 'line',
                    data: [@foreach($orderTotalArray as $k => $v)'{{$v}}',@endforeach],
                    backgroundColor: 'transparent',
                    borderColor: '#007bff',
                    pointBorderColor: '#007bff',
                    pointBackgroundColor: '#007bff',
                    fill: false
                },
                    {
                        type: 'line',
                        data: [@foreach($orderSumArray as $k => $v)'{{$v}}',@endforeach],
                        backgroundColor: 'tansparent',
                        borderColor: '#ced4da',
                        pointBorderColor: '#ced4da',
                        pointBackgroundColor: '#ced4da',
                        fill: false
                    }]
            },
            options: {
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{}],
                    xAxes: [{}]
                }
            }
        });
    });
</script>

<style>
    #visitors-chart {
        height: 200px;
    }
</style>
