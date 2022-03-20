@extends('frontend.master')
@push('css')
<style>
.single-activity-wrapper .thumbnail a img {
    width: 130px!important;
}

</style>
@endpush
@section('content')
 <!-- start page title area -->
 <div class="rn-breadcrumb-inner ptb--30">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <h5 class="title text-center text-md-start">Activitate</h5>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-list">
                        <li class="item"><a href="index.html">Acasa</a></li>
                        <li class="separator"><i class="feather-chevron-right"></i></li>
                        <li class="item current">Activitate</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end page title area -->
    <div class="rn-activity-area rn-section-gapTop">
        <div class="container">
            <div class="row mb--30">
                <h3 class="title">All following Acivity</h3>
            </div>
            <div class="row g-6 activity-direction">
                <div class="col-lg-8 mb_dec--15">
                @foreach ($data['history'] as $his)
                    <!-- single activity -->
                    <div class="single-activity-wrapper">
                        <div class="inner">
                            <div class="read-content">
                                <div class="thumbnail">
                                    <a href="product-details.html"><img src="{{ asset($his->Item->icon) }}" style="width: 130px;" alt="Nft_Profile"></a>
                                </div>
                                <div class="content">
                                    <a href="product-details.html">
                                        <h6 class="title">{{ $his->Item->title }}</h6>
                                    </a>
                                    <p>10 editions listed by Bits for <span>2.50 ETH</span> each</p>
                                    <div class="time-maintane">
                                        <div class="time data">
                                            <i data-feather="clock"></i>
                                            <span>{{ $his->created_at}}</span>
                                        </div>
                                        <div class="user-area data">
                                            <i data-feather="user"></i>
                                            <a href="#">{{ $his->cumparator->username }}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="icone-area">
                                <i data-feather="message-circle"></i>
                            </div>
                        </div>
                    </div>
                    <!-- single activity -->
                @endforeach
                </div>
                <div class="col-lg-4">
                    <div class="filter-wrapper">
                        <div class="widge-wrapper rbt-sticky-top-adjust">
                            <div class="inner">
                                <h3>Market filter</h3>
                                <div class="sing-filter">
                                    <button>Purchases</button>
                                    <button>Sales</button>
                                    <button>Followers</button>
                                    <button>Following</button>
                                    <button>Reserved</button>
                                    <button>Live Auction</button>
                                </div>
                            </div>
                            <div class="inner">
                                <h3>Filter by users</h3>
                                <div class="sing-filter">
                                    <button>Love</button>
                                    <button>Saved</button>
                                    <button>Support us</button>
                                    <button>Report</button>
                                    <button>Vedio</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script src="{{ asset('public/frontend/js/') }}/package.js"></script>
@endpush