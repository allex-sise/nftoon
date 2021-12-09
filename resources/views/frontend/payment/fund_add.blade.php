@extends('frontend.master')
@push('css')

<script src="{{ asset('/')}}public/frontend/js/jquery-3.3.1.js"></script>
@endpush
@section('content')
<style>
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
.checkout_area .check-out-btn{
    text-align: center!important;
}
</style>
 <!-- content begin -->
 <div class="no-bottom no-top" id="content">
            <div id="top"></div>
            
            <!-- section begin -->
            <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>@lang('lang.fund_deposit')</h1>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->       

    <!-- privaci_polecy_area start -->
    <div class="privaci_polecy_area section-padding checkout_area ">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 offset-xl-2 col-12">
                        <div class="single_account_wrap">
                           
                                <h4>@lang('lang.Billing') @lang('lang.Information')</h4>
                                <p>@lang('lang.welcome_message_for_vendor').</p>
                          
                                <div class="fund_add_form_div" >
                                        <span id="alert-danger" class="alert alert-danger d-none"></span>
                                    </div>
                                  <form action="{{ route('user.depositStore')}}" class="single_account-form checkout-form" method="POST" {{-- id="subscribe-form" --}} {{-- onsubmit="return submitpayment()" --}}>
                                    @csrf
                                    
                                    <div class="row">
                                        <div class="col-xl-6 col-md-6">
                                            <label for="first_name"> @lang('lang.first_name') <span>*</span></label>
                                            <input type="text" placeholder="First name" name="first_name" value="{{isset($user)? $user->profile->first_name:old('first_name')}}">
                                            @if ($errors->has('first_name'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('first_name') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="last_name">@lang('lang.last_name') *</label>
                                            <input type="text" placeholder="Last name" name="last_name" value="{{isset($user)? $user->profile->last_name:old('last_name')}}">
                                            @if ($errors->has('last_name'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('last_name') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <label for="compnay">@lang('lang.company') *</label>
                                            <input type="text" placeholder="Company name" name="company_name" value="{{isset($user)? $user->profile->company_name:old('company_name')}}">
                                            @if ($errors->has('company_name'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('company_name') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="phone">@lang('lang.phone') *</label>
                                            <input type="text" placeholder="Phone number" name="mobile" value="{{isset($user)? $user->profile->mobile:old('mobile')}}">
                                            @if ($errors->has('mobile'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('mobile') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="email">@lang('lang.email') *</label>
                                            <input type="email" value="{{  @$user->email? @$user->email:'Email Address'}}" readonly>
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <input type="text" placeholder="Address*" name="address" value="{{isset($user)? $user->profile->address:old('address')}}">
                                            @if ($errors->has('address'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('address') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="country">@lang('lang.country') </label>
                                            <select class="wide customselect country"
                                                name="country_id" style="display: none">
                                                <option data-display="Country*">
                                                    Select</option>
                                                @foreach ($data['country'] as $item)                                                                                        
                                                <option value="{{ @$item->id }}" {{@$user->profile->country_id == $item->id ?'selected':'' }}>{{ @$item->name }}</option>
                                                @endforeach
                                            </select>
                                            @if ($errors->has('country_id'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('country_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="state">@lang('lang.state') </label>
                                            <input type="text" placeholder="@lang('lang.state')/@lang('lang.region')" name="state_id" value="{{isset($data['user'])? $data['user']->profile->state_id:old('state_id')}}">
                                   
                                            @if ($errors->has('state_id'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('state_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="city">@lang('lang.city') </label>
                                            <input type="text" placeholder="@lang('lang.city')" name="city_id" value="{{isset($data['user'])? $data['user']->profile->city_id:old('city_id')}}">
                                         
                                            @if ($errors->has('city_id'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('city_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    
                                        <div class="col-xl-6 col-md-6">
                                            <label for="zip">@lang('lang.postcode_ZIP') </label>
                                            <input type="text" placeholder="@lang('lang.zip_postal_code')" name="zipcode" value="{{isset($data['user'])? $data['user']->profile->zipcode:old('zipcode')}}">
                                     
                                            @if ($errors->has('zipcode'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('zipcode') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                    </div>
                                   
                                    <div class="row mb-40">
                                    <p class="text-center">Fondurile tale: @if (Auth::user()->role_id == 4)
                                                                    {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
                                                                    @endif
                                                                    @if (Auth::user()->role_id == 5)
                                                                        {{ @Auth::user()->balance->amount}} {{@$infix_general_settings->currency_symbol}}
                                                                    @endif
                                                                </p>
                                            <div class="col-xl-8 col-md-8 offset-md-2">
                                            <input type="numeric" min="0" id="ETH2RON"  name="withdraw_amount_eth" value="" placeholder="Introduceti suma dorita pentru retragere" hidden>
                                                <label for="Deposit">@lang('lang.deposit_amount') *</label>
                                                <input type="text"  onkeyup="regular(this.value)" id="depositRON"  name="amount" value="{{old('amount')}}">
                                                @if ($errors->has('amount'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('amount') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                            <div class="col-xl-8 col-md-8 offset-md-2">
                                                <input hidden readonly type="text"  onkeyup="regular(this.value)" id="depositETH"  name="amountETH" value="{{old('amountETH')}}">
                                                @if ($errors->has('amount'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('amount') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                            @if ($user->profile->first_name == "" || $user->profile->last_name == "" || $user->profile->company_name == "" || $user->profile->mobile == "" || $user->profile->address == "" || $user->profile->country_id == "" || $user->profile->state_id == "" || $user->profile->city_id == "" || $user->profile->zipcode == "") 
                                                
                                            @else
                                                <div class="check-out-btn col-xl-8 col-md-8 offset-md-2">
                                                    <button type="submit" id="deposit_" class="btn-main mt-1">Adauga Fonduri</button>
                                                </div>
                                            @endif
                                    </div>
                                    {{-- <input type="hidden" name="card_number" id="card_number" value="{{isset($user)? $user->payment_method->card_number:old('card_number')}}" /> --}}
                                   {{--  <input type="hidden" name="amount" id="amount" value="" />
                                    <input type="hidden" name="stripeToken" id="stripeToken" value="" /> --}} 
                                    @if ($user->profile->first_name == "" || $user->profile->last_name == "" || $user->profile->company_name == "" || $user->profile->mobile == "" || $user->profile->address == "" || $user->profile->country_id == "" || $user->profile->state_id == "" || $user->profile->city_id == "" || $user->profile->zipcode == "") 
                                        <div class="check-out-btn">
                                            <button type="submit" id="deposit_" class="btn-main">Salveaza Informatia si Adauga Fonduri</button>
                                        </div>
                                    @endif
                                </form>
                        </div>
                        

                        </div>
            
                      
            </div>
        </div>
    </div>
    <!-- privaci_polecy_area end -->
   
 @endsection
 @push('js')
 <script src="{{ asset('public/frontend/js/') }}/fund_add.js"></script>
 <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
 <script src="{{ asset('/')}}public/frontend/js/v_4.4_jquery.form.js"></script>
 <script src="{{ asset('public/frontend/js/') }}/fund_add2.js"></script>
 <script>
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            dataType: 'json',
            url: `https://min-api.cryptocompare.com/data/price?fsym=RON&tsyms=ETH`,
            success: function (data) {
                $("#ETH2RON").attr("value", data.ETH);
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
});
function regular(item) {
    if(this.value<0){this.value= this.value * -1}
    const inputRON = $("#depositRON").val();
    const ETH2RON = $("#ETH2RON").val();
    var totalPrice = inputRON*ETH2RON;
    var myNumberWithTwoDecimalPlaces=parseFloat(totalPrice).toFixed(8);

    $("#depositETH").val(myNumberWithTwoDecimalPlaces);
    $("#depositETH").attr("placeholder", "$" + myNumberWithTwoDecimalPlaces);
    $("#depositETH").attr("value", myNumberWithTwoDecimalPlaces);
}
</script> 

 @endpush