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
    height: 300px!important;
    border-radius: 7px!important;
    border-bottom-left-radius: 0px!important;
    border-bottom-right-radius: 0px!important;
}
.latest-goods-area .single-goods .goods-thumb img {
    max-height: 300px!important;
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
.imgrotunda{
    position: relative;
    height: 100px!important;
    width: 100px!important;
    border-radius: 50%!important;
    top: -50px!important;
    left: 32px!important;
    border: 5px solid #FFF;
}
.fontsize40{
    font-size: 40px!important;
}
.gd2{
    padding-top: 0px!important;
    margin-top: -30px!important;
    padding: 0px 5px!important;
}
.textlimit {
   overflow: hidden;
   text-overflow: ellipsis;
   display: -webkit-box;
   -webkit-line-clamp: 3; /* number of lines to show */
   -webkit-box-orient: vertical;
}
p{
    line-height: 22px!important;
}

@media only screen and (max-width: 767px) {
    .featuresbag{
        margin-top: 20px!important;
    }
}
    </style>


    <!-- latest-goods-start -->
    <div class="features-area section-padding1 featuresbag" onscroll="OnScroll()" style="margin-top: 200px;">
    <div class="container">
    <div class="row">
                                <div class="col-lg-12">
                                    <h2 class="style-2">CREATORI</h2>
                                </div>
                                <div id="" class="row wow fadeIn">
                                    @foreach ($data['users'] as $user)
                                    <div class="col-lg-3">
                                        <div class="nft_coll style-2">
                                            <div class="nft_wrap">
                                                <a href="{{ route('user.portfolio',$user->username)}}"><img src="{{ @$user->profile->logo_pic? asset(@$user->profile->logo_pic):asset('public/frontend/img/banner/banner.png') }}" class="lazy img-fluid" alt="" style="width: 100%; height: 200px;"></a>
                                            </div>
                                            <div class="nft_coll_pp">
                                                <a href="{{ route('user.portfolio',$user->username)}}"><img class="lazy" src="{{ @$user->profile->image? asset(@$user->profile->image):asset('public/frontend/img/profile/1.png') }}" alt=""></a>
                                                <i class="fa fa-check"></i>
                                            </div>
                                            <div class="nft_coll_info">
                                                <a href="{{ route('user.portfolio',$user->username)}}"><h4><span>@</span>{{$user->username}}</h4></a>
                                                <div class="textlimit">
                                                    <span>{!! @$user->profile->about !!}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach
                                        
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