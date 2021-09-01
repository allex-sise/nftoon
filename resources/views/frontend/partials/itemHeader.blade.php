@php
$img = explode(",",@$data['item']->item_image->image);
$img2 = @$data['item']->icon;
@endphp
<div class="banner-area3">
    <div class="banner-area-inner">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 offset-xl-3">
                    <div class="banner-info mb-30">
                        @if( (@$data['item']->file == 'img'))
                        <div class="over_view_thumb imaginebanner">
                                {{-- <img height="400"  src="{{ file_exists(@$data['item']->thumbnail) ? asset(@$data['item']->thumbnail) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }} " alt=""> --}}
                            <div class="overlay_with_btn">
                            <div class="overlay_inner">
                               
                                <button class="boxed-btn-white"  onclick="ImgShow()" style="border-radius: 50%; height: 50px; width: 50px; padding: 0px; color: #000!important; background: #FFF;"><i class="ti-search" ></i></button>
              
                                <a class="popup-image hit" href="{{ asset(@$img2)}}"></a>
                             
                            </div>
                            </div>
                        </div>
                        @elseif( (@$data['item']->file == 'video'))
                        <video width="100%" height="100%" autoplay muted style="margin-top: 150px;">
                            <source src="{{ file_exists(@$data['item']->main_file) ? asset(@$data['item']->main_file) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }}" type="video/mp4">
                            
                            Your browser does not support the video tag.
                        </video>
                        @endif
                        <h1 style=" text-align: center; padding: 20px;">{{  @$data['item']->title }} </h1>
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