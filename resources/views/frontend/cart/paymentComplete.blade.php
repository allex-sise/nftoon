@extends('frontend.master')
@push('css') 
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/payment_complete.css">

@endpush
@section('content')
@php
   $infix_general_settings =app('infix_general_settings');
@endphp
 <!-- start page title area -->
 <div class="rn-breadcrumb-inner ptb--30">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <h5 class="title text-center text-md-start">@lang('lang.payment_complete')</h5>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-list">
                        <li class="item"><a href="index.html">Acasa</a></li>
                        <li class="separator"><i class="feather-chevron-right"></i></li>
                        <li class="item current">@lang('lang.payment_complete')</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end page title area -->


    <!-- Upload variants style start -->
    <div class="rn-upload-variant-area varient rn-section-gap">
        <div class="container">
            <div class="row">
                <div class="upload-variant-title-wrapper">
                    <div class="payment_logo" style="text-align: center; margin-bottom: 20px;">
                        <img src="{{asset('public/uploads/img/cart/write2.png')}}" alt="">
                    </div>
                    <h3 class="title text-center">
                        @lang('lang.payment_complete')!
                    </h3>
                    <p class="text-center">@lang('lang.an_confirmation_email_is_coming_your_way') <br>
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
            </div>
            <div class="row g-5 mt--40">
                <div class="col-md-6 offset-3">
                     
                @foreach ($data['order']->itemOrder as $item)  
                    @php
                        $obj = json_decode(@$item->item, true);
                    @endphp 
                    @if ($loop->last)
                    <!-- start single product -->
                    <div class="grid-metro-item cat-3 cat--4">
                        <div class="product-style-one no-overlay">
                            <div class="card-thumbnail">
                                <a href="{{ route('singleProduct',[str_replace(' ', '-',$item->Item->title),$item->Item->id]) }}"><img src="{{asset(@$item->Item->icon)}}"></a>
                            </div>
                            <div class="product-share-wrapper">
                                <div class="profile-share">
                                    <!-- <a href="author.html" class="avatar" data-tooltip="Tumis"><img src="assets/images/client/client-1.png"></a> -->
                                    <a class="more-author-text" href="#">@lang('lang.item_by') {{@$obj['username']}}</a>
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
                            <a href="{{ route('singleProduct',[str_replace(' ', '-',$item->Item->title),$item->Item->id]) }}"><span class="product-name">{{ @$item->Item->title }}</span></a>

                            <div class="row">
                                <div class="col-md-10">
                                    <span class="latest-bid">@lang('lang.price') Achizitie</span>
                                </div>
                                <div class="col-md-2">
                                    <div class="last-bid float-right">{{ @$item->subtotal }} toons</div>
                                </div>
                            </div>
                     
                            <div class="bid-react-area">
                                
                                @if (Auth::user()->role_id == 4)
                                    <a class="btn btn-primary w-100" href="{{ url('author/download/'.@Auth::user()->username) }}">Vezi la tine in profil</a> 
                                @endif
                                @if (Auth::user()->role_id == 5)
                                    <a class="btn btn-primary w-100" href="{{ url('author/download/'.@Auth::user()->username) }}">Vezi la tine in profil</a> 
                                @endif
                            </div>
                        </div>
                    </div>
                    <!-- end single product -->
                    @endif
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <!-- Upload variants style End -->



@endsection