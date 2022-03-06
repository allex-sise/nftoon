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
.bg_image--91{
    background-image: url("{{$banner}}")!important;

}
.rn-collection-inner-one .collection-wrapper .collenction-small-thumbnail img {
    display: inline-block;
    width: 33.33%;
    padding: 4px;
    border-radius: 10px;
    height: 85px;
}
.rn-collection-inner-one .collection-wrapper .collection-big-thumbnail img {
    border-radius: 5px;
    object-fit: cover;
    width: 100%;
    height: 270px;
    transition: var(--transition);
}
.videocollection{
    display: inline-block;
    width: 33.33%;
    padding: 4px;
    border-radius: 10px;
}
.rn-collection-inner-one .collection-wrapper .collenction-small-thumbnail img {
    display: inline-block;
    width: 33.33%;
    padding: 4px;
    border-radius: 10px;
    height: auto;
}
    </style>

    <div class="rn-author-bg-area bg_image--91 bg_image ptb--150">
        <div class="container">
            <div class="row">
            </div>
        </div>
    </div>
 <!-- start page title area -->
 <div class="rn-breadcrumb-inner ptb--30">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
                <h5 class="title text-center text-md-start">DROPS</h5>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <ul class="breadcrumb-list">
                    <li class="item"><a href="index.html">Acasa</a></li>
                    <li class="separator"><i class="feather-chevron-right"></i></li>
                    <li class="item current">DROPS</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- end page title area -->
 <!-- collection area Start -->
 <div class="rn-collection-area rn-section-gapTop">
        <div class="container">
            <div class="row g-5">
            @foreach ($data['drop'] as $drop)

                <!-- start single collention -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-lg-4 col-xl-4 col-md-4 col-sm-6 col-12">
                    <a href="{{ route('singleDrop',@$drop->slug) }}" class="rn-collection-inner-one">
                        <div class="collection-wrapper">
                            <div class="collection-big-thumbnail">
                                <img src="{{asset(@$drop->dropicon)}}">
                            </div>
                            @php                                                        
                                $imageNFTs = App\DropNFTs::where('drop_id', $drop->id)->take(3)->get();
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
                                <img src="{{asset(@$drop->dropicon)}}" alt="Nft_Profile">
                            </div>
                            <div class="collection-deg">
                                
                                <h6 class="title">{{ $drop->name }}</h6>
                                <p>{{ $drop->description }}</p>
                           
                            </div>
                            <div class="collection-deg">
                                @php
                                    $date = $drop->expdate;
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
                                @php                                                        
                                    $countNFTs = App\DropNFTs::where('drop_id', $drop->id)->count();
                                @endphp
                                <span class="items">{{ $countNFTs }} NFTs</span>

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

    
@endsection