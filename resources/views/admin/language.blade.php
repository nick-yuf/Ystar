<li class="dropdown lang lang-switch" style="position:relative;">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
        <span class="">Language</span>
    </a>
    <ul class="dropdown-menu" style="position: absolute;  min-width:150px;">
        <li class="lang-header">
        </li>
            @foreach ($lang as $key => $label)
                <div style="display:inline-block; padding-left:5px; padding-bottom:2px;">
                    <a href="/admin/lang/{{$key}}" class="btn btn-default btn-flat lang-change">{{$label}}</a>
                </div>
            @endforeach
    </ul>
</li>
