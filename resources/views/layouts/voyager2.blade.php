<!DOCTYPE html>
<html lang="{{ config('app.locale') }}" dir="{{ __('voyager::generic.is_rtl') == 'true' ? 'rtl' : 'ltr' }}">
<head>
    <title>@yield('page_title', setting('admin.title') . " - " . setting('admin.description'))</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}"/>
    <meta name="assets-path" content="{{ route('voyager.voyager_assets') }}"/>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <!-- Favicon -->
    <?php $admin_favicon = Voyager::setting('admin.icon_image', ''); ?>
    @if($admin_favicon == '')
        <link rel="shortcut icon" href="{{ voyager_asset('images/logo-icon.png') }}" type="image/png">
    @else
        <link rel="shortcut icon" href="{{ Voyager::image($admin_favicon) }}" type="image/png">
    @endif

    <!-- Bootstrap CSS -->
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css">

    <!-- App CSS -->
    <link rel="stylesheet" href="{{ voyager_asset('css/app.css') }}">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/grid2.css') }}">

    @yield('css')

    @if(__('voyager::generic.is_rtl') == 'true')
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.4.0/css/bootstrap-rtl.css">
        <link rel="stylesheet" href="{{ voyager_asset('css/rtl.css') }}">
    @endif

    <!-- Few Dynamic Styles -->
    <style type="text/css">
        .voyager .side-menu .navbar-header {
            background:{{ config('voyager.primary_color','#22A7F0') }};
            border-color:{{ config('voyager.primary_color','#22A7F0') }};
        }
        .widget .btn-primary {
            border-color:{{ config('voyager.primary_color','#22A7F0') }};
        }
        .widget .btn-primary:focus,
        .widget .btn-primary:hover,
        .widget .btn-primary:active,
        .widget .btn-primary.active,
        .widget .btn-primary:active:focus {
            background:{{ config('voyager.primary_color','#22A7F0') }};
        }
        .voyager .breadcrumb a {
            color:{{ config('voyager.primary_color','#22A7F0') }};
        }
        .panel-heading-nav {
            border-bottom: 0;
            padding: 10px 0 0;
        }
        .panel-heading-nav .nav {
            padding-left: 10px;
            padding-right: 10px;
        }
    </style>

    @if(!empty(config('voyager.additional_css')))
        @foreach(config('voyager.additional_css') as $css)
            <link rel="stylesheet" type="text/css" href="{{ asset($css) }}">
        @endforeach
    @endif

    @yield('head')
    @livewireStyles
</head>

<body class="voyager @if(isset($dataType) && isset($dataType->slug)){{ $dataType->slug }}@endif">

<div id="voyager-loader">
    <?php $admin_loader_img = Voyager::setting('admin.loader', ''); ?>
    @if($admin_loader_img == '')
        <img src="{{ voyager_asset('images/logo-icon.png') }}" alt="Voyager Loader">
    @else
        <img src="{{ Voyager::image($admin_loader_img) }}" alt="Voyager Loader">
    @endif
</div>

<?php
$_authUser = Auth::user();
if ($_authUser && (\Illuminate\Support\Str::startsWith($_authUser->avatar, 'http://') || \Illuminate\Support\Str::startsWith($_authUser->avatar, 'https://'))) {
    $user_avatar = $_authUser->avatar;
} elseif ($_authUser) {
    $user_avatar = Voyager::image($_authUser->avatar);
} else {
    $user_avatar = '';
}
?>

<div class="app-container">
    <div class="fadetoblack visible-xs"></div>
    <div class="row content-container">
        @include('voyager::dashboard.navbar')
        @include('voyager::dashboard.sidebar')

        <script>
            (function(){
                var appContainer = document.querySelector('.app-container'),
                    sidebar = appContainer.querySelector('.side-menu'),
                    navbar = appContainer.querySelector('nav.navbar.navbar-top'),
                    loader = document.getElementById('voyager-loader'),
                    hamburgerMenu = document.querySelector('.hamburger'),
                    sidebarTransition = sidebar.style.transition,
                    navbarTransition = navbar.style.transition,
                    containerTransition = appContainer.style.transition;

                sidebar.style.WebkitTransition = sidebar.style.MozTransition = sidebar.style.transition =
                appContainer.style.WebkitTransition = appContainer.style.MozTransition = appContainer.style.transition =
                navbar.style.WebkitTransition = navbar.style.MozTransition = navbar.style.transition = 'none';

                if (window.innerWidth > 768 && window.localStorage && window.localStorage['voyager.stickySidebar'] == 'true') {
                    appContainer.className += ' expanded no-animation';
                    loader.style.left = (sidebar.clientWidth/2)+'px';
                    hamburgerMenu.className += ' is-active no-animation';
                }

                navbar.style.WebkitTransition = navbar.style.MozTransition = navbar.style.transition = navbarTransition;
                sidebar.style.WebkitTransition = sidebar.style.MozTransition = sidebar.style.transition = sidebarTransition;
                appContainer.style.WebkitTransition = appContainer.style.MozTransition = appContainer.style.transition = containerTransition;
            })();
        </script>

        <!-- Main Content -->
        <div class="container-fluid">
            <div class="side-body padding-top">
                @yield('page_header')
                <div id="voyager-notifications"></div>
                @yield('content')
                @yield('modal_elejir')
            </div>
        </div>
    </div>
</div>

@include('voyager::partials.app-footer')

@stack('scripts')

<!-- App scripts -->

    <!-- jQuery FIRST -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- maskMoney -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-maskmoney/3.0.2/jquery.maskMoney.min.js"></script>

    <!-- Select2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- Bootstrap Toggle -->
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>


    


    <!-- DataTables and Buttons -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.bootstrap5.min.css" />
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.bootstrap5.min.js"></script>
    <!-- <script src="/vendor/datatables/buttons.server-side.js"></script> -->



    <script type="text/javascript" src="{{ voyager_asset('js/app.js') }}"></script>
    
    <!-- Bootstrap JS -->
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<!-- Alerts -->
<script>
    @if(Session::has('alerts'))
        let alerts = {!! json_encode(Session::get('alerts')) !!};
        helpers.displayAlerts(alerts, toastr);
    @endif

    @if(Session::has('message'))
        var alertType = {!! json_encode(Session::get('alert-type', 'info')) !!};
        var alertMessage = {!! json_encode(Session::get('message')) !!};
        var alerter = toastr[alertType];
        if (alerter) {
            alerter(alertMessage);
        } else {
            toastr.error("toastr alert-type " + alertType + " is unknown");
        }
    @endif
</script>

@include('voyager::media.manager')
@yield('javascript')
@stack('javascript')

@if(!empty(config('voyager.additional_js')))
    @foreach(config('voyager.additional_js') as $js)
        <script type="text/javascript" src="{{ asset($js) }}"></script>
    @endforeach
@endif

@livewireScripts

@push('javascript')
<script>
document.addEventListener('DOMContentLoaded', function () {
    $('select').select2();
    $('[data-mask-money]').maskMoney();
    $('.toggleswitch').bootstrapToggle();
});
</script>
@endpush

</body>
</html>