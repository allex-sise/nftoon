@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/dashboard.css">
<link rel="stylesheet" type="text/css" href="{{ asset('/') }}public/backEnd/css/croppie.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/vendor_view.css">
<style>
.social_input_icon{height:40px;width:40px;color:#fff;background:#3a6aff;text-align:center;line-height:40px;border-radius:0;font-size:14px;border-radius:3px;margin-right:10px;flex:40px 0 0}.social_input_icon.color-1{background:#5e7161}.social_input_icon.color-2{background:#000}.social_input_icon.color-3{background:#e14788}.social_input_icon.color-4{background:#425999}.social_input_icon.color-5{background:#f40082}.social_input_icon.color-6{background:#333}.social_input_icon.color-7{background:#d44733}.social_input_icon.color-8{background:#d90214}.social_input_icon.color-9{background:#2d7cb7}.social_input_icon.color-10{background:#f43e00}.social_input_icon.color-11{background:#f68500}.social_input_icon.color-12{background:#38516e}.social_input_icon.color-13{background:#41aeef}.social_input_icon.color-14{background:#acd44b}.social_input_icon.color-15{background:#b20000}
</style>
@endpush
@section('content')
@php
   $infix_general_settings = app('infix_general_settings');
@endphp
<input type="text" hidden value="{{ @$data['user']->username }}" name="user_id" class="user_id">
<!-- content begin -->
<div class="no-bottom no-top" id="content">
            <div id="top"></div>
            
            <!-- section begin -->
            <section id="profile_banner" aria-label="section" class="text-light" data-bgimage="url({{ @$data['user']->profile->logo_pic? asset(@$data['user']->profile->logo_pic):asset('public/frontend/img/banner/banner.png') }}) top">
                    
            </section>
            <!-- section close -->
            

            <section aria-label="section" class="specialsectionmobile">
                <div class="container">
					<div class="row specialrowuserpage">
					    <div class="col-md-12">
                           <div class="d_profile de-flex">
                                <div class="de-flex-col">
                                    <div class="profile_avatar">
                                        <img src="{{ @$data['user']->profile->image? asset(@$data['user']->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                                        <i class="fa fa-check"></i>
                                        <div class="profile_name">
                                            <h4>
                                            {{  @$data['user']->full_name }}    
                                                @php
                                                    $walletz =  App\AuthorPayoutSetup::where('user_id', $data['user']->id)->where('payment_method_name','Bank')->first(); 
                                                @endphp                                            
                                                <span class="profile_username"><span>@</span>{{  @$data['user']->username }}</span>
                                                <span id="wallet" class="profile_wallet">{{ $walletz->payout_email ?? '' }}</span>
                                                @if($walletz)<button id="btn_copy" title="Copy Text">Copy</button>@endif
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                @php
                                    $item =App\ManageQuery::CountItemSell($data['user']->id); 
                                    $itemHistory = App\ItemOrder::where('author_id', $data['user']->id)->count();
                                @endphp
                                <div class="profile_follow de-flex">
                                    <div class="de-flex-col">
                                        <div class="profile_follower">@lang('lang.total') @lang('lang.sales') {{ @$itemHistory}}</div>
                                           
                                    </div>
                                </div>

                            </div>
                        </div>
                        @php
                            $level=App\ManageQuery::UserLabel($data['user']->balance->amount); 
                            // DB::table('labels')->where('amount','<=',@$data['user']->balance->amount)->orderBy('id','desc')->first();
                            $date=Carbon\Carbon::parse(Carbon\Carbon::now())->diffInDays(@$data['user']->created_at);
                            $badge=App\ManageQuery::UserBadge($date); 
                        @endphp
                        <div class="col-md-12">
                            <div class="de_tab">
    
                                <ul class="de_nav">
                                    <li class="active"><span>On Sale</span></li>
                                    <li><span>Owned</span></li>
                                    <li style="position: absolute; right: 50px; top: 100px;"><span>Bio</span></li>
                                </ul>
                                
                                <div class="de_tab_content">
                                    
                                    <div class="tab-1">
                                        <div class="row">
                                        @foreach ($data['item'] as $item)
                                            <!-- nft item begin -->
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
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
                                                            <h4>{{ @$item->title}}</h4>
                                                        </a>
                                                        <div class="nft__item_price">
                                                        {{ @$item->Re_item}} {{@$infix_general_settings->currency_symbol}}
                                                        </div>
                                                        <div class="nft__item_action">
                                                            <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">Cumpara</a>
                                                        </div>
                                                        <!-- <div class="nft__item_like">
                                                            <i class="fa fa-heart"></i><span>50</span>
                                                        </div>                             -->
                                                    </div> 
                                                </div>
                                            </div>                 
                                            <!-- nft item begin -->
                                        @endforeach
                                            <div class="Pagination">
                                                {{ @$data['item']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="tab-2">
                                        <div class="row">
                                            @foreach ($data['item2'] as $item)
                                                <!-- nft item begin -->
                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
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
                                                                <h4>{{ @$item->title}}</h4>
                                                            </a>
                                                          
                                                                               
                                                        </div> 
                                                    </div>
                                                </div>                 
                                                <!-- nft item begin -->
                                            @endforeach
                                            <div class="Pagination">
                                                {{ @$data['item']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-3">
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
                    </div>
				</div>
            </section>
			
			
        </div>
        <!-- content close -->


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