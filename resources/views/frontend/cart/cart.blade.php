
@extends('frontend.master')
@push('css')

<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/item.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/cart.css">
@endpush
@php
   $infix_general_settings = app('infix_general_settings');
@endphp
<style>
.btnspecialz{
    background-image: none!important; background-color: #000!important; border-radius: 50px;
}
.banner-area4 .banner-area-inner .banner-info h2 {
    font-size: 36px;
    font-family: "Quicksand", sans-serif;
    font-weight: 700;
    color: #fff;
    line-height: 48px;
    margin-bottom: 0;
    text-align: left;
    margin-top: 340px;
}
</style>
<input type="hidden" id="currency_symbol" value="{{GeneralSetting()->currency_symbol}}">
@section('content')
      <!-- banner-area start -->
        <div class="banner-area4">
            <div class="banner-area-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-10 offset-xl-1 col-12">
                            <div class="banner-info">
                                <h2>Comanda Ta</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- banner-area end -->
        <!-- main_cart-area-start -->
        <div class="main_cart-area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1 col-12">
                        <div class="row">
                            <div class="col-xl-8 col-12 col-lg-8">
                                <div class="cart_description" >
                                    <div class="cart_description_heading">
                                        @if (@count(Cart::content()) > 0 )

                                        @php
                                            $total_tax=0.00;
                                        @endphp
                                        @foreach (Cart::content() as $key => $item)
                                        @php
                                           $total_tax+= @$item->options['tax'];
                                        @endphp
                                        <div class="single_cart_description gray-bg">
                                            <div class="single_cart_left d-flex justify-content-between">
                                                <div class="card_inner d-flex align-items-center">
                                                    <div class="image">
                                                        <img src="{{ asset(@$item->options['icon']) }}" alt="">
                                                    </div>
                                                    <div class="single_cart_heading">
                                                    <h3>{{ $item->name }}</h3>
                                                    <p>
                                                        <span>@lang('lang.item_by') <a href="{{ route('user.profile',$item->options['username'])}}">{{ @$item->options['username'] }}</a></span> 
                                                        
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="card_des_prise d-flex align-items-center justify-content-center">
                                                 <span class="totalP{{$item->id}}">{{ number_format(@$item->price,2) }} {{@$infix_general_settings->currency_symbol}}</span>
                                                    <a  onclick="deleItem(`{{$item->id}}`)"><i class="ti-close"></i></a>
                                                    <a id="delete-form-{{ $item->id }}" href="{{ route('CartDelete',@$item->rowId)}}" class="dm_display_none"></a>
                                                </div>
                                                <input type="number" hidden value="{{ @$item->price  }}" class="total{{@$item->id}}">
                                                <input type="text" hidden value="{{ @$item->rowId  }}" class="rowId{{@$item->id}}">
                                                <input type="number" hidden value="{{ @$item->options['Extd_percent'] }}" class="Extd_percent">
                                                <input type="number" hidden value="{{ @$item->options['support_charge'] }}" class="support_charge{{@$item->id}}">
                                            </div>
                                            <div class="check-here d-none">
                                                <label>
                                                    <input id="support{{@$item->id}}" class="support" type="checkbox" {{ @$item->options['support_time'] == 1? '':'checked'}}  onclick="ChangeItem(`{{@$item->id}}`)">
                                                    <span class="checkmark">@lang('lang.extent_support_time') +@ {{@$item->options['support_charge']? number_format(@$item->options['support_charge'] ,2) : @$item->price*$item->options['Extd_percent']}} <span>@lang('lang.save') $23.50</span></span>
                                                </label> 
                                            </div>
                                        </div>
                                        @endforeach
                                        
                                        @else
                                          <h4>@lang('lang.your_shopping_cart_is_empty') {{ @count($data['cart_item']) }}</h4>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            @if (@count(Cart::content()) > 0 )
                           <input type="number" hidden id="subtotal" value="{{Cart::subtotal() }}">
                            <div class="col-xl-4 col-lg-4">
                                    
                                <div class="total_cart_area">
                                     
                                        
                                    <span>Totalul este </span>
                                    <h2 id="copon_applied" class="text-success"></h2>
                                        <h1 class="totalPrice">{{Cart::subtotal() }} {{@$infix_general_settings->currency_symbol}}</h1>
                                        @if ($total_tax>0)
                                            <h3>Tax= {{@$infix_general_settings->currency_symbol}}{{$total_tax}}</h3>
                                        @endif
                                        
                                                </form>
                                                @php 
                                                    @$is_address = Auth::user()->profile;
                                                    @endphp 
                                                    @if( !empty($is_address->first_name) && 
                                                    !empty($is_address->country_id) && 
                                                    !empty($is_address->state_id) && 
                                                    !empty($is_address->city_id) && 
                                                    !empty($is_address->zipcode) &&
                                                    !empty($is_address->address) )
                                                    <a href="{{ route('customer.payment')}}" class="boxed-btn btnspecialz">@lang('lang.secure_checkout')</a>
                                                    @else
                                                        <a href="{{ route('customer.cheackout')}}" class="boxed-btn btnspecialz">@lang('lang.secure_checkout')</a>
                                                    @endif
                                    @if ($total_tax>0)
                                        <p>@lang('lang.price_displayed_excludes_sales_tax')</p>
                                    @endif
                                    {{-- <div class="pl dn 10 mt-5" id="coupon_notice">
                                        <ul>
                                            <li>The entire discount amount is deducted from the item price only (see <b>discount item price</b> column for details)</li>
                                       </ul>
                                    </div> --}}
                                </div>
                            </div>
                         @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main_cart-area-end -->
    
@endsection

@push('js')
<script src="{{ asset('public/frontend/js/') }}/delete.js"></script>
<script src="{{ asset('public/frontend/js/') }}/item_preview.js"></script>
@endpush