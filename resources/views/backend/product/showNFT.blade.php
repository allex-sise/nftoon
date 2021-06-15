@extends('backend.master')
@section('mainContent')
@php
    $description = $data['item']->description;
    $externalUrl = $data['item']->demo_url;
    $name = $data['item']->title;
    $image =  $_SERVER['HTTP_HOST'].'/minted/'.$data['item']->icon;
@endphp
    <!-- todo: above has minted hardcoded, upload will fail -->

<script defer src="{{ mix('js/app.js') }}"></script>

<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>Blockchain NFT</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="{{ route('admin.adDrop')}}" class="active">Blockchain NFT</a>
              
            </div>
        </div>
    </div>
</section>


<section class="admin-visitor-area DM_table_info">
    <div class="container-fluid p-0">
     

        <div class="row">
            <!-- aici ai infos si variabilele -->
            <div class="col-lg-3">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-title">
                            <h3 class="mb-30">

                              Blockchain NFT
                            </h3>
                        </div>
                     

                        <div class="white-box">
                            <div class="add-visitor">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                           <p>Titlu: <strong>{{$data['item']->title}}</strong></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                           <p>Descriere: <strong>{{$data['item']->description}}</strong></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                           <p>Pret:  <span style="color: blue;"><strong>{{$data['item']->Reg_total}} lei</strong></span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                        <img src="{{asset(@$data['item']->icon)}}" style="width: 100%;" >
                                        </div>
                                    </div>
                                </div>
                                


                                </div>
                            </div>
                        </div>
                 
                    </div>
                </div>
         

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-lg-4 no-gutters">
                        <div class="main-title sm_mb_20 lm_mb_35">
                            <h3 class="mb-0">Adauga NFT-ul pe blockchain  </h3>
                        </div>
                    </div>
                </div> 

                <div class="row" style="padding: 15px;">
                    <div class="col-lg-12 no-gutters bg-white" style="padding: 0px 15px 15px 15px;">
                        <div class="main-title sm_mb_20 lm_mb_35">
                        
                           <!-- Vue -->
                            <div id="app">
                                <metamask-intro description="{{$description}}" external-url="{{$externalUrl}}" name="{{$name}}" image="{{asset(@$data['item']->icon)}}"></metamask-intro>
                            </div> 

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 no-gutters">
                        <div class="main-title sm_mb_20 lm_mb_35">
                            <h3 class="mb-0">@lang('lang.list') URL-uri si Meta</h3>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                    <div class="main-title sm_mb_20 lm_mb_35">
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection