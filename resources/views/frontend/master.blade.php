
<!DOCTYPE html>
@if (Auth::check())
    @php
        if(userActiveLanguage()==null){
            App::setLocale(activeLanguage());
            $local= App::getLocale();
        }else{
            $local= userActiveLanguage();
        }
        
    @endphp
    @php
        $userdb = App\User::where('id', Auth::user()->id)->first();
        $userbg = $userdb->style_id;
        if($userbg == NULL){
            $bg = 'active-light-mode';
        }else{
            $bg = 'active-dark-mode';
        }
    @endphp
    <html dir="{{ $local=='ar'? 'rtl' :'ltl' }}" class="{{ $local=='ar'? 'rtl' :'ltl' }}" lang="{{ $local }}">
        @php
         App::setLocale(userActiveLanguage());
         $local=userActiveLanguage();
        
        @endphp
@else
@php
        $bg = 'active-dark-mode';
    @endphp
@php
    if( session()->get('guest_locale')!=null){
        App::setLocale(session()->get('guest_locale'));
        $local= App::getLocale();
    }else{
        $local= activeLanguage();
    }
    
@endphp

    <html dir="{{ checkRTL($local) }}" class="{{ checkRTL($local) }}" lang="{{$local!=null? $local: activeLanguage() }}">
        @php App::setLocale(App::getLocale()!=null? App::getLocale(): activeLanguage()); @endphp
@endif
{{-- {{dd($local)}} --}}
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>{{ @app('infix_general_settings')? app('infix_general_settings')->system_name :'Infix Market' }} | {{ @app('infix_general_settings')? app('infix_general_settings')->system_title :'Infix Digital Marketplace' }}</title>
    @if (Request::url() === url('/'))
        <meta name="description" content="{{ @app('infix_seo_settings')? app('infix_seo_settings')->description :'Infix Digital Market Place' }}">
        {{-- <meta name="viewport" content="width=device-width, initial-scale=1"> --}}
        
        <meta name="keywords" content="{{ @app('infix_seo_settings')? app('infix_seo_settings')->keyword :'HTML,CSS,XML,JavaScript' }}">
        <meta name="author" content="{{ @app('infix_seo_settings')? app('infix_seo_settings')->site_author :'Spondonit' }}">
    @endif
        <meta name="_token" content="{!! csrf_token() !!}"/>
    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="icon" href="{{url('/')}}/{{app('infix_background_settings')[1]->image}}" type="image/png"/>
    <!-- Place favicon.ico in the root directory -->
@if (Auth::check())
    @php
        $language_from=userActiveLanguage();
    @endphp
@else
    @php
        // $language_from=activeLanguage();
        $language_from=$local;
    @endphp
@endif
    <!-- CSS here -->
    {{-- {{dd($language_from)}} --}}
   



@php
    $home_page=Modules\Pages\Entities\InfixHomePage::first();
    if (file_exists($home_page->banner_image)) {
        $banner=$home_page->banner_image;
    } else {
        $banner=url('public/frontend/img/banner/banner-img-1.png');
    }
    
@endphp
     <style>
         .banner-area::after {
            background-image: url({{$banner}});
         }

     /* .banner-area::before, .banner-area2::before, .banner-area3::before, .banner-area4::before{
        background-image: -webkit-linear-gradient(90deg, {{@$banner_coller->color1}} 0%, {{@$banner_coller->color2}} 100%) !important;
     }
     .banner-area .search-field::before, .banner-area2 .search-field::before, .banner-area3 .search-field::before, .banner-area4 .search-field::before{
         background: {{@$banner_coller->color3}} !important;
     }  */
     </style>
  

<link rel="stylesheet" href="{{ asset('public/frontend/newassets') }}/assets/css/vendor/styleall.css">
<link rel="stylesheet" href="{{ asset('public/frontend/newassets') }}/assets/css/style.css">
<link rel="stylesheet" href="{{ asset('public/frontend/css/gdpr-cookie.css') }}">


     <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id={{googleAnalyticsData()->ga_site_tag_id}}"></script>
 
        <script>
            window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', '{{googleAnalyticsData()->ga_site_tag_id}}');
        </script>
</head>


<body id="body" class="template-color-1 {{$bg}}">
<input type="text" hidden  class="url" value="{{url('/') }}">
<input type="text" hidden  class="system_url" value="{{url('/') }}">
<input type="text" hidden  class="currencyIn" value="{{ @GeneralSetting()->currency_symbol }}">

   
@include('frontend.partials.header')
    <!-- header-area-end -->

    <!-- banner-area start -->
    @include('frontend.partials.banner') 
    <!-- banner-area end -->

    <!-- features-area-start -->
    @yield('content')
    <!-- latest-goods-end -->

   @include('frontend.partials.footer')

 <!-- JS here -->
 <script src="{{asset('public/js/app.js')}}"></script>
 
 <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/jquery.nice-select.min.js"></script>
 <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/jquery-ui.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/feather.min.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/slick.min.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/bootstrap.min.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/sal.min.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/wow.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/particles.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/count-down.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/counter-up.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/isotop.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/imageloaded.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/backtoTop.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/scrolltrigger.js"></script>
    <script src="{{ asset('public/frontend/newassets/') }}/assets/js/vendor/jquery.custom-file-input.js"></script>
 <script src="{{ asset('public/frontend/newassets/') }}/assets/js/main.js"></script>
<script src="{{ asset('public/frontend/js/') }}/vendor/modernizr-3.5.0.min.js"></script>
<script src="{{ asset('public/frontend/js/') }}/popper.min.js"></script>


<script src="{{ asset('public/frontend/js/') }}/ajax-form.js"></script>

<script src="{{ asset('public/frontend/js/') }}/plugins.js"></script>
<script src="{{ asset('public/frontend/js/') }}/chart.js"></script>
<script src="{{ asset('public/frontend/js/') }}/gijgo.min.js"></script>

<!--contact js-->
<!-- <script src="{{ asset('public/frontend/js/') }}/contact.js"></script>-->
<script src="{{ asset('public/frontend/js/') }}/jquery.ajaxchimp.min.js"></script>
<script src="{{ asset('public/frontend/js/') }}/jquery.form.js"></script>
<script src="{{ asset('public/frontend/js/') }}/image_loaded.js"></script>
<script src="{{ asset('public/frontend/js/') }}/jquery.validate.min.js"></script>
<script src="{{ asset('public/frontend/js/') }}/mail-script.js"></script>



<script src="{{ asset('public/js/')}}/additional.js"></script>
<script src="{{ asset('public/js/')}}/validate.js"></script>
<script src="{{asset('public/js/toastr.js')}}"></script>
<script src="{{asset('public/js/sweet-alert.js')}}"></script>
 <script src="{{asset('public/frontend/frontend.js')}}"></script>
 <script src="https://cdn.ckeditor.com/4.5.1/standard/ckeditor.js"></script>
{!! Toastr::message() !!}

<script src="{{asset('public/frontend/assets/js/easing.js')}}"></script>
<script src="{{asset('public/frontend/assets/js/validation.js')}}"></script>
<script src="{{asset('public/frontend/assets/js/enquire.min.js')}}"></script>
<script src="{{asset('public/frontend/assets/js/jquery.plugin.js')}}"></script>
<script src="{{asset('public/frontend/assets/js/jquery.lazy.min.js')}}"></script>
<script src="{{asset('public/frontend/assets/js/jquery.lazy.plugins.min.js')}}"></script>
<script src="{{asset('public/frontend/js/gdpr-cookie.js')}}"></script>

<script>
$.gdprcookie.init({
    title: "???? Accept cookieurile si politica de confidentialitate ?",
    message: "Folosim cookies pentru functionarea siteului. Nu impartasim cu nici un third party. Click the <strong>accept</strong> button below to see the optional callback in action??? <a href=#privacy>Example privacy link</a>",
    delay: 600,
    expires: 1,
    acceptBtnLabel: "Accept Cookie-uri",
});

$(document.body)
    .on("gdpr:show", function() {
        console.log("Cookie dialog is shown");
    })
    .on("gdpr:accept", function() {
        var preferences = $.gdprcookie.preference();
        console.log("Preferences saved:", preferences);
    })
    .on("gdpr:advanced", function() {
        console.log("Advanced button was pressed");
    });

if ($.gdprcookie.preference("marketing") === true) {
    console.log("This should run because marketing is accepted.");
}
</script>
<script>
$('#icon2').click(function(){
    $('#body').toggleClass('active-light-mode');
    $('#body').toggleClass('active-dark-mode');
    $('#iconita').toggleClass('fa fa-sun-o');
    $('#iconita').toggleClass('fa fa-moon-o');
    
});
    </script>
@stack('js')


 

</body>

</html>