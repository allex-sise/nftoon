 <!-- footer-start -->

    @php
        $logo_conditions = ['title'=>'Logo', 'active_status'=>1];
        $logopic = dashboard_background($logo_conditions);
    @endphp
    <style>
.footer-recent-post li.recent-post .thumbnail a img {
    max-height: 60px;
    border-radius: 100%;
    object-fit: cover;
    width: 60px;
    height: 60px;
}
    </style>
    <!-- Start Footer Area -->
    <div class="rn-footer-one rn-section-gap bg-color--1 mt--100 mt_md--80 mt_sm--80">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                        <div class="widget-content-wrapper">
                            <div class="footer-left">
                                <div class="logo-thumbnail logo-custom-css">
                                    <a class="logo-light" href="{{url('/')}}"><img src="{{ asset('public/frontend/img/nftoonlogo.png') }}" alt="nft-logo"></a>
                                    <a class="logo-dark" href="{{url('/')}}"><img src="{{ asset('public/frontend/img/nftoonlogo.png') }}" alt="nft-logo"></a>
                                </div>
                                <p class="rn-footer-describe">
                                    NFToon a fost creat pentru a usura cumpararea si vanzarea de NFT-uri, la costuri reduse, de catre artisti locali si internationali. 
                                    <!-- Folosim Polygon network pentru a face din NFToon un marketplace cu 99% mai eco-friendly decat orice alt marketplace de NFT-uri. -->
                                </p>
                            </div>
                            <div class="widget-bottom pt--40">
                                <h6 class="title">Aboneaza-te la Newsletter pentru a fi primul care afla despre cele mai noi colectii si noutati! </h6>
                                
                                <form action="{{ route('store_newsletter') }}" method="POST">
                                @csrf
                                    <div class="input-group">
                                        <input name="email" type="email" class="form-control bg-color--2" placeholder="Adresa ta de email">
                                        <div class="input-group-append">
                                        <input type="submit" class="btn btn-primary-alta btn-outline-secondary" value="Abonare">
                                        </div>
                                    </div>
                                </form>
                                </div>
                                <div class="newsletter-dsc">
                                    <p>Email is safe. We don't spam.</p>
                                </div>
                            </div>
                        </div>
                  
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 mt_mobile--40">
                    <div class="footer-widget widget-quicklink">
                        <h6 class="widget-title">Despre</h6>
                        <ul class="footer-list-one">
                            <li class="single-list"><a href="{{ url ('/despre') }}">Despre Noi</a></li>
                            <li class="single-list"><a href="{{ url ('/polygon') }}">Polygon System</a></li>
                            <li class="single-list"><a href="{{ url ('/support-ticket') }}">Suport</a></li>
                            <li class="single-list"><a href="{{ url ('/activitate') }}">Activitate</a></li>
                            <li class="single-list"><a href="{{ url ('/ranking') }}">Ranking</a></li>
                            <li class="single-list"><a href="{{ url ('/contact') }}">Contact</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-6 col-12 mt_md--40 mt_sm--40">
                    <div class="footer-widget widget-information">
                        <h6 class="widget-title">Informatii</h6>
                        <ul class="footer-list-one">
                            <li class="single-list"><a href="{{ url('/termeni-conditii') }}">Termeni si Conditii</a></li>
                            <li class="single-list"><a href="{{  url('/politica-confidentialitate' )}}">Politica Confidentialitate</a></li>
                            <li class="single-list"><a href="{{ url('/politica-cookies') }}">Politica Cookies</a></li>
                            <li class="single-list"><a href="{{ url ('/contact') }}">Contact</a></li>
                            <li class="single-list"><a href="{{ url ('/help/faq') }}">Intrebari Frecvente</a></li>
                            <li class="single-list"><a href="{{ url ('/help/knowledge-base') }}">Knowledge Base</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-6 col-12 mt_md--40 mt_sm--40">
                    <div class="footer-widget">
                        <h6 class="widget-title">Cele mai recente vanzari</h6>
                        <ul class="footer-recent-post">

                        @php 
                            $recentsales =  App\ItemOrder::take(3)->latest()->get();
                        @endphp
                        @foreach ( $recentsales as $rc )
       
                      
                            <li class="recent-post">
                                <div class="thumbnail">
                                
                                    <a href="{{ route('singleProduct',[str_replace(' ', '-',$rc->Item->title),$rc->Item->id])}}">
                                        @if ($rc->Item->file == 'img')
                                            <img src="{{ asset($rc->Item->icon) }}" class="" alt="">
                                        
                                            @elseif($rc->Item->file == 'video')
                                            <video width="100%" height="100%" class="" autoplay muted controls loop>
                                            <source src="{{ asset($rc->Item->main_file) }}" type="video/mp4">
                                            
                                            Your browser does not support the video tag.
                                        </video>
                                        @endif

                                    </a>
                                 
                                </div>
                                <div class="content">
                                    <h6 class="title"><a href="{{ route('singleProduct',[str_replace(' ', '-',$rc->Item->title),$rc->Item->id])}}">{{ $rc->Item->title }}</a></h6>
                                    <p>{{ $rc->cumparator->username }}</p>
                                    <span class="price">{{ $rc->subtotal }} toons</span>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Area -->
    <!-- Start Footer Area -->
    <div class="copy-right-one ptb--20 bg-color--1">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="copyright-left">
                        <span>© NFToon, Inc. Toate drepturile rezervate.</span>
                        <ul class="privacy">
                            <li><a href="terms-condition.html">Termeni si Conditii</a></li>
                            <li><a href="privacy-policy.html">Politica Confidentialitate</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="copyright-right">
                        <ul class="social-copyright">
                            <li><a href="#"><i data-feather="facebook"></i></a></li>
                            <li><a href="#"><i data-feather="twitter"></i></a></li>
                            <li><a href="#"><i data-feather="instagram"></i></a></li>
                            <li><a href="#"><i data-feather="linkedin"></i></a></li>
                            <li><a href="#"><i data-feather="mail"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Area -->
    <div class="mouse-cursor cursor-outer"></div>
    <div class="mouse-cursor cursor-inner"></div>
    <!-- Start Top To Bottom Area  -->
    <div class="rn-progress-parent">
        <svg class="rn-back-circle svg-inner" width="100%" height="100%" viewBox="-1 -1 102 102">
            <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
        </svg>
    </div>
    <!-- End Top To Bottom Area  -->
<!-- footer-end -->