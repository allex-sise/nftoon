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
    </style>

 <!-- start page title area -->
 <div class="rn-breadcrumb-inner ptb--30">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
                <h5 class="title text-center text-md-start">COLECTII</h5>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <ul class="breadcrumb-list">
                    <li class="item"><a href="index.html">Acasa</a></li>
                    <li class="separator"><i class="feather-chevron-right"></i></li>
                    <li class="item current">Colectii</li>
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
            @foreach ($data['collection'] as $collection)

                <!-- start single collention -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-lg-4 col-xl-4 col-md-4 col-sm-6 col-12">
                    <a href="{{ route('singleCollection',@$collection->slug) }}" class="rn-collection-inner-one">
                        <div class="collection-wrapper">
                            <div class="collection-big-thumbnail">
                                <img src="{{asset(@$collection->dropicon)}}">
                            </div>
                            <div class="collenction-small-thumbnail">
                                <img src="{{asset(@$collection->dropicon)}}" alt="Nft_Profile">
                                <img src="{{asset(@$collection->dropicon)}}" alt="Nft_Profile">
                                <img src="{{asset(@$collection->dropicon)}}" alt="Nft_Profile">
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

    
@endsection