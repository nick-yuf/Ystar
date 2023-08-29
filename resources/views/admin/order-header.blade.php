<style>
    .title {
        font-size: 20px;
        color: #636b6f;
        font-family: 'Raleway', sans-serif;
        font-weight: 50;
        display: block;
        text-align: center;
        margin: 10px 0 10px 0px;
    }

    .links {
        text-align: center;
        margin-bottom: 20px;
    }

    .links > span {
        color: #636b6f;
        padding: 0 25px;
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
    @foreach($data as $k => $v)
        <span>{{ $k }}:<b>{{ $v }}</b></span>
    @endforeach
</div>
