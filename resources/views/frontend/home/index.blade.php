@extends('frontend.master')
@push('css')
  
@endpush
@section('content')

@include('frontend.partials.banner')
@php 
$homepage = Modules\Pages\Entities\InfixHomePage::where('active_status', 1)->first();
@endphp 
<style>
.dark-scheme .scsetion{
    background: #21273E!important;
}
.light-scheme .scsetion{
    background: #eee!important;
}
</style>
<div class="features-area section-padding1" onscroll="OnScroll()">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-6 offset-xl-3">
                <div class="section-title text-center mb-70">
                <h3>Nu ratati nici un drop! 👀</h3>
                    {{-- <p>{{$homepage->feature_title_description}}</p> --}}
                    <h4>Abonați-vă la lista noastră ultra-exclusivă de drop și fiți primul care știe despre viitoarele drop-uri Minted.</h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="view-features text-center">
                    <div class="col-xl-12 col-md-12">
                        <input name="company_name" type="text" placeholder="Adresa ta de email" value="" style="border-radius: 0px!important; padding: 13px; width: 400px;">
                        <button type="submit" class="black-btn" style="padding: 8px 17px; border-radius: 2px; margin-left: 8px;">Abonare</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- newsletter-area-end -->

<section id="section-hero" class="no-bottom scsetion" aria-label="section" style="background-size: cover; min-height: 1000px;">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <h2>DROPS</h2>
                            <div class="small-border bg-color-2"></div>
                            <h4>{{$homepage->feature_title_description}}</h4>
                        </div>
                    </div>
                </div>
                <div class="d-carousel" style="background-size: cover; margin-top: 40px;">
                    <div id="item-carousel-big" class="owl-carousel wow fadeIn owl-loaded owl-drag animated" style="background-size: cover; visibility: visible; animation-name: fadeIn;">
           
                    <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-1263px, 0px, 0px); transition: all 0s ease 0s; width: 4631px;">
                    @foreach ($data['drop'] as $drop)
                        <div class="owl-item cloned" style="width: 396px; margin-right: 25px;">
                            <div class="nft_pic" style="background-size: cover;">                            
                                <a href="{{ route('singleDrop',@$drop->slug) }}">
                                    <span class="nft_pic_info">
                                        <span class="nft_pic_title">{{ $drop->name }}</span>
                                        <span class="nft_pic_by">{{ $drop->description }}</span>
                                        @php
                                            $date = $drop->expdate;
                                            $day_year = date('Y', strtotime($date));
                                            $day_name = date('j', strtotime($date));
                                            $day_month = date('n', strtotime($date));
                                            $day_hour = date('H', strtotime($date));
                                        @endphp
                                        <span class="nft_pic_title" style="font-size: 15px!important; margin-top: 10px;">Expira in</span>
                                        <div class="de_countdown" style="left: 40px; margin-top: 10px;" data-year="{{$day_year}}" data-month="{{$day_month}}" data-day="{{$day_name}}" data-hour="{{$day_hour}}"></div>
                                    </span>
                                </a>
                                <div class="nft_pic_wrap" style="background-size: cover;">
                                    <img style="min-height: 600px; max-height: 600px;" src="{{asset(@$drop->dropicon)}}" class="lazy img-fluid" alt="">
                                </div>
                            </div>
                        </div>
                    @endforeach
                    </div></div><div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div><div class="owl-dots disabled"></div></div>
                        <div class="d-arrow-left" style="background-size: cover; opacity: 1; display: block;"><i class="fa fa-angle-left"></i></div>
                        <div class="d-arrow-right" style="background-size: cover; opacity: 1; display: block;"><i class="fa fa-angle-right"></i></div>
                </div>
              
            <div class="col-lg-12" style="margin-top: 120px;">
                <div class="view-features text-center mt-80">
                   <a href="{{ route('dropsAll')}}"  class="black-btn">Vezi toate Drop-urile</a>
                </div>
            </div>
            </section>


<!-- features-area-end -->



@php
   $infix_general_settings = app('infix_general_settings');
@endphp

<section class="latest-goods-area" id="section-nfts">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="text-center">
                                <h2>{{$homepage->product_title}}</h2>
                                <div class="small-border bg-color-2"></div>
                                <h4>{{$homepage->product_title_description}}</h4>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="currency_symbol" value="{{@$infix_general_settings->currency_symbol}}">
         
                    <div class="row wow fadeIn">                        
                        <!-- nft item begin -->
                       <div class="row grid databox " id="databox">
                       </div>

                        <div class="col-md-12 text-center">
                            <a href="#" id="loadmore" class="btn-main wow fadeInUp lead">Arata mai multe</a>
                        </div>                                              
                    </div>
                </div>
            </section>
@if (@$free_items_count >0)
<!-- Free item Start -->
<div class="features-area section-padding1 pt-0" onscroll="OnScroll()">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-6 offset-xl-3">
                <div class="section-title text-center mb-70 mt-4">
                <h3>@lang('lang.free_product_of_the_month')</h3>
                    {{-- <p>{{$homepage->feature_title_description}}</p> --}}
                    <h4>{{$homepage->feature_title_description}}</h4>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- Free item end -->
@endif
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/item_load.js"></script>
<script src="{{ asset('public/frontend/js/') }}/filter.js"></script>
@endpush