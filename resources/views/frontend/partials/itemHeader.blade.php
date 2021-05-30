@php
$img = explode(",",@$data['item']->item_image->image);
$img2 = @$data['item']->icon;
@endphp
<div class="banner-area3 gray-bg">
    <div class="banner-area-inner">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 offset-xl-3">
                    <div class="banner-info mb-30">
                        <div class="over_view_thumb imaginebanner">
                                {{-- <img height="400"  src="{{ file_exists(@$data['item']->thumbnail) ? asset(@$data['item']->thumbnail) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }} " alt=""> --}}
                            <div class="overlay_with_btn">
                            <div class="overlay_inner">
                               
                                <button class="boxed-btn-white"  onclick="ImgShow()">@lang('lang.screenshoot')</button>
              
                                <a class="popup-image hit" href="{{ asset(@$img2)}}"></a>
                             
                            </div>
                            </div>
                        </div>
                        <h1 style="color: #000; text-align: center; padding: 20px;">{{  @$data['item']->title }} </h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
.imaginebanner{
    -webkit-box-shadow: 0px 0px 12px 0px rgb(50 50 50 / 75%)!important;
    -moz-box-shadow: 0px 0px 12px 0px rgba(50, 50, 50, 0.75)!important;
    box-shadow: 0px 0px 12px 0px rgb(50 50 50 / 75%)!important;
    margin-top: 150px!important;
    height: 700px!important;
    width: auto!important;
}
}
.banner-area3 h1 {
    font-size: 30px;
    font-family: "Quicksand", sans-serif;
    font-weight: 700;
    color: #000!important;
    line-height: 48px!important;
    text-align: center!important;
    padding: 20px!important;
}
.banner-area3 .banner-area-inner .banner-info {
    margin-bottom: 50px!important;
}
</style>