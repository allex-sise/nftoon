@php 
    $data['category'] =  app('item_categories');
    $data['cart_item']=Cart::content();
    $logo_conditions = ['title'=>'Logo', 'active_status'=>1];
    $logo = dashboard_background($logo_conditions);
@endphp
<style>
</style><!-- header begin -->
<header class="transparent scroll-dark">
    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="de-flex sm-pt10">
                <div class="de-flex-col">
                    <div class="de-flex-col">
                        <!-- logo begin -->
                        <div id="logo">
                            <a href="{{url('/')}}">
                                <img alt="" class="logo" src="{{ asset('public/frontend/img/logo2.png') }}" />
                                <img alt="" class="logo-2" src="{{ asset('public/frontend/img/logo2.png') }}" />
                            </a>
                        </div>
                        <!-- logo close -->
                    </div>
                    <div class="de-flex-col">
                        <div class="search-field">
                            <div class="search-field-inner">
                                <form class="search-relative" action="{{ route('_by_search')}}" method="POST">
                                    @csrf
                                    <input id="quick_search" class="xs-hide" type="text" placeholder="@lang('lang.search_your_product')" onkeyup="SearchItem(this.value)" name="key">  {{-- filter.js --}}
                                   
                                </form>
                            </div>
                        </div>
                        <div class="list-group" id="livesearch"></div>
                    </div>
                </div>
                <div class="de-flex-col header-col-mid">
                
                    <!-- mainmenu begin -->
                    <ul id="mainmenu">
                        <li><a href="{{ route('dropsAll') }}">Drops<span></span></a>
                        <li><a href="{{ route('categoryAll') }}">Toate<span></span></a></li>
                        <li><a href="{{ route('creatori') }}">Creatori<span></span></a></li>
                        <li><button class="btn" id="icon" style="margin-top: 24px;"><i id="iconita" class="fa fa-sun-o"></i></button></li>
                    </ul>
                    <div class="menu_side_area">
                                <a class="btn-main btnascundedesktop" href="{{ url('customer/login') }}"> <span class="signin_text" >@lang('lang.sign_in')</span> <i class="fa fa-sign-in m-0 p-0 signin_btn" aria-hidden="true"></i></a>
                        
                        <span id="menu-btn"></span>
                    </div>
                    <div class="header-area">
                    @if (Auth::check())
                        <div class="main_user-pro_wrap d-flex align-items-center justify-content-end">
                      
                                <div class="profile-area">
                                    <a class="user_author_pro black-btn" > <span class="name"> {{ Str::limit(@Auth::user()->username, 8) }}</span> 
                                    @if (Auth::user()->role_id != 1)
                                        
                                    <span class="simple_line">|</span> 
                                    @endif
                                         <span class="prise">
                                            @if (Auth::user()->role_id == 4)
                                                {{@$infix_general_settings->currency_symbol}}{{ @Auth::user()->balance->amount}}
                                            @endif
                                            @if (Auth::user()->role_id == 5)
                                                {{@$infix_general_settings->currency_symbol}}{{ @Auth::user()->balance->amount}}
                                            @endif
                                        
                                        </span> </a>
                                    <div class="profile_dropdwon">
                                        <div class="profile_hover_links">
                                            <h3> {{ @Auth::user()->username}}</h3>
                                              @if (@Auth::user()->role_id==1 || @Auth::user()->role_id==2)
                                                    <ul style="padding-left: 0px;">
                                                        <li> <a href="{{route('admin.dashboard')}} ">@lang('lang.dashboard')</a> </li>   
                                                    </ul> 
                                                @endif
                                            <ul style="padding-left: 0px;">
                                                @if (Auth::user()->role_id == 4)
                                                    <li><a href="{{ route('author.profile',@Auth::user()->username)}}">@lang('lang.profile')</a></li>
                                                    <li><a href="{{ route('author.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                                    <li><a href="{{ route('author.download',@Auth::user()->username) }}">Colectia Ta</a></li>
                                                    <li><a href="{{ route('user.deposit',@Auth::user()->username)}}">@lang('lang.fund_deposit')</a></li>
                                                @endif
                                                @if (Auth::user()->role_id == 5)
                                                    <li><a href="{{ route('customer.profile',@Auth::user()->username) }}">@lang('lang.profile')</a></li>
                                                    <li><a href="{{ route('customer.downloads',@Auth::user()->username) }}">Colectia Ta</a></li>
                                                    <li><a href="{{ route('customer.referrals',@Auth::user()->username) }}#referrals">Referrals</a></li>
                                                    <li><a href="{{ route('user.deposit',@Auth::user()->username)}}">@lang('lang.fund_deposit')</a></li>
                                                    @if (GeneralSetting()->public_vendor==1)
                                                        
                                                    <li><a href="{{ route('user.BecomeAuthor') }}">@lang('lang.become_a_author')</a></li>
                                                    @endif

                                                @endif
                                                {{-- <li><a href="{{ route('user.affiliate') }}">@lang('lang.affiliate')</a></li> --}}
                                            </ul>
                                        </div>
                                        @if (Auth::user()->role_id == 5 || Auth::user()->role_id == 4)
                                            <div class="profile_hover_links">
                                                @if (Auth::user()->role_id == 4)
                                                <h3>@lang('lang.author_settings')</h3>
                                                @endif
                                                @if (Auth::user()->role_id == 5)
                                                <h3>@lang('lang.user_settings')</h3>
                                                @endif
                                                <ul style="padding-left: 0px;">
                                                    @if (Auth::user()->role_id == 5)
                                                    <li><a href="{{ route('customer.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                                    @endif
                                                    @if (Auth::user()->role_id == 4)
                                                    <!-- <li><a href="{{ route('author.dashboard',@Auth::user()->username)}}">@lang('lang.dashboard')</a></li> -->
                                                    <li><a href="{{ route('author.portfolio',@Auth::user()->username)}}">@lang('lang.portfolio')</a></li>
                                                    <!-- <li><a href="{{ route('author.content')}}">@lang('lang.upload')</a></li> -->
                                                    <li><a href="{{ route('author.earning',@Auth::user()->username)}}">@lang('lang.earnings')</a></li>
                                                    <li><a href="{{ route('author.statement',@Auth::user()->username)}}">@lang('lang.statement')</a></li>
                                                    <li><a href="{{ route('author.payout',@Auth::user()->username)}}">@lang('lang.payouts')</a></li>
                                                    @endif
                                                </ul>
                                            </div>
                                        @endif
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
                        @if (!Auth::check())

                        <div class="main_user-pro_wrap d-flex align-items-center justify-content-end">
                            <div class="profile-area m-0 prfhidden">
                                <a class="btn-main" href="{{ url('customer/login') }}"> <span class="signin_text" >@lang('lang.sign_in')</span> <i class="fa fa-sign-in m-0 p-0 signin_btn" aria-hidden="true"></i></a>
                            </div>
                        </div>
                        @endif
                    <!-- </div> -->
                    <div class="col-12 d-lg-none">
                         @if (Auth::check())
                        <div class="profile-area">
                            <a class="user_author_pro" ><i class="ti-user"></i> <span
                                    class="name">{{ @Auth::user()->username}}</span> <span class="simple_line">|</span> <span
                                    class="prise"></span> 
                                    @if (Auth::user()->role_id == 4)
                                    @lang('lang.earnings'): {{@$infix_general_settings->currency_symbol}}{{ @Auth::user()->balance->amount}}
                                    @endif
                                    @if (Auth::user()->role_id == 5)
                                    @lang('lang.balances'): {{@$infix_general_settings->currency_symbol}}{{ @Auth::user()->balance->amount}}
                                    @endif
                                </a>
                            <div class="profile_dropdwon">
                                <div class="profile_hover_links">
                                    <h3>{{ @Auth::user()->username}}</h3>
                                    <ul style="padding-left: 0px;">
                                            @if (Auth::user()->role_id == 5)
                                            <li><a href="{{ route('customer.profile',@Auth::user()->username) }}">@lang('lang.profile')</a></li>
                                    
                                            <li><a href="{{ route('customer.downloads',@Auth::user()->username) }}">Colectia Ta</a></li>
                                            @if (GeneralSetting()->public_vendor==1)
                                                
                                                <li><a href="{{ route('user.BecomeAuthor') }}">@lang('lang.become_a_author')</a></li>
                                            @endif
                                            @endif
                                            @if (Auth::user()->role_id == 4)
                                            <li><a href="{{ route('author.profile',@Auth::user()->username)}}">@lang('lang.profile')</a></li>
                                            <li><a href="{{ route('author.download',@Auth::user()->username) }}">Colectia Ta</a></li>                                            
                                            @endif
                                            @if (Auth::check() && @Auth::user()->role_id==1 || @Auth::user()->role_id==2)
                                                <li> <a href="{{route('admin.dashboard')}} ">@lang('lang.dashboard')</a> </li>   
                                            @else
                                                <li><a href="{{ route('user.deposit',@Auth::user()->username)}}">@lang('lang.fund_deposit')</a></li>
                                            @endif
                                           
                                    </ul>
                                </div>
                                    
                                <div class="profile_hover_links">
                                    @if (Auth::user()->role_id == 4)
                                    <h3>@lang('lang.author_settings')</h3>
                                    @endif
                                    @if (Auth::user()->role_id == 5)
                                    <h3>@lang('lang.user_settings')</h3>
                                    @endif
                                    <ul style="padding-left: 0px;"> 
                                            @if (Auth::user()->role_id == 5)
                                            <li><a href="{{ route('customer.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                            @endif
                                            @if (Auth::user()->role_id == 4)
                                            <li><a href="{{ route('author.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                            <li><a href="{{ route('author.dashboard',@Auth::user()->username)}}/">@lang('lang.dashboard')</a></li>
                                            <!-- <li><a href="{{ route('author.coupon_list',@Auth::user()->username)}}">@lang('lang.coupon')</a></li>
                                            <li><a href="{{ route('author.content')}}">@lang('lang.upload')</a></li> -->
                                            <li><a href="{{ route('author.earning',@Auth::user()->username)}}">@lang('lang.earnings')</a></li>
                                            <li><a href="{{ route('author.statement',@Auth::user()->username)}}">@lang('lang.statement')</a></li>
                                            <li><a href="{{ route('author.payout',@Auth::user()->username)}}">@lang('lang.payouts')</a></li>
                                            @endif
                                    </ul>
                                </div>
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
                       @endif
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</header>
<!-- header close -->
