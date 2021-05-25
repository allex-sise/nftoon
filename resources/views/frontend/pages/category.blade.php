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
<input type="text" id="_categor_id" hidden value="{{ $data['category']->id}}">
<input type="text" id="_subcategor_id" hidden value="{{ @$data['subcategory']}}">
<input type="text" id="_tag" hidden value="{{ @$data['tag']}}">
<input type="text" id="_attribute" hidden value="{{ @$data['attribute']}}">
<input type="text" id="_key" hidden value="{{ @$data['key']}}">
<input type="text" id="searCat" hidden value="{{ @$data['searCat']}}">
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
    <!-- categori-menu-area-start -->
    <div class="categori-menu-area d-lg-block Common_cat_menu">
            <div class="container-fluid ">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="catagori-menu ">
                            <nav>
                                <ul class="Common_cat_menu_list" >
                                    @if (!@$data['sub_cat'])
                                    <li>
                                        <div class="catagori-submenu-area mb-40">
                                            <div class="catagori-submenu-inner">
                                                <span href="javascript:;" class="submenu-close"> <i class="ti-close"></i> </span>
                                                <div class="catagori-content">
                                                    <ul>
                                                        @foreach ($data['sub_category'] as $item)                                                            
                                                        <li><a href="{{ route('categoryItem',[@$data['category']->slug,@$item->slug]) }}">{{ @$item->title }} <span> ({{ @$item->CountItem( @$data['category']->id,@$item->id) }})</span></a></li>
                                                        @endforeach
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>                                        
                                    @endif
                                    

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- categori-menu-area-end -->
    <!-- latest-goods-start -->
    <div class="latest-goods-area gray-bg section-padding1 mt-40">
        <div class="container">
            <div class="row align-items-end">
                <div class="col-xl-12  portfolio-menu">                   

                     @if(@$data['category'])
                     <font><button class="active">{{@$data['category']->title }}</button></font>
                     @endif
                     @if(@$data['sub_cat'])
                     <font><button class="active">{{@$data['sub_cat']->title }}</button></font>
                     @endif

                     @if(@$data['tag'])
                     <font><button class="active">{{ @$data['tag'] }}</button></font>
                     @endif
                     @if(@$data['attribute'])
                     <font><button class="active">{{ @$data['attribute'] }}</button></font>
                     @endif
                     @if(@$data['key'])
                     <font><button class="active">{{@$data['key'] }}</button></font>
                     @endif
                     @if(@$data['category'])
                     <font><button onclick="window.location.href = '{{URL('/')}}';" class="active">@lang('lang.clear_filter')</button></font>
                 @endif
                     <font class="filter_cat_sale"></font>
                     <font class="filter_cat_rate"></font>
                </div>

                <div class="col-xl-6">
                    <div class="section-title mb-40">
                        <h3>{{@$homepage->product_title}}</h3>
                        <!-- <h4>{{@$homepage->product_title_description}}</h4> -->
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="portfolio-menu portfolio-menu2 text-xl-right text-lg-left text-sm-center">
                            <button class="active" value="all" id="all" data-filter="*">@lang('lang.all_items')</button>
                            <button data-filter=".cat2" value="newest" id="newest">@lang('Newest')</button>
                            <button data-filter=".cat4" value="trending" id="trending">@lang('lang.Trending')</button>
                    </div>
                </div>
            </div>
            <div class="row grid databox" id="databox">

            </div>
            <div class="row bt">
            </div>
        </div>
    </div>
    <!-- latest-goods-end -->
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/category.js"></script>
@endpush