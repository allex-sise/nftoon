@extends('backend.master')
@section('mainContent')

<section class="sms-breadcrumb mb-40 white-box">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <h1>Lista Abonati Newsletter</h1>
            <div class="bc-pages">
                <a href="{{url('admin/dashboard')}}">@lang('lang.dashboard')</a>
                <a href="#" class="active">@lang('lang.Product') @lang('lang.list')</a>
            </div>
        </div>
    </div>
</section>
<section class="admin-visitor-area DM_table_info">
    <div class="container-fluid p-0">  
        <div class="row">
            <div class="col-lg-8 col-md-6">
            </div>
          
                    </div>
            <div class="col-lg-12 mt-20">
                <div class="row">
                    <div class="col-lg-4 no-gutters">
                        <div class="main-title sm_mb_20 lm_mb_35">
                            <h3 class="mb-0">Abonati la newsletter </h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                    <div class="col-lg-12">                        
                        <table id="table_id" class="display school-table" cellspacing="0" width="100%">
                            <thead>                           
                                <tr>
                                    <th>@lang('lang.id')</th>
                                    <th>@lang('lang.email')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($newsletter as $item)
                            
                                <tr>
                                    <td>{{ @$item->id }}</td>
                                    <td valign="top">{{ @$item->email }}</a></td>
                                   
                                    
                                </tr>
                                  <div class="modal fade admin-query" id="deleteClassModal{{@$item->id}}" >
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">@lang('lang.delete') @lang('lang.product')</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <div class="modal-body">
                                                <div class="text-center">
                                                    <h4>@lang('lang.are_you_sure_to_delete')</h4>
                                                </div>

                                                <div class="mt-40 d-flex justify-content-between">
                                                    <button type="button" class="primary-btn tr-bg" data-dismiss="modal">@lang('lang.cancel')</button>
                                                    <a href="{{ route('admin.itemDelete',@$item->id) }}" class="text-light">
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
</section>


@endsection



