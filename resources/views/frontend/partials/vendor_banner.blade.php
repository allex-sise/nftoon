<style>
.banner-area3::before {
    z-index: -2;
}
</style>
<div class="banner-area3">
        <div class="banner-area-inner">
            <div class="container">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="banner-info mb-30 d-flex justify-content-between align-items-center">
                            <div class="profile_author d-flex align-items-center">
                                <div class="thumb">
                                @php
                                    $profile=$data['user']->profile->image;
                                @endphp
                                <img src="{{ file_exists(@$profile) ? asset($profile) : asset('public/uploads/user/user.png') }} " width="100" alt="" style="border-radius: 50%; border: 5px solid #FFF!important;">
                                </div>
                                <div class="profile_name" style="margin-left: -35px;">
                                   <h1><span>@</span>{{  @$data['user']->username }}</h1><br />
                                   <h5>{{  @$data['user']->full_name }}</h5>
                                
                                </div>
                            </div>
                             @if (@Auth::user()->role_id == 4)
                            @php
                                $item = App\ManageQuery::CountItemSell($data['user']->id);
                            @endphp
                                <div class="rating d-flex">
                                 
                                    <div class="sate-total">
                                        <p>@lang('lang.total_sales')</p>
                                        <h3>{{ @$item}}</h3>
                                    </div>
                                </div>
                                @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
