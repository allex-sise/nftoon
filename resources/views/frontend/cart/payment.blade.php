@extends('frontend.master')
@push('css')
@endpush
@section('content')
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/payment_selection.css">
@php
   $infix_general_settings = app('infix_general_settings');
   $system_logo = app('infix_background_settings');
   $system_logo = $system_logo[0];
   $a = Cart::subtotal();
$b = preg_replace("/(\,)/", "", $a);
$carttotalstrip = floatval($b);
@endphp
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/payment.css">
<style>
    .btnspecial{
        background-image: none;
        background-color: #000!important;
    }   
    .single_deposite_item:hover .deposite_header {
        background-image: none;
    }
    .rn-connect-area{
        margin-top: 50px!important;
    }
    .float-right{
        float: right!important;
    }
    .products_list_bottom{
        font-size: 24px!important;
        font-weight: bold!important;
    }
    .dscbold{
        font-size: 24px!important;
        font-weight: bold!important;
    }
</style>
<!-- banner-area start -->
 <!-- start page title area -->
 <div class="rn-breadcrumb-inner ptb--30">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
                <h5 class="title text-center text-md-start">Detalii @lang('lang.payment')</h5>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <ul class="breadcrumb-list">
                    <li class="item"><a href="index.html">Acasa</a></li>
                    <li class="separator"><i class="feather-chevron-right"></i></li>
                    <li class="item current">Detalii @lang('lang.payment')</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- end page title area -->

  <!-- start connect area -->
  <div class="rn-connect-area">
        <div class="container">
            <div class="row g mb--50 mb_md--30 mb_sm--30 align-items-center">
                <div class="col-lg-6" data-sal="slide-up" data-sal-delay="150" data-sal-duration="800">
                    <h3 class="connect-title">@lang('lang.billing_details')</h3>
                    <a href="{{ route('customer.cheackout') }}">@lang('lang.edit')</a>
                </div>
                <div class="col-lg-6" data-sal="slide-up" data-sal-delay="200" data-sal-duration="800">
                    <p class="wallet-bootm-disc">{{ @$data['user']->profile->first_name }} {{ @$data['user']->profile->last_name }}</p>
                    <p class="wallet-bootm-disc">{{ @$data['user']->profile->address }}</p>
                    <p class="wallet-bootm-disc">{{ @$data['user']->profile->city->name }} - {{ @$data['user']->profile->zipcode }} </p>
                    <p class="wallet-bootm-disc"> {{ @$data['user']->profile->state->name }} , {{ @$data['user']->profile->country->name }} </p>
                </div>
            </div>
            <div class="row g-5">
                <div class="col-lg-9">
                    <div class="row g-5">
                        <!-- start single wallet -->
                        <div class="col-xxl-12 col-lg-12 col-md-12 col-12 col-sm-6 col-12" data-sal="slide-up" data-sal-delay="150" data-sal-duration="800">
                            <div class="wallet-wrapper">
                                <div class="inner">
                                    <div class="icon">
                                        <i data-feather="cast"></i>
                                    </div>
                                    <div class="content">
                                        <h4 class="title"><a href="#">NFToons</a></h4>
                                        <p class="description">Plateste folosind credite NFToons.</p>
                                        <p class="description dscbold">Fondurile tale: @if (Auth::user()->role_id == 4)
                                                                    {{ @Auth::user()->balance->amount}} toons
                                                                    @endif
                                                                    @if (Auth::user()->role_id == 5)
                                                                        {{ @Auth::user()->balance->amount}} toons
                                                                    @endif</p>
                                    </div>
                                </div>
                                <a href="#" data-toggle="modal" data-target="#MakePaymentFromCredit" class="over-link"></a>
                                                              
                            </div>
                        </div>
                        <div class="rn-popup-modal placebid-modal-wrapper modal fade" id="MakePaymentFromCredit" tabindex="-1" aria-hidden="true">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i data-feather="x"></i></button>
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title">Contul meu</h3>
                                    </div>
                                    <div class="modal-body">
                                    <form action="{{ route('user.payment_main_balance') }}" id="infix_payment_form1" method="POST" name="payment_main_balance" >
                                        @csrf 
                                        <div class="placebid-form-box">
                                            <h5 class="title">Toons disponibili in contul tau:</h5>
                                            <div class="bid-content">
                                                <div class="bid-content-top">
                                                    <div class="bid-content-left">
                                                        <input type="text" class=""  placeholder="Bank Name" name="bank_name" value="{{ @Auth::user()->balance->amount}}" readonly>
                                                         <span>NFToons</span>
                                                    </div>
                                                </div>

                                                <div class="bid-content-mid">
                                                    <div class="bid-content-left">
                                                        <span>Total de plata </span>
                                                    </div>
                                                    <div class="bid-content-right">
                                                        <span><input type="text"  name="amount" class="bank_deposit_input"  placeholder="Name of account owner" value="{{ $carttotalstrip }}" readonly></span>
                                                    </div>
                                                </div>
                                            </div>
                                            @if ( @Auth::user()->balance->amount >= $carttotalstrip) 
                                            <div class="row">
                                                <div class="col-lg-12">                                                                                
                                                    {{-- <div class="checkit">
                                                        <span class="chebox-style-custom">
                                                            <input class="styled-checkbox" id="styled-checkbox-28" onchange="showPayOption('con_balance_pay')" type="checkbox" name="item_comment" value="">
                                                            <label for="styled-checkbox-28"> @lang('lang.use') toons {{ $carttotalstrip }} @lang('lang.from_my_infix_balance_for_this_purchase') </label>
                                                        </span>
                                                        <span class="item_comment invalid-feedback" id="item_comment"></span>
                                                    </div> --}}
                                                </div>
                                            </div>
                                            @endif

                                            <div class="bit-continue-button">
                                            @if ( @Auth::user()->balance->amount >= $carttotalstrip) 
                                                    <button  class="btn btn-primary w-100"   type="submit">
                                                        @lang('lang.pay') 
                                                    </button>
                                                @else
                                                    <a class="btn btn-primary w-100" href="{{ route('user.deposit',@Auth::user()->username)}}">ADAUGA FONDURI</a>
                                                @endif

                                                <button type="button" class="btn btn-primary-alta mt--10" data-bs-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                    </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- start single wallet -->
                     
                    </div>
                </div>
                <div class="col-lg-3" data-sal="slide-up" data-sal-delay="150" data-sal-duration="500">
                    <div class="connect-thumbnail">
                        <div class="left-image">
                        <form action="{{ route('customer.payment_store') }}" method="POST">                                        
                                @csrf
                            <div class="your_order mt-lg-2">
                                <div class="order_header">
                                    <h4>@lang('lang.your_order')</h4>
                                </div>
                                <div class="products_total_list ">
                                    <div class="products_total_list-heder d-flex justify-content-between">
                                        <span>@lang('lang.product')</span>
                                        <span>@lang('lang.total')</span>
                                    </div>
                                    <ul>
                                            @if (@count(Cart::content()) > 0 )
                                                @php
                                                $total_tax=0.00;
                                                @endphp
                                            @foreach (Cart::content() as $key => $item)
                                                @php
                                                    $total_tax+= $item->options['tax'];
                                                @endphp
                                                <li>
                                                    <span>{{ @$item->name }}</span>
                                                    <span class="float-right">{{ @$item->price  }} toons</span>
                                                             
                                                </li>
                                            @endforeach
                                        @endif
                                    </ul>
                                </div>
                                <div class="products_list_bottom">
                                    <span>@lang('lang.total')</span>
                                    <span class="prise_tag">
                                             {{ $carttotalstrip }} toons
                                    </span>
                                
                                </div>
                                <div class="mt-3 text-center">
                                    @if ($total_tax>0)
                                    <p>@lang('lang.price_displayed_excludes_sales_tax')</p>
                                   @endif
                                </div>
                               
                            </div>
                            <div class="mt-5 text-center">
                               
                                {{-- <button href="#" class="boxed-btn btnspecial" type="submit">@lang('lang.purchase')</button> --}}
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- End connect area -->

@endsection
@push('js')
    <script src="{{ asset('public/frontend/js/') }}/checkout.js"></script>
    <script src="{{ asset('public/frontend/js/') }}/payment_section.js"></script>
 
@endpush
