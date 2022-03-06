@extends('frontend.master')
@push('css')
  
@endpush
@section('content')

@include('frontend.partials.banner')
@php 
$homepage = Modules\Pages\Entities\InfixHomePage::where('active_status', 1)->first();
@endphp 



@php
   $infix_general_settings = app('infix_general_settings');
@endphp
@php 
$homepage = Modules\Pages\Entities\InfixHomePage::where('active_status', 1)->first();
$home_page=Modules\Pages\Entities\InfixHomePage::first();
    if (file_exists($home_page->banner_image)) {
        $banner=$home_page->banner_image;
    } else {
        $banner=url('public/frontend/img/banner/banner-img-1.png');
    }
@endphp 
<style>
.slider-style-2 .single-slide .thumbnail img {
    border-radius: 7px;
    transition: .7s;
    height: 100%;
}
.slider-style-2 .single-slide .inner {
    position: relative;
    padding: 15px;
    background: var(--background-color-1);
    border-radius: 7px;
    height: 400px;
}
.product-style-one .card-thumbnail {
    position: relative;
    height: 250px;
}
.product-style-one .card-thumbnail a img {
    border-radius: 5px;
    object-fit: cover;
    width: 100%;
    height: 100%;
    transition: 0.5s;
}
.videocollection{
    display: inline-block;
    width: 33.33%;
    padding: 4px;
    border-radius: 10px;
}
</style>
   <!-- start banner area -->
   <div class="slider-one rn-section-gapTop">
        <div class="container">
            <div class="row row-reverce-sm align-items-center">
                <div class="col-lg-5 col-md-6 col-sm-12 mt_sm--50">
                    <h2 class="title" data-sal-delay="200" data-sal="slide-up" data-sal-duration="800">Discover Digital Art, Collect and Sell Your Specific NFTs.</h2>
                    <p class="slide-disc" data-sal-delay="300" data-sal="slide-up" data-sal-duration="800">Partner with one of the world’s largest retailers to showcase your brand and
                        products.</p>
                    <div class="button-group">
                        <a class="btn btn-large btn-primary" href="#" data-sal-delay="400" data-sal="slide-up" data-sal-duration="800">Get Started</a>
                        <a class="btn btn-large btn-primary-alta" href="create.html" data-sal-delay="500" data-sal="slide-up" data-sal-duration="800">Create</a>
                    </div>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12 offset-lg-1">
                    <div class="slider-thumbnail">
                        <img src="{{ asset('')}}{{$banner}}" alt="Slider Images">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End banner area -->

    <!-- start banner area -->
    <div class="banner-area pt--25">
        <div class="container-fluid">
            <div class="container">
                <div class="row mb--50">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h3 class="title mb--0 live-bidding-title" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">DROPS</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="slider-style-2 slick-activation-01 slick-arrow-style-one slick-arrow-between">
                @foreach ($data['drop'] as $drop)
                    <!-- Start Single Portfolio  -->
                    <div class="single-slide">
                        <div class="inner">
                            <div class="thumbnail">
                                <a href="{{ route('singleDrop',@$drop->slug) }}"><img src="{{asset(@$drop->dropicon)}}" alt="NFT_portfolio"></a>
                            </div>
                            <div class="banner-read-thumb">
                                <h4><a href="product-details.html">{{ $drop->name }}</a></h4>
                                <span>{{ $drop->description }}</span>
                                @php
                                    $date = $drop->startdate;
                                    
                                    $day_year = date('Y-m-d', strtotime($date));
                                    $day_name = date('j', strtotime($date));
                                    $day_month = date('n', strtotime($date));
                                    $day_hour = date('H', strtotime($date));
                                @endphp
                              
                                
                                <div class="countdown" data-date="{{$day_year}}">
                                
                                        <div class="countdown-container days">
                                            <span class="countdown-value">87</span>
                                            <span class="countdown-heading">D's</span>
                                        </div>
                                        <div class="countdown-container hours">
                                            <span class="countdown-value">23</span>
                                            <span class="countdown-heading">H's</span>
                                        </div>
                                        <div class="countdown-container minutes">
                                            <span class="countdown-value">38</span>
                                            <span class="countdown-heading">Min's</span>
                                        </div>
                                        <div class="countdown-container seconds">
                                            <span class="countdown-value">27</span>
                                            <span class="countdown-heading">Sec</span>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <!-- Start Single Portfolio  -->
                @endforeach

                </div>
            </div>
        </div>
    </div>
    <!-- End banner area -->
    <!-- Explore Style Carousel -->
    <div class="rn-live-bidding-area rn-section-gapTop">
        <div class="container">
            <div class="row mb--50">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h3 class="title mb--0 live-bidding-title" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">Live Bidding</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="banner-one-slick slick-activation-03 slick-arrow-style-one rn-slick-dot-style slick-gutter-15">
                    @php
                    $infix_general_settings = app('infix_general_settings');
                    @endphp
                        @foreach (@$data['featured'] as $item)
                        <!-- start single product -->
                        <div class="single-slide-product">
                            <div class="product-style-one">
                                <div class="card-thumbnail">
                                <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                @if (@$item->file == 'img')
                                    <img src="{{ asset(@$item->icon) }}" class="" alt="">
                                
                                    @elseif(@$item->file == 'video')
                                    <video width="100%" height="100%" class="" autoplay muted controls loop>
                                    <source src="{{ asset(@$item->main_file) }}" type="video/mp4">
                                    
                                    Your browser does not support the video tag.
                                </video>
                                @endif
                                </a>
                                    <div class="countdown" data-date="2022-11-09">
                                        <div class="countdown-container days">
                                            <span class="countdown-value">87</span>
                                            <span class="countdown-heading">D's</span>
                                        </div>
                                        <div class="countdown-container hours">
                                            <span class="countdown-value">23</span>
                                            <span class="countdown-heading">H's</span>
                                        </div>
                                        <div class="countdown-container minutes">
                                            <span class="countdown-value">38</span>
                                            <span class="countdown-heading">Min's</span>
                                        </div>
                                        <div class="countdown-container seconds">
                                            <span class="countdown-value">27</span>
                                            <span class="countdown-heading">Sec</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-share-wrapper">
                                    <div class="profile-share">
                                        <a href="{{ route('user.portfolio',@$item->og->username)}}" class="avatar" data-tooltip="{{ @$item->og->username }}"><img src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}"></a>
                                        <a class="more-author-text" href="{{ route('user.portfolio',@$item->og->username)}}">{{ @$item->og->username }}</a>
                                    </div>
                                    <div class="share-btn share-btn-activation dropdown">
                                        <button class="icon" data-bs-toggle="dropdown" aria-expanded="false">
                                            <svg viewBox="0 0 14 4" fill="none" width="16" height="16" class="sc-bdnxRM sc-hKFxyN hOiKLt">
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 2C3.5 2.82843 2.82843 3.5 2 3.5C1.17157 3.5 0.5 2.82843 0.5 2C0.5 1.17157 1.17157 0.5 2 0.5C2.82843 0.5 3.5 1.17157 3.5 2ZM8.5 2C8.5 2.82843 7.82843 3.5 7 3.5C6.17157 3.5 5.5 2.82843 5.5 2C5.5 1.17157 6.17157 0.5 7 0.5C7.82843 0.5 8.5 1.17157 8.5 2ZM11.999 3.5C12.8274 3.5 13.499 2.82843 13.499 2C13.499 1.17157 12.8274 0.5 11.999 0.5C11.1706 0.5 10.499 1.17157 10.499 2C10.499 2.82843 11.1706 3.5 11.999 3.5Z" fill="currentColor"></path>
                                            </svg>
                                        </button>

                                        <div class="share-btn-setting dropdown-menu dropdown-menu-end">
                                            <button type="button" class="btn-setting-text share-text" data-bs-toggle="modal" data-bs-target="#shareModal">
                                                Share
                                            </button>
                                            <button type="button" class="btn-setting-text report-text" data-bs-toggle="modal" data-bs-target="#reportModal">
                                                Report
                                            </button>
                                        </div>

                                    </div>

                                </div>
                                <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}"><span class="product-name">{{ $item->title}}</span></a>
                               
                                <div class="bid-react-area">
                                    <div class="last-bid">{{ $item->Re_item}} toons</div>
                                    <div class="react-area">
                                        <i data-feather="activity"></i>
                                        <span class="number">{{ $item->sell}}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end single product -->
                        @endforeach
                        <!-- start single product -->
                        
                        <!-- start single product -->
                        

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Explore Style Carousel End-->

    <!-- start service area -->
    <div class="rn-service-area rn-section-gapTop">
        <div class="container">
            <div class="row">
                <div class="col-12 mb--50">
                    <h3 class="title" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">Cumpara si Vinde NFT-uri</h3>
                </div>
            </div>
            <div class="row g-5">
                <!-- start single service -->
                <div class="col-xxl-3 col-lg-4 col-md-6 col-sm-6 col-12">
                    <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="rn-service-one color-shape-7">
                        <div class="inner">
                            <div class="icon">
                                <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/shape-7.png" alt="Shape">
                            </div>
                            <div class="subtitle">Pasul-01</div>
                            <div class="content">
                                <h4 class="title"><a href="#">Set up your wallet</a></h4>
                                <p class="description">Powerful features and inclusions, which makes Nuron standout,
                                    easily customizable and scalable.</p>
                                <a class="read-more-button" href="#"><i class="feather-arrow-right"></i></a>
                            </div>
                        </div>
                        <a class="over-link" href="#"></a>
                    </div>
                </div>
                <!-- End single service -->
                <!-- start single service -->
                <div class="col-xxl-3 col-lg-4 col-md-6 col-sm-6 col-12">
                    <div data-sal="slide-up" data-sal-delay="200" data-sal-duration="800" class="rn-service-one color-shape-1">
                        <div class="inner">
                            <div class="icon">
                                <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/shape-1.png" alt="Shape">
                            </div>
                            <div class="subtitle">Pasul-02</div>
                            <div class="content">
                                <h4 class="title"><a href="#">Create your collection</a></h4>
                                <p class="description">A great collection of beautiful website templates for your need.
                                    Choose the best suitable template.</p>
                                <a class="read-more-button" href="#"><i class="feather-arrow-right"></i></a>
                            </div>
                        </div>
                        <a class="over-link" href="#"></a>
                    </div>
                </div>
                <!-- End single service -->
                <!-- start single service -->
                <div class="col-xxl-3 col-lg-4 col-md-6 col-sm-6 col-12">
                    <div data-sal="slide-up" data-sal-delay="250" data-sal-duration="800" class="rn-service-one color-shape-5">
                        <div class="inner">
                            <div class="icon">
                                <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/shape-5.png" alt="Shape">
                            </div>
                            <div class="subtitle">Pasul-03</div>
                            <div class="content">
                                <h4 class="title"><a href="#">Add your NFT's</a></h4>
                                <p class="description">We've made the template fully responsive, so it looks great on
                                    all devices: desktop, tablets and.</p>
                                <a class="read-more-button" href="#"><i class="feather-arrow-right"></i></a>
                            </div>
                        </div>
                        <a class="over-link" href="#"></a>
                    </div>
                </div>
                <!-- End single service -->
                <!-- start single service -->
                <div class="col-xxl-3 col-lg-4 col-md-6 col-sm-6 col-12">
                    <div data-sal="slide-up" data-sal-delay="300" data-sal-duration="800" class="rn-service-one color-shape-6">
                        <div class="inner">
                            <div class="icon">
                                <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/shape-6.png" alt="Shape">
                            </div>
                            <div class="subtitle">Pasul-04</div>
                            <div class="content">
                                <h4 class="title"><a href="#">Sell Your NFT's</a></h4>
                                <p class="description">I throw myself down among the tall grass by the stream as I
                                    lie close to the earth NFT's.</p>
                                <a class="read-more-button" href="#"><i class="feather-arrow-right"></i></a>
                            </div>
                        </div>
                        <a class="over-link" href="#"></a>
                    </div>
                </div>
                <!-- End single service -->
            </div>
        </div>
    </div>
    <!-- End service area -->
    <!-- New items Start -->
    <div class="rn-new-items rn-section-gapTop">
        <div class="container">
            <div class="row mb--50 align-items-center">
                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                    <h3 class="title mb--0" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">Cele mai recente</h3>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-12 mt_mobile--15">
                    <div class="view-more-btn text-start text-sm-end" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">
                        <a class="btn-transparent" href="{{ route('categoryAll') }}">VEZI TOATE<i data-feather="arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="row g-5">
            @foreach (@$data['featured'] as $item)
                <!-- start single product -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-4 col-lg-3 col-md-4 col-sm-6 col-12">
                    <div class="product-style-one no-overlay">
                        <div class="card-thumbnail">
                            <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                @if (@$item->file == 'img')
                                    <img src="{{ asset(@$item->icon) }}" class="" alt="">
                                
                                    @elseif(@$item->file == 'video')
                                    <video width="100%" height="100%" class="" autoplay muted controls loop>
                                    <source src="{{ asset(@$item->main_file) }}" type="video/mp4">
                                    
                                    Your browser does not support the video tag.
                                </video>
                                @endif
                            </a>
                        </div>
                        <div class="product-share-wrapper">
                            <div class="profile-share">
                                <a href="{{ route('user.portfolio',@$item->og->username)}}" class="avatar" data-tooltip="{{ @$item->og->username }}"><img src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}"></a>
                                <a class="more-author-text" href="#">{{ @$item->og->username }}</a>
                            </div>
                            <div class="share-btn share-btn-activation dropdown">
                                <button class="icon" data-bs-toggle="dropdown" aria-expanded="false">
                                    <svg viewBox="0 0 14 4" fill="none" width="16" height="16" class="sc-bdnxRM sc-hKFxyN hOiKLt">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 2C3.5 2.82843 2.82843 3.5 2 3.5C1.17157 3.5 0.5 2.82843 0.5 2C0.5 1.17157 1.17157 0.5 2 0.5C2.82843 0.5 3.5 1.17157 3.5 2ZM8.5 2C8.5 2.82843 7.82843 3.5 7 3.5C6.17157 3.5 5.5 2.82843 5.5 2C5.5 1.17157 6.17157 0.5 7 0.5C7.82843 0.5 8.5 1.17157 8.5 2ZM11.999 3.5C12.8274 3.5 13.499 2.82843 13.499 2C13.499 1.17157 12.8274 0.5 11.999 0.5C11.1706 0.5 10.499 1.17157 10.499 2C10.499 2.82843 11.1706 3.5 11.999 3.5Z" fill="currentColor"></path>
                                    </svg>
                                </button>

                                <div class="share-btn-setting dropdown-menu dropdown-menu-end">
                                    <button type="button" class="btn-setting-text share-text" data-bs-toggle="modal" data-bs-target="#shareModal">
                                        Share
                                    </button>
                                    <button type="button" class="btn-setting-text report-text" data-bs-toggle="modal" data-bs-target="#reportModal">
                                        Report
                                    </button>
                                </div>

                            </div>
                        </div>
                        <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}"><span class="product-name">{{ $item->title}}</span></a>
                        
                        <div class="bid-react-area">
                            <div class="last-bid">{{ $item->Re_item}} toons</div>
                            <div class="react-area">
                                <i data-feather="activity"></i>
                                <span class="number">>{{ $item->sell}}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end single product -->
            @endforeach
            </div>
        </div>
    </div>
    <!-- New items End -->
    <!-- collection area Start -->
    <div class="rn-collection-area rn-section-gapTop">
        <div class="container">
            <div class="row mb--50 align-items-center">
                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                    <h3 class="title mb--0" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">Top Colectii</h3>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-12 mt_mobile--15">
                    <div class="view-more-btn text-start text-sm-end" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">
                        <a class="btn-transparent" href="{{ route('collectionsAll') }}">VEZI TOATE<i data-feather="arrow-right"></i></a>
                    </div>
                </div>
            </div>

            <div class="row g-5">
            @foreach ($data['collection'] as $collection)

                <!-- start single collention -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-lg-4 col-xl-4 col-md-4 col-sm-6 col-12">
                    <a href="{{ route('singleCollection',@$collection->slug) }}" class="rn-collection-inner-one">
                        <div class="collection-wrapper">
                            <div class="collection-big-thumbnail">
                                <img src="{{asset(@$collection->dropicon)}}">
                            </div>
                            @php                                                        
                                $imageNFTs = App\CollectionsNFTs::where('collection_id', $collection->id)->take(3)->get();
                            @endphp
                            <div class="collenction-small-thumbnail">
                                @foreach ($imageNFTs as $image)
                                    @if ($image->Item->file == 'img')
                                        <img src="{{ asset($image->Item->icon) }}" class="" alt="">
                                        @elseif($image->Item->file == 'video')
                                        <video width="100%" height="100%" class="videocollection" autoplay muted controls loop>
                                        <source src="{{ asset($image->Item->main_file) }}" type="video/mp4">
                                        
                                        Your browser does not support the video tag.
                                        </video>
                                    @endif
                                @endforeach
                            </div>
                            <div class="collection-profile">
                                <img src="{{ @$collection->creator->profile->image? asset(@$collection->creator->profile->image):asset('public/frontend/img/profile/1.png') }}">
                            </div>
                            <div class="collection-deg">
                                
                                <h6 class="title">{{ $collection->name }}</h6>
                        
                                @php                                                        
                                    $countNFTs = App\CollectionsNFTs::where('collection_id', $collection->id)->count();
                                @endphp
                                <span class="items">{{ $countNFTs }} NFTs</span>

                            
                        
                            </div>
                            <div class="collection-deg">
                            <p>{{ $collection->description }}</p>
                                
                            </div>
                        </div>
                    </a>
                </div>
                <!-- End single collention -->
                @endforeach
            </div>
        </div>
    </div>
    <!-- collection area End -->
    
    <!-- Start product area -->
    <div class="rn-product-area rn-section-gapTop">
        <div class="container">
            <div class="row mb--50 align-items-center">
                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                    <h3 class="title mb--0" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">Explore Product</h3>
                </div>
            </div>

            <div class="row g-5">
            @foreach (@$data['featured'] as $item)
                <!-- start single product -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-4 col-lg-3 col-md-4 col-sm-6 col-12">
                    <div class="product-style-one no-overlay">
                        <div class="card-thumbnail">
                            <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                @if (@$item->file == 'img')
                                    <img src="{{ asset(@$item->icon) }}" class="" alt="">
                                
                                    @elseif(@$item->file == 'video')
                                    <video width="100%" height="100%" class="" autoplay muted controls loop>
                                    <source src="{{ asset(@$item->main_file) }}" type="video/mp4">
                                    
                                    Your browser does not support the video tag.
                                </video>
                                @endif
                            </a>
                        </div>
                        <div class="product-share-wrapper">
                            <div class="profile-share">
                                <a href="{{ route('user.portfolio',@$item->og->username)}}" class="avatar" data-tooltip="{{ @$item->og->username }}"><img src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}"></a>
                                <a class="more-author-text" href="{{ route('user.portfolio',@$item->og->username)}}">{{ @$item->og->username }}</a>
                            </div>
                            <div class="share-btn share-btn-activation dropdown">
                                <button class="icon" data-bs-toggle="dropdown" aria-expanded="false">
                                    <svg viewBox="0 0 14 4" fill="none" width="16" height="16" class="sc-bdnxRM sc-hKFxyN hOiKLt">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 2C3.5 2.82843 2.82843 3.5 2 3.5C1.17157 3.5 0.5 2.82843 0.5 2C0.5 1.17157 1.17157 0.5 2 0.5C2.82843 0.5 3.5 1.17157 3.5 2ZM8.5 2C8.5 2.82843 7.82843 3.5 7 3.5C6.17157 3.5 5.5 2.82843 5.5 2C5.5 1.17157 6.17157 0.5 7 0.5C7.82843 0.5 8.5 1.17157 8.5 2ZM11.999 3.5C12.8274 3.5 13.499 2.82843 13.499 2C13.499 1.17157 12.8274 0.5 11.999 0.5C11.1706 0.5 10.499 1.17157 10.499 2C10.499 2.82843 11.1706 3.5 11.999 3.5Z" fill="currentColor"></path>
                                    </svg>
                                </button>

                                <div class="share-btn-setting dropdown-menu dropdown-menu-end">
                                    <button type="button" class="btn-setting-text share-text" data-bs-toggle="modal" data-bs-target="#shareModal">
                                        Share
                                    </button>
                                    <button type="button" class="btn-setting-text report-text" data-bs-toggle="modal" data-bs-target="#reportModal">
                                        Report
                                    </button>
                                </div>

                            </div>
                        </div>
                        <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}"><span class="product-name">{{ $item->title}}</span></a>
                        
                        <div class="bid-react-area">
                            <div class="last-bid">{{ $item->Re_item}} toons</div>
                            <div class="react-area">
                                <i data-feather="activity"></i>
                                <span class="number">{{ $item->sell}}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end single product -->
            @endforeach
            </div>
        </div>
    </div>
    <!-- end product area -->
    <!-- top top-seller start -->
    <div class="rn-top-top-seller-area nice-selector-transparent rn-section-gapTop">
        <div class="container">
            <div class="row  mb--30">
                <div class="col-12 justify-sm-center d-flex">
                    <h3 class="title" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">Top Seller in</h3>
                   
                </div>
            </div>
            <div class="row justify-sm-center g-5 top-seller-list-wrapper">
                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail varified">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-12.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">Brodband</h6>
                                </a>
                                <span class="count-number">
                                $2500,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->

                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-2.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">Ms. Parkline</h6>
                                </a>
                                <span class="count-number">
                                $2300,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->

                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-3.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">Methods</h6>
                                </a>
                                <span class="count-number">
                                $2100,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->

                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail varified">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-4.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">Jone sone</h6>
                                </a>
                                <span class="count-number">
                                $2000,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->

                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-5.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">Siddhart</h6>
                                </a>
                                <span class="count-number">
                                $200,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->

                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail varified">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-6.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">Sobuj Mk</h6>
                                </a>
                                <span class="count-number">
                                $2000,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->

                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail varified">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-7.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">Trodband</h6>
                                </a>
                                <span class="count-number">
                                $2500,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->

                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-8.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">Yash</h6>
                                </a>
                                <span class="count-number">
                                $2500,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->

                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-9.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">YASHKIB</h6>
                                </a>
                                <span class="count-number">
                                $2500,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->

                <!-- start single top-seller -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-5 col-lg-3 col-md-4 col-sm-6 top-seller-list">
                    <div class="top-seller-inner-one">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail varified">
                                <a href="author.html"><img src="{{ asset('public/frontend/newassets') }}/assets/images/client/client-10.png" alt="Nft_Profile"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="author.html">
                                    <h6 class="name">Brodband</h6>
                                </a>
                                <span class="count-number">
                                $2500,000
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End single top-seller -->
            </div>
        </div>
    </div>
    <!-- top top-seller end -->
    <!-- Modal -->
    <div class="rn-popup-modal share-modal-wrapper modal fade" id="shareModal" tabindex="-1" aria-hidden="true">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i data-feather="x"></i></button>
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content share-wrapper">
                <div class="modal-header share-area">
                    <h5 class="modal-title">Share this NFT</h5>
                </div>
                <div class="modal-body">
                    <ul class="social-share-default">
                        <li><a href="#"><span class="icon"><i data-feather="facebook"></i></span><span class="text">facebook</span></a></li>
                        <li><a href="#"><span class="icon"><i data-feather="twitter"></i></span><span class="text">twitter</span></a></li>
                        <li><a href="#"><span class="icon"><i data-feather="linkedin"></i></span><span class="text">linkedin</span></a></li>
                        <li><a href="#"><span class="icon"><i data-feather="instagram"></i></span><span class="text">instagram</span></a></li>
                        <li><a href="#"><span class="icon"><i data-feather="youtube"></i></span><span class="text">youtube</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="rn-popup-modal report-modal-wrapper modal fade" id="reportModal" tabindex="-1" aria-hidden="true">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i data-feather="x"></i></button>
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content report-content-wrapper">
                <div class="modal-header report-modal-header">
                    <h5 class="modal-title">Why are you reporting?
                    </h5>
                </div>
                <div class="modal-body">
                    <p>Describe why you think this item should be removed from marketplace</p>
                    <div class="report-form-box">
                        <h6 class="title">Message</h6>
                        <textarea name="message" placeholder="Write issues"></textarea>
                        <div class="report-button">
                            <button type="button" class="btn btn-primary mr--10 w-auto">Report</button>
                            <button type="button" class="btn btn-primary-alta w-auto" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection
@push('js')
<script>
$("#butons").hide();

</script>

<script src="{{ asset('public/frontend/js/') }}/item_load.js"></script>
@endpush