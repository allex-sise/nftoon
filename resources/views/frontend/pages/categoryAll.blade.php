@extends('frontend.master')
@push('css')

    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_modal.css">

@endpush

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
.banner-area2::before{
    z-index: 10;
}
    </style>
  <!-- banner-area start -->
    <div class="banner-area2" >
        <div class="container">
            <div class="row">
                <div class="col-xl-8 offset-xl-2">
                
                </div>
            </div>
        </div>
    </div>
    <!-- banner-area end -->

    <!-- latest-goods-start -->
   <!-- latest-goods-start -->
   <div class="latest-goods-area section-padding1">
    <div class="container">
        <div class="row align-items-end">
            <div class="col-xl-6">
                <div class="section-title mb-40">
                    <h3>Descopera toate NFT-urile de pe Minted</h3>
 
                    <h4>ceva vrajeala detalii</h4>
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
      <div class="row">
      
            @foreach (@$data['item'] as $item)
            <!-- nft item begin -->
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 float-left">
                <div class="nft__item">
                    <!-- <div class="de_countdown" data-year="2021" data-month="9" data-day="16" data-hour="8"></div> -->
                    <div class="author_list_pp">
                        <a href="{{ route('user.portfolio',@$item->og->username)}}">                                    
                            <img class="lazy" src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                            <i class="fa fa-check"></i>
                        </a>
                        
                    </div>
                    <div class="nft__item_wrap">
                        <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                        @if (@$item->file == 'img')
                            <img src="{{ asset(@$item->icon) }}" class="lazy nft__item_preview" alt="">
                         
                            @elseif(@$item->file == 'video')
                            <video width="100%" height="100%" class="lazy nft__item_preview" autoplay muted controls loop>
                               <source src="{{ asset(@$item->main_file) }}" type="video/mp4">
                               
                               Your browser does not support the video tag.
                           </video>
                           @endif
                        </a>
                    </div>
                    <div class="nft__item_info">
                        <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                            <h4>{{ $item->title}}</h4>
                        </a>
                        <div class="nft__item_price">
                        {{ $item->Reg_total}} lei
                        </div>
                        <div class="nft__item_action">
             
                            <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}" class="heart">Cumpara Acum</a>
                        
                        </div>
                        <!-- <div class="nft__item_like">
                            <i class="fa fa-heart"></i><span>50</span>
                        </div>                             -->
                    </div> 
                </div>
            </div>                 
            <!-- nft item begin -->

            @endforeach
        
      </div>
    </div>
</div>
    <!-- latest-goods-end -->
@endsection