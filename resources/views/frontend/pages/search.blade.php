@extends('frontend.master')
@push('css')

    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_modal.css">
@endpush
@section('content')

<input type="text" id="_categor_id" hidden value="{{ @$data['category']->id}}">
<input type="text" id="_tag" hidden value="{{ @$data['tag']}}">
<input type="text" id="_attribute" hidden value="{{ @$data['attribute']}}">
<input type="text" id="_key" hidden value="{{ @$data['key']}}">
<input type="text" id="_feature_item" hidden value="{{ @$data['_feature_item']}}">

          <!-- section begin -->
          <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>Rezultatele cautarii pentru {{ @$data['key']}}</h1>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->      
    
    <!-- latest-goods-start -->
    <div class="latest-goods-area section-padding1 mt-40">
        <div class="container">
            
          <div class="row align-items-end">
                  <div class="col-xl-12 portfolio-menu">                   

                     @if(@$data['category'])
                     <font><button class="active">{{@$data['category']->title }}</button></font>
                     @endif
                     @if(@$data['sub_cat'])
                     <font><button class="active">{{@$data['sub_cat']->title }}</button></font>
                     @endif
                     @if(@$data['key'])
                     <font><button class="active">{{@$data['key'] }}</button></font>
                     @endif
                     </div>
            </div> 
  <!-- 
                     @if(@$data['tag'])
                    <font> <button class="active">{{ @$data['tag'] }}</button></font>
                     @endif
                     @if(@$data['attribute'])
                     <font><button class="active">{{ @$data['attribute'] }}</button></font>
                     @endif
                     @if(@$data['key'])
                     <font><button class="active">{{@$data['key'] }}</button></font>
                     @endif
                     <font class="filter_cat_sale"></font>
                     <font class="filter_cat_rate"></font>
                     <font class="filter_cat_price"></font>
                </div>
                <div class="col-xl-6">
                    <div class="section-title mb-40">
                        <h3>@lang('lang.DiscoverOLDG')</h3>
                        <p>@lang('lang.product_header_sub_title')</p>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="portfolio-menu portfolio-menu2 text-xl-right text-lg-left text-sm-center">
                            <button class="active" value="all" id="all" data-filter="*">@lang('lang.all_items')</button>
                            <button data-filter=".cat1" value="bestsell" id="bestsell">@lang('lang.Best') @lang('lang.Sellers')</button>
                            <button data-filter=".cat2" value="newest" id="newest">@lang('lang.Newest')</button>
                            <button data-filter=".cat3" value="bestrated" id="bestrated">@lang('lang.Best') @lang('lang.Rated')</button>
                            <button data-filter=".cat4" value="trending" id="trending">@lang('lang.Trending')</button>
                            <button data-filter=".cat5" value="high" id="high">@lang('price') @lang('lang.High_to_Low')</button>
                            <button data-filter=".cat6" value="low" id="low">@lang('price') @lang('lang.Low_to_High')</button>
                    </div>
                </div>
            </div> -->
            <div class="row grid databox" id="databox">

            </div>
            <div class="row bt">
            </div>
        </div>
    </div>
    <!-- latest-goods-end -->
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/search.js"></script>

@endpush