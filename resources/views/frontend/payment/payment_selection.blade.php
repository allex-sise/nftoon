@extends('frontend.master')
@push('css')

<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/dashboard.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/payment_selection.css">
<style>

#circle {
  -webkit-transform-origin: center;
          transform-origin: center;
  -webkit-animation: rotate 3s infinite linear;
          animation: rotate 3s infinite linear;
  transform-box: fill-box;
}

@-webkit-keyframes rotate {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}

@keyframes rotate {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}

.form {
  width: auto;
  display: -webkit-box;
  display: -ms-flexbox;
  border-radius:10px;
  display: flex;
  background: #fff;
  margin: 0 auto;
  height: 280px;
}

.form__left {
  -ms-flex-preferred-size: 40%;
      flex-basis: 40%;
  text-align: center;
}

.form__right {
  -webkit-box-flex: 1;
      -ms-flex: 1;
          flex: 1;
  padding: 10px;
}

.form__right span {
  display: block;
}

.form__right__steps {
  color: #064b8d75;
  margin-bottom: 12px;
}


.form__right__info {
  font-size: 17px;
  margin-bottom: 10px;
}

.form__right__check {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
}

.form__right__check input[type="radio"] {
  display: none;
}

.form__right__check--creditCard {
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  -webkit-box-flex: 1;
      -ms-flex: 1;
          flex: 1;
  background: #fcfdfc;
  margin-right: 30px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: space-evenly;
      -ms-flex-pack: space-evenly;
          justify-content: space-evenly;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  border-radius: 4px;
  border: 1px solid #dfe5ec;
  position: relative;
}

.form__right__check--creditCard::after {
  content: "";
  border: 3px solid #dfe5ec;
  height: 20px;
  width: 20px;
  display: block;
  border-radius: 50%;
}

.form__right__check--creditCard__icon {
  width: 46px;
}

.form__right__check--creditCard, .form__right__check--payPal {
  padding: 10px 0 10px 0;
  cursor: pointer;
}

.form__right__check--payPal {
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  -webkit-box-flex: 1;
      -ms-flex: 1;
          flex: 1;
  background: #fcfdfc;
  border: 1px solid #dfe5ec;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: space-evenly;
      -ms-flex-pack: space-evenly;
          justify-content: space-evenly;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  border-radius: 4px;
  position: relative;
}

.form__right__check--payPal::after {
  content: "";
  border: 3px solid #dfe5ec;
  height: 20px;
  width: 20px;
  display: block;
  border-radius: 50%;
}

.form__right__check--payPal__icon {
  width: 136px;
}

.form__right__form-control {
  margin-top: 10px;
}

.form__right__form-control--name {
  display: block;
  margin-bottom: 5px;
}

.form__right__form-control--cardNumber {
  height: 45px;
  width: 100%;
  background: #fffffc;
  border: none;
  font-size: 18px;
  padding: 0 10px 0 10px;
  border: 1px solid #dfe5ec;
  border-radius: 2px;
}

.form__right__form-control--cardNumber:focus {
  outline: none;
  border-color: blue;
}

.form__right__form-control--button {
  width: 60%;
  margin-top: 10px;
  padding: 15px 10px;
  border: none;
  background: #064b8d;
  color: #fff;
  border-radius: 2px;
  outline: none;
  cursor: pointer;
}

.form__right__form-control--button:hover {
  background: #0c3a65;
}

#option1:checked ~ .form__right__check--creditCard {
  border-color: blue;
}

#option1:checked ~ .form__right__check--creditCard::after {
  border-color: green;
  outline: 2px solid green;
  outline-offset: -10px;
  outline-style: dotted;
}

#option2:checked ~ .form__right__check--payPal {
  border-color: blue;
}

#option2:checked ~ .form__right__check--payPal::after {
  border-color: green;
  outline: 2px solid green;
  outline-offset: -10px;
  outline-style: dotted;
}
.colmd6spec{
  width: 46%!important;
  margin: 10px;
}
.imgmargin0auto{
  display: block;
  margin: 0 auto;
  margin-top: 82px;
}
.input-group-text {
    display: flex;
    align-items: center;
    padding: 0.5rem 0.75rem!important;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    text-align: center;
    white-space: nowrap;
    background-color: #e9ecef!important;
    border: 0px solid #ced4da!important;
    border-radius: 0px!important;
}
</style>
<script src='https://js.stripe.com/v2/' type='text/javascript'></script>
<script src="{{ asset('/')}}public/frontend/js/jquery-3.3.1.js"></script>
@endpush
@section('content')
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

    <!-- payment area start -->
    <div class="privaci_polecy_area section-padding checkout_area ">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-12">
                    <div class="deposite_payment_wrapper">
                        <!-- single_deposite_item  -->
                        <div class="col-md-6 float-left colmd6spec">
                        @if( in_array('Stripe',$data))
                        <div class="form">
                            <div class="form__left"> 
                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Stripe')->logo)}}" alt="">
                              </div>
                                <div class="form__right">
                                <h2 class="form__right__title" style="color: #00A4FF; margin-bottom: 0px!important; margin-top: 10px;">Ultimul pas !</h2>
                                <p class="form__right__info">Plateste in siguranta prin Stripe.</p>
                                <div class="form__right__check" style="width: 240px;">
                                    <input type="radio" name="paymentMethod" id="option1" checked/>
                                    <label for="option1" class="form__right__check--creditCard">
                                    <span class="form__right__check--creditCard__text">Card Bancar</span>
                                    </label>
                                </div>
                                <div class="form__right__form-control">
                                <label for="cardCode" class="form__right__form-control--name"
                                    >Prin continuarea platii esti de acord cu Termenii si Conditiile</label>
                                    <form action="{{ route('user.stripe_deposit')}}" method="POST">
                                        @csrf
                                        <script
                                            src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                            data-key="{{ env('STRIPE_KEY') }}"
                                            data-name="Stripe Payment"
                                            {{-- data-image={{ asset(GeneralSetting()->logo) }} --}}
                                            data-locale="auto"
                                            data-currency="usd">
                                        </script>
                                        <input hidden value="{{ Session::get('deposit_amount') }}"  readonly="readonly" type="text" id="amount" name="amount">
                                        <button class="btn-main" type="submit" style="height: 40px;">Plateste Acum</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        @endif
                      </div>
                      <div class="col-md-6 float-left colmd6spec">
                   
                        <div class="form">
                            <div class="form__left">
                            <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Blockchain')->logo)}}" alt="">
                            </div>
                                <div class="form__right">
                                <h2 class="form__right__title" style="color: #00A4FF; margin-bottom: 0px!important; margin-top: 10px;">Ultimul pas !</h2>
                                <p class="form__right__info">Plateste in siguranta prin Ethereum.</p>
                                <div class="form__right__check" style="width: 240px;">
                                    <input type="radio" name="paymentMethod2" id="option2" checked/>
                                    <label for="option2" class="form__right__check--payPal">
                                    <span class="form__right__check--creditCard__text">Metamask Wallet</span>
                                    </label>
                                </div>
                                <div class="form__right__form-control">
                                <label for="cardCode" class="form__right__form-control--name" style="margin-top: 10px;">Prin continuarea platii esti de acord cu Termenii si Conditiile</label>
                                    <a href="#" data-toggle="modal" data-target="#exampleModal" class="btn-main" style="padding: 12px 40px;">Plateste Acum</a>
                                </div>
                            </div>
                        </div>
               
                      </div>


                    </div>
                    <div  class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Plata prin Ethereum </h5>
            </div>
            <form name="bank_payment" action=" {{ route('user.bank_payment')}} " class="single_account-form" method="POST" id=""  onsubmit="return validateForm()" >
                <div class="modal-body">
                    @php
                        $bank_setup=explode(',',$payment_methods->where('id',4)->first()->env_terms);
                    @endphp
                    <!-- <fieldset>
                        <legend>Bank Account Info</legend>
                            <table class="table">
                                @foreach ($bank_setup as $setup)
                                
                                    @php
                                        $b_setup=explode(':',$setup);
                                    @endphp
                                    <tr>
                                        <td><strong>{{str_replace('_',' ',@$b_setup[0])}}</strong> </td>
                                        <td>{{@$b_setup[1]}}</td>
                                    </tr>
                                @endforeach
                            </table>
                    </fieldset> -->
                    @csrf
                    {{-- {{ isset($bank_validator) ? 'show active' :''}} --}}
                    <div class="row">
                
                        <div class="col-xl-12 col-md-12">
                            <input type="text" class="bank_deposit_input" name="bank_name" value="blockchain" hidden>
                            <label for="name" class="mb-2">@lang('lang.name_of_account_owner') <span>*</span></label>
                            <input type="text"  name="owner_name" class="bank_deposit_input" value="{{ @Auth::user()->full_name }}">
                            <span class="invalid-feedback" role="alert" id="owner_name"></span>
                        </div> 
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-md-12">
                            <label for="name" class="mb-2">@lang('lang.amount') cu care va fi alimentat contul Minted in Credite <span>*</span></label>
                            <div class="input-group mb-3">
                                <input type="number" style="width: 140px!important" class="bank_deposit_input form-control" min="0" step="any" name="amount" aria-label="Recipient's username" aria-describedby="basic-addon2" value="{{ Session::get('deposit_amount') }}" readonly>
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="basic-addon2">LEI</span>
                                    </div>
                            </div>
                            <span class="invalid-feedback" role="alert" id="amount_validation"></span>
                        </div>
                        <div class="col-xl-12 col-md-12">
                            <label for="name" class="mb-2">@lang('lang.amount') care va fi debitata din wallet-ul tau <span>*</span></label>
                            <div class="input-group mb-3">
                                <input type="number" style="width: 140px!important" class="bank_deposit_input form-control" min="0" step="any" name="amountEth" aria-label="Recipient's username" aria-describedby="basic-addon3" value="{{ Session::get('deposit_amountETH') }}" readonly>
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="basic-addon2">ETH</span>
                                    </div>
                            </div>
                            <span class="invalid-feedback" role="alert" id="amount_validation"></span>
                        </div>
                        <div class="col-xl-12 col-md-12">
                            <label for="name" class="mb-2">@lang('lang.account_no') <span>*</span></label>
                            <div id="app"> <deposit 
                            withdraw-amount="{{ Session::get('deposit_amount') }}" 
                            withdraw-amount-eth="{{ Session::get('deposit_amountETH') }}"
                            owner-name="{{ @Auth::user()->full_name }}"
                            user-id="{{ @Auth::user()->id }}"
                            route-redirect="{{ route('user.deposit',@Auth::user()->username)}}"
                            route-blockchain-deposit="{{ route('user.bank_payment')}}" 
                            route-blockchain-store-payment="{{ route('user.blockchainStoreFund')}}" 
                            /> </div> 
                            <!-- <input type="text" class="bank_deposit_input"  placeholder="Account number" name="account_number" value="{{@old('account_number')}}" >                                              -->
                            <!-- <span class="invalid-feedback" role="alert" id="account_number"></span>  -->
                        </div>
                       
                    </div>
                        
                </div>
                <!-- <div class="modal-footer d-flex justify-content-between">
                   <button type="button" class="boxed-btn-white " data-dismiss="modal">@lang('lang.cancel')</button> 
                    <button class="btn-main" type="submit">@lang('lang.make') @lang('lang.payment')</button>
                </div> -->
            </form>
        </div>
    </div>
</div>
                     
                </div>
            </div>
        </div>
    </div>
    
    <!-- payment area end -->
   
 @endsection
 @push('js')
 <script src="{{ asset('public/frontend/js/') }}/fund_add.js"></script>
 <script src="https://checkout.stripe.com/checkout.js"></script>
 <script src="{{ asset('/')}}public/frontend/js/v_4.4_jquery.form.js"></script>
<script src="{{ asset('public/frontend/js/') }}/payment_section.js"></script>

 @endpush