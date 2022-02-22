@extends('frontend.master')
@push('css')

<script src="{{ asset('/')}}public/frontend/js/jquery-3.3.1.js"></script>
@endpush
@section('content')

 <!-- start page title area -->
 <div class="rn-breadcrumb-inner ptb--30">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <h5 class="title text-center text-md-start">@lang('lang.fund_deposit')</h5>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-list">
                        <li class="item"><a href="index.html">Acasa</a></li>
                        <li class="separator"><i class="feather-chevron-right"></i></li>
                        <li class="item current">@lang('lang.fund_deposit')</li>
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
                    <h3 class="title text-center">
                    Informatii Facturare
                    </h3>
                    <p class="text-center">@lang('lang.welcome_message_for_vendor').</p>
                </div>
            </div>
            <div class="row g-5 mt--40">
                <div class="form-wrapper-one">
                    <div class="fund_add_form_div" >
                        <span id="alert-danger" class="alert alert-danger d-none"></span>
                    </div>
                    <form action="{{ route('user.depositStore')}}" class="single_account-form checkout-form row" method="POST" {{-- id="subscribe-form" --}} {{-- onsubmit="return submitpayment()" --}}>
                                    @csrf
                                    
                                    <div class="row">
                                        <div class="col-xl-6 col-md-6">
                                            <label for="first_name"> @lang('lang.first_name') <span>*</span></label>
                                            <input type="text" class="form-control @error('first_name') is-invalid @enderror" placeholder="First name" name="first_name" value="{{isset($user)? $user->profile->first_name:old('first_name')}}">
                                            @error('first_name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                                @enderror
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="last_name">@lang('lang.last_name') *</label>
                                            <input type="text" class="form-control @error('last_name') is-invalid @enderror" placeholder="Last name" name="last_name" value="{{isset($user)? $user->profile->last_name:old('last_name')}}">
                                            @error('last_name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                                @enderror
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="phone">@lang('lang.phone') *</label>
                                            <input type="text" class="form-control @error('mobile') is-invalid @enderror" placeholder="Phone number" name="mobile" value="{{isset($user)? $user->profile->mobile:old('mobile')}}">
                                            @error('mobile')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                                @enderror
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="email">@lang('lang.email') *</label>
                                            <input type="email" value="{{  @$user->email? @$user->email:'Email Address'}}" readonly>
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                        <label for="state">Adresa </label>
                                            <input type="text" placeholder="Addresa*" class="form-control @error('address') is-invalid @enderror" name="address" value="{{isset($user)? $user->profile->address:old('address')}}">
                                            @error('address')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="country">@lang('lang.country') </label>
                                            <select class="wide customselect country @error('country') is-invalid @enderror"
                                                name="country_id" style="display: none">
                                                <option data-display="Country*">
                                                    Select</option>
                                                @foreach ($data['country'] as $item)                                                                                        
                                                <option value="{{ @$item->id }}" {{@$user->profile->country_id == $item->id ?'selected':'' }}>{{ @$item->name }}</option>
                                                @endforeach
                                            </select>
                                            @error('country_id'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                                @enderror
                                        </div>
                                        <div class="col-xl-6 col-md-6">
                                            <label for="state">@lang('lang.state') </label>
                                            <input type="text" class="form-control @error('state_id') is-invalid @enderror" placeholder="@lang('lang.state')/@lang('lang.region')" name="state_id" value="{{isset($data['user'])? $data['user']->profile->state_id:old('state_id')}}">
                                   
                                            @error('state_id')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ @$message }}</strong>
                                                </span>
                                                @enderror
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
                                          <!-- single -->
                                          <div class="rn-pd-sm-property-wrapper">
                                        
                                                <div class="catagory-wrapper">
                                                    <!-- single property -->
                                                    <div class="pd-property-inner" style="margin: 0 auto; margin-bottom: 10px;">
                                                        <span class="color-body type">Fondurile tale</span>
                                                        <span class="color-white value">@if (Auth::user()->role_id == 4)
                                                                    {{ @Auth::user()->balance->amount}} toons
                                                                    @endif
                                                                    @if (Auth::user()->role_id == 5)
                                                                        {{ @Auth::user()->balance->amount}} toons
                                                                    @endif</span>
                                                    </div>
                                                </div>
                                            </div>
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
                                                <div class="check-out-btn col-xl-8 col-md-8 offset-md-2" style="margin-top: 20px;">
                                                    <button type="submit" id="deposit_" class="btn btn-primary btn-large w-100">Adauga Fonduri</button>
                                                </div>
                                            @endif
                                    </div>
                                    {{-- <input type="hidden" name="card_number" id="card_number" value="{{isset($user)? $user->payment_method->card_number:old('card_number')}}" /> --}}
                                   {{--  <input type="hidden" name="amount" id="amount" value="" />
                                    <input type="hidden" name="stripeToken" id="stripeToken" value="" /> --}} 
                                    @if ($user->profile->first_name == "" || $user->profile->last_name == "" || $user->profile->company_name == "" || $user->profile->mobile == "" || $user->profile->address == "" || $user->profile->country_id == "" || $user->profile->state_id == "" || $user->profile->city_id == "" || $user->profile->zipcode == "") 
                                        <div class="check-out-btn" style="margin-top: 20px;">
                                            <button type="submit" id="deposit_" class="btn btn-primary btn-large w-100">Salveaza Informatia si Adauga Fonduri</button>
                                        </div>
                                    @endif
                                </form>

                </div>
       
                                 
            </div>
        </div>
    </div>
    <!-- Upload variants style End -->

   
 @endsection
 @push('js')
 <script src="{{ asset('public/frontend/js/') }}/fund_add.js"></script>
 <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
 <script src="{{ asset('/')}}public/frontend/js/v_4.4_jquery.form.js"></script>
 <script src="{{ asset('public/frontend/js/') }}/fund_add2.js"></script>
 <!-- <script>
        @if($errors->any())
            @foreach($errors->all() as $error)
                  toastr.error('{{ $error }}','Error',{
                      closeButton:true,
                      progressBar:true,
                   });
            @endforeach
        @endif
    </script> -->
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