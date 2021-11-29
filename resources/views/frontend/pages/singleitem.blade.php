@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/item.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/single_item.css">
@endpush
@php
$infix_general_settings = GeneralSetting();
@endphp

@section('content')
@include('frontend.partials.itemHeader')
<!-- details-tablist-start -->
@php
use Carbon\Carbon;
$dt     = Carbon::now();
$img = explode(",",@$data['item']->item_image->image);
if (Str::contains($_SERVER['REQUEST_URI'], 'mail-sent')) {
$overview='';
$overview_content='';
$support='active';
$support_content='active show';
$comment='';
$comment_content='';
} else if(Str::contains($_SERVER['REQUEST_URI'], 'comment')) {
$overview='';
$overview_content='';
$support='';
$support_content='';
$comment='active';
$comment_content='active show';
}else{
$overview='active';
$overview_content='active show';
$support='';
$support_content='';
$comment='';
$comment_content='';
}
@endphp

<style>
   .over_view_thumb{
      background-image: url({{ file_exists(@$data['item']->icon) ? asset(@$data['item']->icon) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }} );
   }
   .theme-logo img {
    width: 34px;
    height: auto;
    border-radius: 50%;
}
.userbg{
   border-radius: 50px;
    margin-top: -93px!important;
    padding: 9px;
    height: 55px;
    -webkit-box-shadow: 0px 0px 1px 0px rgb(50 50 50 / 25%)!important;
    -moz-box-shadow: 0px 0px 1px 0px rgba(50, 50, 50, 0.25)!important;
    box-shadow: 0px 0px 1px 0px rgb(50 50 50 / 25%)!important;
    width: auto;
}
.userbg2{
   border-radius: 50px;
    padding: 9px;
    height: 55px;
    margin-bottom: 10px;
}
.profile-name{
   margin-bottom: 0px!important;
}
.footeruserborder{
   height: 1px!important;
   width: 100%!important;
}
.theme-logo2 img {
    width: 134px!important;
    height: auto!important;
    border-radius: 50%!important;
}
.theme-side-bar2{
   width: 50%!important;
}
.single-info-inner .single-info-title p {
    line-height: 35px!important;
    margin-bottom: 0px!important;
}
.single-info-inner .single-info-content p {
    line-height: 35px!important;
    margin-bottom: 0px!important;
}
.main-details-area2{
   padding-left: 100px;
   padding-right: 100px;
   padding-bottom: 20px;
}
.footer-area .footer-top {
    padding-top: 50px;
    padding-bottom: 25px;
    display: none;
}
.theme-side-bar .single-side-bar .light-lisence-wrap .light-pakage-list ul li::before {
    content: "";
    width: 14px;
    height: 14px;
    position: absolute;
    left: 0;
    top: 5px;
    background-image: url(../img/theme-details/icon/Check.png);
    background-size: cover;
    background-position: center;
    display: none;
}
.theme-side-bar .single-side-bar .light-lisence-wrap .light-pakage-list ul li {
    overflow: hidden;
    position: relative;
    padding-left: 0px;
    margin-bottom: 14px;
}
.theme-side-bar .single-side-bar .add-cart .boxed-btn-white {
    display: block;
    text-align: center;
    background: #000;
    color: #FFF!important;
}
.theme-side-bar .single-side-bar .side-bar-heading h4 {
    color: #000;
}
.gray-bg {
    background-color: rgb(242, 242, 242);
}
.main-details-area2 {
    -webkit-box-shadow: 0px -3px 14px 0px rgb(50 50 50 / 75%);
    -moz-box-shadow: 0px -3px 14px 0px rgba(50, 50, 50, 0.75);
    box-shadow: 0px 33px 34px 0px rgb(0 0 0 / 75%);
    z-index: 999999999999;
}
.theme-side-bar .single-side-bar .add-cart {
    padding-top: 27px;
    border-top: 1px solid #d9d9d9;
}
.userbg2 {
    border-radius: 50px;
    padding: 9px;
    height: 55px;
    -webkit-box-shadow: 0px 0px 1px 0px rgb(255 255 255 / 55%)!important;
    -moz-box-shadow: 0px 0px 1px 0px rgba(255, 255, 255, 0.55)!important;
    box-shadow: 0px 0px 1px 0px rgb(255 255 255 / 55%)!important;
    background: rgba(0,0,0,0, 0.03);
    margin-bottom: 10px;
}
.svgclass{
   margin-top: 10px;
    float: right;
    margin-right: 20px;
}
.span2s{
   position: absolute;
    left: 0px;
    top: 9px;
    width: 200px;
}
.svgclassicon{
   margin-top: 0px;
    margin-left: 13px;
}
.spansvg{
   width: auto!important;
    float: none!important;
    display: inline!important;
    position: relative!important;
    top: 0px!important;
    left: 9px!important;
}
.spansvg2{
   width: auto!important;
    float: none!important;
    display: inline!important;
    position: relative!important;
    top: -8px!important;
    left: 9px!important;
}
.coloanaspeciala{
   float: right!important; 
   padding-right: 15px!important;
   text-align: right;
}
.theme-side-bar1.theme-side-bar3 {
    padding: 34px 40px;
    padding-left: 0px;
}
footer{
   padding: 0px;
}
.text3randuri{
   overflow: hidden;
   text-overflow: ellipsis;
   display: -webkit-box;
   -webkit-line-clamp: 3; /* number of lines to show */
   -webkit-box-orient: vertical;
}
.banner-area3::before{
   z-index: -2!important;
}
.light-scheme .fundalspc{
   background-color: #eee;
}
.dark-scheme .fundalspc{
   background-color: rgb(33, 39, 62);
}
.single-info-inner .single-info-title p {
    line-height: 35px!important;
    margin-bottom: 0px!important;
}
.dark-scheme .single-info-inner .single-info-title p {
    color: #FFF!important;
}
.light-scheme .single-info-inner .single-info-title p {
    color: #000!important;
}

.dark-scheme .userbg2{
   -webkit-box-shadow: 0px 0px 1px 0px rgb(255 255 255 / 95%)!important;
    -moz-box-shadow: 0px 0px 1px 0px rgba(255, 255, 255, 0.95)!important;
    box-shadow: 0px 0px 1px 0px rgb(255 255 255 / 95%)!important;
}
.light-scheme .userbg2{
   -webkit-box-shadow: 0px 0px 1px 0px rgb(0 0 0 / 95%)!important;
    -moz-box-shadow: 0px 0px 1px 0px rgba(0 0 0, 0.95)!important;
    box-shadow: 0px 0px 1px 0px rgb(0 0 0/ 95%)!important;
}
.light-scheme .span2s{
    color: #000;
}
.dark-scheme .span2s{
    color: #e1e1e1;
}
.dark-scheme .theme-side-bar13 {
   background-color: #2A2E44;
}
.light-scheme .theme-side-bar13 {
   background-color: #e2e2e2;
}
.dark-scheme .theme-side-bar12 {
   background-color: #2A2E44;
}
.light-scheme .theme-side-bar12 {
   background-color: #e2e2e2;
}
.dark-scheme .colordf {
   color: #fff; 
}
.light-scheme .colordf {
   color: #000; 
}
.dark-scheme .userbg{
    background: #2A2E44;
    color: #FFF;
}
.light-scheme .userbg{
    background: #e2e2e2;
    color: #000;
}
.light-scheme .h4c{
    color: #000!important;
}
.dark-scheme .h4c{
    color: #fff!important;
}
.dark-scheme .footeruserborder{
   background: rgb(217, 217, 217)!important;
}
.light-scheme .footeruserborder{
   background: rgb(0, 0, 0)!important;
}
.pwidthlung{
   width: 300px;
}
@media only screen and (max-width: 767px) {
.col50{
   width: 50%!important;
}
.pl-15{
   padding-left: 15px!important;
}
.theme-logo2 img {
    width: 90px!important;
    height: auto!important;
    border-radius: 50%!important;
}
.theme-side-bar2 {
    width: 100%!important;
}
.h1author{
   font-size: 27px!important;
}
.h3creator{
   padding-top: 50px;
   font-size: 27px!important;
   margin-bottom: 3px;
}
}
</style>
<!-- details-tablist-end -->
<!-- main-details-area-start -->
<div class="main-details-area section-padding main-details-area2 fundalspc">
   <div class="container">
      <div class="row">
         <div class="col-xl-8 col-lg-8">
          
            <div class="row">
               @if (@$data['item']->user->balance->amount)                                           
                  <div class="theme-side-bar userbg">
                     <div class="profile-linking">
                        <div class="profile-name">
                           <div class="theme-logo">
                              <img src="{{ @$data['item']->user->profile->image? asset(@$data['item']->user->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                           </div>
                           <div class="theme-info">
                                 <a href="{{ route('user.portfolio',@$data['item']->user->username)}}"><h4 class="h4c" style="margin-top: 5px;"><span>@</span>{{ @$data['item']->user->username}}</h4> </a>
                           </div>
                        </div>
                     </div>
                  </div>
               @endif
            </div>
            <div class="row">
               <p><span>Informatii</span></p> <br />
            </div>
            <div class="row">
               <p>{!! @$data['item']->description !!}</p>
            </div>
            <div class="row">
            <div class="theme-side-bar1 theme-side-bar3 mt-20 themesidebarcustom">
               <div class="theme-detils-info">
                  <div class="single-info">
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title  single-info-column">
                           <p><svg class="svgclassicon" width="22" height="22" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
<g>
	<g>
		<path fill="currentColor" d="M436.494,282.174l-20.377-15.098c2.325-15.684,2.343-31.45,0.051-46.996l20.326-15.061
			c2.956-2.19,4.042-6.111,2.634-9.509l-19.635-47.401c-1.408-3.399-4.952-5.405-8.586-4.861l-25.022,3.723
			c-9.373-12.613-20.532-23.748-33.269-33.196l3.734-25.086c0.541-3.639-1.463-7.179-4.861-8.586l-47.401-19.633
			c-3.398-1.408-7.32-0.322-9.509,2.634l-4.908,6.623V25.119C289.67,11.268,278.402,0,264.551,0h-17.102
			c-13.851,0-25.119,11.268-25.119,25.119v44.607l-4.908-6.624c-2.189-2.956-6.11-4.041-9.509-2.634l-47.401,19.633
			c-3.399,1.408-5.403,4.948-4.861,8.586l3.723,25.023c-12.612,9.373-23.747,20.531-33.194,33.268l-25.086-3.733
			c-3.64-0.543-7.179,1.463-8.586,4.861l-19.635,47.401c-1.408,3.399-0.322,7.32,2.634,9.509l20.377,15.098
			c-2.325,15.684-2.342,31.45-0.051,46.996l-20.326,15.061c-2.956,2.19-4.042,6.111-2.634,9.509l19.635,47.402
			c1.408,3.399,4.952,5.404,8.586,4.861l25.023-3.723c9.373,12.613,20.531,23.748,33.268,33.196l-3.734,25.086
			c-0.541,3.638,1.463,7.179,4.861,8.586l47.401,19.635c3.399,1.408,7.32,0.322,9.509-2.634l4.908-6.624v1.005
			c0,0.78,0.113,1.556,0.338,2.303l25.653,85.512C249.339,509.677,252.46,512,256,512c3.54,0,6.661-2.323,7.679-5.713l25.653-85.512
			c0.224-0.747,0.338-1.523,0.338-2.303v-1.005l4.908,6.624c1.548,2.09,3.961,3.245,6.443,3.245c1.028,0,2.069-0.199,3.066-0.61
			l47.401-19.635c3.399-1.408,5.403-4.948,4.861-8.586l-3.723-25.023c12.613-9.373,23.749-20.533,33.196-33.268l25.085,3.733
			c3.64,0.543,7.179-1.463,8.586-4.861l19.634-47.401C440.536,288.285,439.45,284.364,436.494,282.174z M238.363,25.119
			c0-5.01,4.076-9.086,9.086-9.086h17.102c5.01,0,9.086,4.076,9.086,9.086v17.637h-35.273V25.119z M238.363,58.789h35.273v23.934
			c-11.777-1.315-23.577-1.331-35.273-0.049V58.789z M222.33,303.75c-13.41-7.526-24.082-19.421-30.025-33.77
			c-13.5-32.592-0.047-69.723,30.025-86.53V303.75z M256,476.084l-14.879-49.596h29.757L256,476.084z M273.637,410.455h-35.273
			V176.963c11.837-3.14,23.967-2.982,35.273,0.026V410.455z M223.481,165.088c-43.29,17.932-63.92,67.739-45.989,111.028
			c8.448,20.398,24.65,36.771,44.838,45.5v19.482c-27.974-9.609-50.177-30.385-61.626-58.028
			c-21.765-52.547,3.277-113.005,55.824-134.769c52.547-21.765,113.003,3.276,134.769,55.823c10.544,25.455,10.544,53.492,0,78.946
			c-10.544,25.455-30.368,45.279-55.823,55.824c-1.909,0.79-3.849,1.513-5.803,2.189v-19.487h-0.001
			c20.412-8.802,36.313-24.898,44.839-45.479c8.686-20.971,8.686-44.068,0-65.039C316.577,167.789,266.771,147.159,223.481,165.088z
			 M289.67,303.749v-120.26c13.065,7.301,23.867,18.856,30.025,33.725c7.047,17.014,7.047,35.753,0,52.767
			C313.691,284.476,303.171,296.225,289.67,303.749z M407.076,327.167l-23.731-3.531c-3.015-0.449-6.021,0.85-7.761,3.351
			c-9.92,14.259-22.095,26.459-36.185,36.261c-2.501,1.74-3.8,4.747-3.351,7.761l3.521,23.665l-35.836,14.844l-14.063-18.982V357.93
			c4.039-1.196,8.039-2.608,11.938-4.223c29.412-12.182,52.318-35.09,64.5-64.5c12.182-29.411,12.182-61.807,0-91.217
			c-25.149-60.714-95.005-89.648-155.719-64.5c-60.714,25.148-89.649,95.003-64.501,155.719
			c13.937,33.648,41.659,58.492,76.44,68.717v32.613l-14.065,18.981l-35.836-14.844l3.532-23.73c0.448-3.013-0.85-6.021-3.351-7.761
			c-14.259-9.922-26.459-22.096-36.261-36.185c-1.74-2.501-4.747-3.801-7.761-3.351l-23.665,3.521l-14.844-35.836l19.223-14.243
			c2.449-1.814,3.657-4.859,3.118-7.859c-3.031-16.894-3.014-34.13,0.053-51.227c0.538-2.999-0.669-6.044-3.118-7.857
			l-19.278-14.284l14.844-35.836l23.73,3.531c3.013,0.448,6.02-0.85,7.76-3.35c9.923-14.26,22.097-26.46,36.185-36.261
			c2.501-1.739,3.8-4.747,3.351-7.76l-3.521-23.665l35.836-14.844l14.244,19.224c1.814,2.449,4.857,3.656,7.857,3.118
			c16.892-3.031,34.127-3.014,51.227,0.053c2.997,0.538,6.042-0.67,7.856-3.118l14.284-19.278l35.836,14.844l-3.532,23.732
			c-0.448,3.013,0.85,6.02,3.351,7.76c14.26,9.922,26.459,22.096,36.261,36.185c1.74,2.501,4.749,3.802,7.761,3.351l23.665-3.521
			l14.844,35.835l-19.223,14.244c-2.449,1.814-3.657,4.858-3.118,7.857c3.031,16.895,3.014,34.13-0.053,51.227
			c-0.538,2.999,0.669,6.044,3.118,7.857l19.277,14.284L407.076,327.167z"/>
	</g>
</g>
</svg> <span class="spansvg">@lang('lang.Created')</span></p>
                        </div>
                        <div class="single-info-content single-info-column coloanaspeciala">
                           <p> {{ DateFormat(@$data['item']->created_at)}}</p>
                        </div>
                     </div>
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title  single-info-column">
                           <p><svg width="22" height="22" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-13o7eu2 svgclassicon"><path fill="currentColor" d="M4.364 9.999a.89.89 0 01.895-.89l1.482.004a.891.891 0 01.891.892v5.607c.167-.05.381-.102.616-.157a.743.743 0 00.572-.723V7.776a.892.892 0 01.892-.892h1.485a.891.891 0 01.891.892v6.456s.372-.15.734-.304a.744.744 0 00.454-.685V5.547a.891.891 0 01.892-.891h1.485a.891.891 0 01.891.891v6.337c1.288-.933 2.593-2.056 3.628-3.406A1.496 1.496 0 0020.4 7.08 10.483 10.483 0 0010.632 0C4.811-.077 0 4.677 0 10.501a10.47 10.47 0 001.394 5.252 1.327 1.327 0 001.266.656c.28-.024.63-.06 1.046-.108a.742.742 0 00.659-.737V9.999M4.332 18.991a10.493 10.493 0 0016.641-9.21c-3.834 5.721-10.915 8.396-16.64 9.21" fill="#1A1A1A"></path></svg> <span class="spansvg">Vezi pe Etherscan</span></p>
                        </div>
                        <div class="single-info-content single-info-column">
                        <p> <svg viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="css-13o7eu2 svgclass"><path fill="currentColor" d="M15 0H8v2h4.6L6.3 8.3l1.4 1.4L14 3.4V8h2V1c0-.6-.4-1-1-1z" fill="currentColor"></path><path d="M14 16H1c-.6 0-1-.4-1-1V2c0-.6.4-1 1-1h4v2H2v11h11v-3h2v4c0 .6-.4 1-1 1z" fill="currentColor"></path></svg></p>
                        </div>
                     </div>
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title  single-info-column">
                           <p><svg viewBox="0 0 26 20" fill="none" xmlns="http://www.w3.org/2000/svg" width="25" height="19" class="css-13o7eu2 svgclassicon"><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M3.396 9.535a.814.814 0 000 .93c.749 1.06 2.03 2.657 3.71 3.98C8.791 15.77 10.788 16.75 13 16.75c2.211 0 4.208-.98 5.893-2.306 1.681-1.322 2.962-2.92 3.71-3.98a.814.814 0 000-.929c-.748-1.06-2.029-2.657-3.71-3.98C17.208 4.23 15.211 3.25 13 3.25c-2.212 0-4.209.98-5.894 2.306-1.68 1.322-2.961 2.92-3.71 3.98zM5.56 3.591C7.5 2.065 10.03.75 13 .75c2.97 0 5.499 1.315 7.439 2.84 1.943 1.53 3.384 3.339 4.209 4.506l.003.005a3.315 3.315 0 010 3.798l-.003.005c-.825 1.167-2.266 2.977-4.209 4.505-1.94 1.526-4.47 2.841-7.44 2.841-2.969 0-5.499-1.315-7.439-2.84-1.942-1.53-3.384-3.339-4.208-4.506l-.004-.005a3.314 3.314 0 010-3.798l.004-.005C2.176 6.929 3.618 5.119 5.56 3.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13 7.25a2.75 2.75 0 100 5.5 2.75 2.75 0 000-5.5zM7.75 10a5.25 5.25 0 1110.5 0 5.25 5.25 0 01-10.5 0z" fill="currentColor"></path></svg> <span class="spansvg">Vezi pe IPFS</span></p>
                        </div>
                        <div class="single-info-content single-info-column">
                        <p> <svg viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="css-13o7eu2 svgclass"><path fill="currentColor" d="M15 0H8v2h4.6L6.3 8.3l1.4 1.4L14 3.4V8h2V1c0-.6-.4-1-1-1z" fill="currentColor"></path><path d="M14 16H1c-.6 0-1-.4-1-1V2c0-.6.4-1 1-1h4v2H2v11h11v-3h2v4c0 .6-.4 1-1 1z" fill="currentColor"></path></svg></p>
                        </div>
                     </div>
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title  single-info-column">
                           <p><svg width="22" height="22" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-13o7eu2 svgclassicon"><path fill="currentColor" d="M19.21 5.222L10.639.936a1.428 1.428 0 00-1.279 0L.789 5.222A1.431 1.431 0 000 6.5v10c0 .54.306 1.035.79 1.278l8.571 4.286a1.43 1.43 0 001.278 0l8.571-4.286A1.43 1.43 0 0020 16.5v-10a1.43 1.43 0 00-.79-1.278zM10 3.812L15.377 6.5 10 9.189 4.623 6.501 10 3.81zm-7.143 5l5.714 2.857v6.806l-5.714-2.857V8.812zm8.572 9.663v-6.806l5.714-2.857v6.806l-5.714 2.857z" fill="#000"></path></svg> <span class="spansvg"> Vezi IPFS Metadata </span></p>
                        </div>
                        <div class="single-info-content single-info-column">
                           <p> <svg viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="css-13o7eu2 svgclass"><path d="M15 0H8v2h4.6L6.3 8.3l1.4 1.4L14 3.4V8h2V1c0-.6-.4-1-1-1z" fill="currentColor"></path><path fill="currentColor" d="M14 16H1c-.6 0-1-.4-1-1V2c0-.6.4-1 1-1h4v2H2v11h11v-3h2v4c0 .6-.4 1-1 1z"></path></svg></p>
                        </div>
                     </div>
                     {{-- DYNAMIC ATTRIBUTE PRINTS  --}}
                     @if(@$data['attributes'])
                        @foreach($data['attributes'] as $key=>$value)
                           <div class="single-info-inner userbg2">
                              <div class="single-info-title single-info-column">
                                 <p>{{getAttributeName($value->field_name)}}</p>
                              </div>
                              <div class="single-info-content single-info-column">
                                 <p>{{getAttributeValues($value->values)}}</p> 
                              </div>
                           </div>
                        @endforeach
                     @endif
                     {{--END DYNAMIC ATTRIBUTE PRINTS  --}}

                     {{-- <div class="single-info-inner userbg2">
                        <div class="single-info-title single-info-column">
                           <p>@lang('lang.Documentation')</p>
                        </div>
                        <div class="single-info-content single-info-column">
                           <p>@lang('lang.Well') @lang('lang.Documented')</p>
                        </div>
                     </div>
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title single-info-column">
                           <p>@lang('lang.Layout')</p>
                        </div>
                        <div class="single-info-content single-info-column">
                           <p>{{  @$data['item']->layout }}</p>
                        </div>
                     </div> --}}

                     <div class="single-info-inner userbg2">
                        <div class="single-info-title single-info-column">
                           <p><svg class="svgclassicon" width="22" height="22" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512.001 512.001" style="enable-background:new 0 0 512.001 512.001;" xml:space="preserve"><g><g><path fill="currentColor" d="M506.513,311.066L253.87,58.423c-2.024-2.026-4.486-3.559-7.195-4.483L140.15,17.593
			c-6.758-2.305-14.242-0.568-19.294,4.483L84.709,58.222L31.977,5.491c-7.314-7.315-19.176-7.315-26.49,0
			c-7.315,7.315-7.315,19.175,0,26.49l52.732,52.731l-36.14,36.141c-5.051,5.05-6.79,12.534-4.483,19.294L53.943,246.67
			c0.924,2.71,2.458,5.172,4.483,7.197L311.071,506.51c7.314,7.315,19.175,7.315,26.49,0l168.954-168.954
			C513.83,330.241,513.83,318.382,506.513,311.066z M227.241,227.238c-21.817,21.819-57.132,21.82-78.952,0
			c-21.768-21.768-21.768-57.185,0.001-78.953c21.817-21.819,57.132-21.82,78.953,0C249.009,170.053,249.009,205.47,227.241,227.238
			z"/></g></g></svg> <span class="spansvg">@lang('lang.Tags')</span></p>
                        </div>
                        <div class="single-info-content single-info-column coloanaspeciala">
                           <p>{{  @$data['item']->tags }}</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            </div>
         </div>


               <div class="col-xl-4 col-lg-4">
                  <div class="theme-side-bar-wrap">
                     @if (@$data['item']->free == 1)
                     <div class="theme-side-bar gray-bg mb-5">
                        <div class="single-side-bar">
                           @if (Auth::check())
                           <div >
                              <a class="boxed-btn w-100" href="{{ route('user.FreeItemDownloadAll',@$data['item']->id) }}" >@lang('lang.download') </a>
                              {{--  
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                 <a class="dropdown-item" href="{{ route('user.FreeItemDownloadAll',@$data['item']->id) }}">All files & documentation</a>
                                 <a class="dropdown-item" href="{{ route('user.FreeProductDownload',@$data['item']->id) }}">Installable file only</a>
                                 <a class="dropdown-item" href="{{ route('user.FreeLicenceDownload',@$data['item']->id) }}">License certificate & purchase code (pdf)</a>
                              </div>
                              --}}
                           </div>
                           @else                                                        
                           <a href="{{ url('customer/login') }}"  class="boxed-btn w-100" id="BuyCart">@lang('lang.sign_in_to_download_it_for_free')</a>
                           @endif                                                    
                           <div class="light-lisence-wrap pt-3">
                              <div class="light-pakage-list">
                                 <ul>
                                    <li>
                                       <p>@lang('lang.this_is_free_item_file_of_the_month') {{date('M')}} !
                                          @lang('lang.by_downloading_this_item')
                                       </p>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                     @endif
                     @if (@$data['item']->active_status == 1)
                     <div class="theme-side-bar theme-side-bar13">
                        <div class="single-side-bar">
                           <div
                              class="side-bar-heading d-flex justify-content-between align-items-center mt-2">
                              {{-- <h4> <span id="license_type">@lang('lang.Regular') @lang('lang.License')</span>  <i class="ti-angle-down licenseShow" ></i> </h4>
                              <span class="Reg_total" id="Reg_total">{{@$infix_general_settings->currency_symbol}}{{ @$data['item']->Re_item}}</span>
                              <input type="text" class="_total" id="_total" value="{{ @$data['item']->Re_item}}" hidden>
                              <input type="hidden" value="{{@$infix_general_settings->currency_symbol}}" id="currency_symbol"> --}}
                              <!-- <h4> Pret </h4>  -->
                           </div>
                           <form action="{{ route('AddBuy') }}" method="POST">
                              @csrf
                              <div class="light-lisence-wrap">
                                 <div class="light-pakage-list">
                                    {{-- {!! $item_support->long_description !!} --}}
                                  
                                    <ul id="license_list">
                                       <li>
                                          <div class="row">
                                          <!-- aici sunt preturile afisate -->
                                             <div class="col-lg-6 col50"> 
                                                <strong class="" style="font-size: 20px;"><input type="text" id="pretInEth" style="color: #9fa4dd!important; border: 0px; border-radius: 0px; background: transparent; width: 70px; padding-left: 0px; font-weight: 800; padding-right: 0px;" readonly>
                                                   <span id="regular_license_price">ETH</span>
                                                </strong> <br />
                                                <strong class="colordf" style="font-size: 13px;">{{ @$data['item']->Re_item}} 
                                                   <span id="regular_license_price">{{@$infix_general_settings->currency_symbol}}</span>
                                                </strong>
                                             </div>
                                             <div class="col-lg-6 col50 pl-15" style="border-left: 1px solid #d9d9d9;">
                                                <strong class="" style="color: #878888; font-size: 13px;">Acest NFT<br /> are un pret fix.
                                                </strong>
                                             </div>
                                             <div class="col-lg-6">
                                                <input type="hidden" id="normal_regular_price" value="{{ @$data['item']->Re_item}}">
                                                <input type="radio" hidden class="price_option" data-default_price="{{ @$data['item']->Re_item}}" data-type="regular_license_price" data-normal="normal_regular_price" checked name="list_item_price" value="{{ @$data['item']->Re_item}}">
                                             </div>
                                          </div>
                                       </li>
                                    </ul>
                                  
                                 </div>
  
                                 <input type="text" hidden id="buy_license_type"  name="buy_license_type" value="1">
                                 <input type="text" hidden  name="_item_id" value="{{ @$data['item']->id}}">
                                 <input type="text" hidden  name="_item_percent" value="{{ @$data['BuyerFee']->fee/100}}">
                                 <input type="text" hidden  id="totalVal" name="totalVal" value="{{ @$data['item']->Re_item}}">
                                 <input type="text" hidden id="extra_price"  value="0">
                                
                                 <div class="add-cart">
                                    @php 
                                       $drop_id = $data['item']->in_drop;
                                       $drop = App\Drops::where('id', $drop_id)->first();
                                       $azi = \Carbon\Carbon::now();
                                    @endphp
                                    @if (@$data['item']->is_upload==1)
                                     @if (@$data['item']->in_drop == NULL)
                                       <button  type="submit" class="boxed-btn-white" style="background: var(--secondary-color);" >@lang('lang.Buy') @lang('lang.Now') </button>
                                       @elseif ((@$data['item']->in_drop) && (@$drop->startdate <= $azi) && (@$drop->expdate >= $azi) )
                                       <p>NFT ESTE IN DROP SI DROPUL ESTE IN DERULARE</p>
                                       <button  type="submit" class="boxed-btn-white" style="background: var(--secondary-color);" >@lang('lang.Buy') @lang('lang.Now') </button>
                                       @else
                                       <p>NFT este in drop iar dropul nu a inceput inca</p>
                                       @endif
                                    @else
                                    <a  href="{{@$data['item']->purchase_link}}" target="_blank" class="boxed-btn add-cart-active" style="background: var(--secondary-color);">@lang('lang.Buy') @lang('lang.Now')</a>
                                   
                                    @endif
                                 
                                 </div>
                                
                              </div>
                           </form>
                           
                           <div class="lisence-wrap" id="isence-wrap">
                              <a href="javascript:void(0)"  id="regularLi" onclick="regularLicence();">
                                 <div class="lisence-inner">
                                    <div
                                       class="lisence-heading d-flex justify-content-between align-items-center">
                                       <h5>@lang('lang.Regular') @lang('lang.License')</h5>
                                       <span id="reguler_price">{{@$infix_general_settings->currency_symbol}}{{ @$data['item']->Re_item}}</span>
                                    </div>
                                    <p>@lang('lang.regular_license_description').</p>
                                 </div>
                              </a>
                              <div class="separator-1"></div>
                              <a href="javascript:void(0)"  id="extendedLi" onclick="extendedLicence();">
                                 <div class="lisence-inner">
                                    <div
                                       class="lisence-heading d-flex justify-content-between align-items-center">
                                       <h5>@lang('lang.extended') @lang('lang.License')</h5>
                                       <span id="extended_price">{{@$infix_general_settings->currency_symbol}}{{ @$data['item']->Ex_total}}</span>
                                    </div>
                                    <p>@lang('lang.extended_license_description').</p>
                                 </div>
                              </a>
                              <a href="{{url('license')}}">  <button class="boxed-btn d-block w-100 mt-3">@lang('lang.view_license_details')</button></a>
                           </div>
                        </div>
                     </div>
                   @endif
                     <div class="theme-side-bar1 mt-20 theme-side-bar12" >
                        <div class="download-comments d-flex justify-content-between align-items-center">
                           <h3 class="d-flex align-items-center" style="color: #777777!important; margin-bottom: 0px;"> <i class="ti-shopping-cart"></i> @lang('lang.sales')</h3>
                           <span>{{ @$data['item']->sell }}</span>
                        </div>
                     </div>
                     <br />
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title single-info-column">
                           <p class="pwidthlung"> <img style="width: 30px; border-radius: 50%;" src="{{ @$data['item']->user->profile->image? asset(@$data['item']->user->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                           <span class="spansvg2">Listat de <a href="{{ route('user.portfolio',@$data['item']->og->username)}}"><span>@</span>{{ @$data['item']->og->username }} </a>
                           <span class="span2s">{{ @$data['item']->created_at}}</span>
                           </p>
                        </div>
                        <div class="single-info-content single-info-column coloanaspeciala">
                           <p >{{ @$data['item']->og_price ?? ''}} lei</p>
                        </div>
                     </div>

                     @foreach ($data['history'] as $his)
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title single-info-column">
                           <p> <img style="width: 30px; border-radius: 50%;" src="{{ @$data['item']->user->profile->image? asset(@$data['item']->user->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                           <span class="spansvg2">Cumparat de <a href="{{ route('user.portfolio',$his->cumparator->username)}}"><span>@</span>{{ $his->cumparator->username}} </a>
                           <span class="span2s">{{ $his->created_at}}</span>
                           </p>
                        </div>
                        <div class="single-info-content single-info-column coloanaspeciala">
                           <p >{{ $his->subtotal}} lei</p>
                        </div>
                     </div>
                     @endforeach

                     @php
                     // @$totalRate =DB::table('reviews')->where('item_id', @$data['item']->id)->get();
                     // @$rate5 =DB::table('reviews')->where('item_id', @$data['item']->id)->whereBetween('rating',[4.5,5])->get();
                     if (@$rate5->count() > 0 ) {
                     @$rateparcent5= number_format((float)count(@$rate5)/count(@$totalRate)*100, 2, '.', '');
                     } else {
                     @$rateparcent5=0;
                     }                                                
                     @endphp
                    
                  
                  </div>
               </div>
            </div>
            <div class="row">
            <h3 class="h3creator">Creator</h3>
            <div class="footeruserborder">
            </div>
               @if (@$data['item']->user->balance->amount)                                           
               <div class="theme-side-bar mt-20 theme-side-bar2">
                  <div class="profile-linking">
                     <div class="profile-name">
                        <div class="theme-logo theme-logo2">
                           <img src="{{ @$data['item']->user->profile->image? asset(@$data['item']->user->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                        </div>
                        <a href="{{ route('user.portfolio',@$data['item']->user->username)}}">
                        <div class="theme-info">
                           <h1 class="h1author" style="margin-bottom: 0px; margin-top: 15px;">{{ @$data['item']->user->full_name}}</h1>
                           <h3><span>@</span>{{ @$data['item']->user->username}}</h3>
                           </a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="theme-side-bar mt-20 theme-side-bar2 themesidebardreapta">
                  <div class="profile-linking">
                     <div class="profile-name">
                     <div class="theme-logo">
                            
                     <div class="icons">
                              <img height="auto" width="40"  src="{{asset(@$level->icon)}}" data-toggle="tooltip" data-placement="bottom" title="" alt="">
                              <img height="auto" width="40" src="{{asset(@$badge->icon)}}" data-toggle="tooltip" data-placement="bottom" title="{{ @$level->id-1}} {{@$badge->id == 1? 'Year' :'Years' }} of membarship on {{ @GeneralSetting()->system_name }} " alt="">
                           </div>
                        </div>
                        <div class="theme-info text3randuri">
                          
                           <h6> {!! @$data['item']->user->profile->about !!} </h6>
                        </div>
                     </div>
                  </div>
               </div>
               @endif
            </div>
         </div>
      </div>
   </div>
</div>
{{-- {{@$infix_general_settings->currency_symbol}} --}}
<form id="test-form" class="white-popup-block mfp-hide add_lisence_popup" action="{{ route('AddCartItem')}}" method="POST">
   @csrf
   <div class="form_header">
      @foreach (Cart::content()->unique('item_id') as $item)
      @if (@$data['item']->id == @$item->options['item_id'])
      <div class="alert alert-info" role="alert"> 
         <i class="ti-check"></i> @lang('lang.Already_Added_This_Item')
      </div>
      @endif
      @endforeach
      <h1>@lang('lang.Customize_your_selection')</h1>
      <input type="number" hidden id="item_id" name="id" value="{{  $data['item']->id }}">
      <input type="text" hidden  id="item_price" name="item_price" value="{{  $data['item']->Re_item }}">
      <input type="text" hidden  name="item_name" value="{{  $data['item']->title }}">
      <input type="text" hidden  name="description" value="{{  $data['item']->description }}">
      <input type="text" hidden  name="user_id" value="{{  $data['item']->user_id }}">
      <input type="text" hidden  name="username" value="{{  $data['item']->user->username }}">
      <input type="text" hidden  name="image" value="{{  $data['item']->thumbnail }}">
      <input type="text" hidden  name="icon" value="{{  $data['item']->icon }}">
      <input type="text" hidden id="BuyerFee" name="BuyerFee" value="0">
      {{-- <input type="number" hidden id="_mod_total"  value="{{  $data['item']->Re_item }}"> --}}
      <input type="text" hidden id="Extd_total" value="{{  $data['item']->Ex_total }}">
   </div>
   <input type="text" hidden  id="pop_license_type" value="1" name="license_type">
   <input type="text" hidden  id="pop_support_time" value="1" name="support_time">
   <div class="row d-none">
      <div class="col-xl-6">
         <div class="single_select">
            <h4>@lang('lang.Select_a_License')</h4>
            <div class="select_box">
               <select class="wide SelectLicense" id="SelectLicense" >
                  <option id="reg_val" value="1" data-display="Regular">@lang('lang.Regular')</option>
                  <option id="Ex_val" value="2">@lang('lang.Extended')</option>
               </select>
            </div>
         </div>
      </div>
      <div class="col-xl-6">
         <div class="single_select">
            <h4>@lang('lang.select') @lang('lang.Support') @lang('lang.duration')</h4>
            <div class="select_box">
               <select class="wide Selectsupport" id="Selectsupport" >
                  <option value="1" id="six" data-display="6 months support">6 @lang('lang.months') @lang('lang.support')</option>
                  <option value="2" id="twelve">12 @lang('lang.months') @lang('lang.support')</option>
               </select>
            </div>
         </div>
      </div>
   </div>
   <div class="main_content">
      <div class="row gray-bg-2 no-gutters">
         <div class="col-xl-6 col-md-6">
            <div class="content_left">
               <a  class="profile_mini_thumb">
               <img src="{{ @$data['item']->thumbnail? asset(@$data['item']->thumbnail):'' }}" alt="">
               </a>
               <div class="content_title">
                  <p>{{@$data['item']->title}}
                     <br>
                     <span class="user_author">by {{@$data['item']->user->username}}</span>
                     <input type="number" id="totalCartItem" value="0" hidden>
                  </p>
               </div>
            </div>
         </div>
         <div class="col-xl-6 col-md-6">
            <div class="content_left">
               <h3> {{@$infix_general_settings->currency_symbol}}<span class="_mod_total">{{@$data['item']->Re_item}}</span> </h3>
               <div class="content_title">
                  <p class="support_text">
                     <span>@lang('lang.License') :</span>
                     <a href="#" id="support_text">@lang('lang.Regular')</a>
                  </p>
                  <p class="support_text">
                     <span>@lang('lang.Support') :</span> 
                     <small id="support_tym">6 @lang('lang.months') @lang('lang.support')</small>
                  </p>
               </div>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-xl-12">
            <div class="currency_text">
               <p>@lang('lang.All_prices_are')</p>
            </div>
         </div>
         <div class="col-xl-12">
            <div class="cancel_add_btn d-flex justify-content-between">
               <a class="boxed-btn-white mfp-close"  type="button" >@lang('lang.cancel')</a>
               <button id="AddCart" class="boxed-btn" type="submit">@lang('lang.Add_To_Cart')</button>
            </div>
         </div>
      </div>
   </div>
</form>
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/item_preview.js"></script>
<script src="{{ asset('public/frontend/js/') }}/dm_price_cal.js"></script>
<script>
    $(document).ready(function () {
        const pretInRon = {{ @$data['item']->Re_item}} ;
        $.ajax({
            type: "GET",
            dataType: 'json',
            url: `https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=RON`,
            success: function (data) {
               var price = pretInRon/data.RON;
               var myNumberWithTwoDecimalPlaces=parseFloat(price).toFixed(4);
                  $("#pretInEth").attr("value", myNumberWithTwoDecimalPlaces);
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
});
</script>
@endpush