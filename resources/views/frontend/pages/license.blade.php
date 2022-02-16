@extends('frontend.master')
@push('css')
    
    <link rel="stylesheet" href="{{ asset('public/frontend/') }}/license.css">
@endpush
@php 
  $banner_coller = App\FrontSetting::where('active_status', 1)->first();
@endphp 
@section('content')
 <!-- content begin -->
 <div class="no-bottom no-top" id="content">
            <div id="top"></div>
           
            <!-- section begin -->
            <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>{{ @$data->heading }}</h1>
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
                            <h2>{{ @$data->heading }}</h2>
              
                            <p>{!! @$data->heading_text !!}</p>
                        </div>
                     
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- privaci_polecy_area end -->
 

</div>
 @endsection
 @push('js')
     
<script src="{{ asset('public/frontend/js/') }}/package.js"></script>
 @endpush