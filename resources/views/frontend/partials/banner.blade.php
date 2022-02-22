@php 
$homepage = Modules\Pages\Entities\InfixHomePage::where('active_status', 1)->first();
$home_page=Modules\Pages\Entities\InfixHomePage::first();
    if (file_exists($home_page->banner_image)) {
        $banner=$home_page->banner_image;
    } else {
        $banner=url('public/frontend/img/banner/banner-img-1.png');
    }
@endphp 


<!-- 
<div class="banner-area">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 offset-xl-2">
                    <div class="banner-info text-center">
                        <h2>{{@$homepage->homepage_title}}</h2>
                        {{-- <p>{{@$homepage->homepage_description}}</p> --}}
                        <h4>{{@$homepage->homepage_description}}</h4>
                    </div>
                 
                </div>
            </div>
        </div>
    </div> -->
    <!-- <section id="section-heroz" aria-label="section" class="pt20 pb20 vh-60" data-bgimage="url({{ asset('public/frontend/assets/images/background/7.jpg' )}}) bottom">
                <div class="v-center">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="spacer-single"></div>
                                <h6 class="wow fadeInUp" data-wow-delay=".5s"><span class="text-uppercase id-color-2">Minted Tokenizing Everything</span></h6>
                                <div class="spacer-10"></div>
                                <h1 class="wow fadeInUp h1banners" data-wow-delay=".75s">Descopera NFT-uri de la <span class="id-color-2">artisti romani</span> pe primul marketplace din Romania</h1>
                                <p class="wow fadeInUp lead specialPs" data-wow-delay="1s">
                                Unitate de date stocate pe un registru digital, numit blockchain, care certifica un activ digital ca fiind unic si, prin urmare, nu este interschimbabil</p>
                                <div class="spacer-10"></div>
                                <a href="#section-hero" class="btn-main wow fadeInUp lead" data-wow-delay="1.25s">Descopera</a>
                                <div class="mb-sm-30"></div>
                            </div>
                            <div class="col-md-6 xs-hide">
                                <img src="{{ asset('')}}{{$banner}}" class="img-fluid wow fadeInUp bannerIMG" data-wow-delay=".75s" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        -->