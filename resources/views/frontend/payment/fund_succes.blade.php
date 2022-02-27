@extends('frontend.master')

@section('content')
<style>
.banner-area4 .banner-area-inner .banner-info h2 {
    font-size: 36px;
    font-family: "Quicksand", sans-serif;
    font-weight: 700;
    color: #fff;
    line-height: 48px;
    margin-bottom: 0;
    text-align: left;
    margin-top: 340px;
}
.checkout_area .check-out-btn{
    text-align: center!important;
}
</style>

 <!-- start page title area -->
 <div class="rn-breadcrumb-inner ptb--30">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <h5 class="title text-center text-md-start">@lang('lang.fund_deposit')</h5>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-list">
                        <li class="item"><a href="index.html">Acasa</a></li>
                        <li class="separator"><i class="feather-chevron-right"></i></li>
                        <li class="item current">@lang('lang.fund_deposit')</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end page title area -->


    <!-- privaci_polecy_area start -->
    <div class="privaci_polecy_area section-padding checkout_area ">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-12" style="margin-top: 100px;">
                       <h4 class="text-center">Fondurile tale au fost adaugate cu succes!</h4>
                
                </div>
            
                        @if (@count(Cart::content()) > 0 )
                        
                                <button class="btn btn-success" style="width: 200px; display: block; margin: 0 auto; margin-top: 60px;"><a style="color: #FFF;" href="{{ route('customer.cheackout')}}">Inapoi la checkout</a></button>
                       
                        @else
                            <button class="btn btn-success" style="width: 200px; display: block; margin: 0 auto; margin-top: 60px;"><a style="color: #FFF;" href="{{ route('home')}}">Inapoi la prima pagina</a></button>

                        @endif
                     
                      
            </div>
        </div>
    </div>
    <!-- privaci_polecy_area end -->
   
 @endsection
 @push('js')

 @endpush