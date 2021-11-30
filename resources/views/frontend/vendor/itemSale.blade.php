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
    background-size: cover!important;
    background-position: center!important;
    background-repeat: no-repeat!important;
}
.de_tab.tab_methods .de_nav li span {
    padding: 35px 10px;
    color: rgba(0, 0, 0, .6);
    font-family: var(--body-font);
    font-size: 14px;
    line-height: 20px;
    text-align: center;
    display: table-cell;
    vertical-align: middle;
    border-radius: 12px;
    min-width: 140px;
}
.de_tab.tab_methods .de_nav li span {
    border: solid 2px rgba(0, 0, 0, .1);
}
.dark-scheme .de_tab.tab_methods .de_nav li span {
    color: #ffffff;
}

.de_tab.tab_methods .de_nav li span {
    background: none;
}
.dark-scheme .de_tab.tab_methods .de_nav li span {
    color: rgba(255, 255, 255, .6);
}
.de_tab.tab_methods .de_nav li span {
    border: solid 2px rgba(0, 0, 0, .1);
}
.dark-scheme .de_tab .de_nav li span {
    color: rgba(255, 255, 255, .3);
    background: #292F45;
}
.de_tab .de_nav li{
    background: none!important;
}
</style>
@php                                                        
    $itemLastPrice = App\ItemOrder::where('user_id', @$data['edit']->user_id)->where('item_id', @$data['edit']->id)->orderBy('id', 'DESC')->first();
@endphp
<input type="text" hidden  class="id" value="{{ Auth::user()->id}}">
       <!-- content begin -->
       
 <div class="no-bottom no-top" id="content">
            <div id="top"></div>
            
            <!-- section begin -->
            <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>Pune la vanzare NFT-ul - {{isset($data['edit'])? $data['edit']->title:old('title')}}</h1>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->   

            <section aria-label="section" style="background-size: cover;">
            @if(@$data['edit']->id)
        
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
                    <input type="text" hidden name="category_id" value="{{@$data['edit']->category_id}}">
                    <input type="text" hidden name="id" value="{{@$data['edit']->id}}">
                    <input type="text" hidden value="1" name="upload_or_link">
                <div class="container" style="background-size: cover;">
                    <div class="row wow fadeIn animated" style="background-size: cover; visibility: visible; animation-name: fadeIn;">
                        <div class="col-lg-7 offset-lg-1" style="background-size: cover;">
                            <form id="form-create-item" class="form-border" method="post" action="email.php">
                                <div class="field-set" style="background-size: cover;">
                                   
                                    <h5>Titlu</h5>
                                    <input type="text" name="title" id="" class="form-control" placeholder="@lang('lang.name')*" value="{{isset($data['edit'])? $data['edit']->title:old('title')}}" readonly>
                                    @if ($errors->has('title'))
                                    <span class="invalid-feedback invalid-select error"
                                            role="alert">
                                        <strong>{{ $errors->first('title') }}</strong>
                                    </span>
                                    @endif
                                    <div class="spacer-20" style="background-size: cover;"></div>

                                    <h5>Descriere</h5>
                                    <textarea  name="description" cols="30" rows="5" placeholder="" class="form-control" readonly>{{isset($data['edit'])? $data['edit']->description:old('description')}}</textarea>
                                                   
                                    <div class="spacer-20" style="background-size: cover;"></div>


                                    <h5>Caracteristici</h5>
                                    <div class="de_tab tab_methods" style="background-size: cover;">
                                        <ul class="de_nav">
                                            
                                        <li><span><input style="background: transparent; color: #FFF; border: 0px ; text-align: center;" type="text" name="feature1" id="" placeholder="@lang('lang.key_features')" value="{{isset($data['edit'])? $data['edit']->feature1:old('feature1')}}" readonly>
                                            @if ($errors->has('feature1'))
                                            <span class="invalid-feedback invalid-select error"
                                                role="alert">
                                                <strong>{{ $errors->first('feature1') }}</strong>
                                            </span>
                                            @endif
                                            </span></li>

                                            <li><span> <input style="background: transparent; color: #FFF; border: 0px ; text-align: center;" type="text" name="feature2" id="" placeholder="@lang('lang.key_features')" value="{{isset($data['edit'])? $data['edit']->feature2:old('feature2')}}" readonly>
                                                @if ($errors->has('feature2'))
                                                <span class="invalid-feedback invalid-select error"
                                                    role="alert">
                                                    <strong>{{ $errors->first('feature2') }}</strong>
                                                </span>
                                                @endif
                                                </span></li>
                                        </ul>


                                    </div>

                                    <div class="spacer-20" style="background-size: cover;"></div>

                                    <h5>Categorii</h5>
                                    <p class="p-info">Categoria in care apare NFT-ul pe Minted.ro</p>

                                    <div id="item_collection" class="dropdown fullwidth mb20" style="background-size: cover;">
                                        <select class="wide btn-selector"  name="sub_category_id" id="sub_category_id" style="width: 200px;">

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
                                    </div>
                                    

                                    <div class="spacer-20" style="background-size: cover;"></div>


                                    <h5>Tag-uri</h5>
                                    <textarea  name="tags" id="" cols="30" rows="3" class="form-control" placeholder="@lang('lang.Tags')" readonly>{{isset($data['edit'])? $data['edit']->tags:old('tags')}}</textarea>
     
                                    <div class="spacer-20" style="background-size: cover;"></div>

                                    <h5>Pret</h5>
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
                                                   
                                                        
                                                       
                                                    <p>NFT-ul a fost achizitionat cu:  {{ $itemLastPrice->subtotal }} lei</p>
                                                                    
                                                        <div class="upload_inner d-flex align-items-center mb-10 mt-20">
                                                        
                                                                <!-- <span class="lisence-name ">@lang('lang.regular_license')</span> -->
                                                                <span class="dm_middle_span" style="padding-top: 25px; padding-right: 10px;">{{GeneralSetting()->currency_symbol}}</span>
                                                                <div class="input_field">
                                                                    <label for="">@lang('lang.ITEM_PRISE')</label>
                                                                    <input type="text" class="primary-input form-control decimal" style="width: 150px;" step="any" id="Re_item" name="Re_item" onkeyup="regular(this.value)" value="{{isset($data['edit'])? $data['edit']->Re_item:old('Re_item')}}">
                                                                </div>
                                                                <span class="dm_middle_span" style="padding-top: 25px; padding-right: 10px; padding-left: 10px;">-</span>
                                                                <div class="input_field">
                                                                    <label for="">Comision Artist</label>
                                                                    <input  type="text" class="primary-input form-control decimal" step="any"  style="width: 150px;"  id="comisionreferrer" name="C_buyer" onkeyup="regular(this.value)" value="{{isset($data['edit'])? $data['edit']->C_buyer:old('C_buyer')}}">
                                                                </div>
                                                                <span class="dm_middle_span" style="padding-top: 25px; padding-right: 10px; padding-left: 10px;">-</span>
                                                                <div class="input_field">
                                                                    <label for="">Comision Minted</label>
                                                                    <input  type="text" class="primary-input form-control decimal" step="any"  style="width: 150px;"  id="comision25" name="Re_buyer" onkeyup="regular(this.value)" value="{{isset($data['edit'])? $data['edit']->Re_buyer:old('Re_buyer')}}">
                                                                </div>
                                                                <span class="dm_middle_span" style="padding-top: 25px; padding-right: 10px; padding-left: 10px;">=</span>
                                                                <div class="input_field last-one">
                                                                    <label for="">PRET VANZARE</label>
                                                                    <input  type="text" class="primary-input form-control "   style="width: 150px;" name="Reg_total_price" readonly  value="{{isset($data['edit'])? $data['edit']->Reg_total:old('Reg_total')}}" placeholder="{{GeneralSetting()->currency_symbol}}" id="Re_total" >
                                                                    <input  type="text" class="primary-input form-control"  style="width: 150px;" disabled hidden id="Reg_total"  value="{{isset($data['edit'])? $data['edit']->Reg_total:old('Reg_total')}}">
                                                                </div> 
                                                            
                                                                    <input  type="text" class="primary-input form-control"  style="width: 150px;" hidden name="C_item"  id="comisionminted"  onkeyup="regular(this.value)" value="">
                                                                
                                                                    <input  type="text" class="primary-input form-control"  style="width: 150px;" hidden name="C_buyer"  id="comisionagent"  onkeyup="regular(this.value)" value="">
                                                                
                                                                    <input type="text" class="primary-input form-control"  style="width: 150px;" hidden name="E_buyer"  id="comisionartistdb"  onkeyup="regular(this.value)" value="">
                                                                
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
                                    <div class="spacer-single" style="background-size: cover;"></div>
                                    @if (@$item_preview!=null)
                                    <p class="text-danger text-center">@lang('lang.your_previous_update_is_pending')</p>
                                    <p  class="boxed-btn mt-20">@lang('lang.update') @lang('lang.product')</p>
                                    @else
                                    <button  class="btn-main" id="itemSubmit" type="submit" style="width: 100%;">@lang('lang.update') @lang('lang.product')</button>
                                    @endif
                                    <div class="spacer-single" style="background-size: cover;"></div>
                                </div>
                            </form>
                        </div>

                        <div class="col-lg-3 col-sm-6 col-xs-12" style="background-size: cover;">
                                <h5>Previzualizare NFT</h5>
                                <div class="nft__item" style="background-size: cover;">
                                    
                                    <div class="nft__item_wrap" style="background-size: cover; height: 264px;">
                                        @if( (@$data['edit']->file == 'img'))
                                        <a href="#">
                                            <img src="{{ file_exists(@$data['edit']->icon) ? asset(@$data['edit']->icon) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }}" id="get_file_2" class="lazy nft__item_preview" alt="">
                                        </a>
                                        @elseif( (@$data['edit']->file == 'video'))
                                        <a href="#">
                                            <video width="100%" height="100%" autoplay muted controls loop>
                                                <source src="{{ file_exists(@$data['edit']->main_file) ? asset(@$data['edit']->main_file) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }}" type="video/mp4">
                                                
                                                Your browser does not support the video tag.
                                            </video>
                                        </a>
                                        
                                        @endif
                                    </div>
                                    <div class="nft__item_info" style="background-size: cover;">
                                        <a href="#">
                                            <h4>{{isset($data['edit'])? $data['edit']->title:old('title')}}</h4>
                                        </a>
                                        <div class="nft__item_click" style="background-size: cover;">
                                        <span></span>
                                    </div>
                                        <div class="nft__item_price" style="background-size: cover;">
                                            {{ $itemLastPrice->subtotal }} LEI<span>/ Pret Cumparare</span>
                                        </div>                           
                                    </div> 
                                </div>
                            </div>                                         
                    </div>
                </div>
                @endif
            </section>


        <!-- upload_area _start -->
        
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
    var comisionreferrer = (10 / 100) * tt;
    $("#comisionreferrer").val(comisionreferrer);
    $("#comisionreferrer").attr("placeholder", "$" + comisionreferrer);
    $("#comisionreferrer").attr("value", comisionreferrer);
    var comisionagent = (0.5 / 100) * comisionreferrer;
    $("#comisionagent").val(comisionagent);
    $("#comisionagent").attr("placeholder", "$" + comisionagent);
    $("#comisionagent").attr("value", comisionagent);
    var comisionminted = (2.5 / 100) * comisionreferrer;
    $("#comisionminted").val(comisionminted);
    $("#comisionminted").attr("placeholder", "$" + comisionminted);
    $("#comisionminted").attr("value", comisionminted);
    var comision25 = (2.5 / 100) * tt;
    $("#comision25").val(comision25);
    $("#comision25").attr("placeholder", "$" + comision25);
    $("#comision25").attr("value", comision25);
    
    var total = parseInt(item) - comisionreferrer - comision25;
    $("#Reg_total").val(total);
    $("#Re_total").attr("placeholder", "$" + total);
    $("#Re_total").attr("value", total);


    var comisionartistdb = comisionreferrer - comisionagent - comisionminted;
    $("#comisionartistdb").val(comisionartistdb);
    $("#comisionartistdb").attr("placeholder", "$" + comisionartistdb);
    $("#comisionartistdb").attr("value", comisionartistdb);


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