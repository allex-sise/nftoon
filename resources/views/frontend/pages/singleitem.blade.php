@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/item.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/single_item.css">
@endpush
@php
$infix_general_settings = GeneralSetting();
@endphp

@section('content')
@include('frontend.partials.itemHeader')
<!-- details-tablist-start -->
@php
use Carbon\Carbon;
$dt     = Carbon::now();
$img = explode(",",@$data['item']->item_image->image);
if (Str::contains($_SERVER['REQUEST_URI'], 'mail-sent')) {
$overview='';
$overview_content='';
$support='active';
$support_content='active show';
$comment='';
$comment_content='';
} else if(Str::contains($_SERVER['REQUEST_URI'], 'comment')) {
$overview='';
$overview_content='';
$support='';
$support_content='';
$comment='active';
$comment_content='active show';
}else{
$overview='active';
$overview_content='active show';
$support='';
$support_content='';
$comment='';
$comment_content='';
}
@endphp

<style>
   .over_view_thumb{
      background-image: url({{ file_exists(@$data['item']->thumbnail) ? asset(@$data['item']->thumbnail) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }} );
   }
   .theme-logo img {
    width: 34px;
    height: auto;
    border-radius: 50%;
}
.userbg{
   border-radius: 50px;
    margin-top: -93px!important;
    padding: 9px;
    height: 55px;
    -webkit-box-shadow: 0px 0px 1px 0px rgb(50 50 50 / 25%)!important;
    -moz-box-shadow: 0px 0px 1px 0px rgba(50, 50, 50, 0.25)!important;
    box-shadow: 0px 0px 1px 0px rgb(50 50 50 / 25%)!important;
    background: #FFF;
}
.userbg2{
   border-radius: 50px;
    padding: 9px;
    height: 55px;
    -webkit-box-shadow: 0px 0px 1px 0px rgb(50 50 50 / 25%)!important;
    -moz-box-shadow: 0px 0px 1px 0px rgba(50, 50, 50, 0.25)!important;
    box-shadow: 0px 0px 1px 0px rgb(50 50 50 / 25%)!important;
    background: #FFF;
    margin-bottom: 10px;
}
.profile-name{
   margin-bottom: 0px!important;
}
.footeruserborder{
   height: 1px!important;
   width: 100%!important;
   background: #000!important;
}
.theme-logo2 img {
    width: 134px!important;
    height: auto!important;
    border-radius: 50%!important;
}
.theme-side-bar2{
   width: 50%!important;
}
.single-info-inner .single-info-title p {
    line-height: 35px!important;
    margin-bottom: 0px!important;
}
.single-info-inner .single-info-content p {
    line-height: 35px!important;
    margin-bottom: 0px!important;
}
.main-details-area2{
   padding-left: 100px;
   padding-right: 100px;
   padding-bottom: 20px;
}
.footer-area .footer-top {
    padding-top: 50px;
    padding-bottom: 25px;
    display: none;
}
</style>
<!-- details-tablist-end -->
<!-- main-details-area-start -->
<div class="main-details-area section-padding main-details-area2">
   <div class="container">
      <div class="row">
         <div class="col-xl-8 col-lg-8">
          
            <div class="row">
            @if (@$data['item']->user->balance->amount)                                           
               <div class="theme-side-bar userbg">
                  <div class="profile-linking">
                     <div class="profile-name">
                        <div class="theme-logo">
                           <img src="{{ @$data['item']->user->profile->image? asset(@$data['item']->user->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                        </div>
                        <div class="theme-info">
                        <a href="{{ route('user.portfolio',@$data['item']->user->username)}}"> <h4>{{ @$data['item']->user->username}}</h4> </a>
                        
                        </div>
                     </div>
                  </div>
               </div>
               @endif
            </div>
            <div class="row">
               <p><span style="color: #e2e2e2;">Informatii</span></p> <br />
            </div>
            <div class="row">
               <p>{!! @$data['item']->description !!}</p>
            </div>
            <div class="row">
            <div class="theme-side-bar1 theme-side-bar3 mt-20" style="width: 50%;">
               <div class="theme-detils-info">
                  <div class="single-info">
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title  single-info-column">
                           <p>@lang('lang.Last') Update</p>
                        </div>
                        <div class="single-info-content single-info-column">
                           <p> {{ DateFormat(@$data['item']->updated_at)}}</p>
                        </div>
                     </div>
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title  single-info-column">
                           <p>@lang('lang.Created')</p>
                        </div>
                        <div class="single-info-content single-info-column">
                           <p> {{ DateFormat(@$data['item']->created_at)}}</p>
                        </div>
                     </div>
                     
                     {{-- DYNAMIC ATTRIBUTE PRINTS  --}}
                     @if(@$data['attributes'])
                        @foreach($data['attributes'] as $key=>$value)
                           <div class="single-info-inner userbg2">
                              <div class="single-info-title single-info-column">
                                 <p>{{getAttributeName($value->field_name)}}</p>
                              </div>
                              <div class="single-info-content single-info-column">
                                 <p>{{getAttributeValues($value->values)}}</p> 
                              </div>
                           </div>
                        @endforeach
                     @endif
                     {{--END DYNAMIC ATTRIBUTE PRINTS  --}}

                     {{-- <div class="single-info-inner userbg2">
                        <div class="single-info-title single-info-column">
                           <p>@lang('lang.Documentation')</p>
                        </div>
                        <div class="single-info-content single-info-column">
                           <p>@lang('lang.Well') @lang('lang.Documented')</p>
                        </div>
                     </div>
                     <div class="single-info-inner userbg2">
                        <div class="single-info-title single-info-column">
                           <p>@lang('lang.Layout')</p>
                        </div>
                        <div class="single-info-content single-info-column">
                           <p>{{  @$data['item']->layout }}</p>
                        </div>
                     </div> --}}

                     <div class="single-info-inner userbg2">
                        <div class="single-info-title single-info-column">
                           <p>@lang('lang.Tags')</p>
                        </div>
                        <div class="single-info-content single-info-column">
                           <p>{{  @$data['item']->tags }}</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            </div>
         </div>


               <div class="col-xl-4 col-lg-4">
                  <div class="theme-side-bar-wrap">
                     @if (@$data['item']->free == 1)
                     <div class="theme-side-bar gray-bg mb-5">
                        <div class="single-side-bar">
                           @if (Auth::check())
                           <div >
                              <a class="boxed-btn w-100" href="{{ route('user.FreeItemDownloadAll',@$data['item']->id) }}" >@lang('lang.download') </a>
                              {{--  
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                 <a class="dropdown-item" href="{{ route('user.FreeItemDownloadAll',@$data['item']->id) }}">All files & documentation</a>
                                 <a class="dropdown-item" href="{{ route('user.FreeProductDownload',@$data['item']->id) }}">Installable file only</a>
                                 <a class="dropdown-item" href="{{ route('user.FreeLicenceDownload',@$data['item']->id) }}">License certificate & purchase code (pdf)</a>
                              </div>
                              --}}
                           </div>
                           @else                                                        
                           <a href="{{ url('customer/login') }}"  class="boxed-btn w-100" id="BuyCart">@lang('lang.sign_in_to_download_it_for_free')</a>
                           @endif                                                    
                           <div class="light-lisence-wrap pt-3">
                              <div class="light-pakage-list">
                                 <ul>
                                    <li>
                                       <p>@lang('lang.this_is_free_item_file_of_the_month') {{date('M')}} !
                                          @lang('lang.by_downloading_this_item')
                                       </p>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                     @endif
                     <div class="theme-side-bar gray-bg">
                        <div class="single-side-bar">
                           <div
                              class="side-bar-heading d-flex justify-content-between align-items-center mt-2">
                              {{-- <h4> <span id="license_type">@lang('lang.Regular') @lang('lang.License')</span>  <i class="ti-angle-down licenseShow" ></i> </h4>
                              <span class="Reg_total" id="Reg_total">{{@$infix_general_settings->currency_symbol}}{{ @$data['item']->Reg_total}}</span>
                              <input type="text" class="_total" id="_total" value="{{ @$data['item']->Reg_total}}" hidden>
                              <input type="hidden" value="{{@$infix_general_settings->currency_symbol}}" id="currency_symbol"> --}}
                              <h4> Pret </h4> 
                           </div>
                           <form action="{{ route('AddBuy') }}" method="POST">
                              @csrf
                              <div class="light-lisence-wrap">
                                 <div class="light-pakage-list">
                                    {{-- {!! $item_support->long_description !!} --}}
                                    <input type="hidden" id="support_fees" value="{{$data['fees']->support_fee}}">
                                    <ul id="license_list">
                                       <li>
                                          <div class="row">
                                             <div class="col-lg-2">
                                                <input type="hidden" id="normal_regular_price" value="{{ @$data['item']->Reg_total}}">
                                                <input type="radio"  class="price_option" data-default_price="{{ @$data['item']->Reg_total}}" data-type="regular_license_price" data-normal="normal_regular_price" data-support_fee="{{@$data['fees']->support_fee/100*@$data['item']->Reg_total }}" checked name="list_item_price" value="{{ @$data['item']->Reg_total}}">
                                             </div>
                                             <div class="col-lg-6"></div>
                                             <div class="col-lg-4"> <strong class="float-right">{{@$infix_general_settings->currency_symbol}} <span id="regular_license_price">{{ @$data['item']->Reg_total}}</span></strong> </div>
                                          </div>
                                       </li>
                                    </ul>
                                  
                                 </div>
                                 @php
                                 $support_fee=floor($data['item']->Reg_total/100*$data['fees']->support_fee);
                                    // $support_fee=$data['fees']->support_fee;
                                 @endphp
                                 <input type="text" hidden id="buy_license_type"  name="buy_license_type" value="1">
                                 <input type="text" hidden  name="_item_id" value="{{ @$data['item']->id}}">
                                 <input type="text" hidden  name="_item_percent" value="{{ @$data['BuyerFee']->fee/100}}">
                                 <input type="text" hidden  id="totalVal" name="totalVal" value="{{ @$data['item']->Reg_total}}">
                                 <input type="text" hidden id="extra_price"  value="0">
                                 <div class="add-cart">
                                    @if (@$data['item']->is_upload==1)
                                     
                                       <button  type="submit" class="boxed-btn-white" >@lang('lang.Buy') @lang('lang.Now') </button>
                                    @else
                                    <a  href="{{@$data['item']->purchase_link}}" target="_blank" class="boxed-btn add-cart-active">@lang('lang.Buy') @lang('lang.Now')</a>
                                   
                                    @endif
                                 
                                 </div>
                              </div>
                           </form>
                           
                           <div class="lisence-wrap" id="isence-wrap">
                              <a href="javascript:void(0)"  id="regularLi" onclick="regularLicence();">
                                 <div class="lisence-inner">
                                    <div
                                       class="lisence-heading d-flex justify-content-between align-items-center">
                                       <h5>@lang('lang.Regular') @lang('lang.License')</h5>
                                       <span id="reguler_price">{{@$infix_general_settings->currency_symbol}}{{ @$data['item']->Reg_total}}</span>
                                    </div>
                                    <p>@lang('lang.regular_license_description').</p>
                                 </div>
                              </a>
                              <div class="separator-1"></div>
                              <a href="javascript:void(0)"  id="extendedLi" onclick="extendedLicence();">
                                 <div class="lisence-inner">
                                    <div
                                       class="lisence-heading d-flex justify-content-between align-items-center">
                                       <h5>@lang('lang.extended') @lang('lang.License')</h5>
                                       <span id="extended_price">{{@$infix_general_settings->currency_symbol}}{{ @$data['item']->Ex_total}}</span>
                                    </div>
                                    <p>@lang('lang.extended_license_description').</p>
                                 </div>
                              </a>
                              <a href="{{url('license')}}">  <button class="boxed-btn d-block w-100 mt-3">@lang('lang.view_license_details')</button></a>
                           </div>
                        </div>
                     </div>
                   
                     <div class="theme-side-bar1 gray-bg mt-20">
                        <div class="download-comments d-flex justify-content-between align-items-center">
                           <h3 class="d-flex align-items-center"> <i class="ti-shopping-cart"></i> @lang('lang.sales')</h3>
                           <span>{{ @$data['item']->sell }}</span>
                        </div>
                     </div>
                     
                     @php
                     // @$totalRate =DB::table('reviews')->where('item_id', @$data['item']->id)->get();
                     // @$rate5 =DB::table('reviews')->where('item_id', @$data['item']->id)->whereBetween('rating',[4.5,5])->get();
                     if (@$rate5->count() > 0 ) {
                     @$rateparcent5= number_format((float)count(@$rate5)/count(@$totalRate)*100, 2, '.', '');
                     } else {
                     @$rateparcent5=0;
                     }                                                
                     @endphp
                    
                  
                  </div>
               </div>
            </div>
            <div class="row">
            <h3>Creator</h3>
            <div class="footeruserborder">
            </div>
               @if (@$data['item']->user->balance->amount)                                           
               <div class="theme-side-bar mt-20 theme-side-bar2">
                  <div class="profile-linking">
                     <div class="profile-name">
                        <div class="theme-logo theme-logo2">
                           <img src="{{ @$data['item']->user->profile->image? asset(@$data['item']->user->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                        </div>
                        <a href="{{ route('user.portfolio',@$data['item']->user->username)}}">
                        <div class="theme-info">
                           <h1>{{ @$data['item']->user->username}}</h1>
                           <h3>@username</h3>
                           </a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="theme-side-bar mt-20 theme-side-bar2">
                  <div class="profile-linking">
                     <div class="profile-name">
                     <div class="theme-logo">
                            
                     <div class="icons">
                              <img height="auto" width="40"  src="{{asset(@$level->icon)}}" data-toggle="tooltip" data-placement="bottom" title="Author level  {{ @$level->id}} : sold {{@GeneralSetting()->currency_symbol}}  {{round(@$data['item']->user->balance->amount > 50 ? @$data['item']->user->balance->amount: 0) }}+ on {{ @GeneralSetting()->system_name }} " alt="">
                              <img height="auto" width="40" src="{{asset(@$badge->icon)}}" data-toggle="tooltip" data-placement="bottom" title="{{ @$level->id-1}} {{@$badge->id == 1? 'Year' :'Years' }} of membarship on {{ @GeneralSetting()->system_name }} " alt="">
                           </div>
                        </div>
                        <div class="theme-info">
                          
                           <h6>descriere user, detaliile din contul lui vor fi aici</h6>
                        </div>
                     </div>
                  </div>
               </div>
               @endif
            </div>
         </div>
      </div>
   </div>
</div>
{{-- {{@$infix_general_settings->currency_symbol}} --}}
<form id="test-form" class="white-popup-block mfp-hide add_lisence_popup" action="{{ route('AddCartItem')}}" method="POST">
   @csrf
   <div class="form_header">
      @foreach (Cart::content()->unique('item_id') as $item)
      @if (@$data['item']->id == @$item->options['item_id'])
      <div class="alert alert-info" role="alert"> 
         <i class="ti-check"></i> @lang('lang.Already_Added_This_Item')
      </div>
      @endif
      @endforeach
      <h1>@lang('lang.Customize_your_selection')</h1>
      <input type="number" hidden id="item_id" name="id" value="{{  $data['item']->id }}">
      <input type="text" hidden  id="item_price" name="item_price" value="{{  $data['item']->Reg_total }}">
      <input type="text" hidden  name="item_name" value="{{  $data['item']->title }}">
      <input type="text" hidden  name="description" value="{{  $data['item']->description }}">
      <input type="text" hidden  name="user_id" value="{{  $data['item']->user_id }}">
      <input type="text" hidden  name="username" value="{{  $data['item']->user->username }}">
      <input type="text" hidden  name="image" value="{{  $data['item']->thumbnail }}">
      <input type="text" hidden  name="icon" value="{{  $data['item']->icon }}">
      <input type="text" hidden id="BuyerFee" name="BuyerFee" value="0">
      {{-- <input type="number" hidden id="_mod_total"  value="{{  $data['item']->Reg_total }}"> --}}
      <input type="text" hidden id="Extd_total" value="{{  $data['item']->Ex_total }}">
      <input type="text" hidden id="Extd_percent" name="Extd_percent"  value="{{ $data['item']->support_fee/100 }}">
   </div>
   <input type="text" hidden  id="pop_license_type" value="1" name="license_type">
   <input type="text" hidden  id="pop_support_time" value="1" name="support_time">
   <div class="row d-none">
      <div class="col-xl-6">
         <div class="single_select">
            <h4>@lang('lang.Select_a_License')</h4>
            <div class="select_box">
               <select class="wide SelectLicense" id="SelectLicense" >
                  <option id="reg_val" value="1" data-display="Regular">@lang('lang.Regular')</option>
                  <option id="Ex_val" value="2">@lang('lang.Extended')</option>
               </select>
            </div>
         </div>
      </div>
      <div class="col-xl-6">
         <div class="single_select">
            <h4>@lang('lang.select') @lang('lang.Support') @lang('lang.duration')</h4>
            <div class="select_box">
               <select class="wide Selectsupport" id="Selectsupport" >
                  <option value="1" id="six" data-display="6 months support">6 @lang('lang.months') @lang('lang.support')</option>
                  <option value="2" id="twelve">12 @lang('lang.months') @lang('lang.support')</option>
               </select>
            </div>
         </div>
      </div>
   </div>
   <div class="main_content">
      <div class="row gray-bg-2 no-gutters">
         <div class="col-xl-6 col-md-6">
            <div class="content_left">
               <a  class="profile_mini_thumb">
               <img src="{{ @$data['item']->thumbnail? asset(@$data['item']->thumbnail):'' }}" alt="">
               </a>
               <div class="content_title">
                  <p>{{@$data['item']->title}}
                     <br>
                     <span class="user_author">by {{@$data['item']->user->username}}</span>
                     <input type="number" id="totalCartItem" value="0" hidden>
                  </p>
               </div>
            </div>
         </div>
         <div class="col-xl-6 col-md-6">
            <div class="content_left">
               <h3> {{@$infix_general_settings->currency_symbol}}<span class="_mod_total">{{@$data['item']->Reg_total}}</span> </h3>
               <div class="content_title">
                  <p class="support_text">
                     <span>@lang('lang.License') :</span>
                     <a href="#" id="support_text">@lang('lang.Regular')</a>
                  </p>
                  <p class="support_text">
                     <span>@lang('lang.Support') :</span> 
                     <small id="support_tym">6 @lang('lang.months') @lang('lang.support')</small>
                  </p>
               </div>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-xl-12">
            <div class="currency_text">
               <p>@lang('lang.All_prices_are')</p>
            </div>
         </div>
         <div class="col-xl-12">
            <div class="cancel_add_btn d-flex justify-content-between">
               <a class="boxed-btn-white mfp-close"  type="button" >@lang('lang.cancel')</a>
               <button id="AddCart" class="boxed-btn" type="submit">@lang('lang.Add_To_Cart')</button>
            </div>
         </div>
      </div>
   </div>
</form>
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/item_preview.js"></script>
<script src="{{ asset('public/frontend/js/') }}/dm_price_cal.js"></script>
@endpush