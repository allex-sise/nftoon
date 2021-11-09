@extends('backend.master')
@section('mainContent')

@php
    function showPicName($data){
        $name = explode('/', $data);
        return $name[3];
    }
@endphp

<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>Lista Drops</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="{{ route('admin.adDrop')}}" class="active">Lista Drops</a>
                @if(isset($data['edit']) && !empty(@$data['edit']))
                <a href="#" class="active">@lang('lang.edit') Drop</a>
            @endif
            </div>
        </div>
    </div>
</section>


<section class="admin-visitor-area DM_table_info">
    <div class="container-fluid p-0">
        @if(isset($data['edit']) && !empty(@$data['edit']))
        <div class="row">
            <div class="offset-lg-10 col-lg-2 text-right col-md-12 mb-20">
                <a href="{{route('admin.adDrop')}}" class="primary-btn small fix-gr-bg">
                    <span class="ti-plus pr-2"></span>
                    @lang('lang.add')
                </a>
            </div>
        </div>
        @endif

        <div class="row">
            <div class="col-lg-3">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-title">
                            <h3 class="mb-30">

                                @if(isset($data['edit']) && !empty(@$data['edit']))
                                    @lang('lang.edit')
                                @else
                                    @lang('lang.add')
                                @endif
                                Drop
                            </h3>
                        </div>
                        @if(isset($data['edit']) && !empty(@$data['edit']))
                            <form action="{{url('admin/add-drop-store-update')}}"  method="POST" class="form-horizontal" enctype="multipart/form-data" id="addDrop">
                        @else
                            <form action="{{url('admin/add-drop-store')}}" method="POST" class="form-horizontal" enctype="multipart/form-data" id="addDrop">
                        @endif
                            @csrf

                        <div class="white-box">
                            <div class="add-visitor">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                            <input class="primary-input form-control{{ $errors->has('title') ? ' is-invalid' : '' }}" type="text" name="title"
                                                   autocomplete="off" value="{{isset($data['edit'])? $data['edit']->name :old('name')}}">

                                            <input type="hidden" name="id" value="{{isset($data['edit'])? $data['edit']->id: ''}}">
                                            <label>@lang('lang.title') <span>*</span></label>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('title'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('title') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row mt-25">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                            <input class="primary-input form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" type="text" name="description" autocomplete="off" value="{{isset($data['edit'])? $data['edit']->description:old('description')}}">

                                            <label>@lang('lang.description') </label>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('description'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('description') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-25">
                                    <div class="col-lg-6">
                                        <div class="input-effect">
                                            <input type="text" class="primary-input form-control{{ $errors->has('startdate') ? ' is-invalid' : '' }}" id="date" name="startdate" >
                                            <label>Data Inceperii </label>
                                            <span class="focus-border"></span>
                                                    @if ($errors->has('startdate'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('startdate') }}</strong>
                                                    </span>
                                                    @endif
                                        </div>
                                    </div>
                                    <div class="col-lg-6 float-left">
                                        <div class="input-effect">
                                            <input type="text" class="primary-input" id="time" name="ora_incepere" >
                                            <label>Ora incepere</label>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('data_exp_unic'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('data_exp_unic') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-25">
                                    <div class="col-lg-6">
                                        <div class="input-effect">
                                            <input type="text" class="primary-input form-control{{ $errors->has('expdate') ? ' is-invalid' : '' }}" id="date2" name="expdate" >
                                            <label>Data Expirarii </label>
                                            <span class="focus-border"></span>
                                                    @if ($errors->has('expdate'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('expdate') }}</strong>
                                                    </span>
                                                    @endif
                                        </div>
                                    </div>
                                    <div class="col-lg-6 float-left">
                                        <div class="input-effect">
                                            <input type="text" class="primary-input" id="time2" name="ora_expirare" >
                                            <label>Ora Expirarii</label>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('expdate'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('expdate') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="row mt-25">
                                <div class="col-lg-12">
                                    <div class="row no-gutters input-right-icon">
                                        <div class="col">
                                            <div class="input-effect">
                                                <input class="primary-input {{ $errors->has('thumdnail') ? ' is-invalid' : '' }}" type="text"
                                                      id="placeholder_thembnails"
                                                       placeholder="@lang('lang.thumbnails') "
                                                       readonly="">
                                                <span class="focus-border"></span>
                                            </div>
                                            <small>@lang('lang.please_input')</small>
                                        </div>
                                        <div class="col-auto">
                                            <button class="primary-btn-small-input"
                                                    type="button">
                                                <label class="primary-btn small fix-gr-bg"
                                                       for="thembnails_upload">@lang('lang.browse')</label>
                                                <input type="file" class="d-none" onchange="thembnailUpload()" id="thembnails_upload" name="thumdnail">
                                            </button>
                                            
                                        </div>
                                    </div>
                                    @if ($errors->has('thumdnail'))
                                    <span class="invalid-feedback dm_display_block" role="alert" >
                                        <strong>{{ $errors->first('thumdnail') }}</strong>
                                    </span>
                                    @endif
                                    <p id="thumbneils_title"></p>
                                </div>
                            </div>    
                                <div class="row mt-25">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                            <select class="niceSelect w-100 bb form-control{{ $errors->has('status') ? ' is-invalid' : '' }}" name="status">
                                                <option data-display="Status *" value="">Status *</option> 
                                                 <option value="1" {{ @$data['edit']->status ==1 ?'selected':old('status') ==(1 ? 'selected':'') }}>Activ</option> 
                                                <option value="0" {{ @$data['edit']->status ==0 ?'selected':old('status') ==(0 ? 'selected':'')}}>Inactiv</option> 
                                            </select>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('status'))
                                            <span class="invalid-feedback invalid-select" role="alert">
                                                <strong>{{ $errors->first('status') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                        
                                
                                
                                <div class="row mt-50">
                                    <div class="col-lg-12 text-center">
                                        <button class="primary-btn fix-gr-bg">
                                            <span class="ti-check"></span>
                                            @if(isset($data['edit']))
                                                @lang('lang.update')
                                            @else
                                                @lang('lang.save')
                                            @endif
                                            Drop

                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-lg-4 no-gutters">
                        <div class="main-title sm_mb_20 lm_mb_35">
                            <h3 class="mb-0">@lang('lang.list') Drops</h3>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        
                        <table id="table_id" class="display school-table" cellspacing="0" width="100%">

                            <thead>
                           
                                <tr>
                                    <th>Titlu</th>
                                    <th>Descriere</th>
                                    <th>Data Inceperii</th>
                                    <th>Data Expirarii</th>
                                    <th>Imagine</th>
                                    <th>Status</th>
                                    
                                    <th>@lang('lang.action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($data['drop'] as $item)
                                <tr>
                                    <td valign="top"><a href="{{url('admin/add-drop-show/'.@$item->id)}}">{{@$item->name}}</a></td>
                                    <td valign="top">{{@$item->description}}</td>
                                    <td valign="top">{{@$item->startdate}}</td>
                                    <td valign="top">{{@$item->expdate}}</td>
                                    <td valign="top"><img src="{{asset(@$item->dropicon)}}" class="content_list_wh_40" ></td>
                                    <td valign="top">
                                                    @if (@$item->status == 1)
                                                    Activ
                                                    @else   
                                                    Inactiv
                                                    @endif
                                    </td>
                                    
                                    <td valign="top">
                                        <div class="dropdown">
                                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                                                @lang('lang.select')
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="{{url('admin/add-drop-show/'.@$item->id)}}">@lang('lang.view')</a>
                                                <a class="dropdown-item" href="{{url('admin/add-drop-edit/'.@$item->id)}}">@lang('lang.edit')</a>
                                                <a class="dropdown-item" data-toggle="modal" data-target="#deleteClassModal{{@$item->id}}"  href="#">@lang('lang.delete')</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                  <div class="modal fade admin-query" id="deleteClassModal{{@$item->id}}" >
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">@lang('lang.delete') Drop ?</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <div class="modal-body">
                                                <div class="text-center">
                                                    <h4>@lang('lang.are_you_sure_to_delete')</h4>
                                                </div>

                                                <div class="mt-40 d-flex justify-content-between">
                                                    <button type="button" class="primary-btn tr-bg" data-dismiss="modal">@lang('lang.cancel')</button>
                                                      <a href="{{ route('admin.deleteDropP',@$item->id)}}" class="text-light">
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
<script src="{{asset('public/backEnd/')}}/vendors/js/jquery-3.2.1.min.js"></script>

<script src="{{asset('public/backEnd/')}}/vendors/js/jquery-ui.js"></script>

<script type="text/javascript" src="{{asset('public/backEnd/')}}/js/bootstrap-datetimepicker.min.js"></script>
<script>
	"use strict";
    $(function () {
        $('#date').datepicker({
            keepOpen: true,
            minDate: 0,
            format: 'dd/mm/yyyy',
            icons:
                    { time: 'ti-alarm-clock',
                        date: 'ti-calendar',
                        up: 'ti-arrow-up',
                        down: 'ti-arrow-down',
                        previous: 'ti-arrow-left',
                        next: 'ti-arrow-right',
                        today: 'ti-agenda',
                        clear: 'ti-trash',
                        close: 'ti-close' }
        });
    })
</script>
<script>
	"use strict";
    $(function () {
        $('#time').datetimepicker({
            keepOpen: true,
            format: 'HH:mm',
            icons:
                    { time: 'ti-alarm-clock',
                        date: 'ti-calendar',
                        up: 'ti-arrow-up',
                        down: 'ti-arrow-down',
                        previous: 'ti-arrow-left',
                        next: 'ti-arrow-right',
                        today: 'ti-agenda',
                        clear: 'ti-trash',
                        close: 'ti-close' }
        });
    })
</script>
<script>
	"use strict";
    $(function () {
        $('#date2').datepicker({
            keepOpen: true,
            minDate: 0,
            format: 'dd/mm/yyyy',
            icons:
                    { time: 'ti-alarm-clock',
                        date: 'ti-calendar',
                        up: 'ti-arrow-up',
                        down: 'ti-arrow-down',
                        previous: 'ti-arrow-left',
                        next: 'ti-arrow-right',
                        today: 'ti-agenda',
                        clear: 'ti-trash',
                        close: 'ti-close' }
        });
    })
</script>
<script>
	"use strict";
    $(function () {
        $('#time2').datetimepicker({
            keepOpen: true,
            format: 'HH:mm',
            icons:
                    { time: 'ti-alarm-clock',
                        date: 'ti-calendar',
                        up: 'ti-arrow-up',
                        down: 'ti-arrow-down',
                        previous: 'ti-arrow-left',
                        next: 'ti-arrow-right',
                        today: 'ti-agenda',
                        clear: 'ti-trash',
                        close: 'ti-close' }
        });
    })
</script>
<!-- <script>
	"use strict";
    $(function () {
        $('#date').datetimepicker({
            keepOpen: true,
            minDate: 0,
            format: 'DD/MM/YYYY HH:mm',
            icons:
                    { time: 'ti-alarm-clock',
                        date: 'ti-calendar',
                        up: 'ti-arrow-up',
                        down: 'ti-arrow-down',
                        previous: 'ti-arrow-left',
                        next: 'ti-arrow-right',
                        today: 'ti-agenda',
                        clear: 'ti-trash',
                        close: 'ti-close' }
        });
    })
    $(function () {
        $('#startdate').datetimepicker({
            keepOpen: true,
            minDate: 0,
            format: 'DD/MM/YYYY HH:mm',
            icons:
                    { time: 'ti-alarm-clock',
                        date: 'ti-calendar',
                        up: 'ti-arrow-up',
                        down: 'ti-arrow-down',
                        previous: 'ti-arrow-left',
                        next: 'ti-arrow-right',
                        today: 'ti-agenda',
                        clear: 'ti-trash',
                        close: 'ti-close' }
        });
    })
</script> -->