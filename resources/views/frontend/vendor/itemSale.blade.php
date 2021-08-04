@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/select2.min.css">
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/page_loader.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/editContent.css">
@endpush
@section('content')
<style>
.banner-area4 .banner-area-inner .banner-info h2 {
    font-size: 36px;
    font-family: "Quicksand", sans-serif;
    font-weight: 700;
    color: #fff;
    line-height: 48px;
    margin-bottom: 0;
    text-align: left;
    margin-top: 340px;
}

.over_view_thumb{
      background-image: url({{ file_exists(@$data['edit']->icon) ? asset(@$data['edit']->icon) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }} );
   }
   .over_view_thumb {
    height: 700px!important;
    background-size: cover;
    background-position: left center;
    background-repeat: no-repeat;
}
</style>
<input type="text" hidden  class="id" value="{{ Auth::user()->id}}">
    <!-- banner-area start -->
    <div class="banner-area4">
            <div class="banner-area-inner">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                    <div class="col-xl-10 offset-xl-1 col-12">
                            <div class="banner-info knowledge_title">
                                <h2>Pune la vanzare NFT-ul - {{isset($data['edit'])? $data['edit']->title:old('title')}}</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- banner-area end -->
       
       



        <!-- upload_area _start -->
        <div class="upload_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="row"> 
                                                    
                            @if(@$data['edit']->id)
                            <div class="col-xl-10 offset-xl-1">
                                @if(Auth::user()->role_id == 1 || Auth::user()->role_id == 2 || Auth::user()->role_id == 4)
                                    <form action="{{ route('author.itemSaleUpdate')}}" id="file_update" method="POST" enctype="multipart/form-data">
                                @else
                                    @if (@$item_preview != null)
                                    <form action="{{ route('author.portfolio',Auth::user()->username)}}" method="get" >
                                    @else
                                    <form action="{{ route('author.itemSaleUpdate')}}" id="file_update" method="POST" enctype="multipart/form-data">
                                    @endif
                                  
                                @endif
                                    @csrf
                                <div class="single_upload_area">
                                        <input type="text" hidden name="category_id" value="{{@$data['edit']->category_id}}">
                                        <input type="text" hidden name="id" value="{{@$data['edit']->id}}">
                                        <input type="text" hidden value="1" name="upload_or_link">
                                        <div class="d-flex justify-content-center" id="page_loader" style="display: none">
                                            <div class="loader" style="display: none">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </div>  
                                        </div>
                                        <div class="upload_description gray-bg">

                                            <!-- <select class="wide " id="select_category" name="upload_or_link" onchange="checkIsLink(this)">
                                                <option data-display="@lang('lang.product_upload_or_link')">@lang('lang.product_upload_or_link')</option>
                                                
                                                    <option value="" >@lang('lang.select')</option>
                                                    <option value="1" {{ $data['edit']->is_upload == 1 ?'selected':''}}>@lang('lang.upload')</option>
                                                    <option value="0" {{ $data['edit']->is_upload == 0 ?'selected':''}}>@lang('lang.link')</option>
                                                
                                            </select>

                                            @if ($errors->has('upload_or_link'))
                                            <span class="invalid-feedback invalid-select error" role="alert">
                                                <strong>{{ $errors->first('upload_or_link') }}</strong>
                                            </span>
                                         @endif
                                       {{-- @dd($data['edit']->is_upload) --}} -->

                                                <h3>@lang('lang.name_and_desription')</h3>
                                                


                                                    <input type="text" name="title" id="" placeholder="@lang('lang.name')*" value="{{isset($data['edit'])? $data['edit']->title:old('title')}}" readonly>
                                                    @if ($errors->has('title'))
                                                    <span class="invalid-feedback invalid-select error"
                                                          role="alert">
                                                        <strong>{{ $errors->first('title') }}</strong>
                                                    </span>
                                                  @endif
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" name="feature1" id="" placeholder="@lang('lang.key_features')" value="{{isset($data['edit'])? $data['edit']->feature1:old('feature1')}}" readonly>
                                                        @if ($errors->has('feature1'))
                                                        <span class="invalid-feedback invalid-select error"
                                                            role="alert">
                                                            <strong>{{ $errors->first('feature1') }}</strong>
                                                        </span>
                                                        @endif
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" name="feature2" id="" placeholder="@lang('lang.key_features')" value="{{isset($data['edit'])? $data['edit']->feature2:old('feature2')}}" readonly>
                                                            @if ($errors->has('feature2'))
                                                            <span class="invalid-feedback invalid-select error"
                                                                role="alert">
                                                                <strong>{{ $errors->first('feature2') }}</strong>
                                                            </span>
                                                            @endif
                                                    </div>
                                                </div>
                                                    <textarea  name="description" id="messageArea" cols="30" rows="10" placeholder="" readonly>{{isset($data['edit'])? $data['edit']->description:old('description')}}</textarea>
                                                   
                                                
                                            </div>
                                            <div class="upload_description gray-bg padding-bottom">
                                                <h3>@lang('lang.Files')</h3>
                                                <div class="fileAdd d-none">
                                                    
                                            </div>
                                            {{-- admin --}}
                                            {{-- <div class="row">
                                                <div class="col-lg-6">
                                                     <a href="#" class="boxed-btn minimal_width">Upload File(s)
                                                             <input type="file" id="file_upload_js">
                                                         </a>
                                                </div>
                                                <div class="col-lg-12 mb-3">
                                                     <span class="invalid-feedback invalid-select error" role="alert" class="db">
                                                             <strong id="file_upload_js_error"></strong>
                                                         </span>
                                                </div>
                                            </div> --}}
                                            
                                                        <!-- DM_uploader  -->
                                                        <div class="row">
                                                            <div class="col-12">
                                                            @if( (@$data['edit']->file == 'img'))
                        <div class="over_view_thumb imaginebanner">
                                {{-- <img height="400"  src="{{ file_exists(@$data['edit']->thumbnail) ? asset(@$data['edit']->thumbnail) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }} " alt=""> --}}
                            <div class="overlay_with_btn">
                          
                            </div>
                        </div>
                        @elseif( (@$data['edit']->file == 'video'))
                        <video width="100%" height="100%" autoplay muted>
                            <source src="{{ file_exists(@$data['edit']->main_file) ? asset(@$data['edit']->main_file) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }}" type="video/mp4">
                            
                            Your browser does not support the video tag.
                        </video>
                        @endif


                                                            </div>
                                                        </div>
             
                                                     
                                                  
                                                
                                                    <!-- DM_uploader  -->
                                                
                                               
                                                 
                                               
                                            </div>
                                            <div class="upload_description gray-bg padding-bottom">
                                                    <h3>@lang('lang.categories_and_attributes')</h3>
                                                            <select class="wide"  name="sub_category_id" id="sub_category_id">

                                                            @foreach($data['category'] as $item)
                                                                <option value={{@$item->id}} {{ @$item->id == @Session::get('categorySlect')->id ?'selected':old('category') ==( @$item->id ? 'selected':'')}}>{{@$item->title}}</option>
                                                            @endforeach
                                                  
                                                            </select>
  
                                                            <div class="disable_key">
                                                                {{--dynamic input filed--}}                                                        
                                                                @foreach ($data['attribute'] as $key => $item)                                                         
                                                                    {{-- <select class="js-example-basic-multiple dm_display_none" data-placeholder="{{@$item->name}} *" name="{{@$item->field_name}}[]" multiple="multiple" aria-readonly="false"  title="Select "> --}}
                                                                    <select class="js-example-basic-multiple dm_display_none" data-placeholder="{{@$item->name}} *" name="optional_att[{{@$item->field_name}}][]" multiple="multiple" aria-readonly="false"  title="Select ">
                                                                        @foreach ($item->subAttribute as $value)
                                                                            @if ($data['edit']->category_id == $value->category_id)                                                                
                                                                                <option  data-display="{{@$value->name}}"  value="{{@$value->id}}" 
                                                                                {{getAttributeSelecedStatus($data['edit']->id, $item->field_name, $value->id )}}>{{@$value->name}} </option>
                                                                            @endif
                                                                        @endforeach
                                                                    </select>  
                                                                    @if (@$errors->has(@$item->field_name))
                                                                        <span class="invalid-feedback invalid-select" role="alert">
                                                                            <strong>{{ @$errors->first(@$item->field_name) }}</strong>
                                                                        </span>
                                                                    @endif
                                                                @endforeach
                                                            </div>
                                                        <input type="text" name="demo_url" placeholder="@lang('lang.demo_url')*"  value="{{isset($data['edit'])? $data['edit']->demo_url:old('demo_url')}}" readonly>
                                                </div>
                                                

                                                

                                            <div class="upload_description gray-bg padding-bottom">
                                                <h3>@lang('lang.Tags')</h3>
                                                    <textarea  name="tags" id="" cols="30" rows="10" 
                                                    placeholder="@lang('lang.Tags')" readonly>{{isset($data['edit'])? $data['edit']->tags:old('tags')}}</textarea>
     
                                            </div>
                                            <div class="upload_description gray-bg padding-bottom prise-item">
                                                <div class="upload_hding">
                                                    <h3>Pret</h3>
                                                    <!-- <p>@lang('lang.upload_heading')</p> -->
                                                </div>
                                                         @php
                                                            $regular = App\ManageQuery::BuyerFees(1);
                                                            // DB::table('buyer_fees')->where('type', 1)->first();
                                                         $category_details=$category_details=App\ManageQuery::SelectedCategoryDetails($data['edit']->category_id);
                                                        //  DB::table('item_categories')->where('id',$data['edit']->category_id)->first();
                                                        //  $category_details=DB::table('item_categories')->where('id',Session::get('categorySlect')->id)->first();
                                                        $regular_recommended_price[]=explode("-",$category_details->recommended_price);
                                                         $extended_recommended_price[]=explode("-",$category_details->recommended_price_extended);
                                                         $recommended_price_commercial[]=explode("-",$category_details->recommended_price_commercial);
    
                                                         $item_fee=App\ManageQuery::FreeItemOfCategory($data['edit']->category_id);
                                                        //  DB::table('item_fees')->where('category_id',$data['edit']->category_id)->first();
                                                       
                                                    @endphp 
                                                    
                                                    <div class="table-responsive">
                                                    <p>NFT-ul a fost achizitionat cu:  {{isset($data['edit'])? $data['edit']->Reg_total:old('Reg_total')}} lei</p>
            
<div class="upload_inner d-flex align-items-center mb-10 mt-20">
   
        <!-- <span class="lisence-name ">@lang('lang.regular_license')</span> -->
        <span class="dm_middle_span">{{GeneralSetting()->currency_symbol}}</span>
        <div class="input_field">
            <label for="">@lang('lang.ITEM_PRISE')</label>
            <input type="text" class="primary-input form-control w-50 decimal" step="any" id="Re_item" name="Re_item" onkeyup="regular(this.value)" value="">
        </div>
        <span class="dm_middle_span">+</span>
        <div class="input_field">
            <label for="">Comision Refferal</label>
            <input  type="text" class="primary-input form-control w-50 decimal" step="any"   id="comisionagent" name="C_buyer" onkeyup="regular(this.value)" value="">
        </div>
        <span class="dm_middle_span">+</span>
        <div class="input_field">
            <label for="">Comision Agentie</label>
            <input  type="text" class="primary-input form-control w-50 decimal" step="any"   id="comisionminted" name="C_item" onkeyup="regular(this.value)" value="">
        </div>
        <span class="dm_middle_span">+</span>
        <div class="input_field">
            <label for="">Comision Minted</label>
            <input  type="text" class="primary-input form-control w-50 decimal" step="any"   id="comision25" name="Re_buyer" onkeyup="regular(this.value)" value="">
        </div>
        <span class="dm_middle_span">=</span>
        <div class="input_field last-one">
            <label for="">PRET VANZARE</label>
            <input  type="text" class="primary-input form-control w-50"  name="Reg_total_price" readonly  value="" placeholder="{{GeneralSetting()->currency_symbol}}" id="Re_total" >
            <input  type="text" class="primary-input form-control w-50"  disabled hidden id="Reg_total"  value="">
        </div>
        <!-- <div class="recomander">
            <p>@lang('lang.recommended') <br>
                    @lang('lang.purchase_price') <br>
                    {{GeneralSetting()->currency_symbol}}{{ @$regular_recommended_price[0][0]  }} - {{GeneralSetting()->currency_symbol}}{{@$regular_recommended_price[0][1]}}</p> 
        </div> -->
</div>

</div>
                                                        @php
                                                            $extended = App\ManageQuery::BuyerFees(2);
                                                        @endphp
                                                     
                                                </div>
                                          
                                            </div>
                                            @if (@$item_preview!=null)
                                            <p class="text-danger text-center">@lang('lang.your_previous_update_is_pending')</p>
                                            <p  class="boxed-btn mt-20">@lang('lang.update') @lang('lang.product')</p>
                                            @else
                                            <button  class="boxed-btn mt-20" id="itemSubmit" type="submit">@lang('lang.update') @lang('lang.product')</button>
                                            @endif
                                            
                                
                                </div>
                            </form>
                            </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
@include('error.error')     
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/select2.min.js"></script>
<script src="{{ asset('public/frontend/js/') }}/file_upload.js"></script>
<script src="{{ asset('public/frontend/js/') }}/item_files.js"></script>
<script src="{{ asset('public/frontend/js/') }}/page_loader.js"></script>
<script>
        @if($errors->any())
            @foreach($errors->all() as $error)
                  toastr.error('{{ $error }}','Error',{
                      closeButton:true,
                      progressBar:true,
                   });
            @endforeach
        @endif
    </script>

<script src="https://cdn.ckeditor.com/4.5.1/standard/ckeditor.js"></script>
 
<script type="text/javascript">
    CKEDITOR.replace('messageArea', {
        filebrowserUploadUrl: "{{route('ckeditor_upload', ['_token' => csrf_token() ])}}",
        filebrowserUploadMethod: 'form',
            on: {
                instanceReady: function() {
                    this.dataProcessor.htmlFilter.addRules( {
                        elements: {
                            img: function( el ) {
                                // Add an attribute.
                                if ( !el.attributes.alt )
                                    el.attributes.alt = 'Feature image';

                                // Add some class.
                                el.addClass( 'feature_image_ck' );
                            }
                        }
                    } );            
                }
            }
    });
</script>
<script>
    function regular(item) {
    var Re_item = $("#Re_item").val();
    var Re_buyer = $("#Re_buyer").val();

    if (Re_item.length != 0) {
        var item = Re_item;
    } else {
        var item = 0;
    }
    

    var tt = parseInt(item);
    var comisionagent = (5 / 100) * tt;
    $("#comisionagent").val(comisionagent);
    $("#comisionagent").attr("placeholder", "$" + comisionagent);
    $("#comisionagent").attr("value", comisionagent);
    var comisionminted = (25 / 100) * tt;
    $("#comisionminted").val(comisionminted);
    $("#comisionminted").attr("placeholder", "$" + comisionminted);
    $("#comisionminted").attr("value", comisionminted);
    var comision25 = (2.5 / 100) * tt;
    $("#comision25").val(comision25);
    $("#comision25").attr("placeholder", "$" + comision25);
    $("#comision25").attr("value", comision25);
    
    var total = parseInt(item) + comisionminted + comisionagent + comision25;
    $("#Reg_total").val(total);
    $("#Re_total").attr("placeholder", "$" + total);
    $("#Re_total").attr("value", total);

}

$('.decimal').keyup(function(){
    var val = $(this).val();
    if(isNaN(val)){
         val = val.replace(/[^0-9\.]/g,'');
         if(val.split('.').length>2) 
             val =val.replace(/\.+$/,"");
    }
    $(this).val(val); 
});

</script>
<script>
    function checkIsLink(selectedObj) {
        var selected_value=selectedObj.value;
        var upload_section=document.getElementById('main_file_upload_section');
        var purchase_link=document.getElementById('product_purchase_link');

        if (selected_value==0) {
            upload_section.style.display = "none";
            purchase_link.style.display = "block";
        } else {
            upload_section.style.display = "block";
            purchase_link.style.display = "none";
        }

    }
</script>

@endpush