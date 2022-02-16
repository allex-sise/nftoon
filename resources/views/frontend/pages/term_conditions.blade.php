@extends('frontend.master')
@push('css')
    
@endpush
@section('content')
 <!-- content begin -->
 <div class="no-bottom no-top" id="content">
            <div id="top"></div>
            @foreach ($term_conditions as $term_condition)  
            <!-- section begin -->
            <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>{{ @$term_condition->heading_title }}</h1>
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
                            <h2>{{ @$term_condition->heading_title }}</h2>
                            <span>{{ @$term_condition->sub_title }}</span>
                            
                            @if (!empty(@$term_condition->image))
                                <img class="mb-20 mt-20" width="780" height="auto" src="{{ url('/').'/'.@$term_condition->image }}" alt="">
                            @endif
                            
                            
                            <p>{{   @$term_condition->short_description }}</p>
                            <p>{!! @$term_condition->description !!}</p>
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