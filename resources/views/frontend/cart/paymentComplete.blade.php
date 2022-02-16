@extends('frontend.master')
@push('css') 
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/payment_complete.css">
<style>
.payment_confirm_header{
    width: 150px!important;
    height: 150px!important;
    margin-top: 40px!important;
    margin-bottom: 40px!important;
    }
@media only screen and (max-width: 767px) {
.banner-area4::before {
    margin-top: 0px!important;
}
.payment_info{
    margin-left: 30px;
}
}
</style>
@endpush
@section('content')
@php
   $infix_general_settings =app('infix_general_settings');
@endphp
     <!-- section begin -->
     <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                            <div class="payment_confirm_header">
                            <div class="payment_logo">
                                <img src="{{asset('public/uploads/img/cart/write2.png')}}" alt="">
                            </div>
                        </div>
                        <div class="conformation-title">
                                <h2>@lang('lang.payment_complete')!</h2>
                                <p>@lang('lang.an_confirmation_email_is_coming_your_way') <br>
                                    @lang('lang.this_item_is_now_available_on_your')  
                                    @if (Auth::user()->role_id == 4)
                                    <a href="{{ route('author.download',@Auth::user()->id) }}">Colectia ta</a> 
                                    @endif
                                    @if (Auth::user()->role_id == 5)
                                    <a href="{{ url('downloads/'.@Auth::user()->username) }}">Colectia ta </a> 
                                    {{-- <a href="{{ route('customer.profile',@Auth::user()->username) }}">Download page</a>  --}}
                                    @endif
                                    </p>
                               
                        </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->     



    <!-- payment_confirm_start    -->
    <div class="payment_confim_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1">
                    
                    <div class="payment_confirm_prise_wrap">
                        <div class="payment_confirm_prise_header d-flex justify-content-between align-items-center">
                            <h4>@lang('lang.your_order')</h4>
                       
                        </div>

                        
                            @foreach ($data['order']->itemOrder as $item)  
                            @php
                             $obj = json_decode(@$item->item, true);
                           @endphp 
                           @if ($loop->last)
                           <div class="payment_wrap_body">
                                <div class="row">
                                    <div class="col-xl-6 col-md-7">
                                        <div class="single-confirmation d-flex align-items-center">
                                            <div class="payment_wrap_thumb">
                                                <img src="{{asset(@$obj['icon'])}}" alt="" width="80" height="80">
                                            </div>
                                            
                                            <div class="payment_info">
                                                    <h5> <a href="{{ route('singleProduct',[str_replace(' ', '-',$item->Item->title),$item->Item->id]) }}">{{ @$item->Item->title }}</a> </h5>
                                                    <p>@lang('lang.item_by') <a href="#">{{@$obj['username']}}</a> </p>
                                                   
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-md-5">
                                        <div class="payment_btn_prise d-flex align-items-center">
                                            <!-- @if (Auth::user()->role_id == 4)
                                                <a class="boxed-btn" href="{{ route('user.ItemDownloadAll',@$item->order_id) }}">@lang('lang.download')</a> 
                                            @endif
                                            @if (Auth::user()->role_id == 5)
                                                <a class="boxed-btn" href="{{ route('user.ItemDownloadAll',@$item->order_id) }}">@lang('lang.download')</a> 
                                            @endif -->
                                            @if (Auth::user()->role_id == 4)
                                                <a class="boxed-btn" href="{{ url('author/download/'.@Auth::user()->username) }}">Vezi la tine in profil</a> 
                                            @endif
                                            @if (Auth::user()->role_id == 5)
                                                <a class="boxed-btn" href="{{ url('author/download/'.@Auth::user()->username) }}">Vezi la tine in profil</a> 
                                            @endif
                                             {{-- <a href="{{ @$item->Item->category->productSetting->url }}" target="_blank" class="boxed-btn-white">{{ isset($item->Item->category->productSetting) ?  $item->Item->category->productSetting->title .' '. GeneralSetting()->currency_symbol .''. $item->Item->category->productSetting->amount :''}}</a> --}}
                                            <div class="net_prise">
                                                <span>@lang('lang.price')</span>
                                                <h3>{{ @$item->subtotal }} {{@$infix_general_settings->currency_symbol}}</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
    @endif
                          
                            @endforeach
                            
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection