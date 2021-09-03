 <!-- footer-start -->
 <style>
.colspecial{
    margin: 0 auto;
    display: block;
    width: 70%!important;
}
.footer-area .footer-top {
    padding-top: 50px;
    padding-bottom: 25px;
}
.footer-area .footer-top .footer-widget .footer-logo {
    margin-bottom: 30px;
    margin-top: 10px;
}
.footer-area .copyright-area .social-links li a {
    width: 30px;
    height: 30px;
    font-size: 18px;
    color: aliceblue;
    display: inline-block;
    background: transparent;
    text-align: center;
    line-height: 30px;
    -webkit-transition: 0.5s;
    -moz-transition: 0.5s;
    -ms-transition: 0.5s;
    -o-transition: 0.5s;
    transition: 0.5s;
}
.footer-area .copyright-area .footer-bottom .footer-link {
    margin-bottom: 0px;
}
 </style>
 <a href="#" id="back-to-top"></a>
 <footer>
    @php
        $logo_conditions = ['title'=>'Logo', 'active_status'=>1];
        $logopic = dashboard_background($logo_conditions);
    @endphp
    <div class="footer-area footer-bg">
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 colspecial">
                        <div class="row">
                        @php
                                $custom_link=InfixFooterMenu();
                            @endphp
                            @if ($custom_link!='')
                                
                        
                            <div class="col-md-4">
                                <div class="footer-widget" style="text-align: right;">
                                    <div class="footer-title">
                                        <h3>{{ $custom_link->title2 }}</h3>
                                    </div>
                                    <div class="footer-list">
                                        <nav>
                                            <ul style="padding-left: 0px; margin-right: 0px;">
                                            @if ($custom_link->link_href1!='')
                                                  <li><a href="{{ url($custom_link->link_href1) }}">{{ $custom_link->link_label1 }} </a></li>
                                                  
                                                @endif
                                                    @if ($custom_link->link_href2!='')
                                                    <li><a href="{{ $custom_link->link_href2}}">{{ $custom_link->link_label2}}</a></li>
                                                
                                                @endif
                                                @if ($custom_link->link_href6!='')
                                                <li><a href="{{ url($custom_link->link_href6) }}">{{ $custom_link->link_label6 }}</a></li>
                                      
                                                @endif
                                              
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="footer-widget text-center">
                                    <div class="footer-logo"> 
                                       <a href="{{ url('/') }}">
                                            <img src="{{ @$logopic ? asset($logopic->image) : asset('public/frontend/img/Logo.png') }}" alt="" class="mw" style="display: block; margin: 0 auto;">
                                        </a>
                                    </div>
                                    <div class="copyright-area">
                                    <div class="social-links text-center">
                                    <nav>
                                        <ul style="text-align: center; padding-left: 0px;">
                                            {!! getSocialIconsDynamic() !!} 
                                        </ul> 
                                    </nav>
                                </div>
                                </div>
                                    <!-- <div class="community-area">
                                            @php
                                            $getData=App\ManageQuery::FooterSellCount();
                                                @$ItemEarning=$getData['ItemEarning'];
                                            @endphp
                                        <div class="total-community">
                                            @php
                                                $system_settings=app('infix_general_settings');
                                            @endphp
                                            <h3> {{ @$system_settings->currency_symbol}} {{ isset($ItemEarning) ? round($ItemEarning) : 0}}</h3>
                                            <p>@lang('lang.total_community_earnings')</p>
                                        </div>
                                        <div class="total-community second">
                                            @php
                                                @$ItemSale=$getData['ItemSale'];

                                            @endphp
                                            <h3>{{ @$ItemSale }}</h3>
                                            <p>@lang('lang.total_items_sold')</p>
                                        </div>
                                    </div>  -->
                                </div>
                            </div>
                          
                            <div class="col-md-4">
                                <div class="footer-widget">
                                    <div class="footer-title" style="margin-left: 30px;">
                                        <h3 class="text-right">{{ $custom_link->title3 }}</h3>
                                    </div>
                                    <div class="footer-list">
                                        <nav>
                                            <ul class="text-right">
                                             @if ($custom_link->link_href3!='')
                                                    <li><a href="{{ $custom_link->link_href3}}">{{ $custom_link->link_label3}}</a></li>
                                               @endif
                                                    @if ($custom_link->link_href7!='')
                                                        <li><a href="{{ $custom_link->link_href7 }}">{{ $custom_link->link_label7 }}</a></li>
                                                    @endif
                                                    @if ($custom_link->link_href11!='')
                                                        <li><a href="{{ $custom_link->link_href11 }}">{{ $custom_link->link_label11 }}</a></li>
                                                    @endif
                                                    @if ($custom_link->link_href15!='')
                                                        <li><a href="{{ $custom_link->link_href15 }}">{{ $custom_link->link_label15 }}</a></li>
                                                    @endif
                                                {{-- <li><a href="{{ route('faqPage') }}">FAQ</a></li> --}}
                                               
                                                @if ($custom_link->link_href10!='')
                                                <li><a href="{{ $custom_link->link_href10 }}">{{ $custom_link->link_label10 }}</a></li>
                                      
                                                @endif
                                                @if ($custom_link->link_href14!='')
                                                <li><a href="{{ $custom_link->link_href14 }}">{{ $custom_link->link_label14 }}</a></li>
                                           
                                               @endif
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="line-border mb-20"></div>
                        <div class="row ">
                            <div class="col-xl-7 col-md-12 col-lg-7">
                                <div class="footer-bottom">
                                    <div class="footer-link">
                                        <nav>
                                            <ul>
                                                @php
                                                    $menus = FooterMenu();
                                                @endphp
                                                @foreach ($menus as $menu)
                                                <li>
                                                <a href="{{$menu->menu_url}}">{{$menu->menu_title}}</a>
                                                </li>
                                                @endforeach
                                            </ul>
                                        </nav>
                                    </div>
                                
                                   
                                </div>
                            </div>
                            <div class="col-xl-5 col-md-12 col-lg-5">
                                <div class="social-links mb-0">
                                @php
                                         $footer_link=InfixFooterSetting();
                                    @endphp
                                    <p class="copy-right-text mb-0" style="margin-top: -13px;">{{ @$footer_link->copyright_text }}. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer-end -->