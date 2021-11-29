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
 <!-- content begin -->
 <div class="no-bottom no-top" id="content">
            <div id="top"></div>
            
            <!-- section begin -->
            <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>@lang('lang.fund_deposit')</h1>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->       

    <!-- privaci_polecy_area start -->
    <div class="privaci_polecy_area section-padding checkout_area ">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-12">
                       <h4 class="text-center">Fondurile tale au fost adaugate cu succes!</h4>
                
                </div>
            
                        @if (@count(Cart::content()) > 0 )
                        
                                <button class="btn btn-success" style="width: 200px; display: block; margin: 0 auto; margin-top: 60px;"><a style="color: #FFF;" href="{{ route('customer.cheackout')}}">Inapoi la checkout</a></button>
                       
                        @else
                            <button class="btn btn-success" style="width: 200px; display: block; margin: 0 auto; margin-top: 60px;"><a style="color: #FFF;" href="{{ route('home')}}">Inapoi la checkout</a></button>

                        @endif
                     
                      
            </div>
        </div>
    </div>
    <!-- privaci_polecy_area end -->
   
 @endsection
 @push('js')

 @endpush