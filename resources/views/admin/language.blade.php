<li class="dropdown lang lang-switch" style="position:relative;">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
        <span class="hidden-xs">Language</span>
    </a>
    <ul class="dropdown-menu" style="position: absolute; left:0px; min-width:180px;">
        <li class="lang-header">
        </li>
        <li class="lang-footer clearfix" style="display:flex; justify-content: left; flex-wrap:wrap;">
            @foreach ($lang as $key => $label)
                <div style="display:inline-block; padding-left:5px; padding-bottom:2px;">
                    <a href="/admin/lang/{{$key}}" class="btn btn-default btn-flat lang-change">{{$label}}</a>
                </div>
            @endforeach
        </li>
    </ul>
</li>
