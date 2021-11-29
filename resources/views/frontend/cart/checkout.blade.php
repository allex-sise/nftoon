@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/item.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/checkout.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />

@endpush
@php
   $infix_general_settings = app('infix_general_settings');
@endphp
<style>
.checkout_area .check-out-btn button {
    border: 0;
    cursor: pointer;
    background-image: none;
    background-color: #000;
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

select{
    width: 1px!important;
}
</style>
@section('content')
<!-- banner-area start -->
     <!-- section begin -->
     <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>Checkout</h1>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->    
<!-- checkout_area start -->
<div class="checkout_area section-padding">
    <div class="container">
        <div class="row">
            <div class="col-xl-10 offset-xl-1">
                <div class="row">
                    <div class="col-xl-8 col-lg-8">
                     <form action="{{route('customer.store')}}" class="checkout-form" id="checkout_store" method="POST">
                        @csrf
                            <h4>@lang('lang.billing_details')</h4>
                            <div class="row">
                                <div class="col-xl-6 col-md-6">
                                    <label for="name">@lang('lang.first_name') <span>*</span></label>
                                    <input name="first_name" type="text" placeholder="Enter First name" value="{{isset($data['user'])? $data['user']->profile->first_name:old('first_name')}}">
                                    @if ($errors->has('first_name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('first_name') }}</strong>
                                    </span>
                                @endif
                                </div>
                                <div class="col-xl-6 col-md-6">
                                    <label for="name">@lang('lang.last_name')<span>*</span></label>
                                    <input name="last_name" type="text" placeholder="Enter Last name" value="{{isset($data['user'])? $data['user']->profile->last_name:old('last_name')}}">
                                    @if ($errors->has('last_name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('last_name') }}</strong>
                                    </span>
                                @endif
                                </div>
                                <div class="col-xl-12 col-md-12">
                                    <label for="name">@lang('lang.company_name')</label>
                                    <input name="company_name" type="text" placeholder="Enter company name" value="{{isset($data['user'])? $data['user']->profile->company_name:old('company_name')}}">
                                </div>
                                <div class="col-xl-12 col-md-12">
                                    <label for="name">@lang('lang.address')<span>*</span></label>
                                    <input name="address" type="text" placeholder="Enter address" value="{{isset($data['user'])? $data['user']->profile->address:old('address')}}"> 
                                    @if ($errors->has('address'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('address') }}</strong>
                                    </span>
                                @endif
                                </div>
                                <div class="col-xl-6 col-md-6">
                                    <label for="name">@lang('lang.country_name')<span>*</span></label>
                                    <select class="select2 bb" name="country_id">
                                        <option></option>
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
                                <div class="col-xl-6 col-md-6">
                                    <label for="name">@lang('lang.state')/@lang('lang.region') <span></span></label>
                                  
                                    <input type="text" placeholder="@lang('lang.state')/@lang('lang.region')" name="state_id" value="{{isset($data['user'])? $data['user']->profile->state_id:old('state_id')}}">
                                         
                                    @if ($errors->has('state_id'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('state_id') }}</strong>
                                        </span>
                                    @endif
                                </div>

                                <div class="col-xl-6 col-md-6 city">
                                       
                                    <label for="name">@lang('lang.city')</label>
                                            <input type="text" placeholder="@lang('lang.city')" name="city_id" value="{{isset($data['user'])? $data['user']->profile->city_id:old('city_id')}}">
                                         
                                    @if ($errors->has('city_id'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('city_id') }}</strong>
                                        </span>
                                    @endif
                                </div>
                              
                                <div class="col-xl-6 col-md-6">
                                    <label for="name">@lang('lang.zip_postal_code')<span></span></label>
                                    <input type="text" placeholder="@lang('lang.zip_postal_code')" name="zipcode" value="{{isset($data['user'])? $data['user']->profile->zipcode:old('zipcode')}}">
                                        @if ($errors->has('zipcode'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('zipcode') }}</strong>
                                            </span>
                                        @endif
                                </div>
                            </div>
                            <div class="check-out-btn">
                                <button type="submit" class="boxed-btn">@lang('lang.procced_to_payment')</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-xl-4 col-lg-4">
                        <div class="your_order">
                            <div class="order_header">
                                <h4>Ordinul Tau</h4>
                                
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
                                    {{Cart::subtotal() }} {{@$infix_general_settings->currency_symbol}}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('js')

<script src="{{ asset('public/frontend/js/') }}/checkout.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<script>
$(document).ready(function() {
    $('.select2').select2({
        placeholder: "Alege Tara",
        allowClear: true
    });
});
    </script>
@endpush