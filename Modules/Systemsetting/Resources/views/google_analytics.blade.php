
@extends('backend.master')
@section('mainContent')
<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>@lang('lang.third_party_API')</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="#">@lang('lang.system_settings')</a>
                <a href="#">@lang('lang.third_party_API')</a>
            </div>
        </div>
    </div>
</section>
<section class="admin-visitor-area up_st_admin_visitor">
    <div class="container-fluid p-0">
       
        <div class="row mt-40">

            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-title">
                            <h3 class="mb-30">
                                  
                               @lang('lang.setup_third_party_APIs')
                            </h3>
                        </div>
                        {{ Form::open(['class' => 'form-horizontal', 'files' => true, 'route' => 'google_analytics_setup',
                        'method' => 'POST', 'enctype' => 'multipart/form-data']) }}

                        <div class="white-box">
                            <div class="add-visitor">
                                <div class="row">
                                    <div class="col-lg-12">

                                        @if (env('ANALYTICS_VIEW_ID'))
                                                
                                        @endif

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="input-effect">
                                                    <input class="primary-input form-control{{ $errors->has('view_id') ? ' is-invalid' : '' }}"
                                                        type="text"  name="view_id" autocomplete="off" value="{{@$view_id}}" >
                                                    <label>@lang('lang.GOOGLE_ANALYTICS_VIEW_ID') <span>*</span></label>
                                                    <span class="focus-border"></span>
                                                    @if ($errors->has('view_id'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('view_id') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-effect">
                                                    <input class="primary-input form-control{{ $errors->has('site_tag_id') ? ' is-invalid' : '' }}"
                                                        type="text"  name="site_tag_id" autocomplete="off" value="{{@$third_party_api->ga_site_tag_id}}" >
                                                    <label>@lang('lang.ga_site_tag_id') <span>*</span></label>
                                                    <span class="focus-border"></span>
                                                    @if ($errors->has('site_tag_id'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('site_tag_id') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mt-45">
                                                <div class="row no-gutters input-right-icon">
                                              
                                                    <div class="col">
                                                        <div class="input-effect">
                                                            <input class="primary-input form-control {{ $errors->has('ga_service_account') ? ' is-invalid' : '' }}" type="text"
                                                                    id="placeholderPhoto"
                                                                    placeholder="{{@$third_party_api->ga_service_account != ""? @$third_party_api->ga_service_account:'Service Account Json File *'}}"
                                                                    readonly="">
                                                            <span class="focus-border"></span>
                                                            @if ($errors->has('ga_service_account'))
                                                            <span class="invalid-feedback" role="alert">
                                                                <strong>{{ $errors->first('ga_service_account') }}</strong>
                                                            </span>
                                                            @endif
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <button class="primary-btn-small-input"
                                                                type="button">
                                                            <label class="primary-btn small fix-gr-bg"
                                                                    for="photo">@lang('lang.browse')</label>
                                                            <input type="file" class="d-none" name="ga_service_account"
                                                            id="photo">
                                                        </button>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mt-25">
                                                <div class="input-effect mt-20">
                                                    <button class="primary-btn fix-gr-bg" data-toggle="tooltip" title="">
                                                        {{-- <span class="ti-check"></span> --}}
                                                        @lang('lang.setup_google_analytics')
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                   
                                    </div>
                                </div>

                                
                            </div>
                        {{-- </div> --}}
                        {{ Form::close() }}

<hr>

                        {{ Form::open(['class' => 'form-horizontal', 'files' => true, 'route' => 'fixer_setup',
                        'method' => 'POST', 'enctype' => 'multipart/form-data']) }}

                        {{-- <div class="white-box"> --}}
                            <div class="add-visitor">
                                <div class="row">
                                    <div class="col-lg-12">

                                        

                                        <div class="row">
                                            <div class="col-lg-6 mt-20">
                                                <div class="input-effect">
                                                    <input class="primary-input form-control{{ $errors->has('access_key') ? ' is-invalid' : '' }}"
                                                        type="text"  name="access_key" autocomplete="off" value="{{@$access_key}}" >
                                                    <label>@lang('lang.fixer_access_key') <span>*</span></label>
                                                    <span class="focus-border"></span>
                                                    @if ($errors->has('access_key'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('access_key') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-effect mt-20">
                                                    <button class="primary-btn fix-gr-bg" data-toggle="tooltip" title="">
                                                        {{-- <span class="ti-check"></span> --}}
                                                        @lang('lang.setup_fixer') 
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                   
                                    </div>
                                </div>

                                
                            </div>
                        </div>
                        {{ Form::close() }}
                    </div>
                </div>
            </div>
            @if (moduleStatusCheck('AmazonS3') == true)
            <div class="col-lg-12 mt-20">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-title">
                            <h3 class="mb-30">
                                  
                                @lang('lang.Amazon_S3')
                            </h3>
                        </div>
                        {{ Form::open(['class' => 'form-horizontal', 'files' => true, 'route' => 'AwsS3SettingSubmit',
                        'method' => 'POST', 'enctype' => 'multipart/form-data']) }}

                        <div class="white-box">
                            <div class="add-visitor">
                                <div class="row">
                                    <div class="col-lg-12">

                                       

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="input-effect">
                                                    <input class="primary-input form-control{{ $errors->has('access_key_id') ? ' is-invalid' : '' }}"
                                                        type="text"  name="access_key_id" value="{{env('AWS_ACCESS_KEY_ID')??''}}" >
                                                    <label>Access Key Id <span>*</span></label>
                                                    <span class="focus-border"></span>
                                                    @if ($errors->has('access_key_id'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('access_key_id') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-effect">
                                                    <input class="primary-input form-control{{ $errors->has('secret_key') ? ' is-invalid' : '' }}"
                                                        type="text"  name="secret_key" value="{{env('AWS_SECRET_ACCESS_KEY')??''}}" >
                                                    <label>Secret Key <span>*</span></label>
                                                    <span class="focus-border"></span>
                                                    @if ($errors->has('secret_key'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('secret_key') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 mt-20">
                                                <div class="input-effect">
                                                    <input class="primary-input form-control{{ $errors->has('default_region') ? ' is-invalid' : '' }}"
                                                        type="text"  name="default_region" value="{{env('AWS_DEFAULT_REGION')??''}}" >
                                                    <label>Default Region <span>*</span></label>
                                                    <span class="focus-border"></span>
                                                    @if ($errors->has('default_region'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('default_region') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mt-20">
                                                <div class="input-effect">
                                                    <input class="primary-input form-control{{ $errors->has('bucket') ? ' is-invalid' : '' }}"
                                                        type="text"  name="bucket" value="{{env('AWS_BUCKET')??''}}" >
                                                    <label>Bucket <span>*</span></label>
                                                    <span class="focus-border"></span>
                                                    @if ($errors->has('bucket'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('bucket') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="col-12 mb-10 mt-15 text-center">
                                            <div class="input-effect mt-20">
                                                <button class="primary-btn fix-gr-bg" data-toggle="tooltip" title="">
                                                    {{-- <span class="ti-check"></span> --}}
                                                    @lang('lang.setup_aws3') 
                                                </button>
                                            </div>
                                        </div>
                                   
                                    </div>
                                </div>

                                
                            </div>
                        {{-- </div> --}}
                        {{ Form::close() }}

                    </div>
                </div>
            </div>     
             @endif
            
        </div>

       
    </div>
</section>
<link rel="stylesheet" href="{{asset('Modules/Systemsetting/Resources/assets/')}}/css/add_payment.css"/>
 <script src="{{asset('Modules/Systemsetting/Resources/assets/')}}/js/systemSetting.js"></script>
 
@endsection
