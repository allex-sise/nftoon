@extends('backend.master')
@section('mainContent') 
<link rel="stylesheet" href="{{url('Modules/Pages/Assets/css/style.css')}}">  
<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>Banners</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="#">@lang('lang.frontend_CMS') </a>
                <a href="#">@lang('lang.home_page') </a>
            </div>
        </div>
    </div>
</section>
<section class="admin-visitor-area up_st_admin_visitor">
    <div class="container-fluid p-0">
        
        <div class="row"> 
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-title">
                            <h3 class="mb-30"> @lang('lang.update')
                                Banners
                            </h3>

                        </div>
                      
                        {{ Form::open(['class' => 'form-horizontal', 'files' => true, 'route' => 'banners-update',
                        'method' => 'POST', 'enctype' => 'multipart/form-data']) }} 
                         <input type="hidden" name="id" value="{{isset($editData)? $editData->id: ''}}"> 
                        <div class="white-box">
                                @if ($errors->any())
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif
                            <div class="add-visitor">  
                                {{-- HomePage --}}
                              
                                <div class="row mt-40">
                                    <div class="col-lg-12">
                                        <label>Banner Drops <span class="text-red">*</span></label> 
                                    </div>
                                
                                    <div class="col-lg-6"> 
                                        <div class="input-effect">
                                            <img height="200"  src="{{ file_exists(@$editData->banner_image_drops) ? asset(@$editData->banner_image_drops) : asset('public/frontend/img/banner/banner-img-1.png') }} " alt="">
                                        </div> 
                                    </div> 
                                    <div class="col-lg-6 mt-45" style="margin-top: 160px;">
                                        <div class="row no-gutters input-right-icon">
                                      
                                            <div class="col">
                                                <div class="input-effect">
                                                    <input class="primary-input form-control {{ $errors->has('banner_image_drops') ? ' is-invalid' : '' }}" type="text"
                                                            id="placeholderPhoto2"
                                                            placeholder=""
                                                            readonly="">
                                                    <span class="focus-border"></span>
                                                    @if ($errors->has('banner_image_drops'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('banner_image_drops') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <button class="primary-btn-small-input"
                                                        type="button">
                                                    <label class="primary-btn small fix-gr-bg"
                                                            for="photo2">@lang('lang.browse')</label>
                                                    <input type="file" class="d-none" name="banner_image_drops"
                                                    id="photo2">
                                                </button>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-40">
                                    <div class="col-lg-12">
                                        <label>Banner Categorii <span class="text-red">*</span></label> 
                                    </div>
                                
                                    <div class="col-lg-6"> 
                                        <div class="input-effect">
                                            <img height="200"  src="{{ file_exists(@$editData->banner_image_categories) ? asset(@$editData->banner_image_categories) : asset('public/frontend/img/banner/banner-img-1.png') }} " alt="">
                                        </div> 
                                    </div> 
                                    <div class="col-lg-6 mt-45" style="margin-top: 160px;">
                                        <div class="row no-gutters input-right-icon">
                                      
                                            <div class="col">
                                                <div class="input-effect">
                                                    <input class="primary-input form-control {{ $errors->has('banner_image_categories') ? ' is-invalid' : '' }}" type="text"
                                                            id="placeholderPhoto1"
                                                            placeholder=""
                                                            readonly="">
                                                    <span class="focus-border"></span>
                                                    @if ($errors->has('banner_image_categories'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('banner_image_categories') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <button class="primary-btn-small-input"
                                                        type="button">
                                                    <label class="primary-btn small fix-gr-bg"
                                                            for="photo1">@lang('lang.browse')</label>
                                                    <input type="file" class="d-none" name="banner_image_categories"
                                                    id="photo1">
                                                </button>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row mt-40">
                                    <div class="col-lg-12 text-center">
                                      <button class="primary-btn fix-gr-bg" data-toggle="tooltip" title=" test ">
                                            <span class="ti-check"></span>
                                            @if(isset($editData))
                                                @lang('lang.update')
                                            @else
                                                @lang('lang.save')
                                            @endif 
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {{ Form::close() }}
                    </div>
                </div>
            </div>
 
        </div>
    </div>
</section>


<script>
var fileInput = document.getElementById("photo1");
if (fileInput) {
    fileInput.addEventListener("change", showFileName);

    function showFileName(event) {
        var fileInput = event.srcElement;
        var fileName = fileInput.files[0].name;
        document.getElementById("placeholderPhoto1").placeholder = fileName;
    }
}
    </script>
 
    <script src="{{ asset('/')}}public/backEnd/backend_modules.js"></script>

@endsection
