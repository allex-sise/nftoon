@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/select2.min.css">
<link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/page_loader.css">
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/editContent.css">
@endpush
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

.over_view_thumb{
      background-image: url({{ file_exists(@$data['edit']->icon) ? asset(@$data['edit']->icon) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }} );
   }
   .over_view_thumb {
    height: 700px!important;
    background-size: cover!important;
    background-position: center!important;
    background-repeat: no-repeat!important;
}
.de_tab.tab_methods .de_nav li span {
    padding: 35px 10px;
    color: rgba(0, 0, 0, .6);
    font-family: var(--body-font);
    font-size: 14px;
    line-height: 20px;
    text-align: center;
    display: table-cell;
    vertical-align: middle;
    border-radius: 12px;
    min-width: 140px;
}
.de_tab.tab_methods .de_nav li span {
    border: solid 2px rgba(0, 0, 0, .1);
}
.dark-scheme .de_tab.tab_methods .de_nav li span {
    color: #ffffff;
}

.de_tab.tab_methods .de_nav li span {
    background: none;
}
.dark-scheme .de_tab.tab_methods .de_nav li span {
    color: rgba(255, 255, 255, .6);
}
.de_tab.tab_methods .de_nav li span {
    border: solid 2px rgba(0, 0, 0, .1);
}
.dark-scheme .de_tab .de_nav li span {
    color: rgba(255, 255, 255, .3);
    background: #292F45;
}
.de_tab .de_nav li{
    background: none!important;
}
</style>
@php                                                        
    $itemLastPrice = App\ItemOrder::where('user_id', @$data['edit']->user_id)->where('item_id', @$data['edit']->id)->orderBy('id', 'DESC')->first();
@endphp
<input type="text" hidden  class="id" value="{{ Auth::user()->id}}">
       <!-- content begin -->
       
 <div class="no-bottom no-top" id="content">
            <div id="top"></div>
            
            <!-- section begin -->
            <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>Scoate de la vanzare NFT-ul - {{isset($data['edit'])? $data['edit']->title:old('title')}}</h1>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->   

            <section aria-label="section" style="background-size: cover;">
            @if(@$data['edit']->id)
        
                @if(Auth::user()->role_id == 1 || Auth::user()->role_id == 2 || Auth::user()->role_id == 4)
                    <form action="{{ route('author.itemScoateVanzareUpdate')}}" id="file_update" method="POST" enctype="multipart/form-data">
                @else
                    @if (@$item_preview != null)
                    <form action="{{ route('author.portfolio',Auth::user()->username)}}" method="get" >
                    @else
                    <form action="{{ route('author.itemScoateVanzareUpdate')}}" id="file_update" method="POST" enctype="multipart/form-data">
                    @endif
                    
                @endif
                    @csrf
                    <input type="text" hidden name="category_id" value="{{@$data['edit']->category_id}}">
                    <input type="text" hidden name="id" value="{{@$data['edit']->id}}">
                    <input type="text" hidden value="1" name="upload_or_link">
                <div class="container" style="background-size: cover;">
                    <div class="row wow fadeIn animated" style="background-size: cover; visibility: visible; animation-name: fadeIn;">
                        <div class="col-lg-7 offset-lg-1" style="background-size: cover;">
                            <form id="form-create-item" class="form-border" method="post" action="email.php">
                                <div class="field-set" style="background-size: cover;">
                                   
                                    <h5>Titlu</h5>
                                    <input type="text" name="title" id="" class="form-control" placeholder="@lang('lang.name')*" value="{{isset($data['edit'])? $data['edit']->title:old('title')}}" readonly>
                               
                                    <div class="spacer-20" style="background-size: cover;"></div>

                                    <h5>Descriere</h5>
                                    <textarea  name="description" cols="30" rows="5" placeholder="" class="form-control" readonly>{{isset($data['edit'])? $data['edit']->description:old('description')}}</textarea>
                                      
                                    <div class="spacer-20" style="background-size: cover;"></div>

                                    
                                    <div class="spacer-single" style="background-size: cover;"></div>
                                    @if (@$item_preview!=null)
                                    <p class="text-danger text-center">@lang('lang.your_previous_update_is_pending')</p>
                                    <p  class="boxed-btn mt-20">Pune la vanzare NFT-ul</p>
                                    @else
                                    <button  class="btn-main" id="itemSubmit" type="submit" style="width: 100%;">Scoate de la vanzare NFT-ul</button>
                                    @endif
                                    <div class="spacer-single" style="background-size: cover;"></div>
                                </div>
                            </form>
                        </div>

                        <div class="col-lg-3 col-sm-6 col-xs-12" style="background-size: cover;">
                                <h5>Previzualizare NFT</h5>
                                <div class="nft__item" style="background-size: cover;">
                                    
                                    <div class="nft__item_wrap" style="background-size: cover; height: 264px;">
                                        @if( (@$data['edit']->file == 'img'))
                                        <a href="#">
                                            <img src="{{ file_exists(@$data['edit']->icon) ? asset(@$data['edit']->icon) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }}" id="get_file_2" class="lazy nft__item_preview" alt="">
                                        </a>
                                        @elseif( (@$data['edit']->file == 'video'))
                                        <a href="#">
                                            <video width="100%" height="100%" autoplay muted controls loop>
                                                <source src="{{ file_exists(@$data['edit']->main_file) ? asset(@$data['edit']->main_file) : asset('public/uploads/product/thumbnail/thumbnail-demo.png') }}" type="video/mp4">
                                                
                                                Your browser does not support the video tag.
                                            </video>
                                        </a>
                                        
                                        @endif
                                    </div>
                                    <div class="nft__item_info" style="background-size: cover;">
                                        <a href="#">
                                            <h4>{{isset($data['edit'])? $data['edit']->title:old('title')}}</h4>
                                        </a>
                                        <div class="nft__item_click" style="background-size: cover;">
                                        <span></span>
                                        </div>                        
                                    </div> 
                                </div>
                            </div>                                         
                    </div>
                </div>
                @endif
            </section>


        <!-- upload_area _start -->
        
        </div>
@include('error.error')     
@endsection
@push('js')
<script src="{{ asset('public/frontend/js/') }}/select2.min.js"></script>
<script src="{{ asset('public/frontend/js/') }}/file_upload.js"></script>
<script src="{{ asset('public/frontend/js/') }}/item_files.js"></script>
<script src="{{ asset('public/frontend/js/') }}/page_loader.js"></script>

@endpush