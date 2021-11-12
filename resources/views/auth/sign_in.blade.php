@extends('layouts.user')
@section('title','Logare in cont Minted')

@php
    $logo_conditions = ['title'=>'Logo', 'active_status'=>1];
    $dashboard_bg_conditoins = ['is_default'=>1, 'active_status'=>1, 'id'=>4];
    $dashboard_background=dashboard_background($dashboard_bg_conditoins);
    $logo = dashboard_background($logo_conditions);
@endphp

@push('css')
    <link rel="stylesheet" href="{{ asset('public/css/') }}/auth.css">
    <style>
    .login_resister_area .single_resister_sildbar::after { background: url("{{url('/'.@$dashboard_background->image)}}") no-repeat; background-size:cover;  }
    .login_resister_area .main-login-form button {
    border: none;
    cursor: pointer;
    background: #000;
    border-radius: 50px;
}
.ascundedesktop{
    display: none;
}
.login_resister_area{
    display: block;
}
@media only screen and (max-width: 767px) {
.login_resister_area .single_resister_sildbar .resister_text p{
    display: none;
}
.login_resister_area{
    display: none;
}
.ascundedesktop{
    display: block;
}
.overlay-gradient{
    padding-top: 0px!important;
}
.logo{
    margin-bottom: 140px!important;
}
.padding40 {
    padding: 40px 20px;
}
.field-set{
    margin-bottom: 15px;
}
.form-control{
    padding: 8px;
    margin-bottom: 20px;
    border: none;
    border: solid 1px #cccccc;
    background: none;
    border-radius: 6px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    height: auto;
    box-shadow: none;
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    color: #333;
}
.logocentrat{
    margin: 0 auto!important;
    display: block!important;
    text-align: center;
}
.h3mobile{
    font-size: 22px!important;
    color: #FFF!important;
}
.pmobile{
    color: #a2a2a2!important;
    font-size: 16px!important;
    line-height: 26px!important;
    word-spacing: 0px;
    font-weight: 400px;
    font-family: "DM Sans", Helvetica, Arial, sans-serif!important;
}
.bgcolornew{
    background: rgba(51, 27, 105, 0.94)!important;
}
}
</style>
@endpush 
@section('content')
<!-- login_resister_area-start -->
    <div class="login_resister_area">
        <div class="container-fluid p-0">
            <div class="row no-gutters">
                <div class="col-xl-4 col-md-12 col-lg-5">
                    <div class="single_resister_sildbar">
                        <div class="logo">
                            <a href="{{ url('/') }}">
                                <img src="{{ @$logo ? asset(@$logo->image) : asset('public/frontend/img/Logo.png') }}" alt="" width="123">
                            </a>
                        </div>
                        <!-- <div class="resister_text">
                            {!! @$dashboard_background->additional_text !!} 
                        </div> -->
                        <div class="resister_text">
                            <h3 style="margin-right: 0px; margin-bottom: 39px; margin-left: 0px; padding: 0px; font-family: Quicksand, sans-serif; font-weight: 700; line-height: 45px; color: rgb(255, 255, 255); font-size: 32px;">Intra in cea<br style="margin: 0px; padding: 0px;">Mai mare<br style="margin: 0px; padding: 0px;">Comunitate NFT!</h3>
                            <h3 style="margin-right: 0px; margin-bottom: 39px; margin-left: 0px; padding: 0px; font-family: Quicksand, sans-serif; font-weight: 700; line-height: 45px; font-size: 32px;"><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; font-size: 14px; font-weight: 300; line-height: 26px; color: rgb(255, 255, 255); font-family: &quot;Open Sans&quot;, sans-serif;">There are advances being made in science<br style="margin: 0px; padding: 0px;">and technology everyday, and a good<br style="margin: 0px; padding: 0px;">example of this is the</p></h3><p></p> 
                        </div>
                        <div class="resister_social_links">
                            <nav> 
                                <ul>
                                    {!! getSocialIconsDynamic() !!} 
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-7">
                    <div class="main-login-form">
                        <a class="resiter" href="{{ url('register')}}">@lang('lang.register')</a>
                        <div class="col-xl-6 offset-xl-1">
                            <div class="login_form_content">
                                <div class="login_form_field">



                                    <form action="{{ url('login')}}" method="POST" id="cust_login">
                                        @csrf
                                        <div class="col-xl-12">
                                                @if(session()->has('message-success'))
                                                <div class="alert alert-success">
                                                  {{ session()->get('message-success') }}
                                              </div>
                                              @elseif(session()->has('message-danger'))
                                              <div class="alert alert-danger">
                                                  {{ session()->get('message-danger') }}
                                              </div>
                                              @endif
                                              <h3>{{str_replace('_', ' ',config('app.name') ) }} @lang('lang.login')</h3>
                                              <p>@lang('lang.enter_login')</p>
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="name">@lang('lang.email') @lang('lang.address') <span class="required_icon">*</span></label>
                                            <input type="email" placeholder="@lang('lang.email')" name="email" value="{{ old('email') }}" class="@error('email') is-invalid @enderror" required>
                                            @error('email')
                                                <span class="red_alart" role="alert">
                                                    {{ @$message }}
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="name">@lang('lang.password') <span class="required_icon">*</span></label>
                                            <input type="password" placeholder="@lang('lang.enter_passowrd')" name="password" class="@error('password') is-invalid @enderror" required>
                                            @error('password')
                                                <span class="red_alart  text-red" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-xl-12">
                                            <div class="forgot-pass d-flex align-items-center justify-content-between">
                                                <div class="checkit">
                                                    <span class="chebox-style-custom">
                                                        <input class="styled-checkbox" id="styled-checkbox-2"
                                                            type="checkbox" value="value2" checked>
                                                        <label for="styled-checkbox-2"></label>
                                                    </span>
                                                    <span class="keep-me-login" >
                                                        @lang('lang.keep_me_logged_in')
                                                    </span>
                                                </div>
                                                <div class="forgot-pass-link">
                                                    <a href="{{ route('password.request') }}" class="forgot-pass">@lang('lang.forgot') @lang('lang.password') ?</a>
                                                </div>
                                            </div>
                                        </div>
                                            @php
                                                   $reCaptcha =  App\ManageQuery::ReCaptchaSetting();
                                            @endphp
                                         <input type="text" hidden id="recaptcha_check" value="{{ @$reCaptcha->status }}">
                                      
                                        <div class="col-xl-12 mt-10">
                                            <button type="submit" class="boxed-btn">@lang('lang.login')</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- login_resister_area-end -->
<section class="full-height relative no-top no-bottom vertical-center ascundedesktop" data-bgimage="url({{url('/'.@$dashboard_background->image)}}) top" data-stellar-background-ratio=".5" style="min-height: 812px; background: url({{url('/'.@$dashboard_background->image)}}) center top / cover;">
    <div class="overlay-gradient t50" style="background-size: cover;">
        <div class="center-y relative" style="background-size: cover;">
            <div class="container" style="background-size: cover;">
            <div class="logo">
                <a class="logocentrat" href="{{ url('/') }}">
                    <img src="{{ asset('public/frontend/img/logo2.png') }}" alt="" width="203" >
                </a>
            </div>
                <div class="row align-items-center" style="background-size: cover;">
                    
                    <div class="col-lg-4 offset-lg-4 wow fadeIn bg-color animated bgcolornew" data-wow-delay=".5s" style="background-size: cover; visibility: visible; animation-delay: 0.5s; animation-name: fadeIn;">
                        <div class="box-rounded padding40" style="background-size: cover;">
                        <h3 class="mb10 h3mobile">Autentificare</h3>
                        <p class="pmobile">Conecteaza-te folosind un cont existent sau creaza un cont nou <a href="{{ url('register')}}">aici<span></span></a>.</p>
                            <form action="{{ url('login')}}" method="POST" id="cust_login" class="form-border">
                            @csrf
                            <div class="field-set" style="background-size: cover;">
                                    @if(session()->has('message-success'))
                                    <div class="alert alert-success">
                                        {{ session()->get('message-success') }}
                                    </div>
                                    @elseif(session()->has('message-danger'))
                                    <div class="alert alert-danger">
                                        {{ session()->get('message-danger') }}
                                    </div>
                                    @endif
                                
                            </div>
                            <div class="field-set" style="background-size: cover;">
                                <input type="email" placeholder="@lang('lang.email')" name="email" value="{{ old('email') }}" class="form-control @error('email') is-invalid @enderror" required>
                                @error('email')
                                    <span class="red_alart" role="alert">
                                        {{ @$message }}
                                    </span>
                                @enderror
                            </div>
                            <div class="field-set" style="background-size: cover;">
                                
                                <input type="password" placeholder="@lang('lang.enter_passowrd')" name="password" class="form-control @error('password') is-invalid @enderror" required>
                                @error('password')
                                    <span class="red_alart  text-red" role="alert">
                                        <strong>{{ @$message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            
                                @php
                                        $reCaptcha =  App\ManageQuery::ReCaptchaSetting();
                                @endphp
                                <input type="text" hidden id="recaptcha_check" value="{{ @$reCaptcha->status }}">
                        
                            <div class="field-set" style="background-size: cover;">
                                <button type="submit" class="btn btn-main btn-fullwidth color-2">@lang('lang.login')</button>
                            </div>
                        
                            <!-- social icons -->
                            <div class="forgot-pass d-flex align-items-center justify-content-between">
                                    <div class="checkit">
                                        <span class="chebox-style-custom">
                                            <input class="styled-checkbox" id="styled-checkbox-2"
                                                type="checkbox" value="value2" checked>
                                            <label for="styled-checkbox-2"></label>
                                        </span>
                                        <span class="keep-me-login" >
                                            @lang('lang.keep_me_logged_in')
                                        </span>
                                    </div>
                                    <div class="forgot-pass-link">
                                        <a href="{{ route('password.request') }}" class="forgot-pass">@lang('lang.forgot') @lang('lang.password') ?</a>
                                    </div>
                                </div>
                            <!-- social icons close -->
                    </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
@push('js')
<script src="{{asset('public/frontend/frontend.js')}}"></script>


@endpush
