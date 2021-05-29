@php 
    $data['category'] =  app('item_categories');
    $data['cart_item']=Cart::content();
    $logo_conditions = ['title'=>'Logo', 'active_status'=>1];
    $logo = dashboard_background($logo_conditions);
@endphp
<style>
.latest-goods-area .portfolio-menu button {
    background: #fff;
    color: #000000;
    font-size: 11px;
    font-family: "Open Sans", sans-serif;
    cursor: pointer;
    border: 0;
    display: inline-block;
    font-weight: 300;
    padding: 6px 20px;
    margin-right: 5px;
    border-radius: 30px;
}
.black-btn {
    color: #fff;
    border-radius: 30px;
    font-size: 13px;
    background: #000;
    font-weight: 700;
    padding: 15px 27px;
    display: inline-block;
    font-family: "Quicksand", sans-serif;
    border: 1px solid transparent;
}
.header-area .profile-area a.user_author_pro {
    background-color: rgba(255, 255, 255, 0.06) !important;
    border-radius: 30px;
}
button, input {
    overflow: visible;
    border-radius: 30px;
    padding-left: 15px;
}
.banner-area::before {
    background-image: none!important;
}
.banner-area::after {
    content: "";
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: absolute;
    z-index: -2;
    /* background-image: url(../img/banner/banner-img-1.png); */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover!important;
    z-index: 3;
}
.banner-area {
    height: 900px;
    margin-top: 85px;
    position: relative;
    z-index: 2;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
}
.header-area {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 9999;
    padding: 0 20px;
    background: #fff;
}
.header-area .main-menu ul li a {
    font-family: "Quicksand", sans-serif;
    font-size: 20px;
    padding: 28px;
    text-transform: uppercase;
    font-weight: 700!important;
    letter-spacing: 1px;
    color: rgba(0, 0, 0, 0.7);
    padding-right: 0px;
    padding-left: 0px;
}
.header-area .profile-area a.user_author_pro {
    background-color: rgba(0, 0, 0, 0.88) !important;
    border-radius: 30px;
}
.latest-goods-area .single-goods .goods-thumb {
    overflow: hidden;
    height: 340px;
    border-radius: 7px!important;
    border-bottom-left-radius: 0px!important;
    border-bottom-right-radius: 0px!important;
}
.latest-goods-area .single-goods .goods-thumb img {
    width: 100%;
    -webkit-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1);
    -webkit-transition: 0.5s;
    -moz-transition: 0.5s;
    -ms-transition: 0.5s;
    -o-transition: 0.5s;
    transition: 0.5s;
    max-height: 340px;
}
.good-info2{
    background: #1A1A1A!important;
    color: #FFF!important;
    border-bottom-left-radius: 7px!important;
    border-bottom-right-radius: 7px!important;
}
.good-title2 h3{
    color: #FFF!important;
    font-size: 18px!important;
}
h3.h3clss{
    color: #bfbfbf!important;
    font-size: 18px!important;
    margin-bottom: 3px!important;
}
.Pagination ul li a.active, .Pagination ul li a:hover, .boxed-btn-white:hover, .header-area .profile-area>a:hover, .theme-side-bar1 .progressBar-area .single-progress-bar .progress .progress-bar, .my_coupon table tr td.edit-buttons button.edit, .my_coupon table tr td.edit-buttons button.Restore, .contact_area .form-contact button.boxed-btn, .login_resister_area .main-login-form .resiter:hover, .tiket_area .tiket-nav a.active, .upload_image_overlay i, .statement_details .more_options a:hover, .statement_details .more_options a.hover-btn {
    background-image: -moz-linear-gradient( 0deg, #7c32ff 0%, #a235ec 70%, #c738d8 100%);
    background-image: none;
    background-image: -ms-linear-gradient( 0deg, #7c32ff 0%, #a235ec 70%, #c738d8 100%);
    background: transparent;
    color: #000;
    border: 1px solid #000!important;
}

.searchsubmit{
    position: absolute!important;
    right: 100px!important;
    top: 2px!important;
    padding-left: 12px!important;
    padding-right: 8px!important;
}
.header-area.sticky {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    background: rgba(255,255,255, 0.96);
    top: -70px;
    transform: translateY(70px);
    transition: transform 500ms ease, background 500ms ease;
    -webkit-transition: transform 500ms ease, background 500ms ease;
    z-index: 999;
}
.header-area .profile-area>a {
    background-color: #000!important;
    color: #fff;
    padding: 7px 36px 7px 36px!important;
    font-weight: 600;
    font-size: 13px;
    -webkit-transition: 0.3s;
    -moz-transition: 0.3s;
    -ms-transition: 0.3s;
    -o-transition: 0.3s;
    transition: 0.3s;
}
.Pagination ul li a.active, .Pagination ul li a:hover, .boxed-btn-white:hover, .header-area .profile-area>a:hover, .theme-side-bar1 .progressBar-area .single-progress-bar .progress .progress-bar, .my_coupon table tr td.edit-buttons button.edit, .my_coupon table tr td.edit-buttons button.Restore, .contact_area .form-contact button.boxed-btn, .login_resister_area .main-login-form .resiter:hover, .tiket_area .tiket-nav a.active, .upload_image_overlay i, .statement_details .more_options a:hover, .statement_details .more_options a.hover-btn {
    background: #fff;
    color: #000!important;
    border: 1px solid #000!important;
}
</style>
<header>
   
        <div id="sticky-header" class="header-area">
            <div class="container-fluid">
                <div class="row align-items-center justify-content-between">
                    <!-- <div class=" col-md-3 col-lg-2 col-xl-3 col-md-12"> -->
                        <div class="logo-img" >
                          <a href="{{url('/')}}">
                               <img src="{{ asset('public/frontend/img/Logo2.png') }}" alt="" class="mw">
                            </a>
                        </div>
                    <!-- </div> -->
                    <!-- <div class="col-xl-6 d-none d-lg-block col-lg-6"> -->
                        <div class="main-menu">
                            <nav>
                                <ul id="navigation">
                                    @foreach (app('item_categories') as $item)
                                            <li><a href="{{ route('categoryItem',@$item->slug) }}">{{ @$item->title}}</a>
                                            <li><a href="#">TOATE</a></li>
                                            <li><a href="#">CREATORI</a></li>
                                       </li>
                                    @endforeach
                                </ul>
                            </nav>
                        </div>
                    <!-- </div> -->
                    <!-- <div class="col-xl-3 col-md-6 col-lg-4 d-none d-lg-block"> -->
               

                     
                        @if (Auth::check())
                        <div class="main_user-pro_wrap d-flex align-items-center justify-content-end">
                        <div class="col-xl-10 offset-xl-1 col-lg-10 offset-lg-1">
                            <div class="search-field">
                                <div class="search-field-inner">
                                    <form class="search-relative" action="{{ route('_by_search')}}" method="POST">
                                        @csrf
                                        <input type="text" placeholder="@lang('lang.search_your_product')" onkeyup="SearchItem(this.value)" name="key">  {{-- filter.js --}}
                                        <button class="searchsubmit" type="submit"> <i class="ti-search"></i> </button>
                                    </form>
                                </div>
                            </div>
                            <div class="list-group" id="livesearch"></div>
                        </div>
                            <!-- <a class="" href="{{ route('Cart') }}"><span class="cart"><i class="ti-shopping-cart" id="ti_Shop">
                                @if (@count($data['cart_item']) >0 )
                                    <span class="badge_icon" id="cartItem">{{ count(@$data['cart_item'])}}</span>  
                                @endif
                            </i></span></a> -->

                            {{-- @dd( app('infix_languages')) --}}
                      
                            <!-- <select class="niceSelect languageChange" name="languageChange" id="languageChangeMenu">
                                <option data-display="@lang('lang.language')" value="0">@lang('lang.language')</option>
                                @php
                                    $languages=app('infix_languages');
                                @endphp
                                
                                @foreach($languages as $lang)
    
                                @if (Auth::check())
                                    <option data-display="{{$lang->native}}" value="{{ $lang->language_universal}}" {{$lang->language_universal == userActiveLanguage()? 'selected':''}}>{{$lang->native}}</option>
                                
                                @else
                                    <option data-display="{{$lang->native}}" value="{{ $lang->language_universal}}" {{$lang->language_universal == activeLanguage()? 'selected':''}}>{{$lang->native}}</option>
                                
                                @endif
                                  
                                    @endforeach
                            </select> -->

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
                                                    <ul>
                                                        <li> <a href="{{route('admin.dashboard')}} ">@lang('lang.dashboard')</a> </li>   
                                                    </ul> 
                                                @endif
                                            <ul>
                                                @if (Auth::user()->role_id == 4)
                                                    <li><a href="{{ route('author.profile',@Auth::user()->username)}}">@lang('lang.profile')</a></li>
                                                    <li><a href="{{ route('author.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                                    <li><a href="{{ route('author.download',@Auth::user()->username) }}">@lang('lang.Downloads')</a></li>
                                                    <li><a href="{{ route('user.deposit',@Auth::user()->username)}}">@lang('lang.fund_deposit')</a></li>
                                                @endif
                                                @if (Auth::user()->role_id == 5)
                                                    <li><a href="{{ route('customer.profile',@Auth::user()->username) }}">@lang('lang.profile')</a></li>
                                                    <li><a href="{{ route('customer.downloads',@Auth::user()->username) }}">@lang('lang.Downloads')</a></li>
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
                                                <ul>
                                                    @if (Auth::user()->role_id == 5)
                                                    <li><a href="{{ route('customer.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                                    @endif
                                                    @if (Auth::user()->role_id == 4)
                                                    <li><a href="{{ route('author.dashboard',@Auth::user()->username)}}">@lang('lang.dashboard')</a></li>
                                                    <li><a href="{{ route('author.portfolio',@Auth::user()->username)}}">@lang('lang.portfolio')</a></li>
                                                    <li><a href="{{ route('author.content')}}">@lang('lang.upload')</a></li>
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
                            <div class="col-xl-10 offset-xl-1 col-lg-10 offset-lg-1">
                                <div class="search-field">
                                    <div class="search-field-inner">
                                        <form class="search-relative" action="{{ route('_by_search')}}" method="POST">
                                            @csrf
                                            <input type="text" placeholder="@lang('lang.search_your_product')" onkeyup="SearchItem(this.value)" name="key">  {{-- filter.js --}}
                                            <button class="searchsubmit" type="submit"> <i class="ti-search"></i> </button>
                                        </form>
                                    </div>
                                </div>
                                <div class="list-group" id="livesearch"></div>
                            </div>

                                <div class="profile-area m-0">

                                    {{-- <a class=" " href="{{ url('customer/login') }}">@lang('lang.sign_in')</a> --}}
                                    <a class="login_icon black-btn" href="{{ url('customer/login') }}"> <span class="signin_text" >@lang('lang.sign_in')</span> <i class="fa fa-sign-in m-0 p-0 signin_btn" aria-hidden="true"></i></a>
                                </div>
                        </div>
                            {{-- <div class="profile-area">
                                <p class="main_user-pro_wrap d-flex align-items-center justify-content-end"> <a href="{{ route('Cart') }}"><span class="cart"><i class="ti-shopping-cart" id="ti_Shop">
                                    @if (@count(@$data['cart_item']) >0 )
                                        <span class="badge_icon" id="cartItem">{{ count(@$data['cart_item'])}}</span>  
                                    @endif
                                </i></span></a>  
                                <a class="" href="{{ url('customer/login') }}">Sign In</a></p>
                            </div> --}}
                        @endif
                    <!-- </div> -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
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
                                    <ul>
                                            @if (Auth::user()->role_id == 5)
                                            <li><a href="{{ route('customer.profile',@Auth::user()->username) }}">@lang('lang.profile')</a></li>
                                            <li><a href="{{ route('customer.downloads',@Auth::user()->username) }}">@lang('lang.Downloads')</a></li>
                                            @if (GeneralSetting()->public_vendor==1)
                                                
                                                <li><a href="{{ route('user.BecomeAuthor') }}">@lang('lang.become_a_author')</a></li>
                                            @endif
                                            @endif
                                            @if (Auth::user()->role_id == 4)
                                            <li><a href="{{ route('author.profile',@Auth::user()->username)}}">@lang('lang.profile')</a></li>
                                            <li><a href="{{ route('author.download',@Auth::user()->username) }}">@lang('lang.Downloads')</a></li>                                            
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
                                    <ul> 
                                            @if (Auth::user()->role_id == 5)
                                            <li><a href="{{ route('customer.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                            @endif
                                            @if (Auth::user()->role_id == 4)
                                            <li><a href="{{ route('author.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
                                            <li><a href="{{ route('author.dashboard',@Auth::user()->username)}}/">@lang('lang.dashboard')</a></li>
                                            <li><a href="{{ route('author.coupon_list',@Auth::user()->username)}}">@lang('lang.coupon')</a></li>
                                            <li><a href="{{ route('author.content')}}">@lang('lang.upload')</a></li>
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
</header>
