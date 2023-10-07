
<canvas id="myChart" width="400" height="100" aria-label="Hello ARIA World"></canvas>
<script>
    $(function () {
        var ctx = document.getElementById("myChart").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: [@foreach($labels as $k => $v)'{{$v}}',@endforeach],
                datasets: [{
                    data: [@foreach($data as $k => $v)'{{$v['count']}}',@endforeach],
                    backgroundColor: [
                        'rgba(255,166,64,0.2)',
                        'rgba(44,95,229,0.2)',
                        'rgba(234,225,49,0.2)',
                        'rgba(34,197,197,0.2)',
                        'rgba(74,220,41,0.2)',
                        'rgba(204,7,21,0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 159, 64, 1)',
                        'rgb(13,50,199)',
                        'rgb(225,182,16)',
                        'rgb(11,175,175)',
                        'rgb(15,155,10)',
                        'rgb(176,5,5)'
                    ],
                    borderWidth: 0.1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                },
            }
        });
    });
</script>
