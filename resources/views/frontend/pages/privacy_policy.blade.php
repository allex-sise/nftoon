@extends('frontend.master')
@push('css')
    
@endpush
@section('content')
 <!-- content begin -->
 <div class="no-bottom no-top" id="content">
            <div id="top"></div>
            @foreach ($privacyPolicies as $privacy_policy)    
            <!-- section begin -->
            <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>{{ @$privacy_policy->heading_title }}</h1>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->       

    <!-- privaci_polecy_area start -->
    <div class="privaci_polecy_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 offset-xl-2 col-12">
                    <div class="privacy_inner gray-bg">
                      
     
                        <div class="single_privacy">
                            <h2>{{ @$privacy_policy->heading_title }}</h2>
                            <p class="mb-20">{{ @$privacy_policy->sub_title }}</p>
                            @if (!empty(@$privacy_policy->image))
                                <img class="mb-20" width="780" height="auto" src="{{ url('/').'/'.@$privacy_policy->image }}" alt="">
                            @endif
                            <p>{!! @$privacy_policy->description !!}</p>
                        </div>
                     
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- privaci_polecy_area end -->
    @endforeach
</div>
 @endsection
 @push('js')
     
<script src="{{ asset('public/frontend/js/') }}/package.js"></script>
 @endpush