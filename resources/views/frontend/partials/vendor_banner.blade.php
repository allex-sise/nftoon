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
                                <img src="{{ file_exists(@$profile) ? asset($profile) : asset('public/uploads/user/user.png') }} " width="100" alt="" style="border-radius: 50%;">
                                </div>
                                <div class="profile_name">
                                   <h5>{{  @$data['user']->username }}</h5>
                                    <p>{{ @$data['user']->profile->country->name,','}} <br />@lang('lang.member_since') {{DateFormat(@$data['user']->created_at)}} </p>
                                    @if (@Auth::user()->id != @$data['user']->id)
                                    <div class="view-follow">
                                        <a href="#" class="boxed-btn">@lang('lang.view_portfolio')</a>
                                        <a href="#" class="boxed-btn">@lang('lang.follow')</a>
                                    </div>
                                    @endif
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
