@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/dashboard.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/dashboard.css">
<script src='https://js.stripe.com/v2/' type='text/javascript'></script>
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
    background-image: url("{{$banner}}")!important;
}
.form-wrapper-one input, .form-wrapper-one textarea {
    background: var(--background-color-4);
    height: 50px;
    border-radius: 5px;
    color: var(--color-white);
    font-size: 14px;
    padding: 10px 20px;
    border: 2px solid var(--color-border);
    transition: 0.3s;
    margin-bottom: 8px;
}
.rn-authore-profile-area .tab-content > .active {
    display: block !important;
}
.nav-tabs .nav-item.show .nav-link, .nav-tabs2 .nav-link.active {
    color: #495057;
    background-color: transparent;
    border-color: transparent;
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
.mg-b-25{
    margin-bottom: 25px;
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
                                @php
                                    $item =App\ManageQuery::CountItemSell($data['user']->id);
                                    $itemHistory = App\ItemOrder::where('author_id', $data['user']->id)->count();
                                @endphp
                                <div class="follow-area">
                                    <div class="follow followers">
                                        <span>186k <a href="#" class="color-body">followers</a></span>
                                    </div>
                                    <div class="follow following">
                                        <span>156 <a href="#" class="color-body">following</a></span>
                                    </div>
                                    <div class="follow following">
                                        <span> {{ @$itemHistory}} <a href="#" class="color-body"> @lang('lang.total') @lang('lang.sales')</a></span>
                                    </div>
                                   
                                </div>
                                <div class="author-button-area">
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
    <input type="text" hidden value="{{url('/')}}" id="url">
    <input type="text" hidden value="{{ @$data['user']->username }}" name="user_id" class="user_id">
    <div class="rn-authore-profile-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="tab-wrapper-one">
                        <nav class="tab-button-one">
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                <button class="nav-link {{ @$data['profile'] == url()->current() ?'active':'' }}" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">@lang('lang.profile')</button>
                            @endif
                            @if (@Auth::user()->role_id == 4)
                                <button class="nav-link {{ @$data['portfolio'] == url()->current() ?'active':'' }}" id="nav-portfolio-tab" data-bs-toggle="tab" data-bs-target="#nav-portfolio" type="button" role="tab" aria-controls="nav-portfolio" aria-selected="true">On Sale</button>
                                <button class="nav-link {{ @$data['followers'] == url()->current() ?'active':'' }}" id="nav-followers-tab" data-bs-toggle="tab" data-bs-target="#nav-followers" type="button" role="tab" aria-controls="nav-followers" aria-selected="true">@lang('lang.followers')</button>
                                <button class="nav-link {{ @$data['followings'] == url()->current() ?'active':'' }}" id="nav-followings-tab" data-bs-toggle="tab" data-bs-target="#nav-followings" type="button" role="tab" aria-controls="nav-followings" aria-selected="true">@lang('lang.followings')</button>
                            @endif
                            @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                <button class="nav-link {{ @$data['setting'] == url()->current() ?'active':'' }}" id="nav-setting-tab" data-bs-toggle="tab" data-bs-target="#nav-setting" type="button" role="tab" aria-controls="nav-setting" aria-selected="false">@lang('lang.settings')</button>
                                <button class="nav-link {{ @$data['download'] == url()->current() ?'active':'' }}" id="nav-download-tab" data-bs-toggle="tab" data-bs-target="#nav-download" type="button" role="tab" aria-controls="nav-downloads" aria-selected="false">Colectia Ta</button>
                                <button class="nav-link {{ @$data['referrals'] == url()->current() ?'active':'' }}" id="nav-referrals-tab" data-bs-toggle="tab" data-bs-target="#nav-referrals" type="button" role="tab" aria-controls="nav-referrals" aria-selected="false">Referrals</button>
                                <button class="nav-link {{ @$data['refunds'] == url()->current() ?'active':'' }}" id="nav-refunds-tab" data-bs-toggle="tab" data-bs-target="#nav-refunds" type="button" role="tab" aria-controls="nav-refunds" aria-selected="false">Wallet Retrageri</button>
                                <button class="nav-link {{ @$data['payout'] == url()->current() ?'active':'' }}" id="nav-payout-tab" data-bs-toggle="tab" data-bs-target="#nav-payout" type="button" role="tab" aria-controls="nav-payout" aria-selected="false">Retrageri</button>
                            @endif
                            @if (@Auth::user()->role_id == 4)
                                <button class="nav-link {{ @$data['earning'] == url()->current() ?'active':'' }}" id="nav-earning-tab" data-bs-toggle="tab" data-bs-target="#nav-earning" type="button" role="tab" aria-controls="nav-earning" aria-selected="false">@lang('lang.earnings')</button>
                                <button class="nav-link {{ @$data['statement'] == url()->current() ?'active':'' }}" id="nav-statement-tab" data-bs-toggle="tab" data-bs-target="#nav-statement" type="button" role="tab" aria-controls="nav-statement" aria-selected="false">@lang('lang.statements')</button>
                            @endif
                            </div>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="tab-content rn-bid-content" id="nav-tabContent">
            @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                <div class="tab-pane row g-5 d-flex fade {{ @$data['profile'] == url()->current() ?'show active':'' }}" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <div class="profile_profile">
                        <div class="row">
                            <div class="col-xl-8 col-md-6">
                                <div class="big_logo ">
                                    <div class="logo_thumb mb-0">
                                        <img src="{{ @$data['user']->profile->logo_pic? asset(@$data['user']->profile->logo_pic):asset('public/frontend/img/banner/banner.png') }}" alt="">
                                    </div>
                                    <p>{!! @$data['user']->profile->about !!} </p>
                                </div>
                            </div>
                            <div class="col-xl-4 col-md-6">
                                <div class="badge_mark">
                                        @php
                                            $level=App\ManageQuery::UserLabel($data['user']->balance->amount); 
                                            // DB::table('labels')->where('amount','<=',@$data['user']->balance->amount)->orderBy('id','desc')->first();
                                            $date=Carbon\Carbon::parse(Carbon\Carbon::now())->diffInDays(@$data['user']->created_at);
                                            $badge=App\ManageQuery::UserBadge($date); 
                                        @endphp
                                    <div class="first_badge ">
                                        <img height="auto" width="40" src="{{asset(@$level->icon)}}" data-toggle="tooltip" data-placement="bottom" title="Author level  {{ @$level->id}} : sold {{@GeneralSetting()->currency_symbol}} {{@round($data['user']->balance->amount > 50 ? $data['user']->balance->amount: 0) }}+ on {{GeneralSetting()->system_name}} " alt="">
                                        <img height="auto" width="40" src="{{asset(@$badge->icon)}}" data-toggle="tooltip" data-placement="bottom" title="{{@$badge->time }} years of membarship on {{GeneralSetting()->system_name}} " alt="">
                                    </div>
                                    
                                    <div class="social_profile ">
                                        <h5>@lang('lang.social_profiles')</h5>
                                        @if (@$data['socila_icons']->behance != "")
                                            <a target="_blank" href="{{$data['socila_icons']->behance}}"><i class="fa fa-behance"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->deviantart != "")
                                            <a target="_blank" href="{{$data['socila_icons']->deviantart}}"><i class="fa fa-deviantart"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->digg != "")
                                            <a target="_blank" href="{{$data['socila_icons']->digg}}"><i class="fa fa-digg"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->dribbble != "")
                                            <a target="_blank" href="{{$data['socila_icons']->dribbble}}"><i class="fa fa-dribbble"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->facebook != "")
                                            <a target="_blank" href="{{$data['socila_icons']->facebook}}"><i class="fa fa-facebook"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->flickr != "")
                                            <a target="_blank" href="{{$data['socila_icons']->flickr}}"><i class="fa fa-flickr"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->github != "")
                                            <a target="_blank" href="{{$data['socila_icons']->github}}"><i class="fa fa-github"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->google_plus != "")
                                            <a target="_blank" href="{{$data['socila_icons']->google_plus}}"><i class="fa fa-google-plus"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->lastfm != "")
                                            <a target="_blank" href="{{$data['socila_icons']->lastfm}}"><i class="fa fa-lastfm"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->linkedin != "")
                                            <a target="_blank" href="{{$data['socila_icons']->linkedin}}"><i class="fa fa-linkedin"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->reddit != "")
                                            <a target="_blank" href="{{$data['socila_icons']->reddit}}"><i class="fa fa-reddit"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->soundcloud != "")
                                            <a target="_blank" href="{{$data['socila_icons']->soundcloud}}"><i class="fa fa-soundcloud"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->thumblr != "")
                                            <a target="_blank" href="{{$data['socila_icons']->thumblr}}"><i class="fa fa-thumblr"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->twitter != "")
                                            <a target="_blank" href="{{$data['socila_icons']->twitter}}"><i class="fa fa-twitter"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->vimeo != "")
                                            <a target="_blank" href="{{$data['socila_icons']->vimeo}}"><i class="fa fa-vimeo"></i></a>
                                        @endif
                                        @if (@$data['socila_icons']->youtube != "")
                                            <a target="_blank" href="{{$data['socila_icons']->youtube}}"><i class="fa fa-youtube"></i></a>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            @endif
            @if (Auth::user()->role_id == 4)
                <div class="tab-pane row g-5 d-flex fade show {{ @$data['portfolio'] == url()->current() ?'show active':'' }}" id="nav-portfolio" role="tabpanel" aria-labelledby="nav-portfolio-tab">
               <div class="row">
                @if (count(@$data['item']) > 0)            
                    @foreach (@$data['item'] as $item)
                    <!-- start single product -->
                    <div class="col-5 col-lg-4 col-md-6 col-sm-6 col-12 mg-b-25 float-left">
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
                                
                                <div class="bid-react-area">
                                    <div class="last-bid">{{ @$item->Re_item}} toons</div>
                                    <div class="react-area">
                                        <i data-feather="activity"></i>
                                        <span class="number">{{ $item->sell}}</span>
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <!-- end single product -->
                    @endforeach
                    @else
                        <h4> Nu ai nici un NFT la vanzare</h4>
                    @endif
                    </div>
                </div>
            @endif
            @if (Auth::user()->role_id == 4)
                <div class="tab-pane row g-5 d-flex fade {{ @$data['followers'] == url()->current() ?'show active':'' }}" id="nav-followers" role="tabpanel" aria-labelledby="nav-followers-tab">
                    <div class="row g-5 mt--30 creator-list-wrapper">
                        @if (count(@$data['follower']))
                            @foreach (@$data['follower'] as $item)
                            @if (isset($item->balance))
                                <!-- start single top-seller -->
                                <div class="creator-single col-lg-4 col-md-6 col-sm-6" data-sal="slide-up" data-sal-delay="150" data-sal-duration="800">
                                        <div class="top-seller-inner-one explore">
                                            <div class="top-seller-wrapper">
                                                <div class="thumbnail varified">
                                                    <a href="{{ route('user.profile',@$item->username)}}"><img src="{{ @$item->profile->logo_pic? asset(@$item->profile->logo_pic):asset('public/frontend/img/profile/1.png') }}"></a>
                                                </div>
                                                <div class="top-seller-content">
                                                    <a href="{{ route('user.portfolio',$item->username)}}">
                                                        <h6 class="name"><span>@</span>{{$item->username}}</h6>
                                                    </a>
                                                    <span class="count-number">
                                                        {{ Str::limit(@$item->profile->about, 22) }}
                                                    </span>
                                                    <span class="count-number">
                                                        {{$item->balance->amount}} toons
                                                    </span>
                                                    <span class="count-number">
                                                    Vanzari
                                                    {{ $item->item->sum('sell') }}
                                                    </span>
                                                </div>
                                            </div>
                                            <a class="over-link" href="{{ route('user.portfolio',$item->username)}}"></a>
                                        </div>
                                    </div>
                                <!-- End single top-seller --> 
                            @endif
                            @endforeach
                            <div class="Pagination">
                                {{ @$data['follower']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                            </div>
                            @else
                            <h1>Nu ai nici un urmaritor</h1>
                        @endif
                        
                    </div>
                </div>
                
                @endif
                @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                    <div class="tab-pane row g-5 d-flex fade  {{ @$data['setting'] == url()->current() ?'show active':'' }}" id="nav-setting" role="tabpanel" aria-labelledby="nav-setting-tab">
                        <!-- create new product area -->
                            <div class="create-area">
                                <div class="container">
                                    <div class="row g-5">
                                        <div class="col-lg-3 ml_md--0 ml_sm--0">
                                            <!-- file upload area -->
                                            <div class="upload-area">

                                                <div class="upload-formate mb--30">
                                                    <h6 class="title">
                                                        @lang('lang.details') @lang('lang.personal')e
                                                    </h6>
                                                    <!-- <p class="formate">
                                                        Drag or choose your file to upload
                                                    </p> -->
                                                </div>
                                            </div>
                                            <!-- end upoad file area -->

                                            <div class="mt--100 mt_sm--30 mt_md--30 d-none d-lg-block">
                                                <div class="nav flex-column" id="v-pills-tab" role="tablist"
                                                    aria-orientation="vertical">
                                                    {{-- {{ Request::fullUrl()}} v-pills-home social_updated--}}
                                                    <a class="nav-link  {{ !str_contains(Request::fullUrl(),'?')?'active':'' }}" id="v-pills-home-tab"
                                                        data-toggle="pill" href="#v-pills-home" role="tab"
                                                        aria-controls="v-pills-home"
                                                        aria-selected="true">Detalii Personale</a>
                                                    <a class="nav-link {{ str_contains(Request::fullUrl(),'profile_updated')?'active':'' }}" id="v-pills-profile-tab"
                                                        data-toggle="pill" href="#v-pills-profile" role="tab"
                                                        aria-controls="v-pills-profile"
                                                        aria-selected="false">@lang('lang.profile')</a>
                                                    <a class="nav-link {{ str_contains(Request::fullUrl(),'email_setting')?'active':'' }}" id="v-pills-messages-tab"
                                                        data-toggle="pill" href="#v-pills-messages" role="tab"
                                                        aria-controls="v-pills-messages"
                                                        aria-selected="false">@lang('lang.setting') @lang('lang.email')</a>
                                                
                                                        <a class="nav-link {{ str_contains(Request::fullUrl(),'social_updated')?'active':'' }}" id="v-pills-Description-tab"
                                                        data-toggle="pill" href="#v-pills-Description"
                                                        role="tab" aria-controls="v-pills-settings"
                                                        aria-selected="false">@lang('lang.social') @lang('lang.network')</a>
                                                    <a class="nav-link" id="v-pills-fund-tab"
                                                        data-toggle="pill" href="#v-pills-fund"
                                                        role="tab" aria-controls="v-pills-settings"
                                                        aria-selected="false">Istoric Fonduri</a>    
                                                </div>
                                            </div>

                                        </div>

                                <div class="col-lg-9">
                                   
                                    <div class="my_tab_content">
                                    <div class="tab-content" id="v-pills-tabContent">
                                        <div class="tab-pane fade {{ !str_contains(Request::fullUrl(),'?')?'show active':'' }} " id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                       
                                            <div class="form-wrapper-one">
                                                <h4>{{@$data['profile_setting']->heading1}}</h4>
                                                <p>{{@$data['profile_setting']->text1}}</p>
                                            
                                                @if (@Auth::user()->role_id == 4)  
                                                    <form action="{{ route('author.personalUpdate',  $data['user']->id) }}" class="single_account-form" method="POST" id="personal_infor">
                                                    @endif
                                                    @if (@Auth::user()->role_id == 5)  
                                                    <form action="{{ route('customer.personalUpdate',  $data['user']->id) }}" class="single_account-form" method="POST" id="personal_infor">
                                                    @endif
                                                        @csrf
                                                        <input type="hidden" name="id" value="{{  @$data['user']->id}}">
                                                        <div class="row">
                                                            <div class="col-xl-6 col-md-6">
                                                                <input type="text" placeholder="@lang('lang.first_name') *" name="first_name" value="{{isset($data['user']->profile->first_name)? $data['user']->profile->first_name : old('first_name')}}">
                                                                @if ($errors->has('first_name'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('first_name') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            <div class="col-xl-6 col-md-6">
                                                                <input type="text" placeholder="@lang('lang.last_name') *" name="last_name" value="{{isset($data['user']->profile->last_name)? $data['user']->profile->last_name:old('last_name')}}">
                                                                @if ($errors->has('last_name'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('last_name') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            <div class="col-xl-6 col-md-6">
                                                                <input type="text" placeholder="@lang('lang.user_name') *" name="username" value="{{isset($data['user']->username)? $data['user']->username:old('username')}}" disabled>
                                                                @if ($errors->has('username'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('username') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            <div class="col-xl-6 col-md-6">
                                                                <input type="text" placeholder="@lang('lang.phone_number') *" name="mobile" value="{{isset($data['user']->profile->mobile)? $data['user']->profile->mobile:old('mobile')}}">
                                                                @if ($errors->has('mobile'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('mobile') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            <div class="col-xl-12 col-md-12">
                                                                <input type="email" name="email" placeholder="@lang('lang.email') *" value="{{  @$data['user']->email? @$data['user']->email:'Email Address'}}">
                                                            </div>
                                                        </div>
                                                        <div class="check-out-btn">
                                                            <button type="submit" class="btn btn-primary btn-large w-100">@lang('lang.save') Modificarile</button>
                                                        </div>
                                                    </form>

                                        
                                                    <h4>{{@$data['profile_setting']->heading2}}</h4>
                                                    <p>{{@$data['profile_setting']->text2}}</p>
                                                    @if (@Auth::user()->role_id == 4)
                                                    <form method="POST" action="{{url('author/author-change-password')}}" enctype="multipart/form-data">  
                                                    @endif
                                                    @if (@Auth::user()->role_id == 5)  
                                                    <form method="POST" action="{{url('customer-change-password')}}" enctype="multipart/form-data">  
                                                    @endif
                                                        @csrf
                                                        <div class="row justify-content-center mt-3 no-gutters" >
                                                            <div class="col-xl-6 col-md-8">
                                                                <div class="col-12 mb-30">
                                                                    <input id="password" type="password" placeholder="@lang('lang.current_password')" class="form-control @error('current_password') is-invalid @enderror" name="current_password" required >
                                                                    @if ($errors->has('current_password'))
                                                                        <span class="invalid-feedback text-left pl-3" role="alert">
                                                                            <strong class="dashboard_msg_clr" >{{ $errors->first('current_password') }}</strong>
                                                                        </span>
                                                                    @endif
                                                                </div>
                                                                
                                                                <div class="col-xl-12 mb-30">
                                                                    <input id="password" type="password" placeholder="@lang('lang.new_password')" class="form-control @error('new_password') is-invalid @enderror" name="new_password" required>
                                                                    @if ($errors->has('new_password'))
                                                                        <span class="invalid-feedback text-left pl-3" role="alert">
                                                                            <strong class="dashboard_msg_clr" >{{ $errors->first('new_password') }}</strong>
                                                                        </span>
                                                                    @endif
                                                                </div>
                                                                <div class="col-xl-12 mb-30">
                                                                    <input id="password-confirm" type="password" class="form-control" placeholder="@lang('lang.confirm_password')" name="confirm_password" required >
                                                                    @if ($errors->has('confirm_password'))
                                                                        <span class="invalid-feedback text-left pl-3" role="alert">
                                                                            <strong class="dashboard_msg_clr" >{{ $errors->first('confirm_password') }}</strong>
                                                                        </span>
                                                                    @endif
                                                                </div>
                                                                <div class="check-out-btn col-12 text-center mb-4">
                                                                    <button type="submit" class="btn btn-primary btn-large w-100">Schimba @lang('lang.password')</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                    </form>
                                                
                                                    <h4>{{@$data['profile_setting']->heading3}}</h4>
                                                    <p>{{@$data['profile_setting']->text3}}</p>
                                                    @if (@Auth::user()->role_id == 4)  
                                                    <form action="{{ route('author.personalUpdate',  $data['user']->id) }}" class="single_account-form" method="POST" id="personal_info">
                                                    @endif
                                                    @if (@Auth::user()->role_id == 5)  
                                                    <form action="{{ route('customer.personalUpdate',  $data['user']->id) }}" class="single_account-form" method="POST" id="personal_info">
                                                    @endif
                                                        @csrf
                                                        <input type="hidden" name="id" value="{{  @$data['user']->id}}">
                                                        <div class="row">
                                                            <div class="col-xl-6 col-md-6">
                                                                <input type="text" placeholder="@lang('lang.first_name')*" name="first_name" value="{{isset($data['user']->profile->first_name)? $data['user']->profile->first_name : old('first_name')}}">
                                                                @if ($errors->has('first_name'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('first_name') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            <div class="col-xl-6 col-md-6">
                                                                <input type="text" placeholder="@lang('lang.last_name')*" name="last_name" value="{{isset($data['user']->profile->last_name)? $data['user']->profile->last_name:old('last_name')}}">
                                                                @if ($errors->has('last_name'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('last_name') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            <div class="col-xl-6 col-md-6">
                                                                <input type="text" placeholder="@lang('lang.phone_number')" name="mobile" value="{{isset($data['user']->profile->mobile)? $data['user']->profile->mobile:old('mobile')}}">
                                                                @if ($errors->has('mobile'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('mobile') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            <div class="col-xl-6 col-md-6">
                                                                <input type="email" name="email" value="{{  @$data['user']->email? @$data['user']->email:'Email Address'}}" readonly>
                                                            </div>
                                                            <div class="col-xl-12 col-md-12">
                                                                <input type="text" placeholder="@lang('lang.address')*" name="address" value="{{isset($data['user']->profile->address)? $data['user']->profile->address:old('address')}}">
                                                                @if ($errors->has('address'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('address') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            <div class="col-xl-6 col-md-6 city_id">
                                                                <label for="name">@lang('lang.country_name') *</label>
                                                                <select class="wide customselect country"
                                                                    name="country_id" id="country">
                                                                    <option data-display="Country*">
                                                                        @lang('lang.select')</option>
                                                                    @foreach ($data['country'] as $item)                                                                                        
                                                                    <option value="{{ $item->id }}" {{@$data['user']->profile->country_id == $item->id ?'selected':'' }}>{{ $item->name }}</option>
                                                                    @endforeach
                                                                </select>
                                                                @if ($errors->has('country_id'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('country_id') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            <div class="col-xl-6 col-md-6 city_id">
                                                                    <label for="name">@lang('lang.state')/@lang('lang.region')</label>
                                                                    {{-- <select class="wide state customselect"
                                                                            name="state_id" id="state">
                                                                        <option data-display="Select">@lang('lang.select')</option>
                                                                        @if (@$data['user'])
                                                                        <option value="{{ @$data['user']->profile->state_id }}" selected >{{ @$data['user']->profile->state->name }}</option>
                                                                        @endif
                                                                    </select> --}}
                                                                    <input type="text" placeholder="@lang('lang.state')/@lang('lang.region')" name="state_id" value="{{isset($data['user']->profile->state_id)? $data['user']->profile->state_id:old('state_id')}}">
                                                                
                                                                    @if ($errors->has('state_id'))
                                                                        <span class="invalid-feedback" role="alert">
                                                                            <strong>{{ $errors->first('state_id') }}</strong>
                                                                        </span>
                                                                    @endif
                                                                </div>
                                                            <div class="col-xl-6 col-md-6 city_id">
                                                                
                                                                <label for="name">@lang('lang.city')</label>
                                                                {{-- <select class="wide city customselect"
                                                                        name="city_id" id="city">
                                                                    <option data-display="Town/City*">
                                                                        @lang('lang.select')</option>
                                                                        @if (@$data['user'])
                                                                        <option value="{{ @$data['user']->profile->city_id }}" selected >{{ @$data['user']->profile->city->name }}</option>
                                                                    @endif
                                                                </select> --}}
                                                                <input type="text" placeholder="@lang('lang.city')" name="city_id" value="{{isset($data['user']->profile->city_id)? $data['user']->profile->city_id:old('city_id')}}">
                                                                @if ($errors->has('city_id'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('city_id') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                        
                                                            <div class="col-xl-6 col-md-6">
                                                                <label for="zip_postal_code">@lang('lang.zip_postal_code') </label>
                                                                <input type="text" placeholder="Postcode/ZIP" name="zipcode" value="{{isset($data['user']->profile->zipcode)? $data['user']->profile->zipcode:old('zipcode')}}">
                                                                @if ($errors->has('zipcode'))
                                                                    <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $errors->first('zipcode') }}</strong>
                                                                    </span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                        <div class="check-out-btn">
                                                            <button type="submit" class="btn btn-primary btn-large w-100">@lang('lang.save') Modificarile</button>
                                                        </div>
                                                    </form>
                                                </div>
                                        </div>
                                        <div class="tab-pane fade {{ str_contains(Request::fullUrl(),'profile_updated')?'show active':'' }}" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                                
                                            <div class="form-wrapper-one">
                                          
                                                <form action="{{ route('user.profilePic',$data['user']->id)}}" method="POST" enctype="multipart/form-data" >
                                                @csrf
                                                <div class="profile_avater ">
                                                    <h4>Avatar</h4>
                                                    <div class="avater_upoad">
                                                        {{-- <img src="{{ @$data['user']->profile->image? asset(@$data['user']->profile->image):asset('public/frontend/img/profile/1.png') }}" width="100" alt="" id="pro_pic"> --}}
                                                        @php
                                                            $profile=$data['user']->profile->image;
                                                        @endphp
                                                        <img src="{{ file_exists(@$profile) ? asset($profile) : asset('public/uploads/user/user.png') }} " width="100" alt="">
                                                        <div class="image_upload_field">
                                                            <div class="upload-image">
                                                                <label class="mt-2 mb-2" for="#">@lang('lang.profile') @lang('lang.image')</label>
                                                                <div class="upload_image_input profile_pic">
                                                                    <input type="file"
                                                                        placeholder="No file selected" class="file-upload" name="profile_pic" onchange="readURL(this);">
                                                                    <div class="upload_image_overlay">
                                                                        <span
                                                                            class="brouse-here">@lang('lang.browse')...</span>
                                                                        <span id="Propic_chng">@lang('lang.No_file_selected')</span>
                                                                        <i class="ti-plus d-none"></i>
                                                                    </div>
                                                                </div>
                                                                
                                                                @if ($errors->has('profile_pic'))
                                                                <span class="invalid-feedback invalid-select error"
                                                                        role="alert">
                                                                    <strong>{{ $errors->first('profile_pic') }}</strong>
                                                                </span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="profile_page">
                                                        <h4>@lang('lang.about')</h4>
                                                            <textarea  cols="30" rows="10" name="about">{{isset($data['user']->profile->about) ? $data['user']->profile->about : old('about')}}</textarea>
                                                            @if ($errors->has('about'))
                                                            <span class="invalid-feedback invalid-select error"
                                                                    role="alert">
                                                                <strong>{{ $errors->first('about') }}</strong>
                                                            </span>
                                                            @endif
                                                        <div class="image_upload_field">
                                                            <div class="upload-image">
                                                                <label class="mt-2 mb-2" for="#">@lang('lang.banner') 
                                                                    @lang('lang.image')</label>
                                                                <div class="upload_image_input profile_pic">
                                                                    <input type="file"
                                                                        placeholder="No file selected"  name="backgroud_pic" onchange="BackImg(this)" id="back_pic_user">
                                                                    <div class="upload_image_overlay">
                                                                        <span
                                                                            class="brouse-here">@lang('lang.browse')...</span>
                                                                        <span id="back_pic">@lang('lang.No_file_selected')</span>
                                                                        <i class="ti-plus d-none"></i>
                                                                    </div>
                                                                </div>
                                                                
                                                                @if ($errors->has('backgroud_pic'))
                                                                <span class="invalid-feedback invalid-select error"
                                                                        role="alert">
                                                                    <strong>{{ $errors->first('backgroud_pic') }}</strong>
                                                                </span>
                                                                @endif
                                                                <button  type="submit" class="btn btn-primary btn-large w-100n">@lang('lang.save')
                                                                    Modificarile</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>

                                                </div>
                                            
                                        </div>

                                        
                                        
                                        <div class="tab-pane fade {{ str_contains(Request::fullUrl(),'email_setting')?'show active':'' }}" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                            <div class="form-wrapper-one">
                                                @php
                                            $email_setting=App\ManageQuery::UserEmailNotificationSettings();
                                            // DB::table('email_notification_settings')->where('user_id',Auth::user()->id)->first();
                                            @endphp
                                            @if (!empty($email_setting))
                                                <form action="{{ route('customer.userEmailNotificationUpdate')}}" method="post" >
                                            @else
                                                <form action="{{ route('customer.userEmailNotificationStore')}}" method="post" >
                                            @endif
                                            @csrf
                                            <input type="hidden" name="id" value="{{ isset($email_setting) ? $email_setting->id : '' }}">
                                            <div class="email_setting " id="">
                                                <h4> @lang('lang.email_settings') </h4>
                                                @if(@Auth::user()->role_id == 4)
                                                <div class="single_email_chose d-flex">
                                                    <div class="check_mark_here">
                                                        <div class="checkit">
                                                            <span class="chebox-style-custom">
                                                                <input class="styled-checkbox"
                                                                    id="styled-checkbox-2"
                                                                    type="checkbox" name="rating" value="1" {{ @$email_setting->rating ==1 ?'checked':""}} >
                                                                <label
                                                                    for="styled-checkbox-2"></label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="email_text">
                                                        <h5>@lang('lang.rating') @lang('lang.reminders')</h5>
                                                        <p>@lang('lang.send_email_reminding')</p>
                                                    </div>
                                                </div>
                                                @endif
                                                
                                                <div class="single_email_chose d-flex">
                                                    <div class="check_mark_here">
                                                        <div class="checkit">
                                                            <span class="chebox-style-custom">
                                                                <input class="styled-checkbox"
                                                                    id="styled-checkbox-29"
                                                                    type="checkbox" name="item_update" value="1"
                                                                    {{ @$email_setting->item_update ==1 ?'checked':""}}>
                                                                <label
                                                                    for="styled-checkbox-29"></label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="email_text">
                                                        <h5>@lang('lang.item') @lang('lang.update') @lang('lang.notifications')</h5>
                                                        <p>
                                                            @lang('lang.Send_an_email_when_an_item_purchased_updated')
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="single_email_chose d-flex">
                                                    <div class="check_mark_here">
                                                        <div class="checkit">
                                                            <span class="chebox-style-custom">
                                                                <input class="styled-checkbox"
                                                                    id="styled-checkbox-28"
                                                                    type="checkbox" name="item_comment" value="1"
                                                                    {{ @$email_setting->item_comment ==1 ?'checked':""}}>
                                                                <label
                                                                    for="styled-checkbox-28"></label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="email_text">
                                                        <h5>@lang('lang.item') @lang('lang.comment') @lang('lang.notifications')</h5>
                                                        <p>@lang('lang.comment_notification')</p>
                                                    </div>
                                                </div>
                                                @if(@Auth::user()->role_id == 4)
                                                <div class="single_email_chose d-flex">
                                                    <div class="check_mark_here">
                                                        <div class="checkit">
                                                            <span class="chebox-style-custom">
                                                                <input class="styled-checkbox"
                                                                    id="styled-checkbox-23"
                                                                    type="checkbox" name="item_review" value="1"
                                                                        {{ @$email_setting->item_review ==1 ?'checked':""}}>
                                                                <label
                                                                    for="styled-checkbox-23"></label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="email_text">
                                                        <h5>@lang('lang.item') @lang('lang.review') @lang('lang.notifications')</h5>
                                                        <p>@lang('lang.item_revirew_notification')</p>
                                                    </div>
                                                </div>
                                                @endif
                                                @if(@Auth::user()->role_id == 4)
                                                <div class="single_email_chose d-flex">
                                                    <div class="check_mark_here">
                                                        <div class="checkit">
                                                            <span class="chebox-style-custom">
                                                                <input class="styled-checkbox"
                                                                    id="styled-checkbox-21"
                                                                    type="checkbox" name="buyer_review" value="1"
                                                                    {{ @$email_setting->buyer_review ==1 ?'checked':""}}>
                                                                <label
                                                                    for="styled-checkbox-21"></label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="email_text">
                                                        <h5>@lang('lang.buyer') @lang('lang.review') @lang('lang.notifications')</h5>
                                                        <p>@lang('lang.buyer_review_notifications')</p>
                                                    </div>
                                                </div>
                                                @endif

                                                <div class="single_email_chose d-flex">
                                                    <div class="check_mark_here">
                                                        <div class="checkit">
                                                            <span class="chebox-style-custom">
                                                                <input class="styled-checkbox"
                                                                    id="styled-checkbox-20"
                                                                    type="checkbox" name="expiring_support" value="1"
                                                                    {{ @$email_setting->expiring_support ==1 ?'checked':""}}>
                                                                <label
                                                                    for="styled-checkbox-20"></label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="email_text">
                                                        <h5>@lang('lang.expiring') @lang('lang.support') @lang('lang.notifications')</h5>
                                                        <p>@lang('lang.send_me_a_daily_summary')</p>
                                                    </div>
                                                </div>
                                                @if(@Auth::user()->role_id == 4)
                                                <div class="single_email_chose d-flex">
                                                    <div class="check_mark_here">
                                                        <div class="checkit">
                                                            <span class="chebox-style-custom">
                                                                <input class="styled-checkbox"
                                                                    id="styled-checkbox-211"
                                                                    type="checkbox" name="daily_summary" value="1"
                                                                        {{ @$email_setting->daily_summary ==1 ?'checked':""}}>
                                                                <label
                                                                    for="styled-checkbox-211"></label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="email_text">
                                                        <h5>@lang('lang.daily') @lang('lang.summary') @lang('lang.emails')</h5>
                                                        <p>@lang('lang.daily_summary_emails')</p>
                                                    </div>
                                                </div>
                                                @endif
                                                    @if (!empty($email_setting))
                                                    <input type="submit" value="@lang('lang.update') Modificarile" class="btn btn-primary btn-large w-100"> 
                                                    @else
                                                    <input type="submit" value="@lang('lang.save') Modificarile" class="btn btn-primary btn-large w-100">          
                                                    @endif
                                                
                                            </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade {{ str_contains(Request::fullUrl(),'social_updated')?'show active':'' }}" id="v-pills-Description"
                                            role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                            <div class="form-wrapper-one">
                                                <div class="social_networks ">
                                                    <h4>@lang('lang.social') @lang('lang.networks')</h4>
                                                    @if (!empty($data['socila_icons']))
                                                        <form action="{{ route('user.socialUpdate') }}" method="post">
                                                    @else
                                                        <form action="{{ route('user.socialStore') }}" method="post">
                                                    @endif
                                                    
                                                        @csrf
                                                        <div class="row">
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div class="social_input_icon">
                                                                        <i class="fa fa-behance"></i>
                                                                    </div>
                                                                    <input type="text" name="behance" value="{{ isset($data['socila_icons'])? $data['socila_icons']->behance : '' }}"
                                                                        placeholder="Behance URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-1">
                                                                        <i class="fa fa-deviantart"></i>
                                                                    </div>
                                                                    <input type="text" name="deviantart" value="{{ isset($data['socila_icons'])? $data['socila_icons']->deviantart : '' }}"
                                                                        placeholder="Deviantart URL">
                                                                </div>
                                                            </div>
                                                                <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-2">
                                                                        <i class="fa fa-digg"></i>
                                                                    </div>
                                                                    <input type="text" name="digg" value="{{ isset($data['socila_icons'])? $data['socila_icons']->digg : '' }}"
                                                                        placeholder="Digg URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-3">
                                                                        <i class="fa fa-dribbble"></i>
                                                                    </div>
                                                                    <input type="text" name="dribbble" value="{{ isset($data['socila_icons'])? $data['socila_icons']->dribbble : ''}}"
                                                                        placeholder="Dribbble URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-4">
                                                                        <i class="fa fa-facebook"></i>
                                                                    </div>
                                                                    <input type="text"  name="facebook" value="{{ isset($data['socila_icons'])? $data['socila_icons']->facebook : '' }}"
                                                                        placeholder="facebook URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-5">
                                                                        <i class="fa fa-flickr"></i>
                                                                    </div>
                                                                    <input type="text" name="flickr" value="{{ isset($data['socila_icons'])? $data['socila_icons']->flickr : '' }}"
                                                                        placeholder="Flickr URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-6">
                                                                        <i class="fa fa-github"></i>
                                                                    </div>
                                                                    <input type="text" name="github" value="{{ isset($data['socila_icons'])? $data['socila_icons']->github : '' }}"
                                                                        placeholder="Github URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-7">
                                                                        <i
                                                                            class="fa fa-google-plus"></i>
                                                                    </div>
                                                                    <input type="text" name="google_plus" value="{{ isset($data['socila_icons'])? $data['socila_icons']->google_plus : '' }}"
                                                                        placeholder="Google Plus URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-8">
                                                                        <i class="fa fa-lastfm"></i>
                                                                    </div>
                                                                    <input type="text" name="lastfm" value="{{ isset($data['socila_icons'])? $data['socila_icons']->lastfm : '' }}"
                                                                        placeholder="Lastfm URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-9">
                                                                        <i class="fa fa-linkedin"></i>
                                                                    </div>
                                                                    <input type="text" name="linkedin" value="{{ isset($data['socila_icons'])? $data['socila_icons']->linkedin : '' }}"
                                                                        placeholder="Linkedin URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-10">
                                                                        <i class="fa fa-reddit"></i>
                                                                    </div>
                                                                    <input type="text" name="reddit" value="{{ isset($data['socila_icons'])? $data['socila_icons']->reddit : '' }}"
                                                                        placeholder="Reddit URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-11">
                                                                        <i class="fa fa-soundcloud"></i>
                                                                    </div>
                                                                    <input type="text" name="soundcloud" value="{{ isset($data['socila_icons'])? $data['socila_icons']->soundcloud : '' }}"
                                                                        placeholder="Soundcloud URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-12">
                                                                        <i class="fa fa-thumblr"></i>
                                                                    </div>
                                                                    <input type="text" name="thumblr" value="{{ isset($data['socila_icons'])? $data['socila_icons']->thumblr : '' }}"
                                                                        placeholder="Thumblr URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-13">
                                                                        <i class="fa fa-twitter"></i>
                                                                    </div>
                                                                    <input type="text" name="twitter" value="{{ isset($data['socila_icons'])? $data['socila_icons']->twitter : '' }}"
                                                                        placeholder="Twitter URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-14">
                                                                        <i class="fa fa-vimeo"></i>
                                                                    </div>
                                                                    <input type="text" name="vimeo" value="{{ isset($data['socila_icons'])? $data['socila_icons']->vimeo : '' }}"
                                                                        placeholder="Vimeo URL">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="single_social_input d-flex">
                                                                    <div
                                                                        class="social_input_icon color-15">
                                                                        <i
                                                                            class="fa fa-youtube-play"></i>
                                                                    </div>
                                                                    <input type="text" name="youtube" value="{{ isset($data['socila_icons'])? $data['socila_icons']->youtube : '' }}"
                                                                        placeholder="Youtube URL">
                                                                </div>
                                                            </div>
                                                                <button type="submit" class="btn btn-primary btn-large w-100"> @lang('lang.save') Modificarile</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    <div class="tab-pane fade" id="v-pills-fund" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                        <div class="form-wrapper-one">
                                            <div class="social_networks ">
                                                
                                                @php
                                                $funds=App\Deposit::where('user_id','=',Auth::user()->id)->get();
                                            @endphp

                                            <h3>@lang('lang.funding_history')</h3>
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>@lang('lang.date')</th>
                                                                <th>@lang('lang.amount')({{GeneralSetting()->currency_symbol}})</th>
                                                                <th>@lang('lang.details')</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        @foreach ($funds as $fund)
                                                            <tr>
                                                                <td>{{DateFormat(@$fund->created_at)}}</td>
                                                                <td>{{@$fund->amount}} </td>
                                                                <td>{{@$fund->details}} </td>
                                                            </tr>
                                                        @endforeach
                                                        </tbody>
                                                    </table>
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
                            <!-- create new product area -->
                   
                @endif
                @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                    <div class="tab-pane row g-5 d-flex fade {{ @$data['download'] == url()->current() ?'show active':'' }}" id="nav-download" role="tabpanel" aria-labelledby="nav-download-tab">
                        <div class="latest-goods-area">
                            @if(session()->has('success'))
                            <div class="alert alert-success">
                                {{ session()->get('success') }}
                            </div>
                        @endif
                        <div class="row">
                        @if (count(@$data['order'])>0)
                        
                        @foreach (@$data['itemspecial'] as $item)
                        
                            @if (Auth::user()->role_id==5)
                                @php
                                    if (in_array($item->item_id, @$data['refunds']))
                                        {
                                        continue;
                                        }
                                @endphp  
                            @endif
                            
                            
                            
                            @php
                                $PickId =  $item->item_id;
                            @endphp                                                  
                                @php
                                    $obj = json_decode($item, true);
                                @endphp 
                                <!-- start single product -->
                                    <div class="col-5 col-lg-4 col-md-6 col-sm-6 col-12 mg-b-25">
                                        <div class="product-style-one no-overlay with-placeBid">
                                            <div class="card-thumbnail">
                                                <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                                    <img src="{{ asset(@$item->icon) }}">
                                                </a>
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
                                                        @if ($item->status == 1)
                                                            @if ($item->active_status == 0)
                                                                <a class="btn-setting-text share-text"  href="{{ route('author.itemSale',$item->id)}}" class="heart"><i class="ti-money"></i>  Pune la vanzare</a>
                                                                <a class="btn-setting-text report-text"  href="{{ route('author.itemNftWallet',$item->id)}}" class="heart"><i class="ti-edit"></i>Muta NFT in Wallet-ul tau</a>
                                                            @elseif ($item->active_status == 1)
                                                                <a class="btn-setting-text share-text"  href="{{ route('author.itemScoateVanzare',$item->id)}}" class="heart"><i class="ti-edit"></i>  Scoate de la vanzare NFT-ul</a>
                                                                <a class="btn-setting-text report-text"  href="{{ route('author.itemSale',$item->id)}}" class="heart"><i class="ti-edit"></i>  Editeaza NFT-ul</a>
                                                            @endif
                                                        @endif
                                                    </div>
                
                                                </div>
                                            </div>
                                            <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}"><span class="product-name">{{ @$item->title}}</span></a>
                                            
                                            <div class="bid-react-area">
                                                <div class="react-area">
                                                    <i data-feather="activity"></i>
                                                    <span class="number">{{ $item->sell}}</span>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                    <!-- end single product -->
                            @endforeach
                            <div class="col-md-12 text-center">
                                <a href="#" id="loadmore2" class="black-btn wow fadeInUp">Arata mai multe</a>
                            </div> 
                
                        @else
                        <h4>Nu ai nici un NFT in colectie</h4>
                        @endif
                        </div>
                        </div>
                    </div>
                @endif
                @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                    <div class="tab-pane row g-5 d-flex fade {{ @$data['referrals'] == url()->current() ?'show active':'' }}" id="nav-referrals" role="tabpanel" aria-labelledby="nav-referrals-tab">
                        @if(session()->has('success'))
                            <div class="alert alert-success">
                                {{ session()->get('success') }}
                            </div>
                        @endif
                        <div class="main-details-area mt-3">
                                <div class="container">
                                    <div class="row mt-5">
                                            <div class="col-xl-10 offset-xl-1 affiliate_item">
                                                
                                                    <p> Copiaza si trimite acest link prietenilor tai pentru a deveni afiliati cu tine pe Minted.ro</p>
                                                    <input  class="list-group-item" id="aff_link" value="{{ Auth::user()->referral_link }}"  />
                                                    <button class="butonsp btn-main" onclick="myFunction()">Copiaza link-ul</button>
                                                
                                            </div>
                                    </div>
                                </div>
                            </div>
                        
                        <!-- main-details-area-start -->
                        <div class="main-details-area mt-3">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-10 offset-xl-1 col-lg-12">
                                            <div class="my_coupon">
                                                <div class="my_coupens_headeing mb-30">
                                                    <h3>Toti Afiliatii <b>({{ count(Auth::user()->referrals)  ?? '0' }})</b></h3>
                                                </div>
                                                @if (@$data['referrals'])
                                                <table class="table">
                                                    <tr>
                                                        <th>@lang('lang.affiliate') @lang('lang.name')</th>
                                                        <th>@lang('lang.added_time')</th>
                                                        <th>@lang('status')</th>
                                                    </tr>
                                                    
                                                    @foreach (@$data['affiliate'] as $item)
                                                        <tr>
                                                            <td>{{ @$item->username }}</td>
                                                            <td>{{DateFormat(@$item->created_at)}}</td>
                                                            <td>{{ @$item->status == 1 ?'Active':'Pending' }}</td>
                                                        </tr>
                                                    @endforeach
                                                    
                                                </table>
                                            
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                @endif
                @if (@Auth::user()->role_id == 4)
                    <div class="tab-pane row g-5 d-flex fade {{ @$data['refunds'] == url()->current() ?'show active':'' }}" id="nav-refunds" role="tabpanel" aria-labelledby="nav-refunds-tab">
                        @php
                            $bank_payment = @Auth::user()->payment_methods->where('name','Bank')->first();
                            $stripe_payment = @Auth::user()->payment_methods->where('name','Stripe')->first();
                            $paypal_payment = @Auth::user()->payment_methods->where('name','Paypal')->first();
                            $razor_payment = @Auth::user()->payment_methods->where('name','Razor')->first();
                            $default_payout=defaultPayout();
                            // echo $default_payout->payment_method_name;
                            $payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->first();
                            $bank_payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('payment_method_name','Bank')->first();
                            $stripe_payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('payment_method_name','Stripe')->first();
                            $paypal_payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('payment_method_name','PayPal')->first();
                            $razorpay_payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('payment_method_name','Razorpay')->first();
                        @endphp
                        <!-- start connect area -->
                            <div class="rn-connect-area rn-section-gapTop">
                                <div class="container">
                                    <div class="row g mb--50 mb_md--30 mb_sm--30 align-items-center">
                                        <div class="col-lg-6" data-sal="slide-up" data-sal-delay="150" data-sal-duration="800">
                                            <h3 class="connect-title">Connect your wallet</h3>
                                            <p class="connect-td">Connect with one of available wallet providers or create a new wallet. <a href="#">What is a wallet?</a></p>
                                        </div>
                                        <div class="col-lg-6" data-sal="slide-up" data-sal-delay="200" data-sal-duration="800">
                                            <p class="wallet-bootm-disc">
                                                We do not own your private keys and cannot access your funds without your confirmation.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row g-5">
                                        <div class="col-lg-6">
                                            <div class="row g-5">
                                                <nav>
                                                    <ul class="nav nav-tabs  nav-tabs2 payout_tab_wrap" id="myTab" role="tablist">
                                                        @if (PaymentMethodStatus('Blockchain')=='true')
                                                        <li class="nav-item" style="width: 49%;">
                                                                <!-- start single wallet -->
                                                                <div class="col-xxl-12 col-lg-12 col-md-12 col-12 col-sm-6 col-12" data-sal="slide-up" data-sal-delay="150" data-sal-duration="800">
                                                                    <div class="wallet-wrapper">
                                                                        <div class="inner">
                                                                            <div class="icon">
                                                                                <i data-feather="cast"></i>
                                                                            </div>
                                                                            <div class="content">
                                                                                <h4 class="title"><a href="#">Blockchain ETH</a></h4>
                                                                                <p class="description">@lang('lang.minimum_amount') {{@GeneralSetting()->currency_symbol}} {{env('BANK_MIN_PAYOUT')}}</p>
                                                                            </div>
                                                                        </div>
                                                                        <a class="over-link nav-link {{ isset($default_payout) ? $default_payout->payment_method_name == 'Bank'  ? 'active' :'' : ''}} " id="payoutsBank-tab" data-toggle="tab" href="#payoutsBank" role="tab" aria-controls="home" aria-selected="true"></a>
                                                                    </div>
                                                                </div>
                                                                <!-- start single wallet -->
                                                        </li>
                                                        @endif
                                                        @if (PaymentMethodStatus('Stripe')=='true')
                                                        <li class="nav-item" style="width: 49%; margin-left: 10px;">
                                                            <!-- start single wallet -->
                                                            <div class="col-xxl-12 col-lg-12 col-md-12 col-12 col-sm-6 col-12" data-sal="slide-up" data-sal-delay="200" data-sal-duration="800">
                                                                <div class="wallet-wrapper">
                                                                    <div class="inner">
                                                                        <div class="icon">
                                                                            <i class="color-purple" data-feather="box"></i>
                                                                        </div>
                                                                        <div class="content">
                                                                            <h4 class="title"><a href="#">Stripe</a></h4>
                                                                            <p class="description">@lang('lang.minimum_amount') {{@GeneralSetting()->currency_symbol}} {{env('STRIPE_MIN_PAYOUT')}}</p>
                                                                        </div>
                                                                    </div>
                                                                    <a class="over-link  nav-link {{ isset($default_payout) ? $default_payout->payment_method_name == 'Stripe'  ? 'active' :'' : ''}} " id="payouts1-tab" data-toggle="tab" href="#payouts1" role="tab" aria-controls="home" aria-selected="true"></a>
                                                                </div>
                                                            </div>
                                                            <!-- start single wallet -->
                                                            @endif
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                        <div class="col-lg-6" data-sal="slide-up" data-sal-delay="150" data-sal-duration="500">
                                            <div class="connect-thumbnail">
                                                <div class="left-image">
                                                    <div class="tab-content tabmargin200px" id="myTabContent">
                                                        <div class="tab-pane fade {{ isset($default_payout) ? $default_payout->payment_method_name == 'Bank'  ? 'show active' :'' : ''}} " id="payoutsBank" role="tabpanel" aria-labelledby="payoutsBank-tab">
                                                            <div class="row">
                                                                <div class="col-xl-10">
                                                                    <div class="account_swift_maintain pb-0">
                                                                        <h2 class="comn-heading">Adresa Wallet</h2>
                                                                        <div class='form-row'>
                                                                            <div class='col-md-12 error form-group d-none'>
                                                                                <div class='alert-danger alert' ></div>
                                                                            </div>
                                                                        </div>
                                                                        <form action="{{ route('author.setup_payout')}}"  method="POST" class="checkout-form">
                                                                            @csrf
                                                                            <div class="row">
                                                                                <div class="col-xl-12">
                                                                                    <div class="row">
                                                                                        <input type="text" name="name" value="Bank" hidden>
                                                                                        <div class="col-xl-12 col-md-12">
                                                                                        <div id="app">
                                                                                            <withdraw/>
                                                                                        </div> 
                                                                                        <!-- //todo: aici insereaza valoarea walletului -->
                                                                                            <!-- <input type="text" name="email" id="" value="{{ @$bank_payout_setup->payout_email }}"/> -->
                                                                                        </div>
                                                                                
                                                                                    </div>
                                                                                </div>
                                                                                
                                                                            </div>
                                                                            <div class="check-out-btn mt-20">
                                                                                <button type="submit" class="btn btn-primary btn-large w-100">@lang('lang.setup_account')</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade {{ isset($default_payout) ? $default_payout->payment_method_name == 'Stripe'  ? 'show active' :'' : ''}} " id="payouts1" role="tabpanel"aria-labelledby="payouts1-tab">
                                                            <div class="row">
                                                                <div class="col-xl-10">
                                                                    <div class="account_swift_maintain pb-0">
                                                                        <h2 class="comn-heading">@lang('lang.your_stripe_account')</h2>
                                                                        <p class="comn-para">@lang('lang.get_paid_by_credit_or') <a target="_blank" href="https://stripe.com/">@lang('lang.more_about_stripe')</a> | <a target="_blank" href="https://dashboard.stripe.com/register">@lang('lang.create_an_account')</a></p>
                                                                            <div class='form-row'>
                                                                                    <div class='col-md-12 error form-group d-none'>
                                                                                        <div class='alert-danger alert' ></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="dm_display_none">
                                                                                    <form action="{{ route('author.setup_payout')}}" method="POST" id="payout-setup" >
                                                                                        {{ csrf_field() }}
                                                                                        
                                                                                        <div class="check-out-btn mt-20">
                                                                                            <button type="submit" class="btn-main ">@lang('lang.setup_account')</button>
                                                                                        </div>
                                                                                        
                                                                                    </form>
                                                                                </div>
                                                                                <form action="{{ route('author.setup_payout')}}"  method="POST" class="checkout-form">
                                                                                    @csrf
                                                                                    <div class="row">
                                                                                        <div class="col-xl-6">
                                                                                            <div class="row">
                                                                                                <input type="text" name="name" value="Stripe" hidden>
                                                                                                <div class="col-xl-12 col-md-12">
                                                                                                    <label for="name">@lang('lang.email') <span>*</span></label>
                                                                                                    <input type="text" name="email" value="{{ @$stripe_payout_setup->payout_email }}" 
                                                                                                        placeholder="@lang('lang.enter_email_address')">
                                                                                                </div>
                                                                                        
                                                                                            </div>
                                                                                        </div>
                                                                                        
                                                                                    </div>
                                                                                    <div class="check-out-btn mt-20">
                                                                                        <button type="submit" class="btn btn-primary btn-large w-100">@lang('lang.setup_account')</button>
                                                                                    </div>
                                                                                </form>
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
                            <!-- End connect area -->
                    </div>
                @endif
                @if (@Auth::user()->role_id == 5)
                    <div class="tab-pane row g-5 d-flex fade {{ @$data['refunds'] == url()->current() ?'show active':'' }}" id="nav-refunds" role="tabpanel" aria-labelledby="nav-refunds-tab">
                        <div class="payment_wrap account_tabs_pin">
                        @php
                            $bank_payment = @Auth::user()->payment_methods->where('name','Bank')->first();
                            $stripe_payment = @Auth::user()->payment_methods->where('name','Stripe')->first();
                            $paypal_payment = @Auth::user()->payment_methods->where('name','Paypal')->first();
                            $razor_payment = @Auth::user()->payment_methods->where('name','Razor')->first();
                            $default_payout=defaultPayout();
                            // echo $default_payout->payment_method_name;
                            $payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->first();
                            $bank_payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('payment_method_name','Bank')->first();
                            $stripe_payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('payment_method_name','Stripe')->first();
                            $paypal_payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('payment_method_name','PayPal')->first();
                            $razorpay_payout_setup=App\AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('payment_method_name','Razorpay')->first();
                        @endphp
                        <nav>
                            <ul class="nav nav-tabs payout_tab_wrap" id="myTab" role="tablist">
                                    @if (PaymentMethodStatus('Blockchain')=='true')
                                        
                                    <li class="nav-item">
                                        <a class="p-0  nav-link {{ isset($default_payout) ? $default_payout->payment_method_name == 'Bank'  ? 'active' :'' : ''}} " id="payoutsBank-tab"
                                            data-toggle="tab" href="#payoutsBank" role="tab"
                                            aria-controls="home" aria-selected="true">
                                            
                                            
                                            <div class="single_payout_item w-100">
                                                <div class="deposite_header text-center">
                                                    Blockchain ETH
                                                </div>
                                                <div class="deposite_button text-center">
                                                    <p>@lang('lang.minimum_amount') {{@GeneralSetting()->currency_symbol}} {{env('BANK_MIN_PAYOUT')}} </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li> 
                                    @endif
                                    @if (PaymentMethodStatus('Stripe')=='true')
                                        
                                    <li class="nav-item">
                                        <a class="p-0  nav-link {{ isset($default_payout) ? $default_payout->payment_method_name == 'Stripe'  ? 'active' :'' : ''}} " id="payouts1-tab"
                                            data-toggle="tab" href="#payouts1" role="tab"
                                            aria-controls="home" aria-selected="true">
                                        
                                            <div class="single_payout_item w-100">
                                                <div class="deposite_header text-center">
                                                    Stripe
                                                </div>
                                                <div class="deposite_button text-center">
                                                    <p>@lang('lang.minimum_amount') {{@GeneralSetting()->currency_symbol}} {{env('STRIPE_MIN_PAYOUT')}} </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    @endif
                                    {{-- {{dd(PaymentMethodStatus('PayPal'))}} --}}
                                
                            </ul>
                        </nav>
                        
                        <div class="tab-content tabmargin200px" id="myTabContent">
                            <div class="tab-pane fade {{ isset($default_payout) ? $default_payout->payment_method_name == 'Bank'  ? 'show active' :'' : ''}} " id="payoutsBank" role="tabpanel"
                                aria-labelledby="payoutsBank-tab">
                                <div class="row">
                                    <div class="col-xl-10">
                                        <div class="account_swift_maintain pb-0">
                                            <h2 class="comn-heading">Adresa Wallet</h2>
                                            
                                                    <div class='form-row'>
                                                            <div class='col-md-12 error form-group d-none'>
                                                                <div class='alert-danger alert' ></div>
                                                            </div>
                                                        </div>
                                                        
                                            

                                            <form action="{{ route('customer.setup_payout')}}"  method="POST" class="checkout-form">
                                                @csrf
                                                <div class="row">
                                                    <div class="col-xl-12">
                                                        <div class="row">
                                                            <input type="text" name="name" value="Bank" hidden>
                                                            <div class="col-xl-12 col-md-12">
                                                            <div id="app">
                                                                <withdraw/>
                                                            </div> 
                                                            <!-- //todo: aici insereaza valoarea walletului -->
                                                                <!-- <input type="text" name="email" id="" value="{{ @$bank_payout_setup->payout_email }}"/> -->
                                                            </div>
                                                    
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="check-out-btn mt-20">
                                                    <button type="submit" class="btn-main dpf-submit">@lang('lang.setup_account')</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                    

                            </div>
                            <div class="tab-pane fade {{ isset($default_payout) ? $default_payout->payment_method_name == 'Stripe'  ? 'show active' :'' : ''}} " id="payouts1" role="tabpanel"
                                aria-labelledby="payouts1-tab">
                                <div class="row">
                                    <div class="col-xl-10">
                                        <div class="account_swift_maintain pb-0">
                                            <h2 class="comn-heading">@lang('lang.your_stripe_account')</h2>
                                            <p class="comn-para">@lang('lang.get_paid_by_credit_or') <a target="_blank" href="https://stripe.com/">@lang('lang.more_about_stripe')</a> | <a target="_blank" href="https://dashboard.stripe.com/register">@lang('lang.create_an_account')</a></p>
                                                    <div class='form-row'>
                                                            <div class='col-md-12 error form-group d-none'>
                                                                <div class='alert-danger alert' ></div>
                                                            </div>
                                                        </div>
                                                        <div class="dm_display_none">
                                                            <form action="{{ route('customer.setup_payout')}}" method="POST" id="payout-setup" >
                                                                {{ csrf_field() }}
                                                                
                                                                <div class="check-out-btn mt-20">
                                                                    <button type="submit" class="btn btn-primary btn-large w-100 ">@lang('lang.setup_account')</button>
                                                                </div>
                                                                
                                                            </form>
                                                        </div>
                                            

                                            <form action="{{ route('customer.setup_payout')}}"  method="POST" class="checkout-form">
                                                @csrf
                                                <div class="row">
                                                    <div class="col-xl-6">
                                                        <div class="row">
                                                            <input type="text" name="name" value="Stripe" hidden>
                                                            <div class="col-xl-12 col-md-12">
                                                                <label for="name">@lang('lang.email') <span>*</span></label>
                                                                <input type="text" name="email" value="{{ @$stripe_payout_setup->payout_email }}" 
                                                                    placeholder="@lang('lang.enter_email_address')">
                                                            </div>
                                                    
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="check-out-btn mt-20">
                                                    <button type="submit" class="btn btn-primary btn-large w-100">@lang('lang.setup_account')</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            
                            
                        </div>
                    </div>
                </div>
                @endif
                @if (@Auth::user()->role_id == 4)
                    <div class="tab-pane row g-5 d-flex fade {{ @$data['payout'] == url()->current() ?'show active':'' }}" id="nav-payout" role="tabpanel" aria-labelledby="nav-payout-tab">
                        <div class="payment_wrap account_tabs_pin">
                            <div class="row">
                            @if (defaultPayout())
                                @if (defaultPayout()->payment_method_name=='Stripe')
                                <div class="col-lg-7  ">
                                    <h2>Balanta Ta</h2>
                                    <p>@lang('lang.You_currently_have')  {{Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}} </p>
                                    @php 
                                        $withdraw = App\Withdraw::where('user_id', Auth::user()->id)->orderBy('id', 'desc')->first();
                                    
                                    @endphp
                                    @if (!@$withdraw)
                                    <form action="{{ route('author.withdraw_amount')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            <div class="row">
                                                <div class="col-xl-6">
                                                    <div class="row">
                                                        <input type="text" name="pay_address" value="{!! defaultPayout()->payout_email !!}" hidden>
                                                        <input type="text" name="payment_method_id" value="1" hidden>
                                                        <div class="col-xl-12 col-md-12">
                                                            <label for="name">Suma Retragere <span>*</span></label>
                                                            <input type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null"  name="withdraw_amount" placeholder="Introduceti suma dorita pentru retragere">
                                                        </div>
                                                
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 ">
                                                    <div class="check-out-btn">
                                                        <button type="submit" class="btn btn-primary w-100" style="margin-top: 18px;">Retrage</button>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </form>
                                        @elseif($withdraw->paid_vendors_id !== NULL)
                                        <form action="{{ route('author.withdraw_amount')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            <div class="row">
                                                <div class="col-xl-6">
                                                    <div class="row">
                                                        <input type="text" name="pay_address" value="{!! defaultPayout()->payout_email !!}" hidden>
                                                        <input type="text" name="payment_method_id" value="1" hidden>
                                                        <div class="col-xl-12 col-md-12">
                                                            <label for="name">Suma Retragere <span>*</span></label>
                                                            <input type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null"  name="withdraw_amount" placeholder="Introduceti suma dorita pentru retragere">
                                                        </div>
                                                
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 ">
                                                    <div class="check-out-btn">
                                                        <button type="submit" class="btn btn-primary w-100" style="margin-top: 18px;">Retrage</button>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </form>
                                        @else
                                            <p>Ai deja o cerere de retragere in executie</p>
                                            <form action="{{ route('author.anuleazaWithdraw')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            
                                            
                                            <input type="text" name="withdraw_id" value="{{@$withdraw->id}}" hidden>
                                            <input type="text" name="withdraw_amountz" value="{{@$withdraw->amount}}" hidden>   
                                            <button type="submit" class="btn btn-primary w-100" style="margin-top: 18px;">Anuleaza</button>
                                            </form>
                                        @endif
                                </div>
                                @elseif(defaultPayout()->payment_method_name=='Bank')
                                <div class="col-lg-7  ">
                                    <h2>Balanta Ta ETH</h2>
                                    <p>@lang('lang.You_currently_have')  {{Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}} care inseamna aproximatix: <strong class="" style="font-size: 18px;"><input type="text" id="pretInEth" style="color: #9fa4dd!important; border: 0px; border-radius: 0px; background: transparent; width: 70px; padding-left: 0px; font-weight: 800; padding-right: 0px;" readonly>
                                    
                                    <span id="regular_license_price">ETH</span>
                                    <button type="button" id="exampletool" class="btn btn-secondary btntool" data-toggle="tooltip" data-placement="top" data-html="true" title="<em>Informatii</em> <u>despre</u> <b>Retragere prin ETH</b>">
                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                    </button>
                                </strong> 
                                </p>
                                    @php 
                                        $withdraw = App\Withdraw::where('user_id', Auth::user()->id)->orderBy('id', 'desc')->first();
                                    
                                    @endphp
                                    @if (!@$withdraw)
                                    <form action="{{ route('author.withdraw_amount')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            <div class="row">
                                                <div class="col-xl-9">
                                                    <div class="row">
                                                        <input type="text" name="payment_method_id" value="2" hidden>
                                                        <input type="text" name="pay_address" value="{!! defaultPayout()->payout_email !!}" hidden>
                                                        <input type="numeric" min="0" id="ETH2RON"  name="withdraw_amount_eth" value="" placeholder="Introduceti suma dorita pentru retragere" hidden>
                                                        <label for="basic-url">Suma Retragere* (in ETH)</label>
                                                        <div class="col-xl-12 col-md-12">
                                                        
                                                            <div class="col-md-6 colmd55 float-left">
                                                                
                                                                <div class="input-group mb-3">
                                                                    <input type="numeric" style="width: 140px!important" class="form-control" min="0" id="input"  onkeyup="regular(this.value)" name="withdraw_amount_eth" value="" 
                                                                            placeholder="Introduceti suma dorita pentru retragere" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text" id="basic-addon2">ETH</span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 colmd55 float-left">
                                                                <div class="input-group mb-3">
                                                                    <input type="text" id="pretInETH2"  name="withdraw_amount" style="width: 140px!important" class="form-control" onkeyup="regular(this.value)"  placeholder="Suma in Credite Minted" aria-label="Suma in Credite Minted" aria-describedby="basic-addon3" readonly >   
                                                                
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text" id="basic-addon2">LEI</span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                            </div>
                                                
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 ">
                                                    <div class="check-out-btn">
                                                        <button type="submit" class="btn-main dpf-submit" style="margin-top: 32px;">Retrage</button>
                                                    </div>
                                                </div>
                                            </div> 
                                        </form>
                                        @elseif($withdraw->paid_vendors_id !== NULL)
                                        <form action="{{ route('author.withdraw_amount')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            <div class="row">
                                                <div class="col-xl-9">
                                                    <div class="row">
                                                        <input type="text" name="payment_method_id" value="2" hidden>
                                                        <input type="text" name="pay_address" value="{!! defaultPayout()->payout_email !!}" hidden>
                                                        <input type="numeric" min="0" id="ETH2RON"  name="withdraw_amount_eth" value="" placeholder="Introduceti suma dorita pentru retragere" hidden>
                                                        <label for="basic-url">Suma Retragere* (in ETH)</label>
                                                        <div class="col-xl-12 col-md-12">
                                                        
                                                            <div class="col-md-6 colmd55 float-left">
                                                                
                                                                <div class="input-group mb-3">
                                                                    <input type="numeric" style="width: 140px!important" class="form-control" min="0" id="input"  onkeyup="regular(this.value)" name="withdraw_amount_eth" value="" 
                                                                            placeholder="Introduceti suma dorita pentru retragere" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text" id="basic-addon2">ETH</span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 colmd55 float-left">
                                                                <div class="input-group mb-3">
                                                                    <input type="text" id="pretInETH2"  name="withdraw_amount" style="width: 140px!important" class="form-control" onkeyup="regular(this.value)"  placeholder="Suma in Credite Minted" aria-label="Suma in Credite Minted" aria-describedby="basic-addon3" readonly >   
                                                                
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text" id="basic-addon2">LEI</span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                            </div>
                                                
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 ">
                                                    <div class="check-out-btn">
                                                        <button type="submit" class="btn-main dpf-submit" style="margin-top: 32px;">Retrage</button>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </form>
                                        @else
                                            <p>Ai deja o cerere de retragere in executie</p>
                                            <form action="{{ route('author.anuleazaWithdraw')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            
                                            
                                            <input type="text" name="withdraw_id" value="{{@$withdraw->id}}" hidden>
                                            <input type="text" name="withdraw_amountz" value="{{@$withdraw->amount}}" hidden>   
                                            <button type="submit" class="btn-main dpf-submit" style="margin-top: 32px;">Anuleaza</button>
                                            </form>
                                        @endif
                                </div>
                                @endif
                            @endif
                                <div class="col-lg-1">
                                
                                </div>
                                <div class="col-lg-4 ">
                                    <h2> @lang('lang.account') @lang('lang.payout')</h2>
                                    @if (defaultPayout())
                                        
                                        @if (defaultPayout()->payment_method_name=='PayPal')
                                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('PayPal')->logo)}}" alt="">
                                        @elseif(defaultPayout()->payment_method_name=='Stripe')
                                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Stripe')->logo)}}" alt="">
                                        @elseif(defaultPayout()->payment_method_name=='Razorpay')
                                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Razorpay')->logo)}}" alt="">
                                        @else
                                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Blockchain')->logo)}}" alt="">
                                        @endif
                                            <br>
                                        <span class="spantextct">{!! defaultPayout()->payout_email !!}</span>
                                    @endif

                                    <div class="check-out-btn mt-10" style="margin-top: 20px;">
                                        <a href="{{ route('author.refunds',@Auth::user()->username)}}" id="deposit_" class="btn-main btnw100">@lang('lang.set') @lang('lang.account')</a>
                                        
                                    </div>
                                </div>
                            </div>
            
                            <h2>@lang('lang.payout') @lang('lang.history') </h2>
                            <div class="earing_table  table-responsive">
                                <table class="table">
                                    <thead class="table_border">
                                        <tr>
                                            <th colspan="">@lang('lang.amount')</th>
                                            <th colspan="">@lang('lang.payout') @lang('lang.method')</th>
                                            <th colspan="">Status Plata</th>
                                            <th colspan="">@lang('lang.date')</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                    </div>
                @endif
                @if (@Auth::user()->role_id == 5)
                    <div class="tab-pane row g-5 d-flex fade {{ @$data['payout'] == url()->current() ?'show active':'' }}" id="nav-payout" role="tabpanel" aria-labelledby="nav-payout-tab">
                        <div class="payment_wrap account_tabs_pin">
                            <div class="row">
                            @if (defaultPayout())
                                @if (defaultPayout()->payment_method_name=='Stripe')
                                <div class="col-lg-7  ">
                                    <h2>Balanta Ta</h2>
                                    <p>@lang('lang.You_currently_have')  {{Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}} </p>
                                    @php 
                                        $withdraw = App\Withdraw::where('user_id', Auth::user()->id)->orderBy('id', 'desc')->first();
                                    
                                    @endphp
                                    @if (!@$withdraw)
                                    <form action="{{ route('customer.withdraw_amount')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            <div class="row">
                                                <div class="col-xl-6">
                                                    <div class="row">
                                                        <input type="text" name="pay_address" value="{!! defaultPayout()->payout_email !!}" hidden>
                                                        <input type="text" name="payment_method_id" value="1" hidden>
                                                        <div class="col-xl-12 col-md-12">
                                                            <label for="name">Suma Retragere <span>*</span></label>
                                                            <input type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null"  name="withdraw_amount" placeholder="Introduceti suma dorita pentru retragere">
                                                        </div>
                                                
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 ">
                                                    <div class="check-out-btn">
                                                        <button type="submit" class="btn-main dpf-submit" style="margin-top: 36px;">Retrage</button>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </form>
                                        @elseif($withdraw->paid_vendors_id !== NULL)
                                        <form action="{{ route('customer.withdraw_amount')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            <div class="row">
                                                <div class="col-xl-6">
                                                    <div class="row">
                                                        <input type="text" name="pay_address" value="{!! defaultPayout()->payout_email !!}" hidden>
                                                        <input type="text" name="payment_method_id" value="1" hidden>
                                                        <div class="col-xl-12 col-md-12">
                                                            <label for="name">Suma Retragere <span>*</span></label>
                                                            <input type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null"  name="withdraw_amount" placeholder="Introduceti suma dorita pentru retragere">
                                                        </div>
                                                
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 ">
                                                    <div class="check-out-btn">
                                                        <button type="submit" class="btn-main dpf-submit" style="margin-top: 36px;">Retrage</button>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </form>
                                        @else
                                            <p>Ai deja o cerere de retragere in executie</p>
                                            <form action="{{ route('customer.anuleazaWithdraw')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            
                                            
                                            <input type="text" name="withdraw_id" value="{{@$withdraw->id}}" hidden>
                                            <input type="text" name="withdraw_amountz" value="{{@$withdraw->amount}}" hidden>   
                                            <button type="submit" class="btn-main dpf-submit" style="margin-top: 32px;">Anuleaza</button>
                                            </form>
                                        @endif
                                </div>
                                @elseif(defaultPayout()->payment_method_name=='Bank')
                                <div class="col-lg-7  ">
                                    <h2>Balanta Ta ETH</h2>
                                    <p>@lang('lang.You_currently_have')  {{Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}} care inseamna aproximatix: <strong class="" style="font-size: 18px;"><input type="text" id="pretInEth" style="color: #9fa4dd!important; border: 0px; border-radius: 0px; background: transparent; width: 70px; padding-left: 0px; font-weight: 800; padding-right: 0px;" readonly>
                                    
                                    <span id="regular_license_price">ETH</span>
                                    <button type="button" id="exampletool" class="btn btn-secondary btntool" data-toggle="tooltip" data-placement="top" data-html="true" title="<em>Informatii</em> <u>despre</u> <b>Retragere prin ETH</b>">
                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                    </button>
                                </strong> 
                                </p>
                                    @php 
                                        $withdraw = App\Withdraw::where('user_id', Auth::user()->id)->orderBy('id', 'desc')->first();
                                    
                                    @endphp
                                    @if (!@$withdraw)
                                    <form action="{{ route('customer.withdraw_amount')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            <div class="row">
                                                <div class="col-xl-9">
                                                    <div class="row">
                                                        <input type="text" name="payment_method_id" value="2" hidden>
                                                        <input type="text" name="pay_address" value="{!! defaultPayout()->payout_email !!}" hidden>
                                                        <input type="numeric" min="0" id="ETH2RON"  name="withdraw_amount_eth" value="" placeholder="Introduceti suma dorita pentru retragere" hidden>
                                                        <label for="basic-url">Suma Retragere* (in ETH)</label>
                                                        <div class="col-xl-12 col-md-12">
                                                        
                                                            <div class="col-md-6 colmd55 float-left">
                                                                
                                                                <div class="input-group mb-3">
                                                                    <input type="numeric" style="width: 140px!important" class="form-control" min="0" id="input"  onkeyup="regular(this.value)" name="withdraw_amount_eth" value="" 
                                                                            placeholder="Introduceti suma dorita pentru retragere" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text" id="basic-addon2">ETH</span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 colmd55 float-left">
                                                                <div class="input-group mb-3">
                                                                    <input type="text" id="pretInETH2"  name="withdraw_amount" style="width: 140px!important" class="form-control" onkeyup="regular(this.value)"  placeholder="Suma in Credite Minted" aria-label="Suma in Credite Minted" aria-describedby="basic-addon3" readonly >   
                                                                
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text" id="basic-addon2">LEI</span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                            </div>
                                                
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 ">
                                                    <div class="check-out-btn">
                                                        <button type="submit" class="btn-main dpf-submit" style="margin-top: 32px;">Retrage</button>
                                                    </div>
                                                </div>
                                            </div> 
                                        </form>
                                        @elseif($withdraw->paid_vendors_id !== NULL)
                                        <form action="{{ route('customer.withdraw_amount')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            <div class="row">
                                                <div class="col-xl-9">
                                                    <div class="row">
                                                        <input type="text" name="payment_method_id" value="2" hidden>
                                                        <input type="text" name="pay_address" value="{!! defaultPayout()->payout_email !!}" hidden>
                                                        <input type="numeric" min="0" id="ETH2RON"  name="withdraw_amount_eth" value="" placeholder="Introduceti suma dorita pentru retragere" hidden>
                                                        <label for="basic-url">Suma Retragere* (in ETH)</label>
                                                        <div class="col-xl-12 col-md-12">
                                                        
                                                            <div class="col-md-6 colmd55 float-left">
                                                                
                                                                <div class="input-group mb-3">
                                                                    <input type="numeric" style="width: 140px!important" class="form-control" min="0" id="input"  onkeyup="regular(this.value)" name="withdraw_amount_eth" value="" 
                                                                            placeholder="Introduceti suma dorita pentru retragere" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text" id="basic-addon2">ETH</span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 colmd55 float-left">
                                                                <div class="input-group mb-3">
                                                                    <input type="text" id="pretInETH2"  name="withdraw_amount" style="width: 140px!important" class="form-control" onkeyup="regular(this.value)"  placeholder="Suma in Credite Minted" aria-label="Suma in Credite Minted" aria-describedby="basic-addon3" readonly >   
                                                                
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text" id="basic-addon2">LEI</span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                            </div>
                                                
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 ">
                                                    <div class="check-out-btn">
                                                        <button type="submit" class="btn-main dpf-submit" style="margin-top: 32px;">Retrage</button>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </form>
                                        @else
                                            <p>Ai deja o cerere de retragere in executie</p>
                                            <form action="{{ route('customer.anuleazaWithdraw')}}"  method="POST" class="checkout-form">
                                            @csrf
                                            
                                            
                                            <input type="text" name="withdraw_id" value="{{@$withdraw->id}}" hidden>
                                            <input type="text" name="withdraw_amountz" value="{{@$withdraw->amount}}" hidden>   
                                            <button type="submit" class="btn-main dpf-submit" style="margin-top: 32px;">Anuleaza</button>
                                            </form>
                                        @endif
                                </div>
                                @endif
                            @endif
                                <div class="col-lg-1">

                                </div>
                                <div class="col-lg-4 ">
                                    <h2> @lang('lang.account') @lang('lang.payout')</h2>
                                    @if (defaultPayout())
                                        
                                        @if (defaultPayout()->payment_method_name=='PayPal')
                                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('PayPal')->logo)}}" alt="">
                                        @elseif(defaultPayout()->payment_method_name=='Stripe')
                                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Stripe')->logo)}}" alt="">
                                        @elseif(defaultPayout()->payment_method_name=='Razorpay')
                                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Razorpay')->logo)}}" alt="">
                                        @else
                                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Blockchain')->logo)}}" alt="">
                                        @endif
                                            <br>
                                        <span class="spantextct">{!! defaultPayout()->payout_email !!}</span>
                                    @endif

                                    <div class="check-out-btn mt-10" style="margin-top: 20px;">
                                        <a href="{{ route('author.refunds',@Auth::user()->username)}}" id="deposit_" class="btn-main btnw100">@lang('lang.set') @lang('lang.account')</a>
                                        
                                    </div>
                                </div>
                            </div>
            
                            <h2>@lang('lang.payout') @lang('lang.history') </h2>
                            <div class="earing_table  table-responsive">
                                <table class="table">
                                    <thead class="table_border">
                                        <tr>
                                            <th colspan="">@lang('lang.amount')</th>
                                            <th colspan="">@lang('lang.payout') @lang('lang.method')</th>
                                            <th colspan="">Status Plata</th>
                                            <th colspan="">@lang('lang.date')</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                    </div>
                @endif
                @if (@Auth::user()->role_id == 4)
                    <div class="tab-pane row g-5 d-flex fade {{ @$data['earning'] == url()->current() ?'show active':'' }}" id="nav-earning" role="tabpanel" aria-labelledby="nav-earning-tab">
                        <div class="earnings_area ">
                            <div class="row">
                                <div class="col-xl-4 col-md-4">
                                    <div class="single_earning padding_25px  mb-30">
                                        @php
                                            $total = 0;
                                        @endphp
                                        @foreach ($data['monthly_income'] as $item) 
                                            @php
                                                $total =$total + $item->subtotal;
                                            @endphp                                                               
                                        @endforeach
                                        

                                        @php
                                            $total_sale= $data['monthly_income']->sum('subtotal');
                                            
                                            $author_fee=$data['monthly_sale']->sum('price');
                                            $this_month_sale= $total_sale-$author_fee;
                                            // echo $this_month_sale;
                                        @endphp

                                        {{-- <h3>{{@$infix_general_settings->currency_symbol}}{{ $total }}</h3> --}}
                                        <h3>{{ @$data['monthly_earn1'] }} {{@$infix_general_settings->currency_symbol}}</h3>
                                        <h4>@lang('lang.earnings')  @lang('lang.month') aceasta <br />({{ date('M Y') }}) </h4>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-4">
                                    <div class="single_earning  padding_25px  mb-30">
                                        <h3>{{ @$data['monthly_earn2'] }} {{@$infix_general_settings->currency_symbol}}</h3>
                                        <h4>@lang('lang.your_total_balance_after_associated_author_fees')</h4>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-4">
                                    <div class="single_earning  padding_25px  mb-30">
                                        @php
                                            $total_income = 0;
                                        @endphp
                                        @foreach ($data['total_income'] as $item) 
                                        @php
                                            $total_income =$total_income + $item->subtotal;
                                        @endphp                                                               
                                        @endforeach
                                        <h3>{{ $total_income }} {{@$infix_general_settings->currency_symbol}}</h3>
                                        <h4>@lang('lang.total_value_of_your_sales')</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-8">
                                    <div class="sales_graph ">
                                        <div class="graph_area  padding_25px  mb-30">
                                            <div class="row align-items-center">
                                                <div class="col-xl-3 col-md-3">
                                                    <div class="graph_title">
                                                        <h3>@lang('lang.sales') @lang('lang.graph')</h3>
                                                    </div>
                                                </div>
                                                <div class="col-xl-9 col-md-9">
                                                    <div class="date_sales d-flex"> 
                                                        <span class="btn-main" id="dateEarn">{{date('M Y')}}
                                                        </span>
                                                        <input type="hidden" id="get_month_year" name="get_month_year" value="{{date('m-Y')}}">
                                                        <span class="btn-main coursor_pointer"  id="back"><</span>
                                                        <span class="btn-main coursor_pointer "  id="forwordEarn" >></span> 
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="graph_chrt">
                                                <canvas id="myChart"></canvas>
                                            </div>
                                        </div>
                                        <div class="earing_table  table-responsive">
                                            <table class="table">
                                                <thead class="table_border">
                                                    <tr>
                                                        <th colspan="3">@lang('lang.date')</th>
                                                        <th colspan="3">@lang('lang.itemsale')</th>
                                                        <th colspan="3">@lang('lang.earnings')</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="DateP">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4">
                                    <div class="top_countries  padding_25px  mb-30">
                                        <h3> @lang('lang.top') @lang('lang.countries') @lang('lang.your')</h3>
                                        <div class="country_list">
                                            <ul id="_country">
                                                
                                                
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                @if (@Auth::user()->role_id == 4)
                    <div class="tab-pane row g-5 d-flex fade {{ @$data['statement'] == url()->current() ?'show active':'' }}" id="nav-statement" role="tabpanel" aria-labelledby="nav-statement-tab">
                        <div class="satements_area">
                            <div class="row">
                                <div class="col-xl-8">
                                    <div class="statement_details ">
                                        <div class="statement_details_inner">
                                            <div class="more_options d-flex">
                                                
                                                {{-- <a href="#">may 2019</a>
                                                <a href="#">april 2019</a>
                                                <a class="hover-btn" href="#">more options 2019 <i
                                                        class="ti-plus"></i> </a> --}}
                                            </div>
                                            <div class="more_options d-flex">
                                                    <a class="hover-btn" id="Last30" href="#">@lang('lang.last') 30 @lang('lang.days')</a>
                                                            <div class="date_sales d-flex"> 
                                                                <a class="hover-btn" id="dateShow">{{date('M Y')}}
                                                                    </a>
                                                                    <input type="hidden" id="get_month_" name="get_month_" value="{{date('m-Y')}}">
                                                                    <input type="hidden" id="get_current_month_" value="{{date('m-Y')}}">
                                                                <a class="hover-btn" id="statementBack"><</a>
                                                                <a class="hover-btn" id="StatementForword" >></a>  
                                                            </div> 
                                                <form action="#" class="form-list d-flex">
                                                    <input   placeholder="@lang('lang.from')" readonly id="from">
                                                    <input  placeholder="@lang('lang.to')" readonly id="to">
                                                </form>
                                                <a class="hover-btn search" id="SearhStat">
                                                    <i class="ti-search"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="statement_table ">
                                            <table class="table">
                                                <thead>
                                                    <tr class="table-row">
                                                        <th scope="col">@lang('lang.date')</th>
                                                        <th scope="col">@lang('lang.Order') @lang('lang.id')</th>
                                                        <th scope="col">@lang('lang.type')</th>
                                                        <th colspan="2" scope="col">@lang('lang.details')</th>
                                                        <th scope="col">@lang('lang.price')</th>
                                                        <th scope="col">@lang('lang.amount')</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="statement">
                                                    @php
                                                        $statement =App\ManageQuery::UserPaymentStatement();
                                                    @endphp
                                                    @foreach ($statement as $val)                                                                          
                                                        <tr>
                                                        <td data-label="Account">{{DateFormat(@$val->created_at)}}</td>
                                                        <td data-label="Due Date">{{$val->order_id }}</td>
                                                            <td data-label="Due Date"><a href="#"
                                                                    class="free">{{ $val->title }}</a></td>
                                                            <td colspan="2" data-label="Period2">{{ $val->details}} </td>
                                                            <td class="prise-counting"
                                                            data-label="Period">{{@$infix_general_settings->currency_symbol}}{{ $val->price}}</td>
                                                            <td class="prise-counting red"
                                                                data-label="Period red"> {{ @$val->type? $val->type =='e' ?'-':'+':'' }}  {{@$infix_general_settings->currency_symbol}} {{ $val->price}}</td>
                                                        </tr>
                                                        @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4">
                                    <div class="author_setting_bar ">
                                        <h3>@lang('lang.earnings')</h3>
                                        <p class="timing">@lang('lang.ysreotl30d')</p>
                                        @php
                                            // $statement = DB::table('statements')->where('author_id',Auth::user()->id)->whereDate('created_at','>', \Carbon\Carbon::now()->subDays(30))->get();
                                            $statement = App\ManageQuery::UserPaymentStatement();
                                            $fees=0;
                                            foreach ($statement as $key => $value) {
                                                if ($value->type == 'e') {                                                                     
                                                    $price = @$price - $value->price;  
                                                    $fees = $fees + $value->price;  
                                                }else {
                                                    $price = @$price+$value->price; 
                                                }
                                            }
                                            $AuthorTax = @$data['user']->profile->country->tax;
                                        //    echo $price;
                                        @endphp

                                        
                                        <div class="earning_taks d-flex justify-content-between align-content-center">
                                            <div class="single_task">
                                                <p>@lang('lang.my_funds')</p>
                                                {{-- <h2 id="funds">{{@$infix_general_settings->currency_symbol}}{{ $price - @$price*(@$AuthorTax->tax/100) }}</h2> --}}
                                                <h2 id="funds">{{@$infix_general_settings->currency_symbol}}{{ @$data['monthly_earn2'] }}</h2>
                                            </div>
                                            <div class="single_task">
                                                <p>@lang('lang.earnings')</p>
                                            <h4 class="green" id="earning">+{{@$infix_general_settings->currency_symbol}}{{ @$data['monthly_earn1'] }}</h4>
                                            {{-- <h4 class="green" id="earning">+{{@$infix_general_settings->currency_symbol}}{{ $price}}</h4> --}}
                                            </div>
                                            {{-- <div class="single_task">
                                                <p>Tax withheld</p>
                                            <h4 class="green" id="TaxW">+{{@$infix_general_settings->currency_symbol}} {{ $price*(@$AuthorTax->tax/100) }}</h4>
                                            </div> --}}
                                            <div class="single_task">
                                                <p>@lang('lang.fees')</p>
                                            <h4 class="red" id="feeI">-{{@$infix_general_settings->currency_symbol}}{{ @$data['monthly_earn3'] }}</h4>
                                            </div>
                                        </div>
                                        <p class="link-overview"><a href="#" onClick="window.print()">@lang('lang.print') @lang('lang.this_overview')</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                @endif

                <div class="tab-pane row g-5 d-flex fade {{ @$data['followings'] == url()->current() ?'show active':'' }}" id="nav-followings" role="tabpanel" aria-labelledby="nav-followings-tab">
                    <div class="row g-5 mt--30 creator-list-wrapper">
                        @if (count(@$data['following']))
                            @foreach ($data['following'] as $item)
                            <!-- start single top-seller -->
                                <div class="creator-single col-lg-4 col-md-6 col-sm-6" data-sal="slide-up" data-sal-delay="150" data-sal-duration="800">
                                    <div class="top-seller-inner-one explore">
                                        <div class="top-seller-wrapper">
                                            <div class="thumbnail varified">
                                                <a href="{{ route('user.profile',@$item->username)}}"><img src="{{ @$item->profile->logo_pic? asset(@$item->profile->logo_pic):asset('public/frontend/img/profile/1.png') }}"></a>
                                            </div>
                                            <div class="top-seller-content">
                                                <a href="{{ route('user.portfolio',$item->username)}}">
                                                    <h6 class="name"><span>@</span>{{$item->username}}</h6>
                                                </a>
                                                <span class="count-number">
                                                    {{ Str::limit(@$item->profile->about, 22) }}
                                                </span>
                                                <span class="count-number">
                                                    {{$item->balance->amount}} toons
                                                </span>
                                                <span class="count-number">
                                                Vanzari
                                                {{ $item->item->sum('sell') }}
                                                </span>
                                            </div>
                                        </div>
                                        <a class="over-link" href="{{ route('user.portfolio',$item->username)}}"></a>
                                    </div>
                                </div>
                            <!-- End single top-seller -->
                            @endforeach
                            <div class="Pagination">
                                {{ @$data['following']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                            </div>
                            @else 
                            <h1>Nu urmaresti pe nimeni in acest moment!</h1>   
                        @endif
                        
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

@if (@Auth::user()->role_id == 4 )
<script src="{{asset('public/frontend/js/item.js')}}"></script>
<script src="{{asset('public/frontend/js/dashboard.js')}}"></script>
@endif
<script src="{{asset('public/frontend/js/alldashboard.js')}}"></script>
<script src="{{ asset('public/frontend/js/') }}/delete.js"></script>
<script src="{{ url('resources/js/app.js')}}" ></script>
{{-- <script src="{{ asset('public/frontend/js/') }}/checkout.js"></script> --}}
{{-- <script src="{{ asset('public/frontend/js/') }}/payment.js"></script> --}}
<script src="{{ asset('public/frontend/js/') }}/payment_gateway.js"></script>
<script src="{{ asset('public/frontend/js/') }}/frontend_editor.js"></script>

 <script>
     $(document).ready(function() {

$("#hideme").css("display","none");
$("#aff_generate").on("click", function(){
$("#hideme").toggle();
})
})

function myFunction() {
  /* Get the text field */
  var copyText = document.getElementById("aff_link");

  /* Select the text field */
  copyText.select();
  copyText.setSelectionRange(0, 99999); /* For mobile devices */

  /* Copy the text inside the text field */
  document.execCommand("copy");

  /* Alert the copied text */
  alert("Copied the text: " + copyText.value);
}
</script>
<script>
$(".d-item").slice(0, 8).show();
            $("#loadmore").on("click", function(e){
            e.preventDefault();
            $(".d-item:hidden").slice(0, 4).slideDown();
            if($(".d-item:hidden").length == 0) {
                //$("#loadmore").text("No Content").addClass("noContent");
                $("#loadmore").hide();
                $("#butons").show();
            }
            de_size();
        });
</script>
<script>
$(".d-item2").slice(0, 8).show();
            $("#loadmore2").on("click", function(e){
            e.preventDefault();
            $(".d-item2:hidden").slice(0, 4).slideDown();
            if($(".d-item2:hidden").length == 0) {
                //$("#loadmore").text("No Content").addClass("noContent");
                $("#loadmore2").hide();
                $("#butons").show();
            }
            de_size();
        });
</script>
<script>
    $(document).ready(function () {
        const pretInRon = {{ Auth::user()->balance->amount}} ;
        $.ajax({
            type: "GET",
            dataType: 'json',
            url: `https://min-api.cryptocompare.com/data/price?fsym=RON&tsyms=ETH`,
            success: function (data) {
               var price = pretInRon*data.ETH;
               var myNumberWithTwoDecimalPlaces=parseFloat(price).toFixed(4);
                  $("#pretInEth").attr("value", myNumberWithTwoDecimalPlaces);
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
});
</script>
<script>
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            dataType: 'json',
            url: `https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=RON`,
            success: function (data) {
                $("#ETH2RON").attr("value", data.RON);
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
});
function regular(item) {
    if(this.value<0){this.value= this.value * -1}
    const inputETH = $("#input").val();
    const ETH2RON = $("#ETH2RON").val();
    var totalPrice = ETH2RON*inputETH;
    var myNumberWithTwoDecimalPlaces=parseFloat(totalPrice).toFixed(2);

    $("#pretInETH2").val(myNumberWithTwoDecimalPlaces);
    $("#pretInETH2").attr("placeholder", "$" + myNumberWithTwoDecimalPlaces);
    $("#pretInETH2").attr("value", myNumberWithTwoDecimalPlaces);
}
</script> 
<script>

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>
@endpush