@extends('backend.master')
@section('mainContent')

<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>NFT-uri Dezactivate</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="#" class="active">NFT-uri Dezactivate</a>
            </div>
        </div>
    </div>
</section>
<section class="admin-visitor-area DM_table_info">
    <div class="container-fluid p-0">  
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-4 no-gutters">
                        <div class="main-title lm_mb_35 sm_mb_20">
                            <h3 class="mb-0">NFT-uri Dezactivate </h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                    <div class="col-lg-12">                        
                        <table id="table_id" class="display school-table" cellspacing="0" width="100%">
                            <thead>                           
                                <tr>
                                    <th>@lang('lang.id')</th>
                                    <th>@lang('lang.title')</th>
                                    <th>@lang('lang.category')</th>
                                    <th>@lang('lang.image')</th>
                                    <th>@lang('lang.price')</th>
                                    <th>@lang('lang.author')</th>
                                    <th>Detinator</th>
                                    <th>Nr. de vanzari</th>
                                    <th>@lang('lang.status')</th>
                                    <th>@lang('lang.action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($data['item'] as $key => $item)
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td valign="top"><a target="_blank" href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">{{Str::limit(@$item->title,20)}}</a></td>
                                    <td valign="top">{{@$item->category->title}}</td>
                                    <td valign="top"><img src="{{asset(@$item->icon)}}" class="content_list_wh_40"></td>
                                    <td valign="top">{{@$item->Reg_total}} {{@GeneralSetting()->currency_symbol}}</td>
                                    <td valign="top"><a target="_blank" href="{{ route('user.profile',@$item->og->username)}}">{{@$item->og->username }}</a></td>
                                    <td valign="top"><a target="_blank" href="{{ route('user.profile',@$item->user->username)}}">{{@$item->user->username }}</a></td>
                                    <td>{{ @$item->sell }}</td>
                                    <td valign="top">
                                                @if (@$item->status == 1)
                                                @lang('lang.active')
                                                @else   
                                                @lang('lang.deactive')
                                                @endif
                                    </td>
                                    
                                    <td valign="top">
                                        <div class="dropdown">
                                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                                                @lang('lang.select')
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" target="_blank" href="{{ route('admin.product_viewSingle',[str_replace(' ', '-',@$item->title),@$item->id])}}">@lang('lang.view')</a>
                                                <a class="dropdown-item" target="_blank" href="{{ route('admin.productEdit',@$item->id)}}">@lang('lang.edit')</a> 
                                                <a class="dropdown-item" data-toggle="modal" data-target="#deleteClassModal{{@$item->id}}"  href="">@lang('lang.delete')</a>                                                 
                                                {{-- <a class="dropdown-item" onclick="FreeProduct(`{{ route('admin.free_product_active',$item->id) }}`)" data-toggle="modal" data-target="#FreeProduct" >@lang('lang.free')</a>                                                  --}}
                                                @if ($item->status == 1)
                                                   <a class="dropdown-item" data-toggle="modal" data-target="#ApproveClassModal{{@$item->id}}"  href="">   @lang('lang.deactive')  </a>
                                                @else   
                                                   <a class="dropdown-item" data-toggle="modal" data-target="#ApproveClassModal{{@$item->id}}"  href=""> @lang('lang.active')</a>
                                                @endif
                                                   
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                  <div class="modal fade admin-query" id="deleteClassModal{{@$item->id}}" >
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">@lang('lang.delete') @lang('lang.product')</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <div class="modal-body">
                                                <div class="text-center">
                                                    <h4>@lang('lang.are_you_sure_to_delete')</h4>
                                                </div>

                                                <div class="mt-40 d-flex justify-content-between">
                                                    <button type="button" class="primary-btn tr-bg" data-dismiss="modal">@lang('lang.cancel')</button>
                                                    <a href="{{ route('admin.itemDelete',@$item->id) }}" class="text-light">
                                                    <button class="primary-btn fix-gr-bg" type="submit">@lang('lang.delete')</button>
                                                     </a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                  <div class="modal fade admin-query" id="ApproveClassModal{{@$item->id}}" >
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">@lang('lang.product')</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <div class="modal-body">
                                                <div class="text-center">
                                                        @if ($item->status == 1)
                                                        <h4>@lang('lang.are_you_want_to_deactive')</h4>
                                                        @else   
                                                        <h4>@lang('lang.are_you_want_to_Approve')</h4>
                                                        @endif
                                                </div>

                                                <div class="mt-40 d-flex justify-content-between">
                                                    <button type="button" class="primary-btn tr-bg" data-dismiss="modal">@lang('lang.cancel')</button>
                                                    <a href="{{ route('admin.Item_approve',$item->id) }}" class="text-light">
                                                            @if (@$item->status == 1)
                                                            <button class="primary-btn fix-gr-bg" type="submit">@lang('lang.deactive')</button>
                                                            @else   
                                                            <button class="primary-btn fix-gr-bg" type="submit">@lang('lang.approve')</button>
                                                            @endif
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

<div class="modal fade admin-query" id="FreeProduct" >
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">@lang('lang.product_free')</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="" method="POST" id="Free_form">
                    @csrf
                    <div class="row">
                        <div class="col-lg-12">
                                <label>@lang('lang.date')   <span class="text-red">*</span></label>
                            <div class="input-effect">
                                    <select class="niceSelect w-100 bb form-control" name="date" required>
                                        <option value="01">January</option> 
                                        <option value="02">February</option> 
                                        <option value="03">March</option> 
                                        <option value="04">April</option> 
                                        <option value="05">May</option> 
                                        <option value="06">June</option> 
                                        <option value="07">July</option> 
                                        <option value="08">August</option> 
                                        <option value="09">September</option> 
                                        <option value="10">October</option> 
                                        <option value="11">November</option> 
                                        <option value="12">December</option>    
                                    </select>
                                        <span class="focus-border"></span>
                                        <span class="invalid-feedback " role="alert">
                                            <strong></strong>
                                        </span>
                            </div>
                        </div>
                    </div>

                <div class="mt-40 d-flex justify-content-between">
                    <button type="button" class="primary-btn tr-bg" data-dismiss="modal">@lang('lang.cancel')</button>
                    <button class="primary-btn fix-gr-bg" type="submit">@lang('lang.submit')</button>
                </div>
            </form>
            </div>

        </div>
    </div>
</div>
@endsection



