@extends('backend.master')
@section('mainContent')

@php
function showPicName($data){
$name = explode('/', $data);
return $name[4];
}
function showJoiningLetter($data){
$name = explode('/', $data);
return $name[3];
}
function showResume($data){
$name = explode('/', $data);
return $name[3];
}
function showOtherDocument($data){
$name = explode('/', $data);
return $name[3];
}

@endphp
<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>@lang('lang.affiliate')</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="">@lang('lang.view') @lang('lang.affiliate') </a>
            </div>
        </div>
    </div>
</section>
<section class="mb-40 student-details">
    <div class="container-fluid p-0">
        <div class="row">
         <div class="col-lg-3">
            <!-- Start Student Meta Information -->
            <div class="main-title">
                <h3 class="mb-20">@lang('lang.details') @lang('lang.affiliate') </h3>
            </div>
            <div class="student-meta-box">
                <div class="student-meta-top"></div>
                @if(!empty(@$data['user']->profile->image))
                <img class="student-meta-img img-100" src="{{asset(@$data['user']->profile->image)}}"  alt="">
                @else
                <img class="student-meta-img img-100" src="{{asset('public/uploads/vendor/vendor.jpg')}}"  alt="">
                @endif
                <div class="white-box">
                    <div class="single-meta mt-10">
                        <div class="d-flex justify-content-between">
                            <div class="name">
                                     @lang('lang.name') @lang('lang.affiliate')
                            </div>
                            <div class="value">

                                @if(isset($data['user'])){{@$data['user']->full_name}}@endif

                            </div>
                        </div>
                    </div>
                    <div class="single-meta">
                        <div class="d-flex justify-content-between">
                            <div class="name">
                                    @lang('lang.role') 
                            </div>
                            <div class="value">
                               @if(isset($data['user'])){{@$data['user']->role->name}}@endif
                           </div>
                       </div>
                   </div>
                    <div class="single-meta">
                        <div class="d-flex justify-content-between">
                            <div class="name">
                                 @lang('lang.date_of_joining')
                            </div>
                            <div class="value">
                                @if(isset($data['user']))
                                {{date('jS M, Y', strtotime(@$data['user']->created_at))}}
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Student Meta Information -->

            </div>

            <!-- Start Student Details -->
            <div class="col-lg-9 staff-details">                  

                        <div class="white-box">
                            <h4 class="stu-sub-head"> @lang('lang.info') @lang('lang.affiliate')</h4>
                            <div class="single-info">
                                    <div class="row">
                                        <div class="col-lg-2 col-md-6">
                                            <div class="">
                                                <h5>@lang('lang.email')</h5>
                                            </div>
                                        </div>    
                                        <div class="col-lg-4 col-md-7">
                                            <div class="">
                                                @if(isset($data['user'])){{@$data['user']->email}}@endif
                                            </div>
                                        </div>

                                        <div class="col-lg-2 col-md-5">
                                            <div class="">
                                                <h5>@lang('lang.company')</h5>
                                            </div>
                                        </div>
    
                                        <div class="col-lg-4 col-md-6">
                                            <div class="">
                                                @if(isset($data['user'])){{@$data['user']->profile->company_name}}@endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-info">
                                   <div class="row">
                                        <div class="col-lg-2 col-md-5">
                                                <div class="">
                                                    <h5>@lang('lang.country')</h5>
                                                </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="">
                                                @if(isset($data['user'])){{@$data['user']->profile->country->name}}@endif
                                            </div>
                                        </div>

                                        <div class="col-lg-2 col-md-5">
                                                <div class="">
                                                    <h5>@lang('lang.state')</h5>
                                                </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="">
                                                @if(isset($data['user'])){{@$data['user']->profile->state->name}}@endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-info">
                                   <div class="row">
                                        <div class="col-lg-2 col-md-5">
                                                <div class="">
                                                   <h5> @lang('lang.status')</h5>
                                                </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="">
                                                @if(isset($data['user']))
                                                  @if (@$data['user']->status == 1)
                                                            @lang('lang.active')
                                                            @else   
                                                            @lang('lang.pending')
                                                            @endif
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="white-box">
                             
                                <div class="my_coupon">
                            <div class="my_coupens_headeing mb-30">
                                <h3>Total Afiliati <b>({{ count($data['user']->referrals)  ?? '0' }})</b></h3>
                            </div>
                            <table class="table">
                                <tr>
                                    <th>@lang('lang.username') @lang('lang.affiliate')</th>
                                    <th>@lang('lang.added_time')</th>
                                    <th>@lang('status')</th>
                                </tr>
                                @foreach (@$data['affiliate'] as $item)
                                    <tr>
                                        <td>{{ @$item->username }}</td>
                                        <td>{{DateFormat(@$item->created_at)}}</td>
                                        <td>{{ @$item->status == 1 ?'Active':'Pending' }}</td>
                                    </tr>
                                @endforeach
                            </table>
                           
                            <div class="Pagination">
                                {{ $data['affiliate']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                            </div>
                        </div>
                        </div>
                    </div>
       </div>
    </div>
</section>
@endsection
