@extends('frontend.master')
@push('css')

    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_modal.css">

@endpush

@section('content')
<style>
.banner-area::before, .banner-area2::before, .banner-area3::before, .banner-area4::before{
    background-image: url("{{ asset('public/frontend/imaginibanner/hmm.png') }}")!important;
    background-size: contain;
    background-repeat: no-repeat;
    margin-top: 85px;
}
.banner-area2{
    height: 600px;
}
.section-padding1 {
    padding-top: 20px;
    padding-bottom: 120px;
}
.latest-goods-area .single-goods .goods-thumb {
    overflow: hidden;
    height: 540px!important;
    border-radius: 7px!important;
    border-bottom-left-radius: 0px!important;
    border-bottom-right-radius: 0px!important;
}
.latest-goods-area .single-goods .goods-thumb img {
    max-height: 540px!important;
}
.mg30{
    margin: 30px!important;
}
.mg140top{
    margin-top: 140px!important;
}
    </style>
  <!-- banner-area start -->
    <div class="banner-area2" >
        <div class="container">
            <div class="row">
                <div class="col-xl-8 offset-xl-2">
                 
                </div>
            </div>
        </div>
    </div>
    <!-- banner-area end -->

    <!-- latest-goods-start -->
    <div class="features-area section-padding1" onscroll="OnScroll()">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-12">
                <div class="section-title text-left mb-70">
                <h3>DROPS</h3>
                    <h4>
Minted from drops are sold directly by the creator. You can buy them here before they sell out - or purchase them from other users on the secondary marketplace.</h4>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-xl-12">
                <div class="features-wrap latest-goods-area" id="">
                @foreach ($data['drop'] as $drop)
                <div class="col-xl-10 col-md-10 grid-item cat1 cat1 float-left pull-left mg30 mg20px">
                    <div class="single-goods">
                        <div class="col-xl-9 float-left">
                        <h3><a href="http://localhost/mintedfinal/item/the-bitcoin-angel-(open-edition)-#1569/4157/1">{{ $drop->name }}</a></h3> 

                            <div class="goods-thumb">
                                <a href="http://localhost/mintedfinal/item/the-bitcoin-angel-(open-edition)-#1569/4157/1">
                                    <img height="540" src="{{asset(@$drop->dropicon)}}" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-3 float-left">
                        <div class="good-info mg140top">
                            <div class="good-title good-titledrop">
                                <p> {{ $drop->description }}</p>
                            </div>
                        </div>
                        <div class="good-info good-infodrop" style="padding-top:0px;">
                            <div class="good-title good-titledrop">
                                <h3 class="h3clss">Drop-ul expira pe:</h3>
                                <div data-countdown="{{ $drop->expdate }}" style="font-size: 25px;"></div>
                             
                                <!-- <div>Registration closes in <span id="time">05:00</span> minutes!</div> -->
                                   
                                 

                            </div>
                        </div>
                        <div class="good-info good-infodrop" style="padding-top:0px;">
                            <div class="good-title good-titledrop">
                                <a class="black-btn specialbuton" href="#"> <span class="name"> Vezi Colectia</span> <span class="prise"></span> </a>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                @endforeach
                </div>
            </div>
            <div class="col-lg-12">
                <div class="view-features text-center mt-80">
                   <a href="{{ route('feature_item')}}"  class="black-btn">Vezi toate Drop-urile</a>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- latest-goods-end -->
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/filter.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.countdown/2.2.0/jquery.countdown.min.js" integrity="sha512-lteuRD+aUENrZPTXWFRPTBcDDxIGWe5uu0apPEn+3ZKYDwDaEErIK9rvR0QzUGmUQ55KFE2RqGTVoZsKctGMVw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$('[data-countdown]').each(function() {
  var $this = $(this), finalDate = $(this).data('countdown');
  $this.countdown(finalDate, function(event) {
    $this.html(event.strftime('%D zile %H:%M:%S'));
  });
});
</script>
@endpush