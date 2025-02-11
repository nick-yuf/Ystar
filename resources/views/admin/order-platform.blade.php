<style>
    .title {
        display: block;
        margin: 10px 0 10px 10px;
    }

    .links {
        text-align: center;
        margin-bottom: 10px;
    }

    .links > span {
        color: #636b6f;
        font-family: 'Raleway', sans-serif;
        padding: 0 15px;
        font-size: 12px;
        font-weight: 600;
        letter-spacing: .1rem;
        text-decoration: none;
        text-transform: uppercase;
    }
    .links > span > b {
        color: red;
    }
</style>

<div class="title">
</div>

<div class="links">
    <span style="color:orangered">平台状态</span>
    @foreach($data as $k => $v)
        <span>{{ $k }}:<b>{{ $v }}</b></span>
    @endforeach
|
    <span style="color:orangered">行程状态</span>
    @foreach($data1 as $k => $v)
        <span>{{ $k }}:<b>{{ $v }}</b></span>
    @endforeach
</div>
