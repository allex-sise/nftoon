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
            <h1>Lista Colectii</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="{{ route('admin.adCollection')}}" class="active">Lista Colectii</a>
                @if(isset($data['edit']) && !empty(@$data['edit']))
                <a href="#" class="active">@lang('lang.edit') Colectie</a>
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
                <a href="{{route('admin.adCollection')}}" class="primary-btn small fix-gr-bg">
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
                            <form action="{{url('admin/add-collection-store-update')}}"  method="POST" class="form-horizontal" enctype="multipart/form-data" id="addDrop">
                        @else
                            <form action="{{url('admin/add-collection-store')}}" method="POST" class="form-horizontal" enctype="multipart/form-data" id="addDrop">
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
                                <div class="row mb-25">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                            <select class="niceSelect w-100 bb form-control{{ $errors->has('user_id') ? ' is-invalid' : '' }}"
                                                    name="creator_id">
                                                <option data-display="Creator *"
                                                        value="">Creator *
                                                </option>
                                                @foreach($data['user'] as $item)
                                                    <option value="{{@$item->id}}">{{@$item->full_name}} - {{@$item->username}}</option>
                                                @endforeach
                                            </select>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('user_id'))
                                                <span class="invalid-feedback invalid-select"
                                                        role="alert">
                                                    <strong>{{ $errors->first('user_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-effect">
                                            <input class="primary-input form-control{{ $errors->has('contract') ? ' is-invalid' : '' }}" type="text" name="contract"
                                                   autocomplete="off" value="{{isset($data['edit'])? $data['edit']->contract :old('contract')}}">

                                            <input type="hidden" name="id" value="{{isset($data['edit'])? $data['edit']->id: ''}}">
                                            <label>Contract <span>*</span></label>
                                            <span class="focus-border"></span>
                                            @if ($errors->has('contract'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('contract') }}</strong>
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
                                                    <input class="primary-input {{ $errors->has('placehlimage') ? ' is-invalid' : '' }}" type="text"
                                                        id="placehlimage2"
                                                        placeholder="Placeholder"
                                                        readonly="">
                                                    <span class="focus-border"></span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <button class="primary-btn-small-input"
                                                        type="button">
                                                    <label class="primary-btn small fix-gr-bg"
                                                        for="placehlimage_upload">@lang('lang.browse')</label>
                                                    <input type="file" class="d-none" onchange="placehlimage()" id="placehlimage_upload" name="placehlimage">
                                                </button>
                                                
                                            </div>
                                        </div>
                                        @if ($errors->has('placehlimage'))
                                        <span class="invalid-feedback dm_display_block" role="alert" >
                                            <strong>{{ $errors->first('placehlimage') }}</strong>
                                        </span>
                                        @endif
                                        <!-- <img src="#" id="category-img-tag" width="200px" />   for preview purpose -->
                                        <p id="placehlimage_title"></p>
                                    </div>
                                </div>  


                                <div class="row mt-25">
                                    <div class="col-lg-12">
                                        <div class="row no-gutters input-right-icon">
                                            <div class="col">
                                                <div class="input-effect">
                                                    <input class="primary-input {{ $errors->has('thumdnail') ? ' is-invalid' : '' }}" type="text"
                                                        id="placeholder_thembnails"
                                                        placeholder="Imagine"
                                                        readonly="">
                                                    <span class="focus-border"></span>
                                                </div>
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
                                        <!-- <img src="#" id="category-img-tag" width="200px" />   for preview purpose -->
                                        <p id="thumbneils_title"></p>
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
                            <h3 class="mb-0">@lang('lang.list') Colectii</h3>
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
                                    <th>Imagine</th>
                                    
                                    <th>@lang('lang.action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($data['collection'] as $item)
                                <tr>
                                    <td valign="top"><a href="{{url('admin/add-collection-show/'.@$item->id)}}">{{@$item->name}}</a></td>
                                    <td valign="top">{{@$item->description}}</td>
                                    <td valign="top"><img src="{{asset(@$item->dropicon)}}" class="content_list_wh_40" ></td>
                       
                                    <td valign="top">
                                        <div class="dropdown">
                                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                                                @lang('lang.select')
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="{{url('admin/add-collection-show/'.@$item->id)}}">@lang('lang.view')</a>
                                                <a class="dropdown-item" href="{{url('admin/add-collection-edit/'.@$item->id)}}">@lang('lang.edit')</a>
                                                <a class="dropdown-item" data-toggle="modal" data-target="#deleteClassModal{{@$item->id}}"  href="#">@lang('lang.delete')</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                  <div class="modal fade admin-query" id="deleteClassModal{{@$item->id}}" >
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">@lang('lang.delete') Colectie ?</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <div class="modal-body">
                                                <div class="text-center">
                                                    <h4>@lang('lang.are_you_sure_to_delete')</h4>
                                                </div>

                                                <div class="mt-40 d-flex justify-content-between">
                                                    <button type="button" class="primary-btn tr-bg" data-dismiss="modal">@lang('lang.cancel')</button>
                                                      <a href="{{ route('admin.deleteCollectionP',@$item->id)}}" class="text-light">
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

<script src="{{asset('public/backEnd/js/admin_upload.js')}}"></script>
<script type="text/javascript" src="{{asset('public/backEnd/')}}/js/bootstrap-datetimepicker.min.js"></script>
<!-- <script>
function readURL(input) {
   if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function (e) {
            $('.category-img-tag').attr('src', e.target.result);
      }
      
      reader.readAsDataURL(input.files[0]);
   }
}

$("#thembnails_upload").change(function(){
   readURL(this);
});
</script> -->
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