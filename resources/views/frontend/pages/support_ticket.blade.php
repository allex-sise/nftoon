@extends('frontend.master')
@push('css')
<link rel="stylesheet" href="{{ asset('public/frontend/') }}/support_ticket.css">
@endpush
@section('content')
@php
function showPicName($data){
    $name = explode('/', $data);
    return $name[3];
}
@endphp
<!-- start page title area -->
<div class="rn-breadcrumb-inner ptb--30">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
                <h5 class="title text-center text-md-start">@lang('lang.support_ticket')</h5>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <ul class="breadcrumb-list">
                    <li class="item"><a href="{{ url('/')}}">Acasa</a></li>
                    <li class="separator"><i class="feather-chevron-right"></i></li>
                    <li class="item current">@lang('lang.support_ticket')</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- end page title area -->
 <!-- support center -->
 <div class="rn-support-area rn-section-gapTop">
        <div class="container">
            <div class="row g-6">
                <div class="col-lg-4">
                    <div class="rn-support-read">
                        <div class="tiket-nav gray-bg">
                            <div class="nav flex-column" id="v-pills-tab" role="tablist"
                                aria-orientation="vertical">
                                @if (@$viewTicket)
                                    <a class="nav-link active btn btn-primary-alta" style="margin-bottom: 20px;" id="v-pills-home-tab" data-toggle="pill"
                                    href="#v-pills-home" role="tab" aria-controls="v-pills-home"
                                    aria-selected="true">@lang('lang.support_ticket')</a>
                                    <a href="{{ route('SupportTicket') }}" class="nav-link">@lang('lang.tickets')</a>
                                    @else
                                    <a class="nav-link active btn btn-primary-alta" style="margin-bottom: 20px;" id="v-pills-profile-tab" data-toggle="pill"
                                    href="#v-pills-profile" role="tab" aria-controls="v-pills-profile"
                                    aria-selected="false">@lang('lang.tickets')</a>

                                <a class="nav-link btn btn-primary-alta" style="margin-bottom: 20px;" id="v-pills-messages-tab" data-toggle="pill"
                                    href="#v-pills-messages" role="tab" aria-controls="v-pills-messages"
                                    aria-selected="false">@lang('lang.open_new_ticket')</a>
                                @endif

                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="support-accordion">
                    <div class="tab-content" id="v-pills-tabContent">
                                @if (@$viewTicket)
                                <div class="tab-pane fade active show" id="v-pills-home" role="tabpanel"
                                    aria-labelledby="v-pills-home-tab">
                                    <div class="tiket_main_content">
                                    <h3>@lang('lang.view_ticket') #00{{ @$viewTicket->id }}</h3>
                                        <div class="subject">
                                            @lang('lang.subject')
                                        </div>
                                    <a href="#" class="weblink">{{ @$viewTicket->subject }}</a>
                                        <div class="custom-table">
                                            <table>
                                                <thead>
                                                    <tr class="table-row">
                                                        <th scope="col">@lang('lang.submitted')</th>
                                                        <th scope="col">@lang('lang.status')</th>
                                                        <th scope="col">@lang('lang.department')</th>
                                                        <th scope="col">@lang('lang.priority')</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td data-label="Account">{{DateFormat(@$viewTicket->created_at)}}</td>
                                                        <td data-label="Due Date">
                                                            {{ @$viewTicket->active_status == 1 ? 'closed' :'pending' }}
                                                        
                                                        </td>
                                                        <td data-label="Period">{{ @$viewTicket->ticket_department->name}}</td>
                                                        <td data-label="Period">{{ @$viewTicket->ticket_priority->name}}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="ticket-btn">
                                            <a href="#" class="boxed-btn-gray">@lang('lang.back')</a>
                                            <a href="#" id="ReplyComment" class="boxed-btn">@lang('lang.Replay')</a>
                                        </div>
                                        <div class="replay_area gray-bg">
                                            <h3>@lang('lang.Replay')</h3>
                                             <form action="{{ route('user.comment_store') }}" method="POST" enctype="multipart/form-data">
                                                @csrf
                                                <input type="text" hidden value="{{ @$viewTicket->id }}" name="id">
                                                <div class="row">
                                                    <div class="col-xl-12">
                                                        <label for="#">@lang('lang.messege') <span>*</span></label>
                                                        <textarea name="comment" class="comment_text" cols="30" rows="10"
                                                            placeholder="Street Address"></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-xl-8 p-0">
                                                    <div class="upload-image">
                                                        <label for="#">@lang('lang.upload_an_image')</label>
                                                        <div class="upload_image_input">
                                                            <input type="file" placeholder="No file selected" name="file" onchange="AttachFile1(this)">
                                                            <div class="upload_image_overlay">
                                                                <span class="brouse-here">@lang('lang.browse')</span>
                                                                <span id="attach_file1">@lang('lang.No_file_selected')</span>
                                                                <i class="ti-plus"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="extention">@lang('lang.supported_extensions')</p>
                                                <button class="boxed-btn" type="submit">@lang('lang.submit')</button>
                                            </form>
                                        </div>
                                        @foreach ($comment as $item)      
                                        @if (!@$item->comment_id)                                        
                                        <div class="tickt_mail gray-bg">
                                          <div class="ticket_header d-flex ">
                                                <div class="thumb">
                                                <img src="{{ @$item->user->profile->image? asset(@$item->user->profile->image):asset('public/frontend/img/profile/1.png')}}" height="60" width="60" alt="">
                                                </div>
                                            <p>{{ @$item->user->username }} <span>{{DateFormat(@$item->created_at)}}</span> </p>
                                            </div>
                                            <div class="main_ticket_wrap tick_style">
                                                <div class="mail_mail">
                                                    <p class="para_2">{!! @$item->comment !!} </p>
                                                    @if ($item->file)
                                                        <div class="ticket_bottom d-flex justify-content-between">
                                                            <p>@lang('lang.attach_a_file')</p>
                                                            <p><a href="{{url('download-comment-document/'.showPicName(@$item->file))}}">@lang('lang.download')</a></p>
                                                        </div>
                                                    @endif
                                                   
                                                </div>
                                            </div>
                                            <div class="ticket-btn">
                                                    <button  class="boxed-btn submit_comment{{@$item->id}}" id="t" onclick="submit_comment({{@$item->id}})">@lang('lang.Replay')</button>
                                            </div>

                                            <div class="replay_area gray-bg reply_Tox" id="{{@$item->id}}">
                                                    <h3>@lang('lang.Replay')</h3>
                                                     <form action="{{ route('user.comment_store') }}" method="POST" enctype="multipart/form-data">
                                                        @csrf
                                                     <input type="text" hidden value="{{ @$viewTicket->id }}" name="id">
                                                     <input type="text" hidden value="{{ @$item->id }}" name="comment_id">
                                                        <div class="row">
                                                            <div class="col-xl-12">
                                                                <label for="#">@lang('lang.messege') <span>*</span></label>
                                                                <textarea name="comment" class="comment_text" cols="30" rows="10"
                                                                    placeholder="Street Address"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-8 p-0">
                                                            <div class="upload-image">
                                                                <label for="#">@lang('lang.upload_an_image')</label>
                                                                <div class="upload_image_input">
                                                                    <input type="file" placeholder="No file selected" name="file" onchange="AttachFile2(this)">
                                                                    <div class="upload_image_overlay">
                                                                        <span class="brouse-here">@lang('lang.browse')</span>
                                                                        <span id="attach_file2">@lang('lang.No_file_selected')</span>
                                                                        <i class="ti-plus"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p class="extention">@lang('lang.supported_extensions')</p>
                                                        <button class="boxed-btn" type="submit">@lang('lang.submit')</button>
                                                    </form>
                                                 </div>
                                        </div>
                                        
                                          
                                        @endif
                                        @if (@$item->comment_id)                                            
                                        <div class="ticket_last_mail gray-bg">
                                            <div class="ticket_header d-flex justify-content-end">
                                                <p> <span>{{ DateFormat(@$item->created_at)}} </span> {{ @$item->user->username }}</p>
                                                <div class="thumb">
                                                        <img src="{{ @$item->user->profile->image? asset(@$item->user->profile->image):asset('public/frontend/img/profile/1.png')}}" height="60" width="60" alt="">
                                                </div>
                                            </div>
                                            <div class="ticket_mail_info">
                                                    <p class="para_2">{!! @$item->comment !!} </p>
                                                    @if ($item->file)
                                                        <div class="ticket_bottom d-flex justify-content-between">
                                                            <p>@lang('lang.attach_a_file')</p>
                                                            <p><a href="{{url('download-comment-document/'.showPicName(@$item->file))}}">@lang('lang.download')</a></p>
                                                        </div>
                                                    @endif
                                            </div>
                                            <div class="ticket-btn">
                                                    <button  class="boxed-btn submit_comment{{@$item->id}}" id="t" onclick="submit_comment({{@$item->id}})">@lang('lang.Replay')</button>
                                            </div>

                                            <div class="replay_area gray-bg reply_Tox" id="{{@$item->id}}">
                                                    <h3>@lang('lang.Replay')</h3>
                                                     <form action="{{ route('user.comment_store') }}" method="POST" enctype="multipart/form-data">
                                                        @csrf
                                                     <input type="text" hidden value="{{ @$viewTicket->id }}" name="id">
                                                     <input type="text" hidden value="{{ @$item->id }}" name="comment_id">
                                                        <div class="row">
                                                            <div class="col-xl-12">
                                                                <label for="#">@lang('lang.messege') <span>*</span></label>
                                                                <textarea name="comment" class="comment_text" cols="30" rows="10"
                                                                    placeholder="Street Address"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-8 p-0">
                                                            <div class="upload-image">
                                                                <label for="#">@lang('lang.upload_an_image')</label>
                                                                <div class="upload_image_input">
                                                                    <input type="file" placeholder="No file selected" name="file" onchange="AttachFile3(this)">
                                                                    <div class="upload_image_overlay">
                                                                        <span class="brouse-here">@lang('lang.browse')</span>
                                                                        <span id="attach_file3">@lang('lang.No_file_selected')</span>
                                                                        <i class="ti-plus"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p class="extention">@lang('lang.supported_extensions')</p>
                                                        <button class="boxed-btn" type="submit">@lang('lang.submit')</button>
                                                    </form>
                                                 </div>
                                        </div>
                                        @endif

                                        @endforeach
                                    </div>
                                </div>
                                @else
                                <div class="tab-pane fade active show" id="v-pills-profile" role="tabpanel"
                                    aria-labelledby="v-pills-profile-tab">

                                    <div class="tiket_submited gray-bg">
                                        <h3>{{@$ticket_page->heading}}</h3>
                                    <p>{{@$ticket_page->ticket_text}}</p>

                                        <div class="custom-table">
                                            <table>
                                                <thead>
                                                    <tr class="table-row">
                                                        <th scope="col">@lang('lang.ticket_id')</th>
                                                        <th scope="col">@lang('lang.subject')</th>
                                                        <th scope="col">@lang('lang.status')</th>
                                                        <th scope="col">@lang('lang.last_updated')</th>
                                                        <th scope="col">@lang('lang.department')</th>
                                                        <th scope="col">@lang('lang.action')</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($ticket as $key => $item)
                                                        <tr>
                                                        <td data-label="Account">#00{{ $key+1 }}</td>
                                                        <td data-label="Due Date">{{ @$item->subject }}</td>
                                                        <td data-label="Amount"><a href="#"  class="boxed-btn">{{ @$item->active_status == 1 ? 'closed' :'pending' }}</a></td>
                                                        <td data-label="Period">{{DateFormat(@$item->created_at)}}</td>
                                                        <td data-label="Period">{{ @$item->ticket_department->name}}</td>
                                                        <td data-label="">
                                                        <a href="{{ route('user.ticket_view', @$item->id) }}" class="boxed-btn">@lang('lang.view')</a>
                                                        </td>
                                                        </tr>
                                                    @endforeach
                                                
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
                                    aria-labelledby="v-pills-messages-tab">
                                    <div class="form-wrapper-one">
                        <form action="{{ route('user.ticket_store') }}" class="ticket_form_info-form row" method="POST" enctype="multipart/form-data">
                        @csrf
                                            <h4>@lang('lang.open_a_new_tickets')</h4>
                                            <div class="row">
                                                <div class="col-xl-6 col-md-6"> 
                                                    @php
                                                        $department =App\ManageQuery::InfixDepartment();
                                                    @endphp
                                                    <label for="name">@lang('lang.department')<span>*</span></label>
                                                    <select name="department_id" class="wide" id="">
                                                        <option data-display="Select department"></option>
                                                        @foreach ( $department as $item)                                                            
                                                        <option value="{{ @$item->id }}">{{ @$item->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="col-xl-6 col-md-6"> 
                                                    <label for="name">@lang('lang.related_service')<span>*</span></label>
                                                    <select name="category_id" class="wide" id="">
                                                        <option data-display="Select service"></option>
                                                        @foreach ( $data['ticket_category'] as $item)                                                            
                                                        <option value="{{ @$item->id }}">{{ @$item->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="col-xl-6 col-md-6">
                                                    <label for="name">@lang('lang.priority')<span>*</span></label>
                                                    <select name="priority_id" class="wide" id="">
                                                            <option data-display="Select priority"></option>
                                                            @foreach ( $data['ticket_priority'] as $item)                                                            
                                                            <option value="{{ @$item->id }}">{{ @$item->name }}</option>
                                                            @endforeach
                                                    </select>
                                                </div>
                                                <div class="col-xl-6 col-md-6">
                                                    <label for="name">@lang('lang.subject')<span>*</span></label>
                                                    <input type="text" name="subject" placeholder="Enter subject">
                                                </div>

                                                <div class="col-xl-12 col-md-12">
                                                    <label for="name">@lang('lang.message')<span>*</span></label>
                                                    <textarea id="editor1" name="description"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-xl-12 col-md-12">
                                                <div class="check-out-btn" style="margin-top: 10px;">
                                                    <button type="submit" class="btn btn-primary btn-large w-100">@lang('lang.open_ticket')</button>
                                                </div>
                                            </div>

                                            </form>
                                        </div>

                                </div>
                                @endif
                                
                            </div>
                            
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('js')
<script src="https://cdn.ckeditor.com/4.5.1/standard/ckeditor.js"></script>
{{-- <script src="{{ asset('public/frontend/js/') }}/ticket.js"></script> --}}
<script src="{{ asset('public/frontend/js/') }}/frontend_editor.js"></script>
<script>
function AttachFile4(input) {
    $("#attach_file4").text(input.files[0].name);
}
</script>
<script>
    @if(count($errors) > 0)
        @foreach($errors->all() as $error)
            toastr.error("{{ $error }}");
        @endforeach
    @endif
</script>



@endpush