@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/kn_base.css">
@endpush
@section('content')


<!-- start page title area -->
<div class="rn-breadcrumb-inner ptb--30">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <h5 class="title text-center text-md-start">@lang('lang.knowledge_base')</h5>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-list">
                        <li class="item"><a href="{{ url('/')}}">Acasa</a></li>
                        <li class="separator"><i class="feather-chevron-right"></i></li>
                        <li class="item current">@lang('lang.knowledge_base')</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end page title area -->
    
    <!-- support center -->
    <div class="rn-support-area rn-section-gapTop">
        <div class="container">
            <div class="row g-6">
                <div class="col-lg-4">
                    <div class="rn-support-read">
                        <div class="my_custom_navs gray-bg">
                            <h5>@lang('lang.knowledge_base') @lang('lang.Category')</h5>
                            <div class="nav flex-column" id="v-pills-tab" role="tablist"
                                aria-orientation="vertical">
                                @foreach ($know_base_categories as $key=> $category)  
                                    <a class="nav-link @if($key==0) show active @endif btn btn-primary-alta" style="margin-bottom: 15px!important;" id="v-pills-home-tab" data-toggle="pill"
                                        href="#v-pills-home{{ @$category->id }}" role="tab" aria-controls="v-pills-home"
                                        aria-selected="true">{{ @$category->name }}</a>
                                    @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="support-accordion">
                        <div class="tab-content" id="v-pills-tabContent">
                            @foreach ($know_base_categories as $key=> $category)
                            <div class="tab-pane fade  @if($key==0) show active @endif " id="v-pills-home{{ @$category->id }}" role="tabpanel"
                                aria-labelledby="v-pills-home-tab">
                                <div class="single_knowledge_tab accordion-container">
                                    <nav>
                                        <ul>
                                            
                                            @foreach ($category->firstQuestion as $title_question)
                                            <li>
                                                <div class="set">
                                                    <a style="font-size: 17px; font-weight: 600;">
                                                        {{ @$title_question->first_question }}
                                                    </a>
                                                    <div class="content">
                                                        <div id="accordion">
                                                            <div class="accordion" id="accordionExample">
                                                            @foreach ($title_question->secondQuestion as $sub_q_answer)
                                                                <div class="accordion-item">
                                                                    <h2 class="accordion-header" id="headingOne{{ @$sub_q_answer->id }}">
                                                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne{{ @$sub_q_answer->id }}" aria-expanded="false" aria-controls="collapseOne{{ @$sub_q_answer->id }}">
                                                                        {{ @$sub_q_answer->sub_question }}
                                                                            <i class="feather-chevron-up"></i>
                                                                        </button>
                                                                    </h2>
                                                                    <div id="collapseOne{{ @$sub_q_answer->id }}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                                        <div class="accordion-body">
                                                                            <strong>  {!! @$sub_q_answer->answer !!}</strong>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            @endforeach
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                {{-- <hr> --}}
                                            </li>
                                            @endforeach
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                                @endforeach
                        </div>
                        
             
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- support center end -->

 @endsection
 @push('js')
   
<script src="{{ asset('public/frontend/js/') }}/package.js"></script>

 @endpush