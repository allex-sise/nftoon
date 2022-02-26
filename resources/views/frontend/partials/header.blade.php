@php 
    $data['category'] =  app('item_categories');
    $data['cart_item']=Cart::content();
    $logo_conditions = ['title'=>'Logo', 'active_status'=>1];
    $logo = dashboard_background($logo_conditions);
@endphp
   <!-- start header area -->
    <!-- Start Header -->
    <header class="rn-header haeder-default black-logo-version header--fixed header--sticky">
        <div class="container">
            <div class="header-inner">
                <div class="header-left">
                    <div class="logo-thumbnail logo-custom-css">
                        <a class="logo-light" href="{{ url('/')}}"><img src="{{ asset('public/frontend/img/nftoonlogo.png') }}" alt="nft-logo"></a>
                        <a class="logo-dark" href="{{ url('/')}}"><img src="{{ asset('public/frontend/img/nftoonlogo.png') }}" alt="nft-logo"></a>
                    </div>
                    <div class="mainmenu-wrapper">
                        <nav id="sideNav" class="mainmenu-nav d-none d-xl-block">
                            <!-- Start Mainmanu Nav -->
                            <ul class="mainmenu">
                                <li><a href="{{ route('collectionsAll') }}">Colectii</a></li>
                                <li><a href="{{ route('dropsAll') }}">Drops</a></li>
                                <li><a href="{{ route('categoryAll') }}">Toate</a></li>
                                <li><a href="{{ route('creatori') }}">Creatori</a></li>
                            </ul>
                            <!-- End Mainmanu Nav -->
                        </nav>
                    </div>
                </div>
                <div class="header-right">
                    <div class="setting-option d-none d-lg-block">
                        <form class="search-form-wrapper" action="{{ route('_by_search')}}" method="POST">
                                    @csrf
                                    <input id="quick_search" class="xs-hide" type="text" placeholder="@lang('lang.search_your_product')" onkeyup="SearchItem(this.value)" name="key">  {{-- filter.js --}}
                                   
                                    
                            <div class="search-icon">
                           
                                <button><i class="feather-search"></i></button>
                            </div>
                        </form>
                    </div>
                    <!-- <div class="setting-option rn-icon-list d-block d-lg-none">
                        <div class="icon-box search-mobile-icon">
                            <button><i class="feather-search"></i></button>
                        </div>
                        <form id="header-search-1" action="#" method="GET" class="large-mobile-blog-search">
                            <div class="rn-search-mobile form-group">
                                <button type="submit" class="search-button"><i class="feather-search"></i></button>
                                <input type="text" placeholder="Search ...">
                            </div>
                        </form>
                    </div> -->

                    @if (!Auth::check())
                    <div class="setting-option header-btn">
                        <div class="icon-box">
                            <a class="btn btn-primary-alta btn-small" href="{{ url('customer/login') }}">Conectare</a>
                        </div>
                    </div>
                    @endif
                    @if (Auth::check())
                    <div class="setting-option rn-icon-list user-account">
                        <div class="icon-box">
                            <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/boy-avater.png" alt="Images"></a>
                            <div class="rn-dropdown">
                                <div class="rn-inner-top">
                                    <h4 class="title"><a href="product-details.html">{{ @Auth::user()->full_name }}</a></h4>
                                    <span><a href="#">{{ @Auth::user()->username}}</a></span>
                                </div>
                                <div class="rn-product-inner">
                                    <ul class="product-list">
                                        <li class="single-product-list">
                                            <div class="thumbnail">
                                                <a href="product-details.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/portfolio/portfolio-07.jpg" alt="Nft Product Images"></a>
                                            </div>
                                            <div class="content">
                                                <h6 class="title"><a href="product-details.html">Balanta</a></h6>
                                                
                                                <span class="price"> @if (Auth::user()->role_id == 4)
                                                {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
                                            @endif
                                            @if (Auth::user()->role_id == 5)
                                                {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
                                            @endif</span>
                                            </div>
                                            <div class="button"></div>
                                        </li>
                                    </ul>
                                </div>
                                @if (Auth::user()->role_id == 4 || Auth::user()->role_id == 5)
                                <div class="add-fund-button mt--20 pb--20">
                                    <a class="btn btn-primary-alta w-100" href="{{ route('user.deposit',@Auth::user()->username)}}">@lang('lang.fund_deposit')</a>
                                </div>
                                @endif
                                <ul class="list-inner">
                                    @if (Auth::user()->role_id == 4)
                                        <li><a href="{{ route('author.profile',@Auth::user()->username)}}">@lang('lang.profile')</a></li>
                                        <li><a href="{{ route('author.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                        <li><a href="{{ route('author.download',@Auth::user()->username) }}">Colectia Ta</a></li>
                                    @endif
                                    @if (Auth::user()->role_id == 5)
                                        <li><a href="{{ route('customer.profile',@Auth::user()->username) }}">@lang('lang.profile')</a></li>
                                        <li><a href="{{ route('customer.downloads',@Auth::user()->username) }}">Colectia Ta</a></li>
                                        <!-- <li><a href="{{ route('customer.referrals',@Auth::user()->username) }}#referrals-tab">Referrals</a></li> -->
                                        @if (GeneralSetting()->public_vendor==1)
                                            
                                        <li><a href="{{ route('user.BecomeAuthor') }}">@lang('lang.become_a_author')</a></li>
                                        @endif

                                    @endif
                                </ul>

                                @if (Auth::user()->role_id == 4)
                                <h3>@lang('lang.author_settings')</h3>
                                @endif
                                @if (Auth::user()->role_id == 5)
                                <h3>@lang('lang.user_settings')</h3>
                                @endif
                                <ul class="list-inner">
                                    @if (Auth::user()->role_id == 5)
                                    <li><a href="{{ route('customer.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                    @endif
                                    @if (Auth::user()->role_id == 4)
                                    <!-- <li><a href="{{ route('author.dashboard',@Auth::user()->username)}}">@lang('lang.dashboard')</a></li> -->
                                    <li><a href="{{ route('author.portfolio',@Auth::user()->username)}}">@lang('lang.portfolio')</a></li>
                                    <!-- <li><a href="{{ route('author.content')}}">@lang('lang.upload')</a></li> -->
                                    <li><a href="{{ route('author.earning',@Auth::user()->username)}}">@lang('lang.earnings')</a></li>
                                    <li><a href="{{ route('author.statement',@Auth::user()->username)}}">@lang('lang.statement')</a></li>
                                    <li><a href="{{ route('author.payout',@Auth::user()->username)}}">Retrageri</a></li>
                                    @endif
                                </ul>
                                <div class="sign_out">
                                    <a href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                                document.getElementById('logout-form').submit();">@lang('lang.sign_out')</a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="dn">
                                        @csrf
                                    </form>
                            </div>
                            </div>
                        </div>
                    </div>
                    @endif

                    <div class="setting-option mobile-menu-bar d-block d-xl-none">
                        <div class="hamberger">
                            <button class="hamberger-button">
                                <i class="feather-menu"></i>
                            </button>
                        </div>
                    </div>
                    <div id="my_switcher" class="setting-option my_switcher">
                        <ul>
                            <li>
                                <a href="javascript: void(0);" data-theme="light" class="setColor light">
                                    <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/sun-01.svg" alt="Sun images">
                                </a>
                            </li>
                            <li>
                                <a href="javascript: void(0);" data-theme="dark" class="setColor dark">
                                    <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/vector.svg" alt="Vector Images">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- End Header Area -->
    <div class="popup-mobile-menu">
        <div class="inner">
            <div class="header-top">
                <div class="logo logo-custom-css">
                    <a class="logo-light" href="{{ url('/')}}"><img src="{{ asset('public/frontend/img/nftoonlogo.png') }}" alt="nft-logo"></a>
                    <a class="logo-dark" href="{{ url('/')}}"><img src="{{ asset('public/frontend/img/nftoonlogo.png') }}" alt="nft-logo"></a>
                </div>
                <div class="close-menu">
                    <button class="close-button">
                        <i class="feather-x"></i>
                    </button>
                </div>
            </div>
            <nav>
                <!-- Start Mainmanu Nav -->
                <ul class="mainmenu">
                    <li><a href="{{ route('dropsAll') }}">Drops</a></li>
                    <li><a href="{{ route('categoryAll') }}">Toate</a></li>
                    <li><a href="{{ route('creatori') }}">Creatori</a></li>
                </ul>
                <!-- End Mainmanu Nav -->
            </nav>
        </div>
    </div>
    <!-- ENd Header Area -->
