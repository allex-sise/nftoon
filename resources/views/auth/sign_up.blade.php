@extends('layouts.user')
@section('title','Creare Cont Minted')

@php
    $logo_conditions = ['title'=>'Logo', 'active_status'=>1];
    $dashboard_bg_conditoins = ['is_default'=>1, 'active_status'=>1, 'id'=>4];
    $dashboard_background=dashboard_background($dashboard_bg_conditoins);
    $logo = dashboard_background($logo_conditions);
@endphp

@push('css')
    <link rel="stylesheet" href="{{ asset('public/css/') }}/auth.css">
    <style>.login_resister_area .single_resister_sildbar::after { background: url("{{url('/'.@$dashboard_background->image)}}") no-repeat; background-size:cover;  }
    .error{
    display: block;
}
.login_resister_area .main-login-form input{
    border: 1px solid;
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
    margin-bottom: 100px!important;
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
    color: #FFF;
}
.form-border input[type=text], .form-border textarea, .form-underline input[type=email], .form-border input[type=password], .form-border select{
    color: #FFF!important;
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
                        <a href="{{url('/')}}">
                                <img src="{{ @$logo ? asset(@$logo->image) : asset('public/frontend/img/Logo.png') }}" alt="" class="signup_logo" >
                            </a>
                        </div>
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
                        <div class="resistration-bg">
                            <img src="{{ asset('public/frontend/img/') }}/pattern/Pattern.png" alt="">
                        </div>
                      <a class="resiter" href="{{ url('login')}}">@lang('lang.login')</a>
                        <div class="col-xl-6 offset-xl-1">
                            <div class="login_form_content">
                                
                                <div class="login_form_field">
                                <form action="{{ route('customer_registration') }}" method="POST" id="cus_registration1">
                                    @csrf
                                        <div class="col-xl-12">
                                                <h3>{{str_replace('_', ' ',config('app.name') ) }} @lang('lang.registration')</h3>
                                                <p>@lang('lang.enter_login')</p>
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="first_name">@lang('lang.first_name')<span>*</span></label>
                                            <input type="text" name="first_name" value="{{ old('first_name') }}" placeholder="@lang('lang.first_name')" required class="@error('first_name') is-invalid @enderror">
                                            @error('first_name')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="last_name">@lang('lang.last_name')<span>*</span></label>
                                            <input type="text" name="last_name" value="{{ old('last_name') }}" placeholder="@lang('lang.last_name')" required class="@error('last_name') is-invalid @enderror">
                                            @error('last_name')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="username">@lang('lang.username')*<span>*</span></label>
                                            <input type="text" placeholder="@lang('lang.enter_username')" name="username" value="{{ old('username') }}" required class="@error('username') is-invalid @enderror">
                                            @error('username')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="email">@lang('lang.email') @lang('lang.address')  <span>*</span></label>
                                            <input type="text" placeholder="@lang('lang.username_email_address')" value="{{ old('email') }}" name="email" class="@error('email') is-invalid @enderror" required>
                                            @error('email')
                                                <span class="text-danger  text-red" role="alert">
                                                    {{ @$message }}
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="phone">Numarul de telefon*<span>*</span></label>
                                            <input type="numeric" placeholder="Numarul de telefon" name="phone" value="{{ old('phone') }}" required class="@error('phone') is-invalid @enderror">
                                            @error('phone')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="name">@lang('lang.password')<span>*</span></label>
                                            <input name="password" id="password" type="password" placeholder="@lang('lang.enter_passowrd')"  class="@error('password') is-invalid @enderror" required>
                                            @error('password')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="name">@lang('lang.confirm') @lang('lang.password')<span>*</span></label>
                                            <input type="password" name="password_confirmation" placeholder="@lang('lang.confirm_passowrd')" class="@error('password_confirmation') is-invalid @enderror" required>
                                            @error('password_confirmation')
                                                <span  class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>                             
                                        <input type="hidden"  id="recaptcha_check" value="{{ re_captcha_settings('status') }}">
                                        @if (re_captcha_settings('status') == 1) 
                                            <div class="col-xl-12 col-md-12">
                                                <label for="captcha">@lang('lang.re_captcha')</label>
                                                {!! NoCaptcha::renderJs() !!}
                                                {!! NoCaptcha::display() !!}
                                                <span class="text-danger">{{ $errors->first('g-recaptcha-response') }}</span>
                                            </div>
                                        @endif
                                        <div class="col-xl-12">
                                              <button type="submit" class="boxed-btn mt-35">@lang('lang.register')</button>
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
                        <h3 class="mb10 h3mobile">@lang('lang.registration')</h3>
                        <p class="pmobile">Completeaza formularul pentru a creea un cont nou Minted. Daca ai deja un cont te poti loga <a href="{{ url('login')}}">aici<span></span></a>.</p>
                        <form action="{{ route('customer_registration') }}" method="POST" id="cus_registration1">
                                    @csrf
                                        <div class="field-set" style="background-size: cover;">
                                            <input type="text" name="first_name" value="{{ old('first_name') }}" placeholder="@lang('lang.first_name')" required class="form-control @error('first_name') is-invalid @enderror">
                                            @error('first_name')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="field-set" style="background-size: cover;">
                                            <input type="text" name="last_name" value="{{ old('last_name') }}" placeholder="@lang('lang.last_name')" required class="form-control @error('last_name') is-invalid @enderror">
                                            @error('last_name')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="field-set" style="background-size: cover;">
                                            <input type="text" placeholder="@lang('lang.enter_username')" name="username" value="{{ old('username') }}" required class="form-control @error('username') is-invalid @enderror">
                                            @error('username')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="field-set" style="background-size: cover;">
                                            <input type="text" placeholder="@lang('lang.username_email_address')" value="{{ old('email') }}" name="email" class="form-control @error('email') is-invalid @enderror" required>
                                            @error('email')
                                                <span class="text-danger  text-red" role="alert">
                                                    {{ @$message }}
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="field-set" style="background-size: cover;">
                                            <input type="numeric" placeholder="Numarul de telefon" name="phone" value="{{ old('phone') }}" required class="form-control @error('phone') is-invalid @enderror">
                                            @error('phone')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="field-set" style="background-size: cover;">
                                            <input name="password" id="password" type="password" placeholder="@lang('lang.enter_passowrd')"  class="form-control @error('password') is-invalid @enderror" required>
                                            @error('password')
                                                <span class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="field-set" style="background-size: cover;">
                                            <input type="password" name="password_confirmation" placeholder="@lang('lang.confirm_passowrd')" class="form-control @error('password_confirmation') is-invalid @enderror" required>
                                            @error('password_confirmation')
                                                <span  class="text-danger" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>                             
                                        <input type="hidden"  id="recaptcha_check" value="{{ re_captcha_settings('status') }}">
                                        @if (re_captcha_settings('status') == 1) 
                                            <div class="field-set" style="background-size: cover;">
                                                <label for="captcha">@lang('lang.re_captcha')</label>
                                                {!! NoCaptcha::renderJs() !!}
                                                {!! NoCaptcha::display() !!}
                                                <span class="text-danger">{{ $errors->first('g-recaptcha-response') }}</span>
                                            </div>
                                        @endif
                                        <div class="field-set" style="background-size: cover;">
                                              <button type="submit" class="btn btn-main btn-fullwidth color-2">@lang('lang.register')</button>
                                        </div>
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
@endpush