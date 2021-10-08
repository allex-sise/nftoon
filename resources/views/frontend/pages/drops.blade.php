@extends('frontend.master')
@php
    $home_page=Modules\Pages\Entities\InfixHomePage::first();
    if (file_exists($home_page->banner_image_drops)) {
        $banner=$home_page->banner_image_drops;
    } else {
        $banner=url('public/frontend/img/banner/banner-img-1.png');
    }
    
@endphp

@push('css')

    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_modal.css">

@endpush

@section('content')
<style>
.banner-area::before, .banner-area2::before, .banner-area3::before, .banner-area4::before{
    background-image: url("{{$banner}}")!important;
    background-size: cover;
    background-repeat: no-repeat;
    margin-top: 85px;
    height: 500px;
}
.banner-area2{
    height: 600px;
}
.section-padding1 {
    padding-top: 20px;
    padding-bottom: 120px;
}
.latest-goods-area .single-goods .goods-thumb {
    overflow: hidden;
    height: 540px!important;
    border-radius: 7px!important;
    border-bottom-left-radius: 0px!important;
    border-bottom-right-radius: 0px!important;
}
.latest-goods-area .single-goods .goods-thumb img {
    max-height: 540px!important;
}
.mg30{
    margin: 30px!important;
}
.mg140top{
    margin-top: 140px!important;
}
.de_countdown {
    position: absolute;
    left: 40px;
    margin-top: 10px;
    padding: 0 0 4px 10px;
    -webkit-border-radius: 30px;
    z-index: 100;
    width: 150px;
}
.banner-area2::before{
    z-index: 10;
}
.collgdrop{
    margin-bottom: 45px; 
    margin-right: 50px;
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
    <div class="features-area section-padding1" onscroll="OnScroll()">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-12">
                <div class="section-title text-left mb-70">
                <h3>DROPS</h3>
                    <h4>
Minted from drops are sold directly by the creator. You can buy them here before they sell out - or purchase them from other users on the secondary marketplace.</h4>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-xl-12">
               @foreach ($data['drop'] as $drop)
                        <div class="col-lg-5 float-left collgdrop">
                            <div class="nft_pic" style="background-size: cover;">                            
                                <a href="{{ route('singleDrop',@$drop->slug) }}">
                                    <span class="nft_pic_info">
                                        <span class="nft_pic_title">{{ $drop->name }}</span>
                                        <span class="nft_pic_by">{{ $drop->description }}</span>
                                        <span class="nft_pic_title" style="font-size: 16px!important;">Drop-ul expira in:</span>
                                        @php
                                            $date = $drop->expdate;
                                            $day_year = date('Y', strtotime($date));
                                            $day_name = date('j', strtotime($date));
                                            $day_month = date('n', strtotime($date));
                                            $day_hour = date('H', strtotime($date));
                                        @endphp
                                        <div class="de_countdown" data-year="{{$day_year}}" data-month="{{$day_month}}" data-day="{{$day_name}}" data-hour="{{$day_hour}}"></div>
                                    </span>
                                </a>
                                <div class="nft_pic_wrap" style="background-size: cover;">
                                    <img style="min-height: 550px; max-height: 550px;" src="{{asset(@$drop->dropicon)}}" class="lazy img-fluid" alt="">
                                </div>
                            </div>
                        </div>
                    @endforeach
            </div>
        </div>
    </div>
</div>
    <!-- latest-goods-end -->
@endsection