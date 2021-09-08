@extends('frontend.master')
@push('css')

    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_modal.css">

@endpush
@php 
    $homepage = Modules\Pages\Entities\InfixHomePage::where('active_status', 1)->first();
    $headerbnr = $data['drop']->dropicon;
@endphp 
@section('content')
<style>
.banner-area::before, .banner-area2::before, .banner-area3::before, .banner-area4::before{
    background-image: url("{{asset(@$headerbnr)}}")!important;
    background-size: cover;
    background-repeat: no-repeat;
    margin-top: 85px;
    height: 700px;
    background-position: center;
}
.banner-area2{
    height: 700px;
}
.section-padding1 {
    padding-top: 20px;
    padding-bottom: 120px;
}
.mg120{
    margin-top: 120px;
    margin-bottom: 120px;
}
.rowspecial{
    position: absolute;
    top: 80px;
    left: 0;
    width: 100%;
    padding-top: 250px;
    height: 700px;
    background: rgba(0,0,0,0.5);
}
.mgt50{
    margin-top: 50px;
}
    </style>

  <!-- banner-area start -->
    <div class="banner-area2" >
        <div class="container">
            <div class="row rowspecial">
                <div class="col-xl-8 offset-xl-2">
                     <div class="banner-info text-center mb-30">
                        <h2>{{ @$data['drop']->name}}</h2>
                        
                            @php
                            use Carbon\Carbon;
                            @endphp
                            @if ( $data['drop']->startdate ==  Carbon::now())
                            <div class="col-xl-10 offset-xl-2 mgt50">
                                <div class="col-md-4 float-left">
                                    <h3 class="h3clss">Drop-ul incepe in:</h3>
                                    <div data-countdown="{{ $data['drop']->startdate }}" style="font-size: 25px; color:#FFF;"></div>
                                </div>
                                @endif
                                @if ( $data['drop']->expdate >=  Carbon::now())
                                <div class="col-md-4 float-left">
                                    <h3 class="h3clss">Drop-ul se termina in:</h3>
                                    <div data-countdown="{{ $data['drop']->expdate }}" style="font-size: 25px; color:#FFF;"></div>
                                </div>
                            </div>
                            @else
                            <h3 class="h3clss">Drop-ul sa incheiat</h3>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- banner-area end -->
    <div class="white-box mg120">
        <div class="container">
            <h3 class="h3clss">{{ @$data['drop']->description}}</h3>
        </div>
    </div>
   
    <!-- latest-goods-start -->
        <div class="container">
            <div class="row align-items-end">
                <div class="col-xl-12">
                    <div class="section-title mb-40">
                        <h3>NFT-uri din drop</h3>
                        <!-- <h4>{{@$homepage->product_title_description}}</h4> -->
                    </div>
                </div>
            </div>
            <div class="row section-padding1">
                @foreach ($data['item'] as $item)
                    <!-- nft item begin -->
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <div class="nft__item">
                            <div class="de_countdown" data-year="2021" data-month="9" data-day="16" data-hour="8"></div>
                            <div class="author_list_pp">
                                <a href="{{ route('user.portfolio',@$item->og->username)}}">                                    
                                    <img class="lazy" src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                                    <i class="fa fa-check"></i>
                                </a>
                            </div>
                            <div class="nft__item_wrap">
                                <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                    <img src="{{ asset(@$item->icon) }}" class="lazy nft__item_preview" alt="">
                                </a>
                            </div>
                            <div class="nft__item_info">
                                <a href="{{ route('singleProduct',[str_replace(' ', '-',@$item->title),@$item->id])}}">
                                    <h4>{{ @$item->title}}</h4>
                                </a>
                                <div class="nft__item_price">
                                {{ @$item->Re_item}} lei
                                </div>
                                <div class="nft__item_action">
                                    <a href="#">Cumpara Acum</a>
                                </div>
                                <!-- <div class="nft__item_like">
                                    <i class="fa fa-heart"></i><span>50</span>
                                </div>                             -->
                            </div> 
                        </div>
                    </div>                 
                    <!-- nft item begin -->
                @endforeach
                <div class="Pagination">
                    {{ @$data['item']->onEachSide(1)->links('frontend.paginate.frontentPaginate') }}
                </div>

            </div>
        </div>
        
    <!-- latest-goods-end -->
@endsection
@push('js')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.countdown/2.2.0/jquery.countdown.min.js" integrity="sha512-lteuRD+aUENrZPTXWFRPTBcDDxIGWe5uu0apPEn+3ZKYDwDaEErIK9rvR0QzUGmUQ55KFE2RqGTVoZsKctGMVw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$('[data-countdown]').each(function() {
  var $this = $(this), finalDate = $(this).data('countdown');
  $this.countdown(finalDate, function(event) {
    $this.html(event.strftime('%D zile <br /> %H:%M:%S'));
  });
});
</script>
@endpush