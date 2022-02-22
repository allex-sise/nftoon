@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/dashboard.css">
<link rel="stylesheet" type="text/css" href="{{ asset('/') }}public/backEnd/css/croppie.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/vendor_view.css">


@endpush
@section('content')
@php
   $infix_general_settings = app('infix_general_settings');
@endphp
<input type="text" hidden value="{{ @$data['user']->username }}" name="user_id" class="user_id">
<!-- content begin -->
@php

    $banner = asset(@$data['user']->profile->logo_pic);
@endphp
<style>
.bg_image--92{
    background-image: url("{{ asset('public/frontend/newassets') }}/assets/images/slider/banner-06.png")!important;
}
</style>
<div class="rn-author-bg-area bg_image--92 bg_image ptb--150">
        <div class="container">
            <div class="row">
            </div>
        </div>
    </div>

    <div class="rn-author-area mb--30 mt_dec--120">
        <div class="container">
            <div class="row padding-tb-50 align-items-center d-flex">
                <div class="col-lg-12">
                    <div class="author-wrapper">
                        <div class="author-inner">
                            <div class="user-thumbnail">
                                <img src="{{ @$data['user']->profile->image? asset(@$data['user']->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                            </div>
                            <div class="rn-author-info-content">
                                <h4 class="title"><span>@</span>{{  @$data['user']->username }}</h4>
                                @php
                                    $walletz =  App\AuthorPayoutSetup::where('user_id', $data['user']->id)->where('payment_method_name','Bank')->first(); 
                                @endphp   
                                <a href="#" class="social-follw">
                                    <span class="user-name">{{ $walletz->payout_email ?? '' }}</span>
                                </a>
                                @if($walletz)<button id="btn_copy" title="Copy Text">Copy</button>@endif
                                <div class="follow-area">
                                    <div class="follow followers">
                                        <span>186k <a href="#" class="color-body">followers</a></span>
                                    </div>
                                    <div class="follow following">
                                        <span>156 <a href="#" class="color-body">following</a></span>
                                    </div>
                                </div>
                                <div class="author-button-area">
                                    <span class="btn at-follw follow-button"><i data-feather="user-plus"></i>
                                        Follow</span>
                                    <span class="btn at-follw share-button" data-bs-toggle="modal" data-bs-target="#shareModal"><i data-feather="share-2"></i></span>



                                    <div class="count at-follw">
                                        <div class="share-btn share-btn-activation dropdown">
                                            <button class="icon" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                <svg viewBox="0 0 14 4" fill="none" width="16" height="16" class="sc-bdnxRM sc-hKFxyN hOiKLt">
                                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 2C3.5 2.82843 2.82843 3.5 2 3.5C1.17157 3.5 0.5 2.82843 0.5 2C0.5 1.17157 1.17157 0.5 2 0.5C2.82843 0.5 3.5 1.17157 3.5 2ZM8.5 2C8.5 2.82843 7.82843 3.5 7 3.5C6.17157 3.5 5.5 2.82843 5.5 2C5.5 1.17157 6.17157 0.5 7 0.5C7.82843 0.5 8.5 1.17157 8.5 2ZM11.999 3.5C12.8274 3.5 13.499 2.82843 13.499 2C13.499 1.17157 12.8274 0.5 11.999 0.5C11.1706 0.5 10.499 1.17157 10.499 2C10.499 2.82843 11.1706 3.5 11.999 3.5Z" fill="currentColor"></path>
                                                </svg>
                                            </button>

                                            <div class="share-btn-setting dropdown-menu dropdown-menu-end">
                                                <button type="button" class="btn-setting-text report-text" data-bs-toggle="modal" data-bs-target="#reportModal">
                                                    Report
                                                </button>
                                                <button type="button" class="btn-setting-text report-text">
                                                    Claim Owenership
                                                </button>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="rn-authore-profile-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="tab-wrapper-one">
                        <nav class="tab-button-one">
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <button class="nav-link" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="false">On Sale</button>
                                <button class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="true">Owned</button>
                                <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Created</button>
                                <button class="nav-link" id="nav-liked-tab" data-bs-toggle="tab" data-bs-target="#nav-liked" type="button" role="tab" aria-controls="nav-liked" aria-selected="false">Bio</button>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="tab-content rn-bid-content" id="nav-tabContent">
                <div class="tab-pane row g-5 d-flex fade" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                @foreach ($data['item'] as $item)
                  
                  <!-- start single product -->
                      <div class="col-5 col-lg-4 col-md-6 col-sm-6 col-12">
                          <div class="product-style-one no-overlay with-placeBid">
                              <div class="card-thumbnail">
                                  <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                      <img src="{{ asset(@$item->icon) }}">
                                  </a>
                                  <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}" class="btn btn-primary">Place Bid</a>
                              </div>
                              <div class="product-share-wrapper">
                                  <div class="profile-share">
                                      <a href="{{ route('user.portfolio',@$item->og->username)}}" class="avatar" data-tooltip="Sadikur Ali"><img src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}"></a>
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
                              <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}"><span class="product-name">{{ @$item->title}}</span></a>
                              <span class="latest-bid">Highest bid 6/20</span>
                              <div class="bid-react-area">
                                  <div class="last-bid">{{ @$item->Re_item}} {{@$infix_general_settings->currency_symbol}}</div>
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
                <div class="tab-pane row g-5 d-flex fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                   
                @foreach ($data['item2'] as $item)
                  
                  <!-- start single product -->
                      <div class="col-5 col-lg-4 col-md-6 col-sm-6 col-12">
                          <div class="product-style-one no-overlay with-placeBid">
                              <div class="card-thumbnail">
                                  <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                      <img src="{{ asset(@$item->icon) }}">
                                  </a>
                                  <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}" class="btn btn-primary">Place Bid</a>
                              </div>
                              <div class="product-share-wrapper">
                                  <div class="profile-share">
                                      <a href="{{ route('user.portfolio',@$item->og->username)}}" class="avatar" data-tooltip="Sadikur Ali"><img src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}"></a>
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
                              <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}"><span class="product-name">{{ @$item->title}}</span></a>
                              <!-- <span class="latest-bid">Highest bid 6/20</span>
                              <div class="bid-react-area">
                                  <div class="last-bid">0.234wETH</div>
                                  <div class="react-area">
                                      <svg viewBox="0 0 17 16" fill="none" width="16" height="16" class="sc-bdnxRM sc-hKFxyN kBvkOu">
                                          <path d="M8.2112 14L12.1056 9.69231L14.1853 7.39185C15.2497 6.21455 15.3683 4.46116 14.4723 3.15121V3.15121C13.3207 1.46757 10.9637 1.15351 9.41139 2.47685L8.2112 3.5L6.95566 2.42966C5.40738 1.10976 3.06841 1.3603 1.83482 2.97819V2.97819C0.777858 4.36443 0.885104 6.31329 2.08779 7.57518L8.2112 14Z" stroke="currentColor" stroke-width="2"></path>
                                      </svg>
                                      <span class="number">322</span>
                                  </div>
                              </div> -->
                          </div>
                      </div>
                      <!-- end single product -->
                  @endforeach

                </div>
                <div class="tab-pane row g-5 d-flex fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                    <!-- start single product -->
                    <div class="col-5 col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="product-style-one no-overlay with-placeBid">
                            <div class="card-thumbnail">
                                <a href="product-details.html">
                                    <img src="assets/images/portfolio/portfolio-09.jpg" alt="NFT_portfolio">
                                </a>
                                <a href="product-details.html" class="btn btn-primary">Place Bid</a>
                            </div>
                            <div class="product-share-wrapper">
                                <div class="profile-share">
                                    <a href="author.html" class="avatar" data-tooltip="Sadikur Ali"><img src="assets/images/client/client-2.png" alt="Nft_Profile"></a>
                                    <a href="author.html" class="avatar" data-tooltip="Ali"><img src="assets/images/client/client-3.png" alt="Nft_Profile"></a>
                                    <a href="author.html" class="avatar" data-tooltip="Sadikur"><img src="assets/images/client/client-4.png" alt="Nft_Profile"></a>
                                    <a class="more-author-text" href="#">9+ Place Bit.</a>
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
                            <a href="product-details.html"><span class="product-name">BadBo66</span></a>
                            <span class="latest-bid">Highest bid 6/20</span>
                            <div class="bid-react-area">
                                <div class="last-bid">0.234wETH</div>
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
                </div>
                <div class="tab-pane row g-5 d-flex fade" id="nav-liked" role="tabpanel" aria-labelledby="nav-contact-tab">
                    <!-- start single product -->
                    <div class="row">
                                            <div class="social_profile" style="margin-bottom: 10px;">
                                                <h5>@lang('lang.social') @lang('lang.profiles')</h5>
                                                @if (@$data['socila_icons']->behance != "")
                                                <a href="{{$data['socila_icons']->behance}}" target="_blank">
                                           
                                                    <div class="social_input_icon float-left" style="background-size: cover;">
                                                        <i class="fa fa-behance"></i>
                                                    </div>
                                                   
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->deviantart != "")
                                                <a href="{{$data['socila_icons']->deviantart}}" target="_blank">
                                                    <div class="social_input_icon color-1 float-left" style="background-size: cover;">
                                                        <i class="fa fa-deviantart"></i>
                                                    </div>    
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->digg != "")
                                                <a href="{{$data['socila_icons']->digg}}" target="_blank">
                                                    <div class="social_input_icon color-2 float-left" style="background-size: cover;">
                                                        <i class="fa fa-digg"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->dribbble != "")
                                                <a href="{{$data['socila_icons']->dribbble}}" target="_blank">
                                                    <div class="social_input_icon color-3 float-left" style="background-size: cover;">
                                                        <i class="fa fa-dribbble"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->facebook != "")
                                                <a href="{{$data['socila_icons']->facebook}}" target="_blank">
                                                    <div class="social_input_icon color-4 float-left" style="background-size: cover;">
                                                        <i class="fa fa-facebook"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->flickr != "")
                                                <a href="{{$data['socila_icons']->flickr}}" target="_blank">
                                                    <div class="social_input_icon color-5 float-left" style="background-size: cover;">
                                                        <i class="fa fa-flickr"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->github != "")
                                                <a href="{{$data['socila_icons']->github}}" target="_blank">
                                                    <div class="social_input_icon color-6 float-left" style="background-size: cover;">
                                                        <i class="fa fa-github"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->google_plus != "")
                                                <a href="{{$data['socila_icons']->google_plus}}" target="_blank">
                                                    <div class="social_input_icon color-7 float-left" style="background-size: cover;">
                                                        <i class="fa fa-google-plus"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->lastfm != "")
                                                <a href="{{$data['socila_icons']->lastfm}}" target="_blank">
                                                    <div class="social_input_icon color-8 float-left" style="background-size: cover;">
                                                        <i class="fa fa-lastfm"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->linkedin != "")
                                                <a href="{{$data['socila_icons']->linkedin}}" target="_blank">
                                                    <div class="social_input_icon color-9 float-left" style="background-size: cover;">
                                                        <i class="fa fa-linkedin"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->reddit != "")
                                                <a href="{{$data['socila_icons']->reddit}}" target="_blank">
                                                    <div class="social_input_icon color-10 float-left">
                                                        <i class="fa fa-reddit"></i>
                                                    </div>
                                                </a>                       
                                            @endif
                                            @if (@$data['socila_icons']->soundcloud != "")
                                                <a href="{{$data['socila_icons']->soundcloud}}" target="_blank">
                                                    <div class="social_input_icon color-11 float-left" style="background-size: cover;">
                                                        <i class="fa fa-soundcloud"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->thumblr != "")
                                                <a href="{{$data['socila_icons']->thumblr}}" target="_blank">
                                                    <div class="social_input_icon color-12 float-left" style="background-size: cover;">
                                                        <i class="fa fa-tumblr"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->twitter != "")
                                                <a href="{{$data['socila_icons']->twitter}}" target="_blank">
                                                    <div class="social_input_icon color-13 float-left" style="background-size: cover;">
                                                        <i class="fa fa-twitter"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->vimeo != "")
                                                <a href="{{$data['socila_icons']->vimeo}}" target="_blank">
                                                    <div class="social_input_icon color-14 float-left" style="background-size: cover;">
                                                        <i class="fa fa-vimeo"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            @if (@$data['socila_icons']->youtube != "")
                                                <a href="{{$data['socila_icons']->youtube}}" target="_blank">
                                                    <div class="social_input_icon color-15 float-left" style="background-size: cover;">
                                                        <i class="fa fa-youtube-play"></i>
                                                    </div>
                                                </a>
                                            @endif
                                            </div>
                                        </div>
                                        <div class="row">
                                            <h5>Despre {{ @$data['user']->username }}</h5>
                                            <p>{!! nl2br(e(@$data['user']->profile->about)) !!}</p>
                                      
                                        </div>
                                        <div class="row">
                                            <h5>Data Aderare</h5>
                                            <p>{{ @$data['user']->profile->date_of_joining }} </p>
                                        </div>
                </div>
            </div>
        </div>
    </div>

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
<!-- Croppie js -->
<script src="{{ asset('/public/backEnd/js/')}}/croppie.js"></script>

<script src="{{asset('public/frontend/js/vendorView.js')}}"></script>
<script src="{{ asset('public/frontend/js/') }}/delete.js"></script>
<script>
    $(document).ready(function () {
        const pretInRon = {{ @$data['item']->Reg_total}} ;
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