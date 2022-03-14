@extends('backend.master')
@section('mainContent')

<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>NFT-uri Ne Minted</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="#" class="active">@lang('lang.list') NFT-uri care nu sunt minted</a>
            </div>
        </div>
    </div>
</section>
<section class="admin-visitor-area DM_table_info">
    <div class="container-fluid p-0">  
        <div class="row">
            <div class="col-lg-8 col-md-6">
            </div>
                           <div class="col-lg-4 text-md-right text-left col-md-6 mb-30-lg">
                    <a href="{{route('admin.product_upload')}}" class="primary-btn small fix-gr-bg">
                        <span class="ti-plus pr-2"></span>@lang('lang.product_upload')</a>
                </div>
                    </div>
            <div class="col-lg-12 mt-20">
                <div class="row">
                    <div class="col-lg-4 no-gutters">
                        <div class="main-title sm_mb_20 lm_mb_35">
                            <h3 class="mb-0"> @lang('lang.list') NFT-uri Ne Minted</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            <div class="collapse-default">
                      <div class="card">
                          <div id="headingCollapse1" class="card-header collapsed" data-toggle="collapse" role="button" data-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
                              <span class="lead collapse-title"> Filtreaza </span>
                          </div>
                          <div id="collapse1" role="tabpanel" aria-labelledby="headingCollapse1" class="collapse" style="">
                              <div class="card-body">
                                <div class="cart-filter mb-20 ">

                                 
                                    </div>
                              </div>
                          </div>
                      </div>
                    
                  </div>
                    <div class="col-lg-12">   
                    <form id="basicform" method="post" action="{{ route('admin.showNFTs') }}">
					@csrf                     
                        <table class="table" cellspacing="0" width="100%">
                            <thead>                           
                                <tr>
                                    <th class="am-select">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input checkAll" id="checkAll">
                                            <label class="custom-control-label" for="checkAll"></label>
                                        </div>
                                    </th>
                                    <th>@lang('lang.id')</th>
                                    <th>@lang('lang.title')</th>
                                    <th>@lang('lang.category')</th>
                                    <th>@lang('lang.image')</th>
                                    <th>@lang('lang.price')</th>
                                    <th>@lang('lang.author')</th>
                                    <th>Detinator</th>
                                    <th>Vanzari</th>
                                    <th>Status Mint</th>
                                    <th>@lang('lang.status')</th>
                                    <th>@lang('lang.action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($data['item'] as $key => $item)
                                @php
                                    $product_id=$item->id;
                                @endphp
                                <tr>
                                    <th>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" name="ids[]" class="custom-control-input" id="customCheck{{ $item->id }}" value="{{ $item->id }}">
                                            <label class="custom-control-label" for="customCheck{{ $item->id }}"></label>
                                        </div>
                                    </th>
                                    <td>{{ $key+1 }}</td>
                                    <td valign="top"><a target="_blank" href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">{{Str::limit(@$item->title,20)}}</a></td>
                                    <td valign="top">{{@$item->category->title}}</td>
                                    <td valign="top"><img src="{{asset(@$item->icon)}}" class="content_list_wh_40" ></td>
                                    <td valign="top">{{@$data['settings']->currency_symbol}}{{@$item->Reg_total}}</td>
                                    <td valign="top"><a target="_blank" href="{{ route('user.profile',@$item->user->username)}}">{{@$item->user->username }}</a></td>
                                    <td valign="top"><a target="_blank" href="{{ route('user.profile',@$item->og->username)}}">{{@$item->og->username }}</a></td>
                                    
                                    <td>{{ @$item->sell }}</td>
                                    <td valign="top">
                                                @if (@$item->ipfs_url == NULL)
                                                 NU E MINTED
                                                @else   
                                                 ESTE MINTED
                                                @endif
                                    </td>
                                    <td valign="top">
                                                @if (@$item->active_status == 1)
                                                @lang('lang.active')
                                                @else   
                                                @lang('lang.pending')
                                                @endif
                                    </td>
                                   
                                    
                                    <td valign="top">
                                        <div class="dropdown">
                                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                                                @lang('lang.select')
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="{{ route('admin.showNFT',@$item->id)}}">BLOCKCHAIN</a>
                                                <a class="dropdown-item" target="_blank" href="{{ route('admin.product_viewSingle',[str_replace(' ', '-',@$item->title),@$item->id])}}">@lang('lang.view')</a>
                                                <a class="dropdown-item" target="_blank" href="{{ route('admin.productEdit',@$item->id)}}">@lang('lang.edit')</a> 
                                                <a class="dropdown-item" data-toggle="modal" data-target="#deleteClassModal{{@$item->id}}"  href="">@lang('lang.delete')</a>                                                 
                                                @if ($item->status == 1)
                                                   <a class="dropdown-item" data-toggle="modal" data-target="#ApproveClassModal{{@$item->id}}"  href="">   Dezactiveaza  </a>
                                                @else   
                                                   <a class="dropdown-item" data-toggle="modal" data-target="#ApproveClassModal{{@$item->id}}"  href=""> Activeaza</a>
                                                @endif
                                                   
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                 
                                @endforeach
                            </tbody>
                        </table>
                        <button class="btn btn-primary" type="submit">Trimite catre alt view</button>

</form>
                    </div>
            </div>
    </div>
</section>
<script src="{{ asset('/')}}public/frontend/js/jquery-3.3.1.js"></script>
<script>
	$(".checkAll").on('click',function(){
		$('input:checkbox').not(this).prop('checked', this.checked);
	});
</script>
@endsection



