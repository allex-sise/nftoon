@extends('backend.master')
@section('mainContent')

    <!-- todo: above has minted hardcoded, upload will fail -->


<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>Blockchain NFTs</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="{{ route('admin.adDrop')}}" class="active">Blockchain NFTs</a>
              
            </div>
        </div>
    </div>
</section>


<section class="admin-visitor-area DM_table_info">
    <div class="container-fluid p-0">
     

        <div class="row">
            <!-- aici ai infos si variabilele -->
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-title">
                            <h3 class="mb-30">

                              Blockchain NFTs
                            </h3>
                        </div>
                   
       

     

                        <div class="white-box">
                  
                        <div class="row">
                    <div class="col-lg-12">   
                    <form id="basicform" method="post" action="{{ route('admin.blockchainNFTs') }}">
					@csrf                     
                        <table class="display school-table" cellspacing="0" width="100%">
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
                                </tr>
                            </thead>
                            <tbody>
@php 
$itemsTuple=array();
@endphp
                            @foreach ( $requests as $ra)
        @php 
            $items = App\Item::where('id', $ra)->get();
        @endphp
      
                            @foreach ( $items as $item)
                                @php
                                    $collection = App\Collections::where('id', $item->in_collection)->first();
                                    $contract_address = $collection->contract;
                                    $product_id=$item->id;
                                    $txHash=$item->purchase_link;
                                    array_push($itemsTuple,"{'id':'{$product_id}', 'contract':'{$contract_address}', 'txHash':'{$txHash}' }");
                                @endphp
                                <tr>
                                    <th>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" name="ids[]" class="custom-control-input" id="customCheck{{ $item->id }}" value="{{ $item->id }}">
                                            <label class="custom-control-label" for="customCheck{{ $item->id }}"></label>
                                        </div>
                                    </th>
                                    <td>{{$item->id}}</td>
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
                                   
                                </tr>
                                @endforeach
@endforeach
                            
                            </tbody>
                        </table>
                        <button class="btn btn-primary" type="submit">MODIFICA IN DB</button>

</form>
                    </div>
            </div>
                        </div>
  
                          

                        </div>
                 
                    </div>
                </div>
         

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-lg-4 no-gutters">
                        <div class="main-title sm_mb_20 lm_mb_35">
                            <h3 class="mb-0">Adauga NFT-urile pe blockchain  </h3>
                        </div>
                    </div>
                </div> 

                <div class="row" style="padding: 15px;">
                    <div class="col-lg-12 no-gutters bg-white" style="padding: 0px 15px 15px 15px;">
                        <div class="main-title sm_mb_20 lm_mb_35">
<!-- @foreach ( $requests as $ra)
@php 
$items = App\Item::where('id', $ra)->get();
@endphp

@foreach ( $items as $item)
@php 
$collection = App\Collections::where('id', $item->in_collection)->first();
$contract_address = $collection->contract;
$ipfs_path = $collection->ipfs_path;

$nftmultiple = App\Nftmultiple::where('nftmultiple', $item->id)->first();
$id_nftmultiple = $nftmultiple->id_multiple;
@endphp
{{ $id_nftmultiple }}
{{ $ipfs_path }}
{{ $items }}
@endforeach
 @endforeach -->
 @php
 $jsonitemsTuple = json_encode($itemsTuple); 
 @endphp

                            <!-- Vue -->
                            <div id="app">
                                <mint-nft 
                                mint-route="{{route('admin.itemUpdateMint')}}"
                                items="{{$jsonitemsTuple}}"
                                ></mint-nft>
                            </div> 

                            


                        </div>
                    </div>
                </div>
              
                <div class="row">
                    <div class="col-lg-4 no-gutters">
                        <div class="main-title sm_mb_20 lm_mb_35">
                            <h3 class="mb-0">@lang('lang.list') URL-uri si Meta</h3>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                    <div class="main-title sm_mb_20 lm_mb_35">
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
  <script src="{{ asset('/')}}public/frontend/js/jquery-3.3.1.js"></script>
<script>
	$(".checkAll").on('click',function(){
		$('input:checkbox').not(this).prop('checked', this.checked);
	});
</script>
@endsection