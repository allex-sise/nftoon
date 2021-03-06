@extends('backend.master')
@section('mainContent')

@php
function showPicName($data){
$name = explode('/', $data);
return $name[4];
}
function showJoiningLetter($data){
$name = explode('/', $data);
return $name[3];
}
function showResume($data){
$name = explode('/', $data);
return $name[3];
}
function showOtherDocument($data){
$name = explode('/', $data);
return $name[3];
}

@endphp
<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>@lang('lang.withdraws')</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="{{route('admin.payableUser')}}">Retrageri Creatori</a>
            </div>
        </div>
    </div>
</section>
<section class="mb-40 student-details">
    <div class="container-fluid p-0">
        <div class="row">
         <div class="col-lg-3">
            <!-- Start Student Meta Information -->
            <div class="main-title">
                <h3 class="mb-20">Informatii Creator</h3>
            </div>
            <div class="student-meta-box">
                <div class="student-meta-top"></div>
                @if(!empty(@$data->profile->image))
                <img class="student-meta-img img-100" src="{{asset(@$data->profile->image)}}"  alt="">
                @else
                <img class="student-meta-img img-100" src="{{asset('public/frontend/img/profile/1.png')}}"  alt="">
                @endif
                <div class="white-box">
                    <div class="single-meta mt-10">
                        <div class="d-flex justify-content-between">
                            <div class="name">
                                Nume Creator
                            </div>
                            <div class="value">
                                @if(isset($data)){{@$data->full_name}}@endif
                            </div>
                        </div>
                    </div>
                    <div class="single-meta">
                        <div class="d-flex justify-content-between">
                            <div class="name">
                                @lang('lang.role') 
                            </div>
                            <div class="value">
                               @if(isset($data)){{@$data->role->name}}@endif
                           </div>
                       </div>
                   </div>
                    <div class="single-meta">
                        <div class="d-flex justify-content-between">
                            <div class="name">
                                @lang('lang.balance') 
                            </div>
                            <div class="value">
                               @if(isset($data))  {{@$data->balance->amount}} {{@GeneralSetting()->currency_symbol}}@endif
                           </div>
                       </div>
                   </div>
                    <div class="single-meta">
                        <div class="d-flex justify-content-between">
                            <div class="name">
                                @lang('lang.date_of_joining')
                            </div>
                            <div class="value">
                                @if(isset($data))
                                {{date('jS M, Y', strtotime(@$data->created_at))}}
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Student Meta Information -->

            </div>

            <!-- Start Student Details -->
            <div class="col-lg-9 staff-details">
        
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" href="#Earning" role="tab" data-toggle="tab">@lang('lang.earnings')</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#studentProfile" role="tab" data-toggle="tab">@lang('lang.payment')</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="#withdraw_history" role="tab" data-toggle="tab">@lang('lang.withdraws') @lang('lang.history')</a>
                    </li> 
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Start Profile Tab -->
                    <!-- Start leave Tab -->
                    <div role="tabpanel" class="tab-pane fade show active" id="Earning">
                            <div class="white-box">
                                <div class="row mt-30">
                                    <div class="col-lg-12">
                                        <div class="row">
                                                <div class="col-lg-3 col-6">
                                                    <a href="#" class="d-block">
                                                        <div class="white-box single-summery">
                                                            <div class="d-flex justify-content-between">
                                                                <div>
                                                                    <h3> {{@$data->balance->amount}} {{@GeneralSetting()->currency_symbol}} </h3>
                                                                    <p class="mb-0">Total Balanta Curenta</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div role="tabpanel" class="tab-pane fade " id="studentProfile">
                    @if(@$withdraws->paid_vendors_id == NULL)
                    
                        @if(@$withdraws->payment_method_id == 1)
                        <div class="white-box">
                            <h4 class="stu-sub-head">Informatii Cont Plata Stripe</h4>
                            <div class="single-info">
                                <form accept-charset="UTF-8" action="{{ route('admin.paymentAuthor') }}" class="require-validation"  id="payment-form" method="post">
                                    {{ csrf_field() }}
                                    <input type="text" hidden value="{{ @$payout_setup->user_id }}" name="user_id">
                                    <input type="text" hidden value="{{ @$withdraws->id }}" name="withdraw_id">
                                    <input type="text" hidden value="{{ @$payout_setup->id }}" name="payment_method_id">
                                    <div class='form-row'>
                                        <div class='col-xl-12 form-group'>
                                            <label class='control-label'>Metoda De Plata</label> <input value="{{  @$withdraws->payment_method_id == 1 ? 'Stripe' : 'Ethereum' }}" name="card_name"
                                                class='form-control' size='4' type='text' readonly>
                                        </div>
                                    </div>
                                    <div class='form-row'>
                                        <div class='col-xl-12 form-group'>
                                            <label class='control-label'>@lang('lang.email')</label> <input
                                        autocomplete='off' class='form-control card-number' size='20' value="{{ @$payout_setup->payout_email }}" name="email"
                                                type='text' readonly>
                                        </div>
                                    </div>
                                    <!-- <div class='form-row'>
                                        <div class='col-xl-12 form-group'>
                                            <label class='control-label'>@lang('lang.phone')</label> <input
                                        autocomplete='off' class='form-control card-number' size='20' value="{{ @$data->payout_phone }}" name="phone"
                                                type='text' readonly>
                                        </div>
                                    </div> -->
                                    
                                    <div class="form-row">
                                        <div class='col-xl-12 form-group'>
                                            <label class='control-label'> @lang('lang.total')</label> <input
                                                class='form-control' placeholder='YYYY' value="{{ @$withdraws->amount}}" name="amount"
                                                    type='text' readonly>
                                        </div>
                                    </div>
                                    <div class="form-row">

                                        <div class='col-xl-12 form-group text-center'>
                                            <button type="submit" class="primary-btn fix-gr-bg">Plateste</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        @elseif(@$withdraws->payment_method_id == 2)
                        <div class="white-box">
                            <h4 class="stu-sub-head">Informatii Cont Plata Ethereum</h4>
                            <div class="single-info">
                                <form accept-charset="UTF-8" action="{{ route('admin.paymentAuthor') }}" class="require-validation"  id="payment-form" method="post">
                                    {{ csrf_field() }}
                                    <input type="text" hidden value="{{ @$payout_setup->user_id }}" name="user_id">
                                    <input type="text" hidden value="{{ @$withdraws->id }}" name="withdraw_id">
                                    <input type="text" hidden value="{{ @$payout_setup->id }}" name="payment_method_id">
                                    <input type="text" hidden value="{{ @$withdraws->amountETH }}" name="amountETH">
                                    <div class='form-row'>
                                        <div class='col-xl-12 form-group'>
                                            <label class='control-label'>Metoda De Plata</label> <input value="{{  @$withdraws->payment_method_id == 1 ? 'Stripe' : 'Ethereum' }}" name="card_name"
                                                class='form-control' size='4' type='text' readonly>
                                        </div>
                                    </div>
                                    <div class='form-row'>
                                        <div class='col-xl-12 form-group'>
                                            <label class='control-label'>Adresa Wallet</label> <input
                                        autocomplete='off' class='form-control card-number' size='20' value="{{ @$payout_setup->payout_email }}" name="email"
                                                type='text' readonly>
                                        </div>
                                    </div>
                                    <!-- <div class='form-row'>
                                        <div class='col-xl-12 form-group'>
                                            <label class='control-label'>@lang('lang.phone')</label> <input
                                        autocomplete='off' class='form-control card-number' size='20' value="{{ @$payout_setup->payout_phone }}" name="phone"
                                                type='text' readonly>
                                        </div>
                                    </div> -->
                                    
                                    <div class="form-row">
                                        <div class='col-xl-12 form-group'>
                                            <label class='control-label'> @lang('lang.total')</label> <input
                                                class='form-control' placeholder='YYYY' value="{{ @$withdraws->amountETH}}" name="amount"
                                                    type='text' readonly>
                                        </div>
                                    </div>
                                    <div class="form-row">

                                        <div class='col-xl-12 form-group text-center'>
                                        <div id="app">
                                            <withdraw-admin 
                                            requestor-wallet-address="{{ @$payout_setup->payout_email }}" 
                                            withdraw-amount="{{ @$withdraws->amount}}" 
                                            withdraw-amount-eth="{{ @$withdraws->amountETH}}"
                                            route-transaction-hash="{{ route('admin.adauga_transactionHash') }}" 
                                            withdraw-id="{{ @$withdraws->id }}" 
                                            route-blockchain-status="{{ route('admin.adauga_blockchainStatus') }}" 
                                            route-payment-author="{{ route('admin.paymentAuthor') }}" 
                                            payout-user-id="{{ @$payout_setup->user_id }}" 
                                            payout-id="{{ @$payout_setup->id }}" />
                                        </div> 
                                            <!-- <button type="submit" class="primary-btn fix-gr-bg">Plateste</button> -->
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        
                        @endif

                        @else
                        <div class="white-box">
                        <a href="{{ route('admin.anuleazaWithdraw',@$withdraws->id)}}" class="text-light">
                            <button class="primary-btn fix-gr-bg" type="submit">@lang('lang.delete')</button>
                        </a>
                        </div>
                        <div class="white-box">
                            <h4 class="stu-sub-head">Plata a fost efectuata</h4>
                        </div>
                        @endif
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="withdraw_history">
                        <div class="white-box">
                            <h4>@lang('lang.history') @lang('lang.withdraws') </h4>
                            <div class="text-right mb-20">
                                <table id="table_id" class="display school-table" cellspacing="0" width="100%">

                                    <thead>
                                   
                                        <tr class="">
                                            <th>@lang('lang.username')</th>
                                            <th>Metoda Plata</th>
                                            <th>Cont Plata</th>
                                            <th>@lang('lang.amount')</th>
                                            <th>@lang('lang.date') Retragere</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($withdraw2 as $item)
                                        <tr>  
                                            <td valign="top">{{ @$item->user->username }}</td>
                                            <td valign="top">{{  @$item->payment_method_id == 1 ? 'Stripe' : 'Ethereum' }}</td>
                                            <td valign="top">{{ @$item->pay_address }}</td>
                                            <td valign="top">{{ @$item->amount }} lei</td>
                                            <td valign="top">{{$item->created_at}}</td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                     </div>                    
                </div>

                </div>
            </div>
       </div>
    </div>
</section>
@endsection
@section('script')
  <script src="{{asset('public/js/app.js')}}"></script>
@endsection
