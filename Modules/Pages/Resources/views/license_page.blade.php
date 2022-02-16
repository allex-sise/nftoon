@extends('backend.master')
@section('mainContent') 
<link rel="stylesheet" href="{{url('Modules/Pages/Assets/css/style.css')}}">  
<script src="https://cdn.ckeditor.com/4.5.1/standard/ckeditor.js"></script>
<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>Politica Cookies</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="#">@lang('lang.frontend_CMS') </a>
                <a href="#">@lang('lang.page') Politica Cookies </a>
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
                                    @lang('lang.page') Politica Cookies 
                            </h3>
                        </div>
                        {{ Form::open(['class' => 'form-horizontal', 'files' => true, 'route' => 'LicensePageUpdate',
                        'method' => 'POST', 'enctype' => 'multipart/form-data']) }} 
                         <input type="hidden" name="id" value="{{isset($editData1)? $editData1->id: ''}}"> 
                        <div class="white-box">
                            <div class="add-visitor">  
                                {{-- HomePage --}}
                                <div class="row mt-40">
                                    <div class="col-lg-12"> 
                                        <div class="input-effect">
                                            <input class="primary-input form-control{{ $errors->has('heading') ? ' is-invalid' : '' }}"
                                                type="text" name="heading" autocomplete="off" value="{{isset($editData1)? $editData1->heading:old('heading')}}">
                                            <label>@lang('lang.heading')-1<span class="text-red">*</span></label>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('heading'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('heading') }}</strong>
                                            </span>
                                            @endif
                                        </div> 
                                    </div> 
                                </div>
                                <div class="row mt-40">
                                        <div class="col-lg-12">
                                            <label>@lang('lang.description') <span class="text-red">*</span></label>
                                            <div class="input-effect">
                                                <textarea id="summernote"
                                                          class="primary-input form-control{{ $errors->has('heading_text') ? ' is-invalid' : '' }}"
                                                          name="heading_text" id="" cols="30" rows="10"
                                                          data-sample-short>{{isset($editData1)? @$editData1->heading_text: old('heading_text')}}</textarea>

                                                <span class="focus-border"></span>
                                                @if ($errors->has('heading_text'))
                                                    <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('heading_text') }}</strong>
                                            </span>
                                                @endif
                                            </div>
                                        </div>
                                    </div>

                                    
                                <div class="row mt-40 d-none">
                                    <div class="col-lg-12"> 
                                        <div class="input-effect">
                                            <input hidden class="primary-input form-control{{ $errors->has('heading2') ? ' is-invalid' : '' }}"
                                                type="text" name="heading2" autocomplete="off" value="{{isset($editData1)? $editData1->heading2:old('heading2')}}">
                                            <label>@lang('lang.heading')-2<span class="text-red">*</span></label>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('heading2'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('heading2') }}</strong>
                                            </span>
                                            @endif
                                        </div> 
                                    </div> 
                                </div>
                                <div class="row mt-40 d-none">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                            <textarea hidden class="primary-input form-control" cols="0" rows="4"
                                                        name="heading2_text">{{isset($editData1)? @$editData1->heading2_text: old('heading2_text')}}</textarea>
                                            <label>@lang('lang.heading_text') -2 <span class="text-red">*</span></label>
                                            <span class="focus-border textarea"></span>
                                            @if ($errors->has('heading2_text'))
                                                <span class="invalid-feedback d-block" role="alert">
                                                <strong>{{ $errors->first('heading2_text') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <div class="row mt-40">
                                    <div class="col-lg-12 text-center">
                                      <button class="primary-btn fix-gr-bg" data-toggle="tooltip" title=" test ">
                                            <span class="ti-check"></span>
                                            @if(isset($editData1))
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
</section>

</div>

    <script src="{{ asset('/')}}public/backEnd/backend_modules.js"></script>

@endsection
