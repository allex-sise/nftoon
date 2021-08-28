@extends('backend.master')
@section('mainContent')

@php
    function showPicName($data){
        $name = explode('/', $data);
        return $name[3];
    }
@endphp
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<style>
.select2-container .select2-choice {
    background-color: #fff;
    background-image: none;
    border-radius: 0px;
    -moz-background-clip: padding;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #aaa;
    display: block;
    overflow: hidden;
    white-space: nowrap;
    position: relative;
    height: 40px;
    line-height: 26px;
    padding: 0px;
    color: #444;
    text-decoration: none;
}
.select2-container .select2-choice span {
    margin-right: 26px;
    display: block;
    overflow: hidden;
    white-space: nowrap;
    -o-text-overflow: ellipsis;
    -ms-text-overflow: ellipsis;
    text-overflow: ellipsis;
    margin-left: 10px;
    margin-top: 7px;
    font-size: 19px;
}
.select2-search input, .select2-search-choice-close, .select2-container .select2-choice abbr, .select2-container .select2-choice div b {
    background-image: url(select2x2.png) !important;
    background-image: url("https://cdnjs.cloudflare.com/ajax/libs/select2/3.5.4/select2x2.png")!important;
    background-repeat: no-repeat !important;
    background-size: 60px 40px !important;
    margin-top: 7px!important;
}
.select2-container .select2-choice div{
    background: #FFF;
    background-image: none;
}
</style>
<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>Detalii Drop</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="{{ route('admin.adDrop')}}" class="active">Detalii Drops</a>
                @if(isset($data['edit']) && !empty(@$data['edit']))
                <a href="#" class="active">Drop</a>
            @endif
            </div>
        </div>
    </div>
</section>


<section class="admin-visitor-area DM_table_info">
    <div class="container-fluid p-0">
     

        <div class="row">
            <div class="col-lg-3">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-title">
                            <h3 class="mb-30">

                              Detalii Drop
                            </h3>
                        </div>
                     

                        <div class="white-box">
                            <div class="add-visitor">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                           <p>Titlu: <strong>{{$data['edit']->name}}</strong></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                           <p>Descriere: <strong>{{$data['edit']->description}}</strong></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                           <p>Data Expirarii:  <span style="color: blue;"><strong>{{$data['edit']->expdate}}</strong></span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                           <p>Status: @if ( $data['edit']->status == 1) <span style="color: green"><strong> Activ </strong> </span> @elseif ( $data['edit']->status == 0) <span style="color: red"> <strong>Inactiv</strong> </span> @endif</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                        <img src="{{asset(@$data['edit']->dropicon)}}" style="width: 100%;" >
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
                            <h3 class="mb-0">Adauga NFT-uri la DROP-ul {{$data['edit']->name}} </h3>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding: 15px;">
                    <div class="col-lg-12 no-gutters bg-white" style="padding: 0px 15px 15px 15px;">
                        <div class="main-title sm_mb_20 lm_mb_35">
                            

                            <form action="{{url('admin/add-drop-nftstore')}}" method="POST" class="form-horizontal" id="addDrop">
                            @csrf
                            <input type="hidden" name="drop_id" value="{{$data['edit']->id}}">
                            <div class="row mt-25">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                            <select class="select2 w-100 bb" name="nft_id">
                                            <option></option>
                                                @foreach($nfts as $nft)
                                                    <option value="{{@$nft->id}}">{{@$nft->title}}</option>
                                                @endforeach                                            
                                            </select>
                                            <span class="focus-border"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-50">
                                    <div class="col-lg-12 text-left">
                                        <input type="submit" class="primary-btn fix-gr-bg" value="Adauga">
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 no-gutters">
                        <div class="main-title sm_mb_20 lm_mb_35">
                            <h3 class="mb-0">@lang('lang.list') NFT-uri din DROP</h3>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        
                        <table id="table_id" class="display school-table" cellspacing="0" width="100%">

                            <thead>
                           
                                <tr>
                                    <th>Titlu</th>
                                    
                                    <th>@lang('lang.action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($nftdrop as $item)
                                <tr>
                                    <td valign="top">{{@$item->Item->title}}</td>
                                    <td valign="top">
                                        <div class="dropdown">
                                        <a class="btn" data-toggle="modal" data-target="#deleteClassModal{{@$item->id}}"  href="#">@lang('lang.delete')</a>

                                        </div>
                                    </td>
                                </tr>
                                  <div class="modal fade admin-query" id="deleteClassModal{{@$item->id}}" >
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">@lang('lang.delete') @lang('lang.category')</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <div class="modal-body">
                                                <div class="text-center">
                                                    <h4>@lang('lang.are_you_sure_to_delete')</h4>
                                                </div>

                                                <div class="mt-40 d-flex justify-content-between">
                                                    <button type="button" class="primary-btn tr-bg" data-dismiss="modal">@lang('lang.cancel')</button>
                                                      <a href="{{ route('admin.deleteDrop',@$item->id)}}" class="text-light">
                                                    <button class="primary-btn fix-gr-bg" type="submit">@lang('lang.delete')</button>
                                                     </a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
<script src="{{ asset('/')}}public/backEnd/js/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<script>
$(document).ready(function() {
    $('.select2').select2({
        placeholder: "Alege un NFT",
        allowClear: true
    });
});
    </script>