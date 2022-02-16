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
.scsetion{
    min-height: 1000px!important;
    background-size: cover;
}
.mgbutton50{
    margin-bottom: 50px;
}
.footer-area .footer-top {
  padding-top: 50px!important;
  padding-bottom: 25px;
}
.btnnewsletter{
    padding: 8px 17px; 
    border-radius: 2px; 
    margin-left: 8px;
}
.inputnewsletter{
    border-radius: 0px!important; 
    padding: 13px; 
    width: 400px;
}
@media only screen and (max-width: 767px) {
.inputnewsletter{
    width: 100%;
    margin-bottom: 20px;
}
.section-title h4 {
    font-size: 16px;
    color: #888888;
    font-weight: 300;
    line-height: 25px;
    margin-bottom: 13px;
}
h3 {
    font-size: 19px!important;
}
}
</style>
<div class="features-area section-padding1" onscroll="OnScroll()">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-6 offset-xl-3">
                <div class="section-title text-center mb-70">
                <h3>Nu rata nici un drop! 👀</h3>
                    {{-- <p>{{$homepage->feature_title_description}}</p> --}}
                    <h4>Aboneaza-te la lista noastra ultra-exclusiva de drop si fi primul care afla despre viitoarele drop-uri Minted.</h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="view-features text-center">
                    <div class="col-xl-12 col-md-12">
                    <form action="{{ route('store_newsletter') }}" method="POST">
                    @csrf
                        <input name="email" type="email" class="inputnewsletter" placeholder="Adresa ta de email">
                        <input type="submit" class="black-btn btnnewsletter" value="Abonare">
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- newsletter-area-end -->

<section id="section-hero" class="no-bottom scsetion" aria-label="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <h2>DROPS</h2>
                            <div class="small-border bg-color-2"></div>
                            <h4 class="mgbutton50">{{$homepage->feature_title_description}}</h4>
                        </div>
                    </div>
                </div>
                <div class="d-carousel">
                    <div id="item-carousel-big" class="owl-carousel wow fadeIn">
                    @foreach ($data['drop'] as $drop)
                        <div class="nft_pic" style="background-size: cover;">                            
                            <a href="{{ route('singleDrop',@$drop->slug) }}">
                                <span class="nft_pic_info">
                                    <span class="nft_pic_title">{{ $drop->name }}</span>
                                    <span class="nft_pic_by">{{ $drop->description }}</span>
                                    @php
                                        $date = $drop->startdate;
                                        $day_year = date('Y', strtotime($date));
                                        $day_name = date('j', strtotime($date));
                                        $day_month = date('n', strtotime($date));
                                        $day_hour = date('H', strtotime($date));
                                    @endphp
                                
                                    <span class="nft_pic_title" style="font-size: 15px!important; margin-top: 10px;">Incepe in</span>
                                    <div class="de_countdown" style="left: 40px; margin-top: 10px;" data-year="{{$day_year}}" data-month="{{$day_month}}" data-day="{{$day_name}}" data-hour="{{$day_hour}}"></div>
                                </span>
                            </a>
                            <div class="nft_pic_wrap" style="background-size: cover;">
                                <img style="min-height: 600px; max-height: 600px;" src="{{asset(@$drop->dropicon)}}" class="lazy img-fluid" alt="">
                            </div>
                        </div>
                    @endforeach

                    </div>
                        <div class="d-arrow-left"><i class="fa fa-angle-left"></i></div>
                        <div class="d-arrow-right"><i class="fa fa-angle-right"></i></div>
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



<section id="section-nfts">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="text-center">
                    <h2>{{$homepage->product_title}}</h2>
                    <div class="small-border bg-color-2"></div>
                    <h4 class="mgbutton50">{{$homepage->product_title_description}}</h4>
                </div>
            </div>
        </div>
        <div class="row wow fadeIn">                        
            <!-- nft item begin -->
            @foreach (@$data['featured'] as $item)
            <!-- nft item begin -->
            <div class="d-item col-lg-3 col-md-6 col-sm-6 col-xs-12 float-left">
                <div class="nft__item">
                    <!-- <div class="de_countdown" data-year="2021" data-month="9" data-day="16" data-hour="8"></div> -->
                    <div class="author_list_pp">
                        <a href="{{ route('user.portfolio',@$item->og->username)}}">                                    
                            <img class="lazy" src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                            <i class="fa fa-check"></i>
                        </a>
                        
                    </div>
                    <div class="nft__item_wrap">
                        <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                        @if (@$item->file == 'img')
                            <img src="{{ asset(@$item->icon) }}" class="lazy nft__item_preview" alt="">
                        
                            @elseif(@$item->file == 'video')
                            <video width="100%" height="100%" class="lazy nft__item_preview" autoplay muted controls loop>
                            <source src="{{ asset(@$item->main_file) }}" type="video/mp4">
                            
                            Your browser does not support the video tag.
                        </video>
                        @endif
                        </a>
                    </div>
                    <div class="nft__item_info">
                        <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                            <h4>{{ $item->title}}</h4>
                        </a>
                        <div class="nft__item_price">
                        {{ $item->Re_item}} lei
                        </div>
                        <div class="nft__item_action">
            
                            <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}" class="heart">Cumpara Acum</a>
                        
                        </div>
                        <!-- <div class="nft__item_like">
                            <i class="fa fa-heart"></i><span>50</span>
                        </div>                             -->
                    </div> 
                </div>
            </div>                 
            <!-- nft item begin -->

            @endforeach
            <!-- nft item end -->
            <div class="col-md-12 text-center">
                <a href="#" id="loadmore" class="black-btn wow fadeInUp">Arata mai multe</a>
            </div>  
            
            <div class="col-md-12 text-center" >
                <a href="{{ route('categoryAll') }}" id="butons" class="black-btn wow fadeInUp">Vezi toate NFT-urile</a>
            </div> 
        </div>
    </div>
</section>

@endsection
@push('js')
<script>
$("#butons").hide();

</script>

<script src="{{ asset('public/frontend/js/') }}/item_load.js"></script>
@endpush