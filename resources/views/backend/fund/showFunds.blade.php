
@extends('backend.master')
<link rel="stylesheet" href="{{asset('public/backEnd/')}}/approved_deposit.css">
@section('mainContent')
<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>@lang('lang.fund_list')  </h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="#">@lang('lang.fund_list')  </a>
            </div>
        </div>
    </div>
</section>
<section class="white-box">
<div class="col-lg-3 col-md-6 mt-30-md">
      <a href="#" class="d-block">
        <div class="white-box single-summery">
          <div class="d-flex justify-content-between">
            <div>
              <h3>Balanta Totala</h3>
              <p class="mb-0">Total minted credits </p>
            </div>
            <h1 class="gradient-color2">{{@$infix_general_settings->currency_symbol}}{{ @Auth::user()->balance->amount}}</h1>
          </div>
        </div>
      </a>
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
                            <h3 class="mb-0">{{@$user_info->full_name}}</h3>
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
                                <th width="10%">F-ID</th>
                                <th width="15%">@lang('lang.amount')</th>
                                <th width="15%">@lang('lang.date')</th>
                                <th width="15%">@lang('lang.action')</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($funds as $value)
                                <tr>
                                <td>{{@$value->id}}</td>
                                <td>{{@$value->income}}</td>
                                <td>{{DateFormat($value->created_at)}}</td>
                                <td>
                                    <div class="row">
                                    <div class="col-sm-6">
    
                                    <div class="dropdown">
                                        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                                            @lang('lang.select')
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                          
                                            <a class="dropdown-item" data-toggle="modal" data-target="#EditFund{{@$value->id}}"  href="#">@lang('lang.edit')</a>
                                            <a class="dropdown-item" data-toggle="modal" data-target="#DeleteFund{{@$value->id}}"  href="#">@lang('lang.delete')</a>
                                            
    
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>  

                            
                            <div class="modal fade admin-query" id="EditFund{{@$value->id}}" >
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">@lang('lang.edit') @lang('lang.fund')</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <div class="modal-body">
                                        <form action="{{url('admin/update-fund')}}" method="post">
                                        @csrf
                                            <div class="row no-gutters input-right-icon">
                                                <div class="col">
                                                    <div class="input-effect">
                                                    <input class="primary-input form-control" id="fund_amount" min="0" type="number" name="fund_amount" value="{{@$value->amount}}">
                                                        <label>@lang('lang.amount')<span>*</span></label>
                                                        <span class="focus-border"></span>
                                                    </div>
                                                </div>
                                            </div>

                                            <input type="hidden" name="fund_id" value="{{ @$value->id}}">
                                            {{-- <div class="row mt-25">
                                                <div class="col-lg-12">
                                                    <div class="input-effect">
                                                        <textarea class="primary-input form-control" cols="0" rows="4" name="note">{{@$value->description}}</textarea>
                                                        <span class="focus-border textarea"></span>
                                                        <label>Note <span></span></label>
                                                    </div>
                                                </div>
                                            </div> --}}
                                
                                            <div class="mt-40 d-flex justify-content-between">
                                                <button type="button" class="primary-btn tr-bg" data-dismiss="modal">@lang('lang.cancel')</button>
                                                 
                                                <button class="primary-btn fix-gr-bg" type="submit">@lang('lang.update')</button>
                                                
                                            </div>

                                        </form>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="modal fade admin-query" id="DeleteFund{{@$value->id}}" >
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">@lang('lang.delete') @lang('lang.fund')</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <div class="modal-body">
                                            <div class="text-center">
                                                <h4>@lang('lang.are_you_sure_to_delete')</h4>
                                            </div>

                                            <div class="mt-40 d-flex justify-content-between">
                                                <button type="button" class="primary-btn tr-bg" data-dismiss="modal">@lang('lang.cancel')</button>
                                                  <a href="{{ route('admin.fundrDeleted',@$value->id)}}" class="text-light">
                                                <button class="primary-btn fix-gr-bg" type="submit">@lang('lang.delete')</button>
                                                 </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

    </div>
</section>


@endsection
