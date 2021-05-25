@extends('frontend.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_item.css">
    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_modal.css">
<style>
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
</style>
@endpush
@section('content')

@include('frontend.partials.banner')
@php 
$homepage = Modules\Pages\Entities\InfixHomePage::where('active_status', 1)->first();
@endphp 
<div class="features-area section-padding1 gray-bg" onscroll="OnScroll()">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-6 offset-xl-3">
                <div class="section-title text-center mb-70">
                <h3>Nu ratati nici un drop! 👀</h3>
                    {{-- <p>{{$homepage->feature_title_description}}</p> --}}
                    <h4>Abonați-vă la lista noastră ultra-exclusivă de drop și fiți primul care știe despre viitoarele drop-uri Minted.</h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="view-features text-center">
                    <div class="col-xl-12 col-md-12">
                        <input name="company_name" type="text" placeholder="Adresa ta de email" value="" style="border-radius: 0px!important; padding: 13px; width: 400px;">
                        <button type="submit" class="black-btn" style="padding: 8px 17px; border-radius: 2px; margin-left: 8px;">Abonare</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- newsletter-area-end -->

<input type="hidden" id="url" value="{{url('/')}}">
<div class="features-area section-padding1" onscroll="OnScroll()">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-6 offset-xl-3">
                <div class="section-title text-center mb-70">
                <h3>DROPS</h3>
                    {{-- <p>{{$homepage->feature_title_description}}</p> --}}
                    <h4>{{$homepage->feature_title_description}}</h4>
                </div>
            </div>
        </div>


        {{-- <div class="features_item_modal"></div> --}}
        <div class="row">
            <div class="col-xl-6 offset-xl-3">
                <div class="features-wrap " id="FeatureItem">

                </div>
            </div>
            <div class="col-lg-12">
                <div class="view-features text-center mt-80">
                   <a href="{{ route('feature_item')}}"  class="black-btn">@lang('lang.view_all_featured_products')</a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- features-area-end -->



@php
   $infix_general_settings = app('infix_general_settings');
@endphp




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

@if (@$free_items_count >0)
<!-- Free item Start -->
<div class="features-area section-padding1 pt-0" onscroll="OnScroll()">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-6 offset-xl-3">
                <div class="section-title text-center mb-70 mt-4">
                <h3>@lang('lang.free_product_of_the_month')</h3>
                    {{-- <p>{{$homepage->feature_title_description}}</p> --}}
                    <h4>{{$homepage->feature_title_description}}</h4>
                </div>
            </div>
        </div>


        {{-- <div class="free_item_modal"></div> --}}
        {{-- <div class="row justify-content-center">
            <div class="col-xl-6 d-flex justify-content-center">
                <div class="features-wrap" id="FreeItem">

                </div>
            </div>
            <div class="col-lg-12">
                <div class="view-features text-center mt-80">
                   <a href="{{ route('free_items')}}"  class="black-btn">View All Free Products</a>
                </div>
            </div>
        </div> --}}

         {{-- <div class="features_item_modal"></div> --}}
         <div class="row justify-content-center">
            <div class="col-xl-6">
                <div class="features-wrap d-flex justify-content-center" id="FreeItem">

                </div>
            </div>

            <div class="col-lg-12">
                <div class="view-features text-center mt-80">
                    <a href="{{ route('free_items')}}"  class="black-btn">@lang('lang.view_all_free_products')</a>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- Free item end -->
@endif
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/item_load.js"></script>
<script src="{{ asset('public/frontend/js/') }}/filter.js"></script>


@endpush