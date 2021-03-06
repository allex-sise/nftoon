@extends('backend.master') @section('mainContent')
<style>
    .input_field {
    width: 150px;
    max-width: 150px !important;
    flex: 150px 0 0;
}
</style>
<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>@lang('lang.product_upload') </h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="#">@lang('lang.product')</a>
                <a href="#"> @lang('lang.product_upload')</a>
            </div>
        </div>
    </div>
</section>

<section class="admin-visitor-area up_admin_visitor">
    <div class="container-fluid p-0">
        <div class="row">
            <div class="col-lg-8 col-md-6">
            </div>
            <div class="col-lg-4 text-md-right text-left col-md-6 mb-30-lg">
                <a href="{{route('admin.content')}}" class="primary-btn small fix-gr-bg">
                    <span class="ti-plus pr-2"></span>@lang('lang.Product') @lang('lang.list')</a>
            </div>
        </div>
        
            <div class="row">
                
               
                <div class="col-lg-12">
                    <div class="white-box">
                        <div class="add-visitor">
                            <form action="{{route('admin.itemUpdate')}}" method="post" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" value="{{@Session::get('categorySlect')->id}}" name="user_id">
                                <input type="hidden" value="1" name="upload_or_link">
                              
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <div class="input-effect">
                                        <input class="primary-input form-control{{ $errors->has('title') ? ' is-invalid' : '' }}" type="text" name="title"
                                               autocomplete="off" value="{{isset($data['edit'])? $data['edit']->title :old('title')}}">

                                        <label>@lang('lang.title') <span>*</span></label>
                                        <span class="focus-border"></span>
                                        @if ($errors->has('title'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('title') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                       <div class="row mt-10">
                                <div class="col-lg-12">
                                    <div class="input-effect">
                                        <input class="primary-input form-control{{ $errors->has('feature1') ? ' is-invalid' : '' }}" type="text" name="feature1"
                                               autocomplete="off" value="{{isset($data['edit'])? $data['edit']->feature1 :old('feature1')}}">

                                        <input type="hidden" name="id" value="{{isset($data['edit'])? $data['edit']->id: ''}}">
                                        <label>@lang('lang.feature') <span></span></label>
                                        <span class="focus-border"></span>
                                        @if ($errors->has('feature1'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('feature1') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-20 mb-20">
                                <div class="col-lg-12">
                                    <div class="input-effect">
                                        <input class="primary-input form-control{{ $errors->has('feature2') ? ' is-invalid' : '' }}" type="text" name="feature2"
                                               autocomplete="off" value="{{isset($data['edit'])? $data['edit']->feature2 :old('feature2')}}">

                                        <input type="hidden" name="id" value="{{isset($data['edit'])? $data['edit']->id: ''}}">
                                        <label>@lang('lang.feature') <span></span></label>
                                        <span class="focus-border"></span>
                                        @if ($errors->has('feature2'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('feature2') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div> 
                            <div class="row mt-20">
                                <div class="col-md-12">
                                    <div class="input-effect mb-20">
                                        <label>@lang('lang.description') <span>*</span> </label>
                                        <textarea class="primary-input form-control {{ $errors->has('description') ? ' is-invalid' : '' }}" cols="0" rows="4" name="description" id="details">{{isset($data['edit'])? $data['edit']->description :old('description')}}</textarea>
                                    
                                        <span class="focus-border textarea"></span> 
                                        @if ($errors->has('description'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('description') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-25">
                                <div class="col-lg-12">
                                    <div class="input-effect">
                                        <select class="niceSelect w-100 bb form-control{{ $errors->has('category_id') ? ' is-invalid' : '' }}"
                                                name="category_id">
                                            <option data-display="@lang('lang.category') *"
                                                    value="">@lang('lang.category') *
                                            </option>
                                            @foreach($data['category'] as $item)
                                                <option value={{@$item->id}} {{ @$item->id == $data['edit']->category->id ?'selected':old('category') ==( @$item->id ? 'selected':'')}}>{{@$item->title}}</option>
                                            @endforeach
                                        </select>
                                        <span class="focus-border"></span>
                                        @if ($errors->has('category_id'))
                                            <span class="invalid-feedback invalid-select"
                                                    role="alert">
                                                <strong>{{ $errors->first('category_id') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-25">
                                <div class="col-lg-12">
                                
                                    <div class="form-check col-md-1 float-left">
                                        <input class="form-check-input image_question" type="radio" value="img" name="videoimage" id="flexRadioDefault1" {{( $data['edit']->file == 'img' ? 'checked' : '')}}>
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                Imagine
                                            </label>
                                    </div>
                                    <div class="form-check col-md-1 float-left">
                                        <input class="form-check-input video_question" type="radio" value="video" name="videoimage" id="flexRadioDefault2" {{( $data['edit']->file == 'video' ? 'checked' : '')}}>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                                Video
                                            </label>
                                    </div>

                                </div>
                            </div>
                            <div class="row mt-25 imagine">
                                <div class="col-lg-12">
                                    <div class="row no-gutters input-right-icon">
                                        <div class="col-md-12">
                                            <img style="width: 200px;" src="{{ file_exists(@$data['edit']->icon) ? asset(@$data['edit']->icon) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }}"/>

                                        </div>
                                        <div class="col">
                                            <div class="input-effect">
                                                <input class="primary-input {{ $errors->has('thumdnail') ? ' is-invalid' : '' }}" type="text"
                                                      id="placeholder_thembnails"
                                                       placeholder="Incarca o IMAGINE"
                                                       readonly="">
                                                <span class="focus-border"></span>
                                            </div>
                                            <small>@lang('lang.please_input')</small>
                                        </div>
                                        <div class="col-auto">
                                            <button class="primary-btn-small-input"
                                                    type="button">
                                                <label class="primary-btn small fix-gr-bg"
                                                       for="thembnails_upload">@lang('lang.browse') pentru imagine</label>
                                                <input type="file" class="d-none" onchange="thembnailUpload()" id="thembnails_upload" name="thumdnail">
                                            </button>
                                            
                                        </div>
                                    </div>
                                    @if ($errors->has('thumdnail'))
                                    <span class="invalid-feedback dm_display_block" role="alert" >
                                        <strong>{{ $errors->first('thumdnail') }}</strong>
                                    </span>
                                    @endif
                                    <p id="thumbneils_title"></p>
                                </div>
                            </div>      
                            
                           
                            {{-- <p>@lang('lang.thumdnail_message')</p> --}}
                      

                            
                            <div class="row mt-25 video" id="main_file_upload_section" style="display:block" >
                            
                                <div class="col-lg-12">
                                    <div class="row no-gutters input-right-icon">
                                    <div class="col-md-12">
                                            @if (@$data['edit']->main_file)
                                            <video width="200px;" autoplay muted controls loop>
                                                <source src="{{ file_exists(@$data['edit']->main_file) ? asset(@$data['edit']->main_file) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }}" type="video/mp4">
                                                
                                                Your browser does not support the video tag.
                                            </video>
                                            @endif
                                        </div>
                                        <div class="col">
                                            <div class="input-effect">
                                                <input class="primary-input {{ $errors->has('main_file') ? ' is-invalid' : '' }}" type="text"
                                                      id="placeholderPhoto"
                                                       placeholder="Incarca un VIDEO"
                                                       readonly="">
                                                <span class="focus-border"></span>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <button class="primary-btn-small-input"
                                                    type="button">
                                                <label class="primary-btn small fix-gr-bg"
                                                       for="mail_file_upload">@lang('lang.browse') pentru video</label>
                                                <input type="file" class="d-none" onchange="mainFileUpload()" name="main_file" id="mail_file_upload">
                                            </button>
                                            
                                        </div>
                                    </div>
                                    @if ($errors->has('main_file'))
                                        <span class="invalid-feedback dm_display_block" role="alert" >
                                            <strong>{{ $errors->first('main_file') }}</strong>
                                        </span>
                                    @endif
                                    <p id="main_file_title"></p>
                                </div>
                            </div> 
                            <div class="row mt-25">
                                <div class="col-lg-12">
                                
                                    <div class="form-check col-md-1 float-left">
                                        <input class="form-check-input nftunic_question" type="radio" value="0" name="nftunic" id="nftunic1" {{( @$item->nftmultiplu == 0 ? 'checked' : '')}}>
                                            <label class="form-check-label" for="nftunic1">
                                                NFT Unic
                                            </label>
                                    </div>
                                    <div class="form-check col-md-1 float-left">
                                        <input class="form-check-input nftunic_question2" type="radio" value="1" name="nftunic" id="nftunic2" {{( @$item->nftmultiplu == 1 ? 'checked' : '')}}>
                                            <label class="form-check-label" for="nftunic2">
                                                NFT Multiplu
                                            </label>
                                    </div>

                                </div>
                            </div>
                       
                            <div class="row mt-25 data_exp_unic" id="data_exp_unic" style="display:block" >
                                <div class="col-lg-3">
                                        <div class="input-effect">
                                            @php
                                                $dataexpiraremultiplu = $data['edit']->data_exp_unic;
                                            @endphp
                                            <input type="text" class="primary-input" id="date" name="data_exp_unic">
                                            <label>Data expirare vanzare multipla <span>*</span></label>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('data_exp_unic'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('data_exp_unic') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                <div class="col-lg-9 float-left">
                                    <div class="input-effect">
                                        <input type="text" class="primary-input" id="time" name="ora_exp_unic">
                                        <label>Ora expirare vanzare multipla <span>*</span></label>
                                        <span class="focus-border"></span>
                                        @if ($errors->has('data_exp_unic'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('data_exp_unic') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <p id="">Data si ora de expirare pentru cate nft-uri pot fi vandute (in momentul cand se atinge ora, minutul, se opreste duplicarea nft-ului</p>
                                </div>
                            </div> 
                            <div id="product_purchase_link" style="display: none">
                                <div class="input-effect">
                                    <input class="primary-input form-control{{ $errors->has('purchase_link') ? ' is-invalid' : '' }}" type="text" name="purchase_link" autocomplete="off" value="{{isset($data['edit'])? $data['edit']->purchase_link :old('purchase_link')}}">
                                    <input type="hidden" name="id" value="{{isset($data['edit'])? $data['edit']->id: ''}}">
                                    <label>@lang('lang.purchase_link') <span>*</span></label>
                                    <span class="focus-border"></span>
                                    @if ($errors->has('purchase_link'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('purchase_link') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div> 
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
                            <br>
                                <style>
                                    .select_Staff_width{
                                        width: 100%;
                                        height: 35px;
                                        border-color: #D9DCE8;
                                        /* overflow-x: hidden; */

                                    }
                                    /* Hide scrollbar for Chrome, Safari and Opera */
                                    .select_Staff_width::-webkit-scrollbar {
                                        display: none;
                                    }
                                    /* Hide scrollbar for IE and Edge */
                                    .select_Staff_width {
                                        -ms-overflow-style: none;
                                    }
                                </style>
                   
                    <div class="row mt-20">
                        <div class="col-lg-12 mb-30">
                            <div class="input-effect">
                                <select class="niceSelect w-100 bb form-control{{ $errors->has('user_id') ? ' is-invalid' : '' }}" name="user_id">
                                    <option data-display="Creator *"
                                            value="">Creator *
                                    </option>
                                    @foreach($data['user'] as $item)
                                        <option value={{@$item->id}} {{ @$item->id == $data['edit']->user->id ?'selected':old('user') ==( @$item->id ? 'selected':'')}}>{{@$item->full_name}} - {{@$item->username}}</option>
                                    @endforeach
                                </select>
                                <span class="focus-border"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-20">
                        <div class="col-lg-12">
                            <div class="input-effect">
                                <input class="primary-input form-control{{ $errors->has('demo_url') ? ' is-invalid' : '' }}" type="text" name="demo_url"
                                       autocomplete="off" value="https://www.minted.ro" hidden>

                                <input type="hidden" name="id" value="{{isset($data['edit'])? $data['edit']->id: ''}}">
                        
                                <span class="focus-border"></span>
                                @if ($errors->has('demo_url'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('demo_url') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="row mt-25">
                        <div class="col-lg-12">
                            <div class="input-effect">
                                <textarea class="primary-input form-control{{ $errors->has('tags') ? ' is-invalid' : '' }}" type="text" name="tags" autocomplete="off" >{{isset($data['edit'])? $data['edit']->tags:old('tags')}} </textarea>
                                <label>@lang('lang.Tags') *</label>
                                <span class="focus-border"></span>
                                @if ($errors->has('tags'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('tags') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                    </div>
                
            <style>
                span.dm_middle_span {
                    margin-top: 38px;
                    margin-right: 15px;
                }
            </style>
            <div class="table-responsive">

            
                    <div class="upload_inner d-flex align-items-center mb-10 mt-20">
                            <!-- <span class="lisence-name ">@lang('lang.regular_license')</span> -->
                            <span class="dm_middle_span">{{GeneralSetting()->currency_symbol}}</span>
                            <div class="input_field">
                                <label for="">PRET VANZARE NFT</label>
                                <input type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null" class="primary-input form-control w-50 decimal" step="any" id="Re_item" name="Re_item" onkeyup="regular(this.value)" value="{{isset($data['edit'])? $data['edit']->Re_item:old('Re_item')}}">
                            </div>
                            <span class="dm_middle_span">-</span>
                            <div class="input_field">
                                <label for="">Comision Agent</label>
                                <input  type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null" class="primary-input form-control w-50 decimal" step="any"   id="comisionagent" name="C_buyer" onkeyup="regular(this.value)" value="{{isset($data['edit'])? $data['edit']->C_buyer:old('C_buyer')}}">
                            </div>
                            <span class="dm_middle_span">-</span>
                            <div class="input_field">
                                <label for="">Comision Agentie</label>
                                <input  type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null" class="primary-input form-control w-50 decimal" step="any"   id="comisionminted" name="C_item" onkeyup="regular(this.value)" value="{{isset($data['edit'])? $data['edit']->C_item:old('C_item')}}">
                            </div>
                            <span class="dm_middle_span">-</span>
                            <div class="input_field">
                                <label for="">Comision Website</label>
                                <input  type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null" class="primary-input form-control w-50 decimal" step="any"   id="comision25" name="Re_buyer" onkeyup="regular(this.value)" value="{{isset($data['edit'])? $data['edit']->Re_buyer:old('Re_buyer')}}">
                            </div>
                            <span class="dm_middle_span">=</span>
                            <div class="input_field last-one">
                                <label for="">INCASARE CREATOR</label>
                                <input  type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null" class="primary-input form-control w-50"  name="Reg_total_price" readonly  value="{{isset($data['edit'])? $data['edit']->Reg_total:old('Reg_total')}}" placeholder="{{GeneralSetting()->currency_symbol}}" id="Re_total" >
                                <input  type="numeric" min="0" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null" class="primary-input form-control w-50"  disabled hidden id="Reg_total"  value="{{isset($data['edit'])? $data['edit']->Reg_total:old('Reg_total')}}">
                            </div>
                            <!-- <div class="recomander">
                                <p>@lang('lang.recommended') <br>
                                        @lang('lang.purchase_price') <br>
                                        {{GeneralSetting()->currency_symbol}}{{ @$regular_recommended_price[0][0]  }} - {{GeneralSetting()->currency_symbol}}{{@$regular_recommended_price[0][1]}}</p> 
                            </div> -->
                    </div>
               
                </div>
            

</div>
                <!-- <p>@lang('lang.price_message') </p> -->
            </div>

            <div class="row mt-50">
                <div class="col-lg-12 text-center">
                    <button class="primary-btn fix-gr-bg">
                        <span class="ti-check"></span>
                        @if(isset($data['edit']))
                            @lang('lang.update')
                        @else
                            @lang('lang.save')
                        @endif

                    </button>
                </div>
            </div>

        </form>


                </div>
                </div>
               
                </div>
            </div>
        </div>
     
</section>
@endsection
@section('script')

<script>
if($(".image_question").is(":checked")) {
    $(".imagine").show();
    $(".video").hide();
} 
else {
    $(".imagine").hide();
    $(".video").show();
}; 

$(".image_question").click(function() {
    $(".imagine").show();
    $(".video").hide();
});
$(".video_question").click(function() {
    $(".imagine").hide();
    $(".video").show();
});
</script>
<script>
$(".data_exp_unic").hide();
$(".nftunic_question").click(function() {
    if($(this).is(":checked")) {
        $(".data_exp_unic").hide();
    } else {
        $(".data_exp_unic").show();
    }
});
$(".nftunic_question2").click(function() {
    if($(this).is(":checked")) {
        $(".data_exp_unic").show();
    } else {
        $(".data_exp_unic").hide();
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
    
    var total = parseInt(item) - comisionminted - comisionagent - comision25;
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
<script src="{{asset('public/backEnd/send_email.js')}}"></script>
<script src="{{asset('public/backEnd/backend.js')}}"></script>
<script src="{{asset('public/backEnd/js/admin_upload.js')}}"></script>
<script type="text/javascript" src="{{asset('public/backEnd/')}}/vendors/js/moment.min.js"></script>
<script type="text/javascript" src="{{asset('public/backEnd/')}}/js/bootstrap-datetimepicker.min.js"></script>
<script>
	"use strict";
    $(function () {
        $('#date').datepicker({
            keepOpen: true,
            minDate: 0,
            format: 'dd/mm/yyyy',
            icons:
                    { time: 'ti-alarm-clock',
                        date: 'ti-calendar',
                        up: 'ti-arrow-up',
                        down: 'ti-arrow-down',
                        previous: 'ti-arrow-left',
                        next: 'ti-arrow-right',
                        today: 'ti-agenda',
                        clear: 'ti-trash',
                        close: 'ti-close' }
        });
    })
</script>
<script>
	"use strict";
    $(function () {
        $('#time').datetimepicker({
            keepOpen: true,
            format: 'HH:mm',
            icons:
                    { time: 'ti-alarm-clock',
                        date: 'ti-calendar',
                        up: 'ti-arrow-up',
                        down: 'ti-arrow-down',
                        previous: 'ti-arrow-left',
                        next: 'ti-arrow-right',
                        today: 'ti-agenda',
                        clear: 'ti-trash',
                        close: 'ti-close' }
        });
    })
</script>
@endsection