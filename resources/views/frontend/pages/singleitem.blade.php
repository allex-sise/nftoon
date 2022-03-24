@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/item.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/single_item.css">
@endpush
@php
$infix_general_settings = GeneralSetting();
@endphp

@section('content')
<!-- details-tablist-start -->
@php
use Carbon\Carbon;
$dt     = Carbon::now();
$img = explode(",",@$data['item']->item_image->image);
if (Str::contains($_SERVER['REQUEST_URI'], 'mail-sent')) {
$overview='';
$overview_content='';
$support='active';
$support_content='active show';
$comment='';
$comment_content='';
} else if(Str::contains($_SERVER['REQUEST_URI'], 'comment')) {
$overview='';
$overview_content='';
$support='';
$support_content='';
$comment='active';
$comment_content='active show';
}else{
$overview='active';
$overview_content='active show';
$support='';
$support_content='';
$comment='';
$comment_content='';
}
@endphp
@php
$img = explode(",",@$data['item']->item_image->image);
$img2 = @$data['item']->icon;
@endphp
<style>
.top-seller-inner-one .top-seller-wrapper .thumbnail a img {
    overflow: hidden;
    transition: 0.3s;
    border-radius: 50%!important;
    height: 45px!important;
    width: 50px!important;
}
</style>
<!-- start page title area -->
<div class="rn-breadcrumb-inner ptb--30">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <h5 class="title text-center text-md-start">{{  @$data['item']->title }}</h5>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-list">
                        <li class="item"><a href="index.html">Home</a></li>
                        <li class="separator"><i class="feather-chevron-right"></i></li>
                        <li class="item current">{{  @$data['item']->title }}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end page title area -->

    <!-- start product details area -->
    <div class="product-details-area rn-section-gapTop">
        <div class="container">
            <div class="row g-5">
                <!-- product image area -->

                <div class="col-lg-7 col-md-12 col-sm-12">
                    <div class="product-tab-wrapper rbt-sticky-top-adjust">
                    
                   @if ($data['item']->nftmultiplu == 0)
                       <div class="pd-tab-inner" @if ( $data['item']->nftmultiplu == 1) style="display: flex!important;" @else style="display: block!important;" @endif>
                            <div class="tab-content rn-pd-content" id="v-pills-tabContent">
                                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                    @if ($data['item']->file == 'img')
                                        <div class="rn-pd-thumbnail">
                                            <img src="{{ asset(@$img2)}}" alt="Nft_Profile">
                                        </div>
                                    @elseif($data['item']->file == 'video')
                                        <div class="rn-pd-thumbnail">
                                            <video width="100%" height="100%" class="lazy nft__item_preview" autoplay muted controls loop>
                                            <source src="{{ asset($data['item']->main_file) }}" type="video/mp4">
                                            
                                            Your browser does not support the video tag.
                                            </video>
                                        </div>
                                    @endif
                                 </div>
                            </div>
                        </div>
                @elseif ( $data['item']->nftmultiplu == 1)
                    @php
                        $jsonimagini=json_decode($feature2->icon);
                    @endphp
                    <div class="pd-tab-inner" @if ( $data['item']->nftmultiplu == 1) style="display: flex!important;" @else style="display: block!important;" @endif>
                        <div class="nav rn-pd-nav rn-pd-rt-content nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        @foreach ($img as $key2 => $poza)
                            <button class="nav-link {{ $loop->first ? 'active' : '' }}" id="v-pills-{{$key2}}-tab" data-bs-toggle="pill" data-bs-target="#v-pills-{{$key2}}" type="button" role="tab" aria-controls="v-pills-{{$key2}}" aria-selected="true">
                                <span class="rn-pd-sm-thumbnail">
                                    <img src="{{ asset(@$poza)}}" alt="Nft_Profile">
                                </span>
                            </button>
                            @endforeach
                        </div>
                        <div class="tab-content rn-pd-content" id="v-pills-tabContent">
                        @foreach ($img as $key2 => $poza)
                            <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="v-pills-{{$key2}}" role="tabpanel" aria-labelledby="v-pills-{{$key2}}-tab">
                                <div class="rn-pd-thumbnail">
                                    <img src="{{ asset(@$poza)}}" alt="Nft_Profile">
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>    
                @endif
                

                    </div>
                </div>
                <!-- product image area end -->

                <div class="col-lg-5 col-md-12 col-sm-12 mt_md--50 mt_sm--60">
                    <div class="rn-pd-content-area">
                        <div class="pd-title-area">
                            <h4 class="title">{{  @$data['item']->title }}</h4>
                            <div class="pd-react-area">
                                <div class="heart-count">
                                    <i data-feather="activity"></i>
                                    <span>{{ @$data['item']->sell }}</span>
                                </div>
                                <div class="count">
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
                            </div>
                        </div>
                        <span class="bid">Pret Curent <span class="price">{{ @$data['item']->Re_item}} toons</span></span>
                        @if ( $data['item']->feature1)
                            <div class="rn-pd-sm-property-wrapper">
                                <div class="property-wrapper">
                                        <!-- single property -->
                                        <div class="pd-property-inner">
                                            <span class="color-body type">Raritatea</span>
                                            <span class="color-white value"> {{ @$data['item']->feature1}}</span>
                                        </div>
                                </div>
                            </div>
                        @endif
                        @if (@$data['item']->ogowner)  
                        <div class="catagory-collection">
                            <div class="catagory">
                                <span>Creator</span>
                                <div class="top-seller-inner-one">
                                    <div class="top-seller-wrapper">
                                        <div class="thumbnail">
                                            <a href="{{ route('user.portfolio',@$data['item']->og->username)}}"><img src="{{ @$data['item']->og->profile->image? asset(@$data['item']->og->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="Nft_Profile"></a>
                                        </div>
                                        <div class="top-seller-content">
                                            <a href="{{ route('user.portfolio',@$data['item']->og->username)}}">
                                                <h6 class="name">{{ @$data['item']->og->username}}</h6>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="collection">
                                <span>Colectie</span>
                                <div class="top-seller-inner-one">
                                    <div class="top-seller-wrapper">
                                        <div class="thumbnail">
                                            <a href="{{ route('singleCollection',@$data['collections']->Collection->slug) }}"><img src="{{asset(@$data['collections']->Collection->dropicon)}}" alt="Nft_Profile"></a>
                                        </div>
                                        <div class="top-seller-content">
                                            <a href="{{ route('singleCollection',@$data['collections']->Collection->slug) }}">
                                                <h6 class="name">{{ @$data['collections']->Collection->name}}</h6>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endif
                        <a class="btn btn-primary-alta" href="#">Unlockable content included</a>
                        <div class="rn-bid-details">
                            <div class="tab-wrapper-one">
                                <nav class="tab-button-one">
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <button class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="true">Detalii</button>
                                        <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Istoric</button>
                                        <button class="nav-link" id="nav-creator-tab" data-bs-toggle="tab" data-bs-target="#nav-creator" type="button" role="tab" aria-controls="nav-creator" aria-selected="false">Creator</button>
                                    </div>
                                </nav>
                                <div class="tab-content rn-bid-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                        <!-- single -->
                                        <div class="rn-pd-bd-wrapper mt--20">
                                            <div class="top-seller-inner-one">
                                                <p>{{ @$data['item']->description }}</p>
                                                <h6 class="name-title">
                                                    Detinator
                                                </h6>
                                                <div class="top-seller-wrapper">
                                                    <div class="thumbnail">
                                                        <a href="{{ route('user.portfolio',@$data['item']->user->username)}}"><img src="{{ @$data['item']->user->profile->image? asset(@$data['item']->user->profile->image):asset('public/frontend/img/profile/1.png') }}"></a>
                                                    </div>
                                                    <div class="top-seller-content">
                                                        <a href="{{ route('user.portfolio',@$data['item']->user->username)}}">
                                                            <h6 class="name">{!! @$data['item']->user->username !!}</h6>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- single -->
                                                @php
                                                    $json=json_decode($feature2->feature2);
                                                @endphp
                                            @if ($json)
                                            <div class="rn-pd-sm-property-wrapper">
                                               
                                                <h6 class="pd-property-title">
                                                    Proprietati
                                                </h6>
                                                <div class="property-wrapper">
                                                    @foreach ( $json as $key => $value)
                                                    <!-- single property -->
                                                    <div class="pd-property-inner">
                                                        <span class="color-body type" style="text-transform: uppercase;">{{ $key }}</span>
                                                        <span class="color-white value" style="text-transform: uppercase;">{{ $value }}</span>
                                                    </div>
                                                    <!-- single property End -->
                                                    @endforeach
                                                </div>
                                            </div>
                                            <!-- single -->
                                            @endif
                                        </div>
                                        <!-- single -->
                                    </div>

                                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                        @foreach ($data['history'] as $his)
                                        <!-- single creator -->
                                        <div class="top-seller-inner-one mt--20">
                                            <div class="top-seller-wrapper">
                                                <div class="thumbnail">
                                                        <a href="#"><img src="{{ @$data['item']->user->profile->image? asset(@$data['item']->user->profile->image):asset('public/frontend/img/profile/1.png') }}"></a>
                                                </div>
                                                <div class="top-seller-content">
                                                        <span>{{ $his->subtotal}} toons cumparat de<a href="#">{{ $his->cumparator->username}}</a></span>
                                                        <span class="count-number">
                                                        {{ $his->created_at}}
                                                        </span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single creator -->
                                        @endforeach
                                    </div>
                                    <div class="tab-pane fade" id="nav-creator" role="tabpanel" aria-labelledby="nav-creator-tab">
                                        <!-- single -->
                                        <div class="rn-pd-bd-wrapper mt--20">
                                            <div class="top-seller-inner-one">
                                             
                                                <h6 class="name-title">
                                                    Creator
                                                </h6>
                                                <div class="top-seller-wrapper">
                                                    <div class="thumbnail">
                                                        <a href="{{ route('user.portfolio',@$data['item']->og->username)}}"><img src="{{ @$data['item']->og->profile->image? asset(@$data['item']->og->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="Nft_Profile"></a>
                                                    </div>
                                                    <div class="top-seller-content">
                                                        <a href="{{ route('user.portfolio',@$data['item']->og->username)}}">
                                                            <h6 class="name">{{ @$data['item']->og->full_name}}</h6>
                                                        </a>
                                                        <a href="{{ route('user.portfolio',@$data['item']->og->username)}}">
                                                            <h6 class="name"><span>@</span>{{ @$data['item']->og->username}}</h6>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- single -->
                                            <div class="rn-pd-sm-property-wrapper">
                                               <p>{!! @$data['item']->og->profile->about !!}</p>
                                            </div>
                                            <!-- single -->
                                            
                                        </div>
                                        <!-- single -->
                                    </div>
                                </div>
                                </div>
                            </div>
                            <div class="place-bet-area">
                                <div class="rn-bet-create">
                                @if (@$data['item']->active_status == 1)
                     <div class="theme-side-bar theme-side-bar13">
                        <div class="single-side-bar">
                           <div
                              class="side-bar-heading d-flex justify-content-between align-items-center mt-2">
                              {{-- <h4> <span id="license_type">@lang('lang.Regular') @lang('lang.License')</span>  <i class="ti-angle-down licenseShow" ></i> </h4>
                              <span class="Reg_total" id="Reg_total">{{@$infix_general_settings->currency_symbol}}{{ @$data['item']->Re_item}}</span>
                              <input type="text" class="_total" id="_total" value="{{ @$data['item']->Re_item}}" hidden>
                              <input type="hidden" value="{{@$infix_general_settings->currency_symbol}}" id="currency_symbol"> --}}
                              <!-- <h4> Pret </h4>  -->
                           </div>
                           <form action="{{ route('AddBuy') }}" method="POST">
                              @csrf
                              <div class="light-lisence-wrap">
                                 <div class="light-pakage-list">
                                    {{-- {!! $item_support->long_description !!} --}}
                                    <div class="bid-list winning-bid">
                                        <h6 class="title">Pret Curent</h6>
                                        <div class="top-seller-inner-one">
                                            <div class="top-seller-wrapper">
                                           
                                                <div class="top-seller-content">
                                               
                                                    <span class="count-number">
                                                      <strong class="" style="font-size: 20px;"><input type="text" id="pretInEth" style="color: #9fa4dd!important; border: 0px; border-radius: 0px; background: transparent; width: 70px; padding-left: 0px; font-weight: 800; padding-right: 0px;" readonly>
                                                         <span id="regular_license_price">ETH</span>
                                                      </strong> <br />
                                                    {{ @$data['item']->Re_item}}  {{@$infix_general_settings->currency_symbol}}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <input type="hidden" id="normal_regular_price" value="{{ @$data['item']->Re_item}}">
                                        <input type="radio" hidden class="price_option" data-default_price="{{ @$data['item']->Re_item}}" data-type="regular_license_price" data-normal="normal_regular_price" checked name="list_item_price" value="{{ @$data['item']->Re_item}}">
                                    </div>
                                    
                                  
                                 </div>
  
                                 <input type="text" hidden id="buy_license_type"  name="buy_license_type" value="1">
                                 <input type="text" hidden  name="_item_id" value="{{ @$data['item']->id}}">
                                 <input type="text" hidden  name="_item_percent" value="{{ @$data['BuyerFee']->fee/100}}">
                                 <input type="text" hidden  id="totalVal" name="totalVal" value="{{ @$data['item']->Re_item}}">
                                 <input type="text" hidden id="extra_price"  value="0">
                   
                                
                              </div>
                      
                           
                        </div>
                     </div>
                
                                    
                                    <div class="bid-list left-bid">
                                        <h6 class="title">Acest NFT are un pret FIX</h6>
                                      
                                    </div>
                                </div>
                                <!-- <a class="btn btn-primary-alta mt--30" href="#">Place a Bid</a> -->
                                @php 
                                       $drop_id = $data['item']->in_drop;
                                       $drop = App\Drops::where('id', $drop_id)->first();
                                       $azi = \Carbon\Carbon::now();
                                    @endphp
                                    @if (@$data['item']->user_id != Auth::user()->id)
                                        @if (@$data['item']->nftmultiplumax == @$data['item']->sell)
                                            @if (@$data['item']->is_upload == 1)
                                                @if (@$data['item']->in_drop == NULL)
                                                <button  type="submit" class="btn btn-primary-alta mt--30">@lang('lang.Buy') @lang('lang.Now') </button>
                                                @elseif ((@$data['item']->in_drop) && (@$drop->startdate <= $azi) && (@$drop->expdate >= $azi) )
                                                <p>NFT ESTE IN DROP SI DROPUL ESTE IN DERULARE</p>
                                                <button  type="submit" class="btn btn-primary-alta mt--30">@lang('lang.Buy') @lang('lang.Now') </button>
                                                @else
                                                <p>NFT este in drop iar dropul nu a inceput inca</p>
                                                @endif
                                                @else
                                                <a href="{{@$data['item']->purchase_link}}" target="_blank" class="btn btn-primary-alta mt--30">@lang('lang.Buy') @lang('lang.Now')</a>
                                   
                                            @endif
                                        @else
                                        <p>S-au terminat</p>
                                        @endif
                                    @else
                                        <p>Nu poti cumpara nft-ul tau</p>
                                    @endif
                            </div>
                            @endif
                        </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- End product details area -->

    <!-- New items Start -->
    <div class="rn-new-items rn-section-gapTop">
        <div class="container">
            <div class="row mb--30 align-items-center">
                <div class="col-12">
                    <h3 class="title mb--0" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">Alte NFT-uri de la acelasi Creator</h3>
                </div>
            </div>
            <div class="row g-5">
               @foreach ($morenfts as $more)
                <!-- start single product -->
                <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="col-lg-3 col-md-4 col-sm-6 col-12">
                  <div class="product-style-one no-overlay">
                        <div class="card-thumbnail">
                           <a href="{{ route('singleProduct',[str_replace(' ', '-',@$more->title),@$more->id])}}">
                                 @if (@$more->file == 'img')
                                    <img src="{{ asset(@$more->icon) }}" class="lazy nft__item_preview" alt="">
                                 
                                    @elseif(@$more->file == 'video')
                                    <video width="100%" height="100%" class="lazy nft__item_preview" autoplay muted controls loop>
                                    <source src="{{ asset(@$more->main_file) }}" type="video/mp4">
                                    
                                    Your browser does not support the video tag.
                                 </video>
                                 @endif
                           </a>
                        </div>
                        <div class="product-share-wrapper">
                           <div class="profile-share">
                                 <a href="{{ route('user.portfolio',@$more->og->username)}}" class="avatar" data-tooltip="{{ @$more->og->username }}"><img src="{{ $more->og->profile->image? asset($more->og->profile->image):asset('public/frontend/img/profile/1.png') }}"></a>
                                 <a class="more-author-text" href="#">{{ @$more->og->username }}</a>
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
                        <a href="{{ route('singleProduct',[str_replace(' ', '-',@$more->title),@$more->id])}}"><span class="product-name">{{ $more->title}}</span></a>
                    
                        <div class="bid-react-area">
                           <div class="last-bid">{{ $more->Re_item}} toons</div>
                            <div class="react-area">
                                <i data-feather="activity"></i>
                                <span class="number">{{ $more->sell}}</span>
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
    
    <form id="test-form" class="white-popup-block mfp-hide add_lisence_popup" action="{{ route('AddCartItem')}}" method="POST">
   @csrf
   <div class="form_header">
      @foreach (Cart::content()->unique('item_id') as $item)
      @if (@$data['item']->id == @$item->options['item_id'])
      <div class="alert alert-info" role="alert"> 
         <i class="ti-check"></i> @lang('lang.Already_Added_This_Item')
      </div>
      @endif
      @endforeach

      <input type="number" hidden id="item_id" name="id" value="{{  $data['item']->id }}">
      <input type="text" hidden  id="item_price" name="item_price" value="{{  $data['item']->Re_item }}">
      <input type="text" hidden  name="item_name" value="{{  $data['item']->title }}">
      <input type="text" hidden  name="description" value="{{  $data['item']->description }}">
      <input type="text" hidden  name="user_id" value="{{  $data['item']->user_id }}">
      <input type="text" hidden  name="username" value="{{  $data['item']->user->username }}">
      <input type="text" hidden  name="image" value="{{  $data['item']->thumbnail }}">
      <input type="text" hidden  name="icon" value="{{  $data['item']->icon }}">
      <input type="text" hidden id="BuyerFee" name="BuyerFee" value="0">
      {{-- <input type="number" hidden id="_mod_total"  value="{{  $data['item']->Re_item }}"> --}}
      <input type="text" hidden id="Extd_total" value="{{  $data['item']->Ex_total }}">
   </div>
   <input type="text" hidden  id="pop_license_type" value="1" name="license_type">
   <input type="text" hidden  id="pop_support_time" value="1" name="support_time">
   
</form>

@endsection
@section('script')
  <script src="{{asset('public/js/app.js')}}"></script>
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/dm_price_cal.js"></script>
<script>
    $(document).ready(function () {
        const pretInRon = {{ @$data['item']->Re_item}} ;
        $.ajax({
            type: "GET",
            dataType: 'json',
            url: `https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=RON`,
            success: function (data) {
               var price = pretInRon/data.RON;
               var myNumberWithTwoDecimalPlaces=parseFloat(price).toFixed(4);
                  $("#pretInEth").attr("value", myNumberWithTwoDecimalPlaces);
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
});
</script>
@endpush