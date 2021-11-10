@extends('frontend.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/dashboard.css">
    <link rel="stylesheet" href="{{ asset('public/frontend/') }}/dashboard.css">
    <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
@endpush
 
@php
   $infix_general_settings =app('infix_general_settings');
@endphp
@section('content')
<style>
#aff_link{
    width: 60%;
    border-radius: 0px;
    float: left;
    margin-right: 10px;
}
.butonsp{
    height: 50px;
    border-radius: 0px;
    width: 15%;
}
/* .banner-area3::before {
    z-index: 99!important;
    background-image: url({{ @$data['user']->profile->logo_pic? asset(@$data['user']->profile->logo_pic):asset('public/frontend/img/banner/banner.png') }})!important;
} */
</style>
      @include('frontend.partials.vendor_banner')
     <!-- details-tablist-start -->
     <input type="text" hidden value="{{url('/')}}" id="url">
      <input type="text" hidden value="{{ @$data['user']->username }}" name="user_id" class="user_id">
     <div class="details-tablist-area details-tablist-area-two menu_md_bg">
            <div class="container">
                <div class="row">
                    
                    <div class="col-xl-10 offset-xl-1">
                        <div class="details-tablist ">
                            <nav>
                                <ul class="nav" id="myTab" role="tablist">
                                  
                                    @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['profile'] == url()->current() ?'active':'' }}" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                            aria-controls="home" aria-selected="true">@lang('lang.profile')</a>
                                    </li>
                                    @endif
                                    @if (@Auth::user()->role_id == 4)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['portfolio'] == url()->current() ?'active':'' }}" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                                            aria-controls="profile" aria-selected="false">On Sale</a>
                                    </li>

                                    <!-- <li class="nav-item">
                                        <a class="nav-link {{ @$data['followers'] == url()->current() ?'active':'' }}" id="contact-tab" data-toggle="tab" href="#contact" role="tab"
                                            aria-controls="contact" aria-selected="false">@lang('lang.followers')</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['followings'] == url()->current() ?'active':'' }}" id="Followings-tab" data-toggle="tab" href="#Followings"
                                            role="tab" aria-controls="contact" aria-selected="false">@lang('lang.followings')</a>
                                    </li> -->
                                    @endif
                                    @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['setting'] == url()->current() ?'active':'' }}" id="Settings-tab" data-toggle="tab" href="#Settings" role="tab"
                                            aria-controls="contact" aria-selected="false">@lang('lang.settings')</a>
                                    </li>
                                    @endif
                                    <!-- @if (@Auth::user()->role_id == 4)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['hiddenItem'] == url()->current() ?'active':'' }}" id="Hidden-tab" data-toggle="tab" href="#Hidden" role="tab"
                                            aria-controls="contact" aria-selected="false" >@lang('lang.hidden_items')</a>
                                    </li>
                                    @endif -->
                                    @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['download'] == url()->current() ?'active':'' }}" id="Downloads-tab" data-toggle="tab" href="#Downloads"
                                            role="tab" aria-controls="contact" aria-selected="false">Colectia Ta</a>
                                    </li>
                                    @endif
                                    @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['referrals'] == url()->current() ?'active':'' }}" id="referrals-tab" data-toggle="tab" href="#referrals"
                                            role="tab" aria-controls="contact" aria-selected="false">Referrals</a>
                                    </li>
                                    @endif
                                    <!-- @if (@Auth::user()->role_id == 4)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['reviews'] == url()->current() ?'active':'' }}" id="Reviews-tab" data-toggle="tab" href="#Reviews" role="tab"
                                            aria-controls="contact" aria-selected="false">@lang('lang.reviews')</a>
                                    </li>
                                    @endif -->
                                    @if (@Auth::user()->role_id == 4)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['refunds'] == url()->current() ?'active':'' }}" id="refunds-tab" data-toggle="tab" href="#refunds" role="tab"
                                            aria-controls="contact" aria-selected="false">Wallet Retrageri</a>
                                    </li>
                                    @endif
                                    @if (@Auth::user()->role_id == 4)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['payout'] == url()->current() ?'active':'' }}" id="payouts-tab" data-toggle="tab" href="#payouts" role="tab"
                                            aria-controls="contact" aria-selected="false">Retrageri</a>
                                    </li>
                                    @endif
                                    <!-- {{-- @if (@Auth::user()->role_id == 4)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['payout'] == url()->current() ?'active':'' }}" id="payouts-tab" data-toggle="tab" href="#payouts" role="tab"
                                            aria-controls="contact" aria-selected="false">@lang('lang.payouts') 1</a>
                                    </li>
                                    @endif --}} -->
                                    @if (@Auth::user()->role_id == 4)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['earning'] == url()->current() ?'active':'' }}" id="Followings-tab00" data-toggle="tab" href="#Followings00"
                                            role="tab" aria-controls="contact00" aria-selected="false">@lang('lang.earnings')</a>
                                    </li>
                                    @endif
                                    @if (@Auth::user()->role_id == 4)
                                    <li class="nav-item">
                                        <a class="nav-link {{ @$data['statement'] == url()->current() ?'active':'' }}"
                                         id="Statements-tab" data-toggle="tab" href="#Statements"
                                            role="tab" aria-controls="contact" aria-selected="false">@lang('lang.statements')</a>
                                    </li>
                                    @endif
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
     </div>
        <!-- details-tablist-end -->
    
        <!-- main-details-area-start -->
    <div class="account-area account-area2 section-padding user_profile pb_60">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-10">
                    <div class="row">
                        <div class="col-xl-12 p-sm-0">
                            <div class="main-tab-content">
                                <div class="tab-content" id="myTabContent">
                                   
                                    @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                    <div class="tab-pane fade {{ @$data['profile'] == url()->current() ?'show active':'' }}  " id="home" role="tabpanel"
                                        aria-labelledby="home-tab">
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
                                    <div class="tab-pane fade {{ @$data['portfolio'] == url()->current() ?'show active':'' }} " id="profile" role="tabpanel"
                                        aria-labelledby="profile-tab">
                                        @if (count(@$data['item']) > 0)
                                                
                                            @foreach (@$data['item'] as $item)
                                          <!-- nft item begin -->
                                            <div class="d-item col-lg-3 col-md-6 col-sm-6 col-xs-12 float-left">
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
                                                            <img src="{{ asset(@$item->icon) }}" class="lazy nft__item_preview" alt="">
                                                        </a>
                                                    </div>
                                                    <div class="nft__item_info">
                                                        <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                                            <h4>{{ $item->title}}</h4>
                                                        </a>
                                                        <div class="nft__item_price">
                                                        {{ $item->Re_item}} lei
                                                        </div>
                                                        <div class="nft__item_action">
                                                            @if ($item->active_status == 0)
                                                        <a href="{{ route('author.itemSale',$item->id)}}" class="heart"><i class="ti-money"></i>  Pune la vanzare</a>
                                                        @endif
                                                        </div>
                                                        <!-- <div class="nft__item_like">
                                                            <i class="fa fa-heart"></i><span>50</span>
                                                        </div>                             -->
                                                    </div> 
                                                </div>
                                            </div>                 
                                            <!-- nft item begin -->

                                            @endforeach
                                          
                                            @endif
                                    </div>
                                    @endif
                                    @if (Auth::user()->role_id == 4)
                                    <div class="tab-pane fade {{ @$data['followers'] == url()->current() ?'show active':'' }} " id="contact" role="tabpanel"
                                        aria-labelledby="contact-tab">
                                        <div class="follower ">
                                            @if (count(@$data['follower']))
                                                @foreach (@$data['follower'] as $item)
                                                @if (isset($item->balance))
                                                <div
                                                    class="single_followers d-flex justify-content-between align-items-center ">
                                                    <div class="followers d-flex align-items-center">
                                                        <img src="{{ @$item->profile->logo_pic? asset(@$data['user']->profile->logo_pic):asset('public/frontend/img/profile/1.png') }}" alt="" width="80" height="auto">
                                                        <div class="thumb_heading">
                                                            <h5><a href="{{ route('user.profile',@$item->username)}}">{{$item->username}}</a></h5>
                                                            <p>@lang('lang.member_since'): {{DateFormat($item->created_at)}}</p>
                                                        </div> 
                                                    </div>
                                                    @php
                                                        // $level=DB::table('labels')->where('amount','<=',@$item->balance->amount)->orderBy('id','desc')->first();
                                                        // $date=Carbon\Carbon::parse(Carbon\Carbon::now())->diffInDays($item->created_at);
                                                        // $badge=DB::table('badges')->where('day','<=',@$date)->orderBy('id','desc')->first();

                                                           $level=App\ManageQuery::UserLabel($item->balance->amount); 
                                                            // DB::table('labels')->where('amount','<=',@$item->balance->amount)->orderBy('id','desc')->first();
                                                            $date=Carbon\Carbon::parse(Carbon\Carbon::now())->diffInDays(@$item->created_at);
                                                            $badge=App\ManageQuery::UserBadge($date); 
                                                    @endphp
                                                <div class="bandge">
                                                    <img height="auto" width="40" src="{{asset(@$level->icon)}}" data-toggle="tooltip" data-placement="bottom" title="Author level  {{ @$level->id}} : sold {{@GeneralSetting()->currency_symbol}} {{round(@$item->balance->amount > 50 ? @$item->balance->amount: 0) }}+ on {{@GeneralSetting()->system_name}} " alt="">
                                                    <img height="auto" width="40" src="{{asset(@$badge->icon)}}" data-toggle="tooltip" data-placement="bottom" title="{{ @$level->id-1}} {{@$badge->id == 1? 'Year' :'Years' }} of membarship on {{@GeneralSetting()->system_name}} " alt="">
                                            
                                                </div>
                                                <div class="rating">
                                                    <div class="rate">
                                                        @php
                                                        $review_total=count(@$item->reviews);
                                                        $total_star=0;
                                                    @endphp
                                                    @if (@$review_total > 0)
                                                    
                                                        @foreach ( $item->reviews as $review)
                                                        @php
                                                            $total_star = $total_star+$review->rating;
                                                        @endphp
                                                        @if($review->rating == .5)
                                                        <i class="fa fa-star-half-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        @elseif($review->rating == 1)
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        @elseif($review->rating == 1.5)
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        @elseif($review->rating == 2)
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        @elseif($review->rating == 2.5)
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        @elseif($review->rating == 3)
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        @elseif($review->rating == 3.5)
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        @elseif($review->rating == 4)
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        @elseif($review->rating == 4.5)
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                        @elseif($review->rating == 5)
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            @endif
                                                            @endforeach
                                                        @else
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        @endif
                                                    </div>
                                                    <p>{{ $review_total }} @lang('lang.Ratings')</p>
                                                    </div>
                                                    <div class="total-prise text-center">
                                                        <h2> {{ $item->item->sum('sell') }}</h2>
                                                        <p>@lang('lang.sales')</p>
                                                    </div>
                                                </div>  
                                                @endif
                                                @endforeach
                                                <div class="Pagination">
                                                    {{ @$data['follower']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                                                </div>
                                                @else
                                                <h1>@lang('lang.no') @lang('lang.followers')</h1>
                                            @endif
                                            
                                        </div>
                                    </div>
                                   
                                    <!-- Followings start here  -->
                                    <div class="tab-pane fade {{ @$data['followings'] == url()->current() ?'show active':'' }} " id="Followings" role="tabpanel"
                                        aria-labelledby="Followings-tab">
                                        <div class="follower ">
                                            @if (count(@$data['following']))
                                                @foreach ($data['following'] as $item)
                                                    <div
                                                        class="single_followers d-flex justify-content-between align-items-center ">
                                                        <div class="followers d-flex align-items-center">
                                                                <img src="{{ @$item->profile->logo_pic? asset(@$item->profile->logo_pic):asset('public/frontend/img/profile/1.png') }}" alt="">
                                                            <div class="thumb_heading">
                                                                <h5><a href="{{ route('user.profile',@$item->username)}}">{{$item->username}}</a></h5>
                                                                <p>Member Since: {{ DateFormat(@$item->created_at)  }}</p>
                                                            </div>
                                                        </div>

                                                        @php
                                                            // $level=DB::table('labels')->where('amount','<=',$item->balance->amount)->orderBy('id','desc')->first();
                                                            // $date=Carbon\Carbon::parse(Carbon\Carbon::now())->diffInDays($item->created_at);
                                                            // $badge=DB::table('badges')->where('day','<=',$date)->orderBy('id','desc')->first();

                                                             $level=App\ManageQuery::UserLabel($item->balance->amount); 
                                                            // DB::table('labels')->where('amount','<=',@$item->balance->amount)->orderBy('id','desc')->first();
                                                            $date=Carbon\Carbon::parse(Carbon\Carbon::now())->diffInDays(@$item->created_at);
                                                            $badge=App\ManageQuery::UserBadge($date); 
                                                        @endphp
                                                        <div class="bandge">
                                                            <img src="{{asset(@$level->icon)}}" data-toggle="tooltip" data-placement="bottom" title="Author level  {{ @$level->id}} : sold {{@GeneralSetting()->currency_symbol}} {{round(@$item->balance->amount > 50 ? @$item->balance->amount: 0) }}+ on {{@GeneralSetting()->system_name}} " alt="">
                                                            <img src="{{asset(@$badge->icon)}}" data-toggle="tooltip" data-placement="bottom" title="{{ @$level->id-1}} {{@$badge->id == 1? 'Year' :'Years' }} of membarship on {{@GeneralSetting()->system_name}} " alt="">
                                                    
                                                        </div>
                                                        <div class="rating">
                                                            <div class="rate">
                                                                @php
                                                                $review_total=count($item->reviews);
                                                                $total_star=0;
                                                            @endphp
                                                            @if (@$review_total > 0)
                                                            
                                                                @foreach ( $item->reviews as $review)
                                                                @php
                                                                    $total_star = $total_star+$review->rating;
                                                                @endphp
                                                                @if($review->rating == .5)
                                                                <i class="fa fa-star-half-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                @elseif($review->rating == 1)
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                @elseif($review->rating == 1.5)
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-half-o-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                @elseif($review->rating == 2)
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                @elseif($review->rating == 2.5)
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-half-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                @elseif($review->rating == 3)
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                @elseif($review->rating == 3.5)
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-half-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                @elseif($review->rating == 4)
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                @elseif($review->rating == 4.5)
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-half-o"></i>
                                                                @elseif($review->rating == 5)
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    @endif
                                                                    @endforeach
                                                                    @else
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    @endif
                                                            </div>
                                                            <p>{{ $review_total }} @lang('lang.Ratings')</p>
                                                        </div>
                                                        <div class="total-prise text-center">
                                                            <h2> {{ $item->item->sum('sell') }}</h2>
                                                            <p>@lang('lang.sales')</p>
                                                        </div>
                                                    </div>
                                                @endforeach
                                                
                                                <div class="Pagination">
                                                    {{ @$data['following']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                                                </div>
                                                @else 
                                                <h1>@lang('lang.no') @lang('lang.Following')</h1>   
                                            @endif
                                            
                                        </div>
                                    </div>    
                                    @endif
                                    <!-- Followings end  -->
                                    @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                    <div class="tab-pane fade {{ @$data['setting'] == url()->current() ?'show active':'' }}" id="Settings" role="tabpanel"
                                        aria-labelledby="Settings-tab">
                                        <div class="row">
                                            <div class="col-xl-4 col-lg-4">
                                                <div class="my_custom_navs ">
                                                    <h5>@lang('lang.details') @lang('lang.personal')e </h5>
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
                                            <div class="col-xl-8 col-lg-8">
                                                <div class="my_tab_content">
                                                    <div class="tab-content" id="v-pills-tabContent">
                                                        <div class="tab-pane fade {{ !str_contains(Request::fullUrl(),'?')?'show active':'' }} " id="v-pills-home"
                                                            role="tabpanel" aria-labelledby="v-pills-home-tab">
                                                            <div class="single_account_wrap ">
                                                                <h4>{{@$data['profile_setting']->heading1}}</h4>
                                                                <p>{{@$data['profile_setting']->text1}}</p>
                                                                {{-- personal  --}}
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
                                                                        <button type="submit" class="btn-main">@lang('lang.save')
                                                                            Modificarile</button>
                                                                    </div>
                                                                </form>
                                                                {{-- personal  --}}
                                                            </div>

                                                            {{-- password change --}}
                                                            <div class="single_account_wrap ">
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
                                                                                <button type="submit" class="btn-main">Schimba
                                                                                    @lang('lang.password')</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                </form>
                                                            </div>
                                                            {{-- Billing Info --}}
                                                            <div class="single_account_wrap ">
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
                                                                        <div class="col-xl-12 col-md-12">
                                                                            <input type="text" placeholder="@lang('lang.company_name')" name="company_name" value="{{isset($data['user']->profile->company_name)? $data['user']->profile->company_name:old('company_name')}}">
                                                                            @if ($errors->has('company_name'))
                                                                                <span class="invalid-feedback" role="alert">
                                                                                    <strong>{{ $errors->first('company_name') }}</strong>
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
                                                                        <button type="submit" class="btn-main">@lang('lang.save')
                                                                            Modificarile</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade {{ str_contains(Request::fullUrl(),'profile_updated')?'show active':'' }}" id="v-pills-profile"
                                                            role="tabpanel" aria-labelledby="v-pills-profile-tab">
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
                                                                                <button  type="submit" class="btn-main">@lang('lang.save')
                                                                                   Modificarile</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </form>
                                                        </div>

                                                        
                                                        
                                                        <div class="tab-pane fade {{ str_contains(Request::fullUrl(),'email_setting')?'show active':'' }}" id="v-pills-messages"
                                                            role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                                                @php
                                                            $email_setting=App\ManageQuery::UserEmailNotificationSettings();
                                                            // DB::table('email_notification_settings')->where('user_id',Auth::user()->id)->first();
                                                            @endphp
                                                            @if (!empty($email_setting))
                                                                <form action="{{ route('customer.userEmailNotificationUpdate')}}" method="post" >
                                                            @else
                                                                <form action="{{ route('customer.userEmailNotificationStore')}}" method="post" >
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
                                                                    <input type="submit" value="@lang('lang.update') Modificarile" class="btn-main border-0"> 
                                                                    @else
                                                                    <input type="submit" value="@lang('lang.save') Modificarile" class="btn-main border-0">          
                                                                    @endif
                                                                
                                                            </div>
                                                                </form>
                                                        </div>
                                                       
                                                        <div class="tab-pane fade {{ str_contains(Request::fullUrl(),'social_updated')?'show active':'' }}" id="v-pills-Description"
                                                            role="tabpanel" aria-labelledby="v-pills-settings-tab">
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
                                                                        {{-- <a href="#" class="btn-main">SAVE
                                                                            CHANGES</a> --}}
                                                                            <button type="submit" class="btn-main"> @lang('lang.save')
                                                                            Modificarile</button>
                                                                    </div>
                                                                </form>
                                                            </div>

                                                        </div>
                                                     
                                                        <div class="tab-pane fade" id="v-pills-fund"
                                                        role="tabpanel" aria-labelledby="v-pills-settings-tab">
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
                                    @endif
                                    @if (@Auth::user()->role_id == 4)
                                    <div class="tab-pane fade {{ @$data['hiddenItem'] == url()->current() ?'show active':'' }} " id="Hidden" role="tabpanel"
                                        aria-labelledby="Hidden-tab">
                                        <div class="portfolio_list ">
                                            @if (count($data['hidden_item']) > 0)
                                            @foreach ($data['hidden_item'] as $item)
                                                <div
                                                class="single_portfolio_list  d-flex align-items-center justify-content-between">
                                                <div class="portflio_thumb d-flex align-items-center">
                                                    <img src="{{ asset( $item->icon ) }}" alt="" width="100">
                                                    <div class="thumb_heading">
                                                    <h5><a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id]) }}">{{ substr(@$item->title,0,30) }}</a></h5>
                                                        <p>@lang('lang.item_by') <a href="{{ route('author.profile',@$item->user->id)}}">{{ @$item->user->username}}</a> </p>
                                                    </div>
                                                </div>
                                                <div class="portfolio_details">
                                                        <p>@lang('lang.in'): {{ @$item->category->title}} / {{ @$item->subCategory->title}} <br>
                                                            @lang('lang.high_resolution'): {{ @$item->resolution}}, @lang('lang.compatible_browsers'): {{ $item->compatible_browsers }}, @lang('lang.compatible_with'): <br>
                                                            {{ @$item->compatible_with }}, @lang('lang.Columns'): {{ @$item->columns }}</p>
                                                </div>
                                                <div class="total-prise text-center">
                                                    <p>@lang('lang.item_price')</p>
                                                    <h2>{{ $item->Re_item}} {{@$infix_general_settings->currency_symbol}}</h2>
                                                </div>
                                                <div class="download_inner-btn">
                                                    @if ($item->status == 2)                                                           
                                                        <a href="{{ route('author.itemEdit',$item->id)}}" class="btn-main">@lang('lang.resubmit')</a>
                                                    @endif
                                                    @if ($item->status == 0)                                                            
                                                        <button  class="btn-main">@lang('lang.pending')</button>
                                                    @endif
                                                <a  onclick="deleItem({{$item->id}})" class="btn-main-white">@lang('lang.delete')</a>
                                                <a id="delete-form-{{ $item->id }}" href="{{ route('author.itemDelete',$item->id)}}" class="dm_display_none"></a>
                                                </div>
                                            </div>
                                            @endforeach

                                            <div class="Pagination">
                                                
                                                {{ @$data['hidden_item']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                                                
                                            </div>
                                            @else
                                                <h1>@lang('lang.no_item')</h1>   
                                            @endif
                                        </div>
                                    </div>
                                    @endif
                                    @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                    <div class="tab-pane fade {{ @$data['download'] == url()->current() ?'show active':'' }} " id="Downloads" role="tabpanel"
                                        aria-labelledby="Downloads-tab">
                                        
                                        <div class="latest-goods-area">
                                                @if(session()->has('success'))
                                                <div class="alert alert-success">
                                                    {{ session()->get('success') }}
                                                </div>
                                            @endif
                                        @if (count(@$data['order'])>0)
                                        <div class="row">
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
                                                <!-- nft item begin -->
                                                    <div class="d-item col-lg-3 col-md-6 col-sm-6 col-xs-12 float-left">
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
                                                                    <img src="{{ asset(@$item->icon) }}" class="lazy nft__item_preview" alt="">
                                                                </a>
                                                            </div>
                                                            <div class="nft__item_info">
                                                                <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                                                    <h4>{{ $item->title}}</h4>
                                                                </a>
                                                                <div class="nft__item_price">
                                                                {{ $item->Re_item}} lei
                                                                </div>
                                                                <div class="nft__item_action">
                                                                    @if ($item->active_status == 0)
                                                             <a href="{{ route('author.itemSale',$item->id)}}" class="heart"><i class="ti-money"></i>  Pune la vanzare</a>
                                                             @endif
                                                                </div>
                                                                <!-- <div class="nft__item_like">
                                                                    <i class="fa fa-heart"></i><span>50</span>
                                                                </div>                             -->
                                                            </div> 
                                                        </div>
                                                    </div>                 
                                                    <!-- nft item begin -->

                                            @endforeach
                                            <div class="col-md-12 text-center">
                                                <a href="#" id="loadmore" class="black-btn wow fadeInUp">Arata mai multe</a>
                                            </div> 
                               
                                        @endif 
                                        </div>
                                        </div>
                                    </div>
                                    @endif

                                    @if (@Auth::user()->role_id == 4 || @Auth::user()->role_id == 5)
                                  
                                    <div class="tab-pane fade {{ @$data['referrals'] == url()->current() ?'show active':'' }} " id="referrals" role="tabpanel" aria-labelledby="referrals-tab">
                                        @if(session()->has('success'))
                                                <div class="alert alert-success">
                                                    {{ session()->get('success') }}
                                                </div>
                                            @endif
                                            <div class="main-details-area mt-3">
                                                    <div class="container">
                                                        <div class="row mt-5">
                                                                <div class="col-xl-10 offset-xl-1 affiliate_item">
                                                                    <h3>Link pentru referral <button id="aff_generate" class="btn-main">@lang('lang.click')</button></h3> 
                                                                    <div id="hideme">
                                                                        <p> Copiaza si trimite acest link prietenilor tai pentru a deveni afiliati cu tine pe Minted.ro</p>
                                                                        <input  class="list-group-item" id="aff_link" value="{{ Auth::user()->referral_link }}"  />
                                                                        <button class="butonsp" onclick="myFunction()">Copy text</button>
                                                                    </div>
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
                                                                            <h3>@lang('lang.all') @lang('lang.affiliate') <b>({{ count(Auth::user()->referrals)  ?? '0' }})</b></h3>
                                                                        </div>
                                                                        @if (@$data['referrals'])
                                                                        <table class="table">
                                                                            <tr>
                                                                                <th>@lang('lang.affiliate') @lang('lang.name')</th>
                                                                                <th>@lang('lang.added_time')</th>
                                                                                <th>@lang('status')</th>
                                                                            </tr>
                                                                          
                                                                            @foreach (@$data['referrals'] as $item)
                                                                                <tr>
                                                                                    <td>{{ @$item->username }}</td>
                                                                                    <td>{{DateFormat(@$item->created_at)}}</td>
                                                                                    <td>{{ @$item->status == 1 ?'Active':'Pending' }}</td>
                                                                                </tr>
                                                                            @endforeach
                                                                            
                                                                        </table>
                                                                    
                                                                        <div class="Pagination">
                                                                            {{ $data['referrals']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                                                                        </div>
                                                                        @endif
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- main-details-area-end -->
                          
                                    @endif


                                    @if (@Auth::user()->role_id == 4)
                                    <div class="tab-pane fade {{ @$data['reviews'] == url()->current() ?'show active':'' }} " id="Reviews" role="tabpanel"
                                        aria-labelledby="Reviews-tab">
                                        <div class="review_main_area">
                                            <div class="row">
                                                <div class="col-xl-8">
                                                    <div class="review_area ">
                                                        @php
                                                            $review_total=count(@$data['item_review']);
                                                            $total_star=0;
                                                        @endphp
                                                        @if (@$review_total > 0)
                                                        
                                                            @foreach ( @$data['item_review'] as $review)
                                                                <div class="single_review_wrap">
                                                                    <div
                                                                        class="review_header d-flex justify-content-between">
                                                                        <div
                                                                            class="review_author d-flex align-items-center">
                                                                            <div class="review_thumb">
                                                                                    <img src="{{ @$review->user->profile->image? asset($review->user->profile->image): asset('public/uploads/img/theme-details/comments/1.png')}}" alt="" width="80" height="auto">
                                                                                    
                                                                            </div>
                                                                            <div class="author_name">
                                                                                <h4>{{ @$review->Item->title}}</h4>
                                                                                <p>@lang('lang.reviewed_by'): {{ @$review->user->username}} on {{ DateFormat(@$review->created_at)}}
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="review_rating">
                                                                                @php
                                                                                    $total_star = $total_star+$review->rating;
                                                                                @endphp
                                                                                
                                                                                @if($review->rating == .5)
                                                                                <i class="fa fa-star-half-o"></i>
                                                                                <i class="fa fa-star-o"></i>
                                                                                <i class="fa fa-star-o"></i>
                                                                                <i class="fa fa-star-o"></i>
                                                                                <i class="fa fa-star-o"></i>
                                                                                @elseif($review->rating == 1)
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                @elseif($review->rating == 1.5)
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star-half-o-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                @elseif($review->rating == 2)
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                @elseif($review->rating == 2.5)
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star-half-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                @elseif($review->rating == 3)
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                @elseif($review->rating == 3.5)
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star-half-o"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                @elseif($review->rating == 4)
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star-o"></i>
                                                                                @elseif($review->rating == 4.5)
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star-half-o"></i>
                                                                                @elseif($review->rating == 5)
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    @endif
                                                                        </div>
                                                                    </div>
                                                                    <div class="review-text">
                                                                            <p>{{ @$review->body}}</p>
                                                                    </div>
                                                                </div>
                                                            @endforeach
                                                            <div class="Pagination">
                                                                    {{ @$data['item_review']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                                                            </div>
                                                            @else
                                                            <h1>@lang('lang.no') @lang('lang.review')</h1>
                                                                
                                                        @endif
                                                    </div>
                                                </div>
                                                <div class="col-xl-4">
                                                    <div class="rating_side_bar">
                                                        <div
                                                            class="single_rating_bar d-flex justify-content-between align-items-center ">
                                                            <div class="rating_star d-flex align-items-center">
                                                                <i class="ti-star"></i>
                                                                <div class="rate_text">
                                                                    <span>@lang('lang.Ratings')</span>
                                                                    
                                                                    @php
                                                                        if ($review_total > 0) {
                                                                        
                                                                                
                                                                        $countable_star=$total_star / $review_total;
                                                                        $row_countable_star= floor($countable_star * 100) / 100;
                                                                        if ($row_countable_star>0 && $row_countable_star<=.5) {
                                                                            $countable_star=.5;
                                                                        }  
                                                                        if ($row_countable_star>.5 && $row_countable_star<=1) {
                                                                            $countable_star=1;
                                                                        } 
                                                                        if ($row_countable_star>1 && $row_countable_star<=1.5) {
                                                                            $countable_star=1.5;
                                                                            
                                                                        }  
                                                                        if ($row_countable_star>1.5 && $row_countable_star<=2) {
                                                                            $countable_star=2;
                                                                            
                                                                        } 
                                                                        if ($row_countable_star>2 && $row_countable_star<=2.5) {
                                                                            $countable_star=2.5;
                                                                            
                                                                        } 
                                                                        if ($row_countable_star>2.5 && $row_countable_star<=3) {
                                                                            $countable_star=3;
                                                                            
                                                                        }
                                                                        if ($row_countable_star>3 && $row_countable_star<=3.5) {
                                                                            $countable_star=3.5;
                                                                            
                                                                        } 
                                                                        if ($row_countable_star>3.5 && $row_countable_star<=4) {
                                                                            $countable_star=4;
                                                                            
                                                                        } 
                                                                        if($row_countable_star>4 && $row_countable_star<=4.5) {
                                                                            $countable_star=4.5;
                                                                            
                                                                        }
                                                                        if($row_countable_star>4.5 && $row_countable_star<=5) {
                                                                            $countable_star=5;
                                                                            
                                                                        }
                                                                    } 
                                                                    @endphp
                                                                    @if (@$review_total > 0)
                                                                    <p>{{ $countable_star}} @lang('lang.average_based_on') {{@$review_total}} @lang('lang.Ratings').</p>
                                                                    @else
                                                                    <p>0</p>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                            @if (@$review_total > 0)
                                                                <h2>{{ $countable_star}}</h2>
                                                            @endif
                                                        </div>
                                                        <div
                                                            class="single_rating_bar d-flex justify-content-between align-items-center ">
                                                            <div class="rating_star d-flex align-items-center">
                                                                <i class="ti-shopping-cart-full"></i>
                                                                <div class="rate_text">
                                                                    <span>@lang('lang.total') @lang('lang.sales')</span>
                                                                </div>
                                                            </div>
                                                            <h2>{{ $data['user']->item->sum("sell") }}</h2>
                                                        </div>
                                                        <div
                                                            class="single_rating_bar d-flex justify-content-between align-items-center ">
                                                            <div class="rating_star d-flex align-items-center">
                                                                <i class="ti-user"></i>
                                                                <div class="rate_text">
                                                                    <span>@lang('lang.followers')</span>
                                                                </div>
                                                            </div>
                                                            <h2>{{ $data['user']->followers()->count()}}</h2>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @endif

<!--  AICI O SA MODIFICI TU SIS, AICI E PAGINA TA, PENTRU CA ASTA E O PAGINA MARE CARE ARE TOATE TAB-URILE RESPECTIVE -->

                                    @if (@Auth::user()->role_id == 4)
                                    <div class="tab-pane fade {{ @$data['refunds'] == url()->current() ?'show active':'' }} " id="refunds" role="tabpanel"
                                        aria-labelledby="refunds-tab">
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
                                            
                                            <div class="tab-content" id="myTabContent">
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
                                                                          
                                                                

                                                                <form action="{{ route('author.setup_payout')}}"  method="POST" class="checkout-form">
                                                                    @csrf
                                                                    <div class="row">
                                                                        <div class="col-xl-12">
                                                                            <div class="row">
                                                                                <input type="text" name="name" value="Bank" hidden>
                                                                                <div class="col-xl-12 col-md-12">
                                                                                   <input type="text" name="email" id="" value="{{ @$bank_payout_setup->payout_email }}"/>
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
                                                                        <button type="submit" class="btn-main dpf-submit">@lang('lang.setup_account')</button>
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



<!-- AICI SE OPRESTE UNDE UMBLII TU -->
                                    @if (@Auth::user()->role_id == 4)
                                    <!-- payouts start -->
                                    
                                    <div class="tab-pane fade {{ @$data['payout'] == url()->current() ?'show active':'' }} " id="payouts" role="tabpanel"
                                        aria-labelledby="payouts-tab">
                                        <div class="payment_wrap account_tabs_pin">
                                            <div class="row">
                                            @if (defaultPayout())
                                                @if (defaultPayout()->payment_method_name=='Stripe')
                                                <div class="col-lg-7  ">
                                                    <h2>Balanta Ta</h2>
                                                    <p>@lang('lang.You_currently_have')  {{Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}} </p>
                                                    <form action="{{ route('author.withdraw_amount')}}"  method="POST" class="checkout-form">
                                                        @csrf
                                                        <div class="row">
                                                            <div class="col-xl-6">
                                                                <div class="row">
                                                                    <input type="text" name="payment_method_id" value="1" hidden>
                                                                    <div class="col-xl-12 col-md-12">
                                                                        <label for="name">Suma Retragere <span>*</span></label>
                                                                        <input type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null"  name="withdraw_amount" placeholder="Introduceti suma dorita pentru retragere">
                                                                    </div>
                                                            
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-3 ">
                                                                <div class="check-out-btn">
                                                                    <button type="submit" class="btn-main dpf-submit">Retrage</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                    </form>
                                                </div>
                                                @elseif(defaultPayout()->payment_method_name=='Bank')
                                                <div class="col-lg-7  ">
                                                    <h2>Balanta Ta ETH</h2>
                                                    <p>@lang('lang.You_currently_have')  {{Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}} </p>
                                                    <form action="{{ route('author.withdraw_amount')}}"  method="POST" class="checkout-form">
                                                        @csrf
                                                        <div class="row">
                                                            <div class="col-xl-6">
                                                                <div class="row">
                                                                    <input type="text" name="payment_method_id" value="2" hidden>
                                                                    <div class="col-xl-12 col-md-12">
                                                                        <label for="name">Suma Retragere <span>*</span></label>
                                                                        <input type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null"  name="withdraw_amount" value="" 
                                                                            placeholder="Introduceti suma dorita pentru retragere">
                                                                    </div>
                                                            
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-3 ">
                                                                <div class="check-out-btn">
                                                                    <button type="submit" class="btn-main dpf-submit">Retrage</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                    </form>
                                                </div>
                                                @endif
                                            @endif
                                                <div class="col-lg-1">

                                                </div>
                                                <div class="col-lg-4 ">
                                                    <h2> @lang('lang.account') @lang('lang.payout')</h2>
                                                    @if (defaultPayout())
                                                        
                                                        @if (defaultPayout()->payment_method_name=='PayPal')
                                                            <img src="{{asset('/'.PaymentMethodSetup('PayPal')->logo)}}" alt="">
                                                        @elseif(defaultPayout()->payment_method_name=='Stripe')
                                                            <img src="{{asset('/'.PaymentMethodSetup('Stripe')->logo)}}" alt="">
                                                        @elseif(defaultPayout()->payment_method_name=='Razorpay')
                                                            <img src="{{asset('/'.PaymentMethodSetup('Razorpay')->logo)}}" alt="">
                                                        @else
                                                            <img src="{{asset('/'.PaymentMethodSetup('Blockchain')->logo)}}" alt="">
                                                        @endif
                                                            <br>
                                                        {!! defaultPayout()->payout_email !!}
                                                    @endif

                                                    <div class="check-out-btn mt-10" style="margin-top: 20px;">
                                                        <a href="{{ route('author.refunds',@Auth::user()->username)}}" id="deposit_" class="btn-main">@lang('lang.set') @lang('lang.account')</a>
                                                       
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
                                                            <th colspan="">@lang('lang.date')</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @foreach ($data['payout_history'] as $payout)
                                                            <tr>
                                                                <td>{{@$infix_general_settings->currency_symbol}} {{$payout->amount}} </td>
                                                                <td>{{ @$payout->payment_method_name }} -{{ @$payout->payout_email }} </td>
                                                                <td>{{DateFormat($payout->created_at)}} </td>
                                                            </tr>
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                              
                                            </div>
                                        </div>
                                       
                                    </div>
                                        
                                    <!-- payouts start -->
                                    @endif
                                    @if (@Auth::user()->role_id == 4)
                                    
                                    <!-- earnings start here  -->
                                    <div class="tab-pane fade {{ @$data['earning'] == url()->current() ?'show active':'' }} " id="Followings00" role="tabpanel"
                                        aria-labelledby="Followings-tab00">
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
                                                        <h3>{{@$infix_general_settings->currency_symbol}}{{ @$data['monthly_earn1'] }}</h3>
                                                        <h4>@lang('lang.sales') @lang('lang.earnings') @lang('lang.this') @lang('lang.month') ({{ date('M Y') }}), </h4>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-4">
                                                    <div class="single_earning  padding_25px  mb-30">
                                                        <h3>{{@$infix_general_settings->currency_symbol}}{{ @$data['monthly_earn2'] }}</h3>
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
                                                        <h3>{{@$infix_general_settings->currency_symbol}}{{ $total_income }}</h3>
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
                                                        <h3>@lang('lang.your') @lang('lang.top') @lang('lang.countries')</h3>
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
                                    <!-- earnings end  -->
                                    <div class="tab-pane fade {{ @$data['statement'] == url()->current() ?'show active':'' }} " id="Statements" role="tabpanel"
                                        aria-labelledby="Statements-tab">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- main-details-area-end -->

        {{-- pop  --}}
        <!-- form itself -->

        <!-- form itself -->

     @if (count(@$data['order'])>0)
    <form id="test-form2" class="white-popup-block mfp-hide add_lisence_popup" action="{{route('user.review')}}" method="POST">
       @csrf
        <h1>@lang('lang.review') @lang('lang.this') @lang('lang.item')</h1>
        <fieldset class="border-0">
        {{-- <p class="pro_name">@lang('lang.woodMark_responsive_woocommerce_theme') <span>by</span> <a href="#">  @lang('lang.xtemos') </a></p> --}}
        <div class="tag_ieam">
            <p>@lang('lang.message_for_rating')</p>
        </div>
        <input type="text" hidden  name="order_id" id="order_id" />
        <input type="text" hidden name="item_id" id="RatVAl" />
        <div class="your_rated d-flex">
                <strong>@lang('lang.your') @lang('lang.rating') :</strong><span  class="rating">
                        <input type="checkbox" class="starRate" id="starS5" /><label class = "full " for="5" title="Awesome - 5 stars"></label>
                        <input type="checkbox" class="starRate"  id="starS4.5" /><label class="half" for="4.5" title="Pretty good - 4.5 stars"></label>
                        <input type="checkbox" class="starRate" id="starS4"  /><label class = "full " for="4" title="Pretty good - 4 stars"></label>
                        <input type="checkbox" class="starRate"  id="starS3.5" /><label class="half star3.5" for="3.5" title="Meh - 3.5 stars"></label>
                        <input type="checkbox" class="starRate"  id="starS3"  /><label class = "full star3" for="3" title="Meh - 3 stars"></label>
                        <input type="checkbox" class="starRate"  id="starS2.5" /><label class="half star2.5" for="2.5" title="Kinda bad - 2.5 stars"></label>
                        <input type="checkbox" class="starRate"  id="starS2" /><label class = "full star2" for="2" title="Kinda bad - 2 stars"></label>
                        <input type="checkbox" class="starRate"  id="starS1.5" /><label class="half star1.5" for="1.5" title="Meh - 1.5 stars"></label>
                        <input type="checkbox" class="starRate"  id="starS1"  /><label class = "full star1" for="1" title="Sucks big time - 1 star"></label>
                        <input type="checkbox" class="starRate" id="starS.5" /><label class="half half5" for=".5" title="Sucks big time - 0.5 stars"></label>
                        <input type="hidden" id="final_rating" name="rating">
                    </span>
        </div>

        <div class="row">
            <div class="col-xl-12">
                    <div class="select_box">
                        @php
                             $review_type = App\ManageQuery::ReviewType();

                        @endphp
                        <p>@lang('lang.mryr')</p>
                            <select class="wide" name="review_type" id="review_type">
                                <option data-display="Select Review Type *">Select Review Type *</option>
                                @foreach ($review_type as $item)                                    
                                 <option value="{{ $item->id}}">{{ $item->name}}</option>
                                @endforeach

                              </select>
                        </div>
                        <span class="text-danger" id="review_type_msg"></span>
            </div>
            <div class="col-xl-12">

                <div class="comments_field">
                    <div class="label d-flex justify-content-between">
                            <label for="textarea" >@lang('lang.comments')</label>
                            <span>1000</span>
                    </div>
                        <textarea id="textarea" placeholder="Your Comments" name="comment" ></textarea>
                </div>
                
                <div class="reviews_text_w">
                    <p>@lang('lang.review_publish_to_other')</p>
                </div>
                <div class="button_info">
                    <a class="btn-main-white mfp-close"  type="button">@lang('lang.cancle')</a>
                    <button class="btn-main">@lang('lang.save') @lang('lang.review')</button>
                </div>
                
            </div>
        </div>
        </fieldset>
    </form>
    @endif



        {{--/ pop --}}
@endsection
@push('js')
<!-- Croppie js -->
<script src="{{asset('public/frontend/js/croppie.min.js')}}"></script>
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

    
@endpush