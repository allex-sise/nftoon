@extends('frontend.master')
@push('css')
    
@endpush
@section('content')

<!-- start page title area -->
<div class="rn-breadcrumb-inner ptb--30">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <h5 class="title text-center text-md-start">@lang('lang.faq')</h5>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-list">
                        <li class="item"><a href="{{ url('/')}}">Acasa</a></li>
                        <li class="separator"><i class="feather-chevron-right"></i></li>
                        <li class="item current">@lang('lang.faq')</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end page title area -->
     <!-- start service area -->
     <div class="rn-service-area rn-section-gapTop">
        <div class="container">
            <div class="row">
                <div class="col-12 mb--50">
                    <h3 class="title" data-sal-delay="150" data-sal="slide-up" data-sal-duration="800">Cumpara si Vinde NFT-uri</h3>
                </div>
            </div>
            <div class="row g-5">
                <!-- start single service -->
                <div class="col-xxl-3 col-lg-4 col-md-6 col-sm-6 col-12">
                    <div data-sal="slide-up" data-sal-delay="150" data-sal-duration="800" class="rn-service-one color-shape-7">
                        <div class="inner">
                            <div class="icon">
                                <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/shape-7.png" alt="Shape">
                            </div>
                            <div class="subtitle">Pasul-01</div>
                            <div class="content">
                                <h4 class="title"><a href="#">Creaza un cont</a></h4>
                                <p class="description">Creaza-ti un cont acum in cel mai rapid mod, si te poti apuca de cumparat NFT-uri de la artisti locali si internationali</p>
                                <a class="read-more-button" href="#"><i class="feather-arrow-right"></i></a>
                            </div>
                        </div>
                        <a class="over-link" href="#"></a>
                    </div>
                </div>
                <!-- End single service -->
                <!-- start single service -->
                <div class="col-xxl-3 col-lg-4 col-md-6 col-sm-6 col-12">
                    <div data-sal="slide-up" data-sal-delay="200" data-sal-duration="800" class="rn-service-one color-shape-1">
                        <div class="inner">
                            <div class="icon">
                                <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/shape-1.png" alt="Shape">
                            </div>
                            <div class="subtitle">Pasul-02</div>
                            <div class="content">
                                <h4 class="title"><a href="#">Adauga Fonduri</a></h4>
                                <p class="description">Nu ai nevoie de nici un wallet pe blockchain! Poti adauga fonduri pe Nftoon foarte rapid si in siguranta folosind cardul bancar!</p>
                                <a class="read-more-button" href="#"><i class="feather-arrow-right"></i></a>
                            </div>
                        </div>
                        <a class="over-link" href="#"></a>
                    </div>
                </div>
                <!-- End single service -->
                <!-- start single service -->
                <div class="col-xxl-3 col-lg-4 col-md-6 col-sm-6 col-12">
                    <div data-sal="slide-up" data-sal-delay="250" data-sal-duration="800" class="rn-service-one color-shape-5">
                        <div class="inner">
                            <div class="icon">
                                <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/shape-5.png" alt="Shape">
                            </div>
                            <div class="subtitle">Pasul-03</div>
                            <div class="content">
                                <h4 class="title"><a href="#">Alege NFT-urile dorite</a></h4>
                                <p class="description">Alege din multitudinea de NFT-uri prezente pe platforma NFToon, cumpara folosind toons, foarte rapid si usor si mai ales fara costuri suplimentare!</p>
                                <a class="read-more-button" href="#"><i class="feather-arrow-right"></i></a>
                            </div>
                        </div>
                        <a class="over-link" href="#"></a>
                    </div>
                </div>
                <!-- End single service -->
                <!-- start single service -->
                <div class="col-xxl-3 col-lg-4 col-md-6 col-sm-6 col-12">
                    <div data-sal="slide-up" data-sal-delay="300" data-sal-duration="800" class="rn-service-one color-shape-6">
                        <div class="inner">
                            <div class="icon">
                                <img src="{{ asset('public/frontend/newassets') }}/assets/images/icons/shape-6.png" alt="Shape">
                            </div>
                            <div class="subtitle">Pasul-04</div>
                            <div class="content">
                                <h4 class="title"><a href="#">Vinde NFT-urile</a></h4>
                                <p class="description">Poti revinde oricand orice NFT achizitionat pe NFToons, doar intri la Colectia Ta si poti seta pretul de vanzare si sa incepi sa profiti de oportunitatea de a genera venituri imediat!</p>
                                <a class="read-more-button" href="#"><i class="feather-arrow-right"></i></a>
                            </div>
                        </div>
                        <a class="over-link" href="#"></a>
                    </div>
                </div>
                <!-- End single service -->
            </div>
        </div>
    </div>
    <!-- End service area -->
    <!-- support center -->
    <div class="rn-support-area rn-section-gapTop">
        <div class="container">
            <div class="row g-6">
                <div class="col-lg-6">
                    <div class="rn-support-read">
                    @foreach ($faqs_odd as $faq) 
                        <div class="read-card">
                            <h4>{{ @$faq->question_title }}</h4>
                            <div class="content">
                                <p>{{ @$faq->question_answer }}</p>
                            </div>
                        </div>
                    @endforeach
                        <a href="create.html" class="btn btn-primary mr--15">Creaza Cont</a>
                        <a href="{{url('/contact')}}" class="btn btn-primary-alta">Contacteaza-ne</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="support-accordion">
                        <div class="accordion" id="accordionExample">
                       
                        @foreach ($faqs_even as $faq) 
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne{{ @$faq->id }}">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne{{ @$faq->id }}" aria-expanded="false" aria-controls="collapseOne{{ @$faq->id }}">
                                    {{ @$faq->question_title }}
                                        <i class="feather-chevron-up"></i>
                                    </button>
                                </h2>
                                <div id="collapseOne{{ @$faq->id }}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <strong> {{ @$faq->question_answer }}</strong>
                                    </div>
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