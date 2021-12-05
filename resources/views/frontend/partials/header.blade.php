@php 
    $data['category'] =  app('item_categories');
    $data['cart_item']=Cart::content();
    $logo_conditions = ['title'=>'Logo', 'active_status'=>1];
    $logo = dashboard_background($logo_conditions);
@endphp
<style>
    .overlay {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 999999;
  top: 0;
  left: 0;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0, 0.9);
  overflow-x: hidden;
  transition: 0.5s;
  opacity: 1!important;
}

.overlay-content {
  position: relative;
  top: 25%;
  width: 100%;
  text-align: center;
  margin-top: 30px;
}

.overlay a {
  padding: 18px;
  text-decoration: none;
  font-size: 36px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
  color: #f1f1f1;
}

.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 20px;
  font-size: 60px;
}


.overlay2 {
  height: 0%;
  width: 50%;
  position: fixed;
  z-index: 99999;
  top: 0;
  right: 0;
  background-color: #161D30;
  overflow-y: hidden;
  transition: 0.5s;
  opacity: 1!important;
}

.overlay-content2 {
  position: relative;
  top: 7%;
  width: 100%;
  text-align: right;
  margin-top: 30px;
}

.overlay2 a {
  padding: 3px;
  text-decoration: none;
  font-size: 16px;
  color: #FFF;
  display: block;
  transition: 0.3s;
  padding-right: 26px;
}

.overlay2 a:hover, .overlay2 a:focus {
  color: #f1f1f1;
}

.overlay2 .closebtn2 {
  position: absolute;
  top: 20px;
  right: 0px;
  font-size: 36px;
}
.ascunddesktop{
    display: none!important;
}
.sign_out{
    border-top: 1px solid #F1F1F4!important;
}
@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 15px;
  right: 35px;
  }
}
@media only screen and (max-width: 767px) {
  .btnascundedesktop {
    display: inline!important;
    position: relative;
    right: -10px;
  }
  #menu-btn{
      background: var(--secondary-color)!important;
  }
  .footer-area .copyright-area .footer-bottom .footer-link ul li a{
      font-size: 12px!important;
  }
  .footermobul{
      padding-left: 0rem!important;
  }
  .copy-right-text{
      font-size: 13px!important;
  }
  .ascundemobile{
      display: none!important;
  }
  .ascunddesktop{
      display: inline!important;
  }
  .mainmenu{
      display: none!important;
  }
  .hidemobile{
      display: none!important;
  }
}
</style><!-- header begin -->
<!-- zone mobile -->
<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
    <a href="{{ route('dropsAll') }}">Drops<span></span></a>
    <a href="{{ route('categoryAll') }}">Toate<span></span></a>
    <a href="{{ route('creatori') }}">Creatori<span></span></a>
  </div>
</div>
@if (Auth::check())
<div id="myNav2" class="overlay2">
  <a href="javascript:void(0)" class="closebtn2" onclick="closeNav2()">&times;</a>
  <div class="overlay-content2">
    <h3 style="margin: 0px; padding-right: 26px;"> {{ @Auth::user()->username}} 
       
        <span class="simple_line">|</span> 
     
        <span class="prise">
        @if (Auth::user()->role_id == 4)
            {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
        @endif
        @if (Auth::user()->role_id == 5)
            {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
        @endif
        </span>
    </h3>
    @if (@Auth::user()->role_id==1 || @Auth::user()->role_id==2)
        <ul style="padding-left: 0px; padding-top: 7px;">
            <li> <a href="{{route('admin.dashboard')}} ">@lang('lang.dashboard')</a> </li>   
        </ul> 
    @endif
    <ul style="padding-left: 0px; padding-top: 7px;">
        @if (Auth::user()->role_id == 4)
            <li><a href="{{ route('author.profile',@Auth::user()->username)}}">@lang('lang.profile')</a></li>
            <li><a href="{{ route('author.setting',@Auth::user()->username) }}">@lang('lang.settings')</a></li>
            <li><a href="{{ route('author.download',@Auth::user()->username) }}">Colectia Ta</a></li>
            <li><a href="{{ route('user.deposit',@Auth::user()->username)}}">@lang('lang.fund_deposit')</a></li>
        @endif
        @if (Auth::user()->role_id == 5)
            <li><a href="{{ route('customer.profile',@Auth::user()->username) }}">@lang('lang.profile')</a></li>
            <li><a href="{{ route('customer.downloads',@Auth::user()->username) }}">Colectia Ta</a></li>
            <!-- <li><a href="{{ route('customer.referrals',@Auth::user()->username) }}#referrals">Referrals</a></li> -->
            <li><a href="{{ route('user.deposit',@Auth::user()->username)}}">@lang('lang.fund_deposit')</a></li>
            @if (GeneralSetting()->public_vendor==1)
                
            <li><a href="{{ route('user.BecomeAuthor') }}">@lang('lang.become_a_author')</a></li>
            @endif

        @endif
        {{-- <li><a href="{{ route('user.affiliate') }}">@lang('lang.affiliate')</a></li> --}}
    </ul>
    @if (Auth::user()->role_id == 5 || Auth::user()->role_id == 4)
        <div class="profile_hover_links" style="border-top: 1px solid #FFF; padding-top: 20px;">
            @if (Auth::user()->role_id == 4)
            <h3 style="margin: 0px; padding-right: 26px;">@lang('lang.author_settings')</h3>
            @endif
            @if (Auth::user()->role_id == 5)
            <h3 style="margin: 0px; padding-right: 26px;">@lang('lang.user_settings')</h3>
            @endif
            <ul style="padding-left: 0px; padding-top: 7px;">
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
        </div>
    @endif
   
    <div class="sign_out" style="border-top: 1px solid #eee; padding-top: 20px;">
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
<!-- end zona mobile -->
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
                        <li class="hidemobile"><a href="{{ route('dropsAll') }}">Drops<span></span></a>
                        <li class="hidemobile"><a href="{{ route('categoryAll') }}">Toate<span></span></a></li>
                        <li class="hidemobile"><a href="{{ route('creatori') }}">Creatori<span></span></a></li>
                    </ul>
                    <div class="menu_side_area">
                        
                    @if (!Auth::check())
                        <a class="btn-main btnascundedesktop" href="{{ url('customer/login') }}"> <span class="signin_text" >@lang('lang.sign_in')</span> <i class="fa fa-sign-in m-0 p-0 signin_btn" aria-hidden="true"></i></a>
                    @endif
                    @if (Auth::check())
                    <span style="font-size: 10px; cursor: pointer; padding: 6px; right: 5px; top: -6px; position: relative;" onclick="openNav2()" class="user_author_pro black-btn ascunddesktop"><span class="name"> {{ Str::limit(@Auth::user()->username, 3) }}</span> 
                                    @if (Auth::user()->role_id != 1)   
                                        
                                    <span class="simple_line">|</span> 
                                    @endif
                                         <span class="prise">
                                            @if (Auth::user()->role_id == 4)
                                                {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
                                            @endif
                                            @if (Auth::user()->role_id == 5)
                                                {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
                                            @endif
                                        
                                        </span></span>
                    @endif
                        <span class="btnascundedesktop" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
                    </div>
                
                    <div class="header-area">
                        
                    @if (Auth::check())
                        <div class="main_user-pro_wrap d-flex align-items-center justify-content-end">
                      
                                <div class="profile-area">
                                    <a class="user_author_pro black-btn " > <span class="name"> {{ Str::limit(@Auth::user()->username, 8) }}</span> 
                                    @if (Auth::user()->role_id != 1)
                                        
                                    <span class="simple_line">|</span> 
                                    @endif
                                         <span class="prise">
                                            @if (Auth::user()->role_id == 4)
                                                {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
                                            @endif
                                            @if (Auth::user()->role_id == 5)
                                                {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
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
                                                    <!-- <li><a href="{{ route('customer.referrals',@Auth::user()->username) }}#referrals-tab">Referrals</a></li> -->
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
                                                    <li><a href="{{ route('author.payout',@Auth::user()->username)}}">Retrageri</a></li>
                                                    @endif
                                                </ul>
                                            </div>
                                        @endif
                                        <div id="headerDarkMode" style="padding: 10px 20px;">
                                            <toggle-theme-color 
                                            style-id="{{( @Auth::user()->style_id == '1' ? true : false)}}"
                                            route="{{ route('user.darkMode',  @Auth::user()->id) }}"
                                            user-id="{{@Auth::user()->id}}"
                                            />
                                        </div> 
                                        <br />
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
                            <a class="user_author_pro ascundemobile" ><i class="ti-user"></i> <span
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
