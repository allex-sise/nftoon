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
<div class="no-bottom no-top" id="content">
            <div id="top"></div>
            
            <!-- section begin -->
            <section id="profile_banner" aria-label="section" class="text-light" data-bgimage="url({{ @$data['user']->profile->logo_pic? asset(@$data['user']->profile->logo_pic):asset('public/frontend/img/banner/banner.png') }}) top">
                    
            </section>
            <!-- section close -->
            

            <section aria-label="section">
                <div class="container">
					<div class="row">
					    <div class="col-md-12">
                           <div class="d_profile de-flex">
                                <div class="de-flex-col">
                                    <div class="profile_avatar">
                                        <img src="{{ @$data['user']->profile->image? asset(@$data['user']->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                                        <i class="fa fa-check"></i>
                                        <div class="profile_name">
                                            <h4>
                                            {{  @$data['user']->full_name }}                                                
                                                <span class="profile_username"><span>@</span>{{  @$data['user']->username }}</span>
                                                <span id="wallet" class="profile_wallet">DdzFFzCqrhshMSxb9oW3mRo4MJrQkusV3fGFSTwaiu4wPBqMryA9DYVJCkW9n7twCffG5f5wX2sSkoDXGiZB1HPa7K7f865Kk4LqnrME</span>
                                                <button id="btn_copy" title="Copy Text">Copy</button>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                @php
                                    $item =App\ManageQuery::CountItemSell($data['user']->id); 
                                @endphp
                                <div class="profile_follow de-flex">
                                    <div class="de-flex-col">
                                        <div class="profile_follower">@lang('lang.total') @lang('lang.sales') {{ @$item}}</div>
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
                                </ul>
                                
                                <div class="de_tab_content">
                                    
                                    <div class="tab-1">
                                        <div class="row">
                                        @foreach ($data['item'] as $item)
                                            <!-- nft item begin -->
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                <div class="nft__item">
                                                    <div class="de_countdown" data-year="2021" data-month="9" data-day="16" data-hour="8"></div>
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
                                                        {{ @$item->Reg_total}} {{@$infix_general_settings->currency_symbol}}
                                                        </div>
                                                        <div class="nft__item_action">
                                                            <a href="#">Place a bid</a>
                                                        </div>
                                                        <div class="nft__item_like">
                                                            <i class="fa fa-heart"></i><span>50</span>
                                                        </div>                            
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
                                                        <div class="de_countdown" data-year="2021" data-month="9" data-day="16" data-hour="8"></div>
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
                                                            {{ @$item->Reg_total}} {{@$infix_general_settings->currency_symbol}}
                                                            </div>
                                                            <div class="nft__item_action">
                                                                <a href="#">Place a bid</a>
                                                            </div>
                                                            <div class="nft__item_like">
                                                                <i class="fa fa-heart"></i><span>50</span>
                                                            </div>                            
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