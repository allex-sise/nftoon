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
</style>
   <!-- banner-area start -->

 <!-- content begin -->
 <div class="no-bottom no-top" id="content">
            <div id="top"></div>
            
            <!-- section begin -->
            <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>Detalii @lang('lang.payment')</h1>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->       

    <!-- checkout_area start -->
    <div class="payment_area section-padding">
        <div class="container">
            <div class="row"> 
                <div class="col-xl-10 offset-xl-1">
                    <div class="row">
                        <div class="col-xl-9">
                            <div class="biling_address">
                                <div class="biling-header d-flex justify-content-between align-items-center">
                                    <h4>@lang('lang.billing_details')</h4>
                                   <a href="{{ route('customer.cheackout') }}">@lang('lang.edit')</a>
                                </div>
                                <div class="biling_body_content">
                                    <p>{{ @$data['user']->profile->first_name }} {{ @$data['user']->profile->last_name }}</p>
                                    <p>{{ @$data['user']->profile->address }}</p>
                                    <p>{{ @$data['user']->profile->city->name }} - {{ @$data['user']->profile->zipcode }} </p>
                                    <p> {{ @$data['user']->profile->state->name }} , {{ @$data['user']->profile->country->name }} </p>
                                </div>
                            </div>
                        
                            <div class="select_payment_method">
                                <div class="input_box_tittle">
                                        <h4>@lang('lang.payment_method')</h4>
                                        {{-- <div class="input-group d-block">
                                            <div class="d-flex">
                                                <div class="mr-30">
                                                    <input type="radio" name="payment_type" id="_main_balance" value="main_" class="common-radio relationButton" checked >
                                                    <label for="_main_balance">@lang('lang.main') @lang('lang.balance')</label>
                                                </div>
                                                <div class="ml-2 mr-30">
                                                    <input type="radio" name="payment_type" id="_Online" value="online_" class="common-radio relationButton">
                                                    <label for="_Online">@lang('lang.payment') @lang('lang.online')</label>
                                                </div>
                                            </div>
                                        </div> --}}
                                    </div>
                                    {{-- <div class="payment_wrap" id="_main_balance_on">
                                        <nav>
                                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active" id="infix-tab" data-toggle="tab" href="#infix"
                                                        role="tab" aria-controls="contact" aria-selected="false">
                                                        <img   class="img-fluid"src="{{asset('public/uploads/img/payment/infix.png')}}" alt="">
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade show active" id="infix" role="tabpanel" aria-labelledby="infix-tab">
                                                <div class="payment_form">
                                                    <div class="col-lg-6 mt-40 text-center" id="main_balance_on">
                                                                <h5>@lang('lang.my') @lang('lang.account')</h2>
                                                                <p class="mb-0">@lang('lang.my') @lang('lang.balance') : <b>{{@$infix_general_settings->currency_symbol}}{{ @Auth::user()->balance->amount}}</b></p>
                                                                 <small>@lang('lang.your') @lang('lang.item') @lang('lang.price') : {{@$infix_general_settings->currency_symbol}} {{ $carttotalstrip }}</small><br>
                                                                 @if ( @Auth::user()->balance->amount > $carttotalstrip )  
                                                                     <small> <font color="green">@lang('lang.you_can_buy_now') </font> <font color="black"><i class="ti-face-smile"></i></font></small>
                                                                     <div class="main_balance mt-5">
                                                                            <form action="{{ route('user.payment_main_balance') }}" method="POST">
                                                                                @csrf
                                                                                <div class="input-group">
                                                                                   <input class="form-control" id="_package_price_payment" readonly type="text" name='amount' value="{{ $carttotalstrip }}" placeholder=""/>
                                                                                </div>
                                                                                <div class="col-lg-12 mt-4">
                                                                                    <div class="login_button text-center">
                                                                                        <button id="" class="button boxed-btn" type="submit">
                                                                                            @lang('lang.pay')
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                   @else  
                                                                 @endif
                                                               
                                                        </div>
                                                </div>
                                                    
                                            </div>
                                        </div>
                                            
                                    </div> --}}
                                    <div class="privaci_polecy_area section-padding checkout_area ">
                                        <div class="container">
                                            <div class="row justify-content-center">
                                                <div class="col-xl-12">
                                                    <div class="deposite_payment_wrapper customer_payment_wrapper">
                                                        
                                                        <!-- single_deposite_item  -->
                                                        <div class="single_deposite_item">
                                                            <div class="deposite_header text-center">
                                                                Minted Credit
                                                            </div>
                                                            <div class="deposite_button text-center">
                                                                 <p class="mt-3">Plateste folosind credite Minted.</p>
                                                                 <p class="">Fondurile tale: @if (Auth::user()->role_id == 4)
                                                                    {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
                                                                    @endif
                                                                    @if (Auth::user()->role_id == 5)
                                                                        {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
                                                                    @endif
                                                                </p>
                                                                <div class="mt-1 text-center mb-1">
                                                                    <a href="#" data-toggle="modal" data-target="#MakePaymentFromCredit" class="boxed-btn btnspecial">Plateste</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                    <div  class="modal fade " id="MakePaymentFromCredit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-lg" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Contul meu</h5>
                                                                </div>
                                                                {{-- <form action="{{ route('user.payment_main_balance') }}" id="infix_payment_form1" method="POST" name="payment_main_balance"    onsubmit="return validateFormForPayment()" > --}}
                                                                <form action="{{ route('user.payment_main_balance') }}" id="infix_payment_form1" method="POST" name="payment_main_balance" >
                                                                    @csrf 
                                                                    <div class="modal-body">
                                                                        <div class="row">
                                                                            <div class="col-xl-6 col-md-6">
                                                                                <label for="name" class="mb-2">Ai in contul tau minted:</label>
                                                                                <input type="text" class="bank_deposit_input"  placeholder="Bank Name" name="bank_name" value="{{ @Auth::user()->balance->amount}}" readonly>
                                                                            </div>
                                                                            <div class="col-xl-6 col-md-6">
                                                                                <label for="name" class="mb-2">Pretul pe care trebuie sa il platesti: </label>
                                                                                <input type="text"  name="amount" class="bank_deposit_input"  placeholder="Name of account owner" value="{{ $carttotalstrip }}" readonly>
                                                                            </div> 
                                                                        </div>
                                                                        @if ( @Auth::user()->balance->amount > $carttotalstrip) 
                                                                        <div class="row">
                                                                            <div class="col-lg-12">                                                                                
                                                                                {{-- <div class="checkit">
                                                                                    <span class="chebox-style-custom">
                                                                                        <input class="styled-checkbox" id="styled-checkbox-28" onchange="showPayOption('con_balance_pay')" type="checkbox" name="item_comment" value="">
                                                                                        <label for="styled-checkbox-28"> @lang('lang.use') {{@$infix_general_settings->currency_symbol}} {{ $carttotalstrip }} @lang('lang.from_my_infix_balance_for_this_purchase') </label>
                                                                                    </span>
                                                                                    <span class="item_comment invalid-feedback" id="item_comment"></span>
                                                                                </div> --}}
                                                                            </div>
                                                                        </div>
                                                                        @endif
 
                                                                    </div>
                                                                    <div class="modal-footer d-flex justify-content-between">
                                                                        <button type="button" class="boxed-btn-white " data-dismiss="modal">@lang('lang.cancel')</button>
                                                                        
                                                                        @if ( @Auth::user()->balance->amount > $carttotalstrip) 
                                                                            <button  class="button boxed-btn btnspecial"   type="submit">
                                                                                @lang('lang.pay') 
                                                                            </button>
                                                                        @else
                                                                            <a class="button boxed-btn btnspecial" href="{{ route('user.deposit',@Auth::user()->username)}}">{{__('Fund Deposit')}}</a>
                                                                        @endif
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                     
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            {{-- stripe --}}
                                
                            </div>
                        </div>
                        <div class="col-xl-3">
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
                                                    <span>{{ @$item->price  }} {{@$infix_general_settings->currency_symbol}}</span>
                                                             
                                                </li>
                                            @endforeach
                                        @endif
                                    </ul>
                                </div>
                                <div class="products_list_bottom">
                                    <span>@lang('lang.total')</span>
                                    <span class="prise_tag">
                                             {{ $carttotalstrip }} {{@$infix_general_settings->currency_symbol}}
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
    <!-- checkout_area end -->
</div>
@endsection
@push('js')
    <script src="{{ asset('public/frontend/js/') }}/checkout.js"></script>
    <script src="{{ asset('public/frontend/js/') }}/payment_section.js"></script>
 
@endpush
