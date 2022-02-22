@extends('frontend.master')
@push('css')

    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_modal.css">

@endpush
@php
    $home_page=Modules\Pages\Entities\InfixHomePage::first();
    if (file_exists($home_page->banner_image_categories)) {
        $banner=$home_page->banner_image_categories;
    } else {
        $banner=url('public/frontend/img/banner/banner-img-1.png');
    }
    
@endphp
@section('content')
<style>
.bg_image--91{
    background-image: url("{{$banner}}")!important;

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
                    <h5 class="title text-center text-md-start">Descopera toate NFT-urile de pe Minted</h5>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-list">
                        <li class="item"><a href="index.html">Acasa</a></li>
                        <li class="separator"><i class="feather-chevron-right"></i></li>
                        <li class="item current">Toate</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end page title area -->
    <!-- Start product area -->
    <div class="rn-product-area rn-section-gapTop masonary-wrapper-activation">
        <div class="container">
            <div class="row mb--30 align-items-center">
                <div class="col-lg-4">
                    <div class="section-title">
                        <h3 class="title mb--0">Toate NFT-urile</h3>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="button-group isotop-filter filters-button-group d-flex justify-content-start justify-content-lg-end mt_md--30 mt_sm--30">
                        <button data-filter="*" class="is-checked"><span class="filter-text">All Items</span></button>
                        <button data-filter=".cat--1"><span class="filter-text">Art</span></button>
                        <button data-filter=".cat--2"><span class="filter-text">Music</span></button>
                        <button data-filter=".cat--3"><span class="filter-text">Vedio</span></button>
                        <button data-filter=".cat--4"><span class="filter-text">Collectionable</span></button>
                        <button data-filter=".cat--5"><span class="filter-text">Highest</span></button>
                        <button data-filter=".cat--6"><span class="filter-text">Lowest</span></button>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="grid-metro5 mesonry-list">
                    <div class="resizer"></div>
                    @foreach (@$data['item'] as $item)
                    <!-- start single product -->
                    <div class="grid-metro-item cat--1 cat--3">
                        <div class="product-style-one no-overlay">
                            <div class="card-thumbnail">
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
                            <div class="product-share-wrapper">
                                <div class="profile-share">
                                    <a href="{{ route('user.portfolio',@$item->og->username)}}" class="avatar" data-tooltip="{{ @$item->og->username }}"><img src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}"></a>
                                    <a class="more-author-text" href="#">{{ @$item->og->username }}</a>
                                </div>
                                <div class="share-btn share-btn-activation dropdown">
                                    <button class="icon" type="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                            <span class="latest-bid">Highest bid 1/20</span>
                            <div class="bid-react-area">
                                <div class="last-bid">{{ $item->Re_item}} crd</div>
                                <div class="react-area">
                                    <svg viewBox="0 0 17 16" fill="none" width="16" height="16" class="sc-bdnxRM sc-hKFxyN kBvkOu">
                                        <path d="M8.2112 14L12.1056 9.69231L14.1853 7.39185C15.2497 6.21455 15.3683 4.46116 14.4723 3.15121V3.15121C13.3207 1.46757 10.9637 1.15351 9.41139 2.47685L8.2112 3.5L6.95566 2.42966C5.40738 1.10976 3.06841 1.3603 1.83482 2.97819V2.97819C0.777858 4.36443 0.885104 6.31329 2.08779 7.57518L8.2112 14Z" stroke="currentColor" stroke-width="2"></path>
                                    </svg>
                                    <span class="number">322</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end single product -->
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <!-- end product area -->
    
@endsection