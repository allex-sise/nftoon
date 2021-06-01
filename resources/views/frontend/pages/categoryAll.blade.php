@extends('frontend.master')
@push('css')

    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_modal.css">

@endpush
@php 
    $homepage = Modules\Pages\Entities\InfixHomePage::where('active_status', 1)->first();
@endphp 
@section('content')
<style>
.banner-area::before, .banner-area2::before, .banner-area3::before, .banner-area4::before{
    background-image: url("{{ asset('public/frontend/imaginibanner/hmm.png') }}")!important;
    background-size: contain;
    background-repeat: no-repeat;
    margin-top: 85px;
}
.banner-area2{
    height: 700px;
}
.section-padding1 {
    padding-top: 20px;
    padding-bottom: 120px;
}
    </style>
  <!-- banner-area start -->
    <div class="banner-area2" >
        <div class="container">
            <div class="row">
                <div class="col-xl-8 offset-xl-2">
                    <!-- <div class="banner-info text-center mb-30">
                        <h2>{{ @$data['sub_cat']? @$data['sub_cat']->title :@$data['category']->title}}</h2>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
    <!-- banner-area end -->

    <!-- latest-goods-start -->
   <!-- latest-goods-start -->
<div class="latest-goods-area gray-bg section-padding1" onscroll="OnScroll()">
    <div class="container">
        <div class="row align-items-end">
            <div class="col-xl-6">
                <div class="section-title mb-40">
                    <h3>{{$homepage->product_title}}</h3>
                    {{-- <p>{{$homepage->product_title_description}}</p> --}}
                    <h4>{{$homepage->product_title_description}}</h4>
                </div>
            </div>
            <input type="hidden" id="currency_symbol" value="{{@$infix_general_settings->currency_symbol}}">
            <div class="col-xl-6">
                <div class="portfolio-menu portfolio-menu2 text-xl-right text-lg-left text-sm-center">
                    <button class="active" value="all" id="all" data-filter="*">@lang('lang.all_items')</button>
                    <button data-filter=".cat2" value="newest" id="newest">@lang('lang.Newest')</button>
                    <button data-filter=".cat4" value="trending" id="trending">@lang('lang.Trending')</button>
                    <button data-filter=".cat5" value="high" id="high">@lang('lang.price_high_to_low')</button>
                    <button data-filter=".cat6" value="low" id="low">@lang('lang.price_low_to_high')</button>
                </div>
            </div>
        </div>
        <div class="row grid databox " id="databox">
        </div>
        <div class="row bt">
        </div>
    </div>
</div>
    <!-- latest-goods-end -->
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/filter.js"></script>

@endpush