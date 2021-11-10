
@extends('backend.master')
<link rel="stylesheet" href="{{asset('public/backEnd/')}}/approved_deposit.css">
@section('mainContent')
<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>@lang('lang.payment')</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="#">@lang('lang.payment')</a>
                <a href="#">@lang('lang.author') @lang('lang.payment') @lang('lang.list')</a>
            </div>
        </div>
    </div>
</section>
<section class="admin-visitor-area DM_table_info">
    <div class="container-fluid p-0">
       {{--  <div class="row justify-content-between p-3">
            <div class="bc-pages">
             
            </div>
      </div> --}}

            <div class="row mt-40 mb-25">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 no-gutters">
                            <div class="main-title">
                                <h3 class="mb-0">Retrageri</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        
            <!-- </div> -->
            <div class="row">
                <div class="col-lg-12">
                    <table id="table_id" class="display school-table" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <td width="1%">ID#</td>
                                <th width="10%">@lang('lang.user') @lang('lang.name')</th>
                                <th width="15%">@lang('lang.email')</th>
                                <th width="15%">Suma Retragere </th>
                                <th width="15%">@lang('lang.status')</th>
                                <th width="15%">@lang('lang.payment') @lang('lang.method')</th>
                                <th width="15%">@lang('lang.send')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($author_list as $value)
                            {{-- @if (@$value->payment_method->status == 1)                                 --}}
                                    <tr id="{{ @$value->id}}">
                                        <td>{{ @$value->id}}</td>
                                    <td>{{@$value->user->username}}</td>
                                    <td>{{@$value->user->email}}</td>
                                    <td>{{@$value->amount}} {{@GeneralSetting()->currency_symbol}}</td>

                                    <td>{{  @$value->paid_vendors_id == NULL ? 'Neplatit' : 'Platit' }}</td>
                                    
                                    <td>{{  @$value->payment_method_id == 1 ? 'Stripe' : 'Ethereum' }}</td>
                                    <td>
                                      @if (@$value->paid_vendors_id == NULL)                                            
                                        <a href="{{ route('admin.WithdrawUser',@$value->id) }}" class="primary-btn small fix-gr-bg">@lang('lang.send') @lang('lang.money')</a>
                                      @else 
                                        <span>@lang('lang.empty')</span>  
                                      @endif
                                  </td>
                                        
                                </tr> 
                            {{-- @endif --}}

                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
                  
    </div>
</section>


@endsection
