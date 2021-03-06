<style>
.banner-area3::before {
    z-index: -2;
}
.details-tablist-area::before {
    background: var(--secondary-color)!important;
}
.nav-link{
    color: #FFF!important;
}
.light-scheme .nav-link {
    color: #000!important;
}
.light-scheme .details-tablist-area .details-tablist ul li a.active::before{
    background: #000!important;
}
</style>
 <!-- section begin -->
 <section id="profile_banner" aria-label="section" class="text-light" data-bgimage="url({{ @$data['user']->profile->logo_pic? asset(@$data['user']->profile->logo_pic):asset('public/frontend/img/banner/banner.png') }}) top">

</section>
<!-- section close -->
<section aria-label="section" class="specialsectionmobile" style="padding-bottom: 0px;">
                <div class="container">
					<div class="row specialrowuserpage">
<div class="col-md-12">
    <div class="d_profile de-flex">
        <div class="de-flex-col">
            <div class="profile_avatar">
                <img src="{{ @$data['user']->profile->image? asset(@$data['user']->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                <i class="fa fa-check"></i>
                <div class="profile_name">
                    <h4>
                    {{  @$data['user']->full_name }}                                                
                        <span class="profile_username"><span>@</span>{{  @$data['user']->username }}</span>
                            @php
                                $walletz =  App\AuthorPayoutSetup::where('user_id', $data['user']->id)->where('payment_method_name','Bank')->first(); 
                            @endphp 
                        <span id="wallet" class="profile_wallet">
                        {{ $walletz->payout_email ?? '' }}
                        </span>
                        @if($walletz) <button id="btn_copy" title="Copy Text">Copy</button> @endif
                    </h4>
                </div>
            </div>
        </div>
        @php
            $item =App\ManageQuery::CountItemSell($data['user']->id);
            $itemHistory = App\ItemOrder::where('author_id', $data['user']->id)->count();
        @endphp
        <div class="profile_follow de-flex">
            <div class="de-flex-col">
                <div class="profile_follower">@lang('lang.total') @lang('lang.sales') {{ @$itemHistory}}</div>
                    
            </div>
        </div>

    </div>
</div>
</div>
</div>
</section>