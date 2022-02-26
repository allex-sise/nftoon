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
.btstripe{
  float: right;
  width:50%;
  margin-bottom: 10px;
}
.btnnulare{
  background: #e2e2e2!important;
  color: #000!important;
}
.ft2modal{
  display: block!important;
}
@media only screen and (max-width: 767px) {
  .form{
  display: block!important;
  height: auto!important;
  background: transparent!important;
  } 
  .form__left {
    flex-basis: unset!important;
    text-align: center!important;
}
.form__right {
    padding: 20px!important;
    text-align: center;
    background: #FFF;
    -moz-border-radius-bottomright: 5px;
    -webkit-border-bottom-right-radius: 5px;
    border-bottom-right-radius: 5px;
    -moz-border-radius-bottomleft: 5px;
    -webkit-border-bottom-left-radius: 5px;
    border-bottom-left-radius: 5px;
}
.colmd6spec {
    width: 100%!important;
    margin: 10px!important;
}
.form__left{
  background: #FFF;
  -moz-border-radius-topleft: 5px;
  -webkit-border-top-left-radius: 5px;
  border-top-left-radius: 5px;
  -moz-border-radius-topright: 5px;
  -webkit-border-top-right-radius: 5px;
  border-top-right-radius: 5px;
}
.form__right__check--creditCard{
  margin-right: 0px!important;
}
.form__right__check{
  display: block;
  margin: 0 auto;
}
.colmd6spec{
  margin-left: 0px!important;
}
}
</style>
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

    <!-- start connect area -->
    <div class="rn-connect-area rn-section-gapTop">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-12">
                    <div class="row g-5">
                        <!-- start single wallet -->
                        <div class="col-xxl-6 col-lg-6 col-md-6 col-12 col-sm-6 col-12 offset-3" data-sal="slide-up" data-sal-delay="150" data-sal-duration="800">
                            <div class="wallet-wrapper" style="text-align: center;">
                                <div class="inner">
                                    <div class="icon">
                                      <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Stripe')->logo)}}" alt="">
                                    </div>
                                    <div class="content">
                                        <h4 class="title"><a href="#">Card Bancar</a></h4>
                                        <p class="description">Plateste in siguranta prin Stripe.</p>
                                    </div>
                                </div>
                                <a class="over-link" data-toggle="modal" data-target="#exampleModal2"></a>
                            </div>
                        </div>
                        <!-- start single wallet -->

                        <!-- start single wallet -->
                        <!-- <div class="col-xxl-6 col-lg-6 col-md-6 col-12 col-sm-6 col-12" data-sal="slide-up" data-sal-delay="200" data-sal-duration="800">
                            <div class="wallet-wrapper">
                                <div class="inner">
                                    <div class="icon">
                                      <img class="imgmargin0auto" src="{{asset('/'.PaymentMethodSetup('Blockchain')->logo)}}" alt="">
                                    </div>
                                    <div class="content">
                                        <h4 class="title"><a href="#">Metamask Wallet</a></h4>
                                        <p class="description">Plateste in siguranta prin Ethereum.</p>
                                    </div>
                                </div>
                                <a class="over-link" href="#"></a>
                            </div>
                        </div> -->
                        <!-- start single wallet -->

                    </div>
                </div>
                <div  class="rn-popup-modal report-modal-wrapper modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
                      <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                              <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">Plata prin Stripe </h5>
                              </div>
                              <div class="container">
                                <form
                          role="form"
                          action="{{ route('user.stripe_deposit')}}"
                          method="post"
                          class="require-validation"
                          data-cc-on-file="false"
                          data-stripe-publishable-key="{{ env('STRIPE_KEY') }}"
                          id="payment-form">
                          @csrf
                          <div class='form-row row'>
                            <div class='col-xs-12 form-group required'>
                                <label class='control-label'>Numele de pe Card</label> <input
                                  class='form-control' size='4' type='text'>
                            </div>
                          </div>
                          <div class='form-row row'>
                            <div class='col-xs-12 form-group required'>
                                <label class='control-label'>Numar Card</label> <input
                                  autocomplete='off' id="txtCardNumber" class='form-control card-number' size='16'
                                  type='text'>
                            </div>
                          </div>
                          <div class='form-row row'>
                            <div class='col-xs-12 col-md-4 form-group cvc required'>
                                <label class='control-label'>CVC / CVV</label> <input autocomplete='off'
                                  class='form-control card-cvc' id="txtCVV" placeholder='ex. 311' size='3'
                                  type='text'>
                            </div>
                            <div class='col-xs-12 col-md-4 form-group expiration required'>
                                <label class='control-label'>Data Expirarii</label> <input
                                  class='form-control card-expiry-month' id="expNumber"  placeholder='MM' size='2'
                                  type='text'>
                            </div>
                            <div class='col-xs-12 col-md-4 form-group expiration required'>
                                <label class='control-label'>Anul Expirarii</label> <input
                                  class='form-control card-expiry-year' id="yearNumber"  placeholder='YYYY' size='4'
                                  type='text'>
                            </div>
                          </div>
                          <div class='form-row row'>
                            <div class='col-md-12 error form-group hide'>
                                <div class='alert-danger alert'>Te rugam sa corectezi erorile si sa continui!
                                </div>
                            </div>
                          </div>
                          <input hidden value="{{ Session::get('deposit_amount') }}"  readonly="readonly" type="text" id="amount" name="amount">
                          <div class="modal-footer ft2modal">
                          <div class="row">
                            <div class="col-xs-12">
                                <button class="btn btn-primary mr--10 w-auto btstripe" type="submit">Plateste Acum {{ Session::get('deposit_amount') }} lei</button>
                              
                                    <button type="button" class="btn btn-primary-alta w-auto" data-dismiss="modal">@lang('lang.cancel')</button> 
                                      
                              </div>
                          </div>
                          </div>
                      </form>
                      </div>
                          </div>
                      </div>
                  </div>

            </div>

        </div>
    </div>
    <!-- End connect area -->

   
 @endsection
 @push('js')
 
 <script src="{{ asset('public/frontend/js/') }}/fund_add.js"></script>
 <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
 <script src="{{ asset('/')}}public/frontend/js/v_4.4_jquery.form.js"></script>
<script src="{{ asset('public/frontend/js/') }}/payment_section.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.js"></script>
<script>
$('#txtCardNumber').mask("9999 9999 9999 9999");
$('#txtCVV').mask("999");
$('#expNumber').mask("99");
$('#yearNumber').mask("9999");
</script>
<script type="text/javascript">
      $(function() {
    var $form = $(".require-validation");
    $('form.require-validation').bind('submit', function(e) {
        var $form = $(".require-validation"),
            inputSelector = ['input[type=email]', 'input[type=password]',
                'input[type=text]', 'input[type=file]',
                'textarea'
            ].join(', '),
            $inputs = $form.find('.required').find(inputSelector),
            $errorMessage = $form.find('div.error'),
            valid = true;
        $errorMessage.addClass('hide');
        $('.has-error').removeClass('has-error');
        $inputs.each(function(i, el) {
            var $input = $(el);
            if ($input.val() === '') {
                $input.parent().addClass('has-error');
                $errorMessage.removeClass('hide');
                e.preventDefault();
            }
        });
        if (!$form.data('cc-on-file')) {
            e.preventDefault();
            Stripe.setPublishableKey($form.data('stripe-publishable-key'));
            Stripe.createToken({
                number: $('.card-number').val(),
                cvc: $('.card-cvc').val(),
                exp_month: $('.card-expiry-month').val(),
                exp_year: $('.card-expiry-year').val()
            }, stripeResponseHandler);
        }
    });
    function stripeResponseHandler(status, response) {
        if (response.error) {
            $('.error')
                .removeClass('hide')
                .find('.alert')
                .text(response.error.message);
        } else {
            /* token contains id, last4, and card type */
            var token = response['id'];
            $form.find('input[type=text]').empty();
            $form.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
            $form.get(0).submit();
        }
    }
});
   </script>
 @endpush