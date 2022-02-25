@extends('frontend.master')
@push('css')

    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_modal.css">

@endpush
<style>
.top-seller-inner-one.explore .top-seller-wrapper .thumbnail a {
    display: block;
    overflow: hidden;
    height: 80px;
    width: 80px;
}
.top-seller-inner-one.explore .top-seller-wrapper .thumbnail a img {
    height: 100%;
}
</style>
@section('content')

<div class="rn-creator-title-area rn-section-gapTop">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                    <h2 class="title mb--0">CREATORI</h2>
                </div>
                <!-- <div class="col-lg-6 col-md-6 col-sm-6 col-12 mt_mobile--15">
                    <div class="shortby-default text-start text-sm-end">
                        <label class="filter-leble">SORTEAZA DUPA:</label>
                        <select>
                            <option data-display="Top Rated">Top Rated</option>
                            <option value="1">Best Seller</option>
                            <option value="2">Recent Added</option>
                            <option value="3">Varified</option>
                        </select>
                    </div>
                </div> -->
            </div>
            <div class="row g-5 mt--30 creator-list-wrapper">
            @foreach ($data['users'] as $user)
                <!-- start single top-seller -->
                <div class="creator-single col-lg-3 col-md-4 col-sm-6" data-sal="slide-up" data-sal-delay="150" data-sal-duration="800">
                    <div class="top-seller-inner-one explore">
                        <div class="top-seller-wrapper">
                            <div class="thumbnail varified">
                                <a href="{{ route('user.portfolio',$user->username)}}"><img src="{{ @$user->profile->logo_pic? asset(@$user->profile->logo_pic):asset('public/frontend/img/banner/banner.png') }}"></a>
                            </div>
                            <div class="top-seller-content">
                                <a href="{{ route('user.portfolio',$user->username)}}">
                                    <h6 class="name"><span>@</span>{{$user->username}}</h6>
                                </a>
                                <span class="count-number">
                                    {{ Str::limit(@$user->profile->about, 22) }}
                                </span>
                                <span class="count-number">
                                
                                    {{$user->balance->amount}} toons
                                </span>
                            </div>
                        </div>
                        <a class="over-link" href="{{ route('user.portfolio',$user->username)}}"></a>
                    </div>
                </div>
                <!-- End single top-seller -->
            @endforeach
            </div>
            <div class="row">
                <div class="col-lg-12" data-sal="slide-up" data-sal-delay="950" data-sal-duration="800">
                    
                </div>
            </div>
        </div>
    </div>


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