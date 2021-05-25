@php 
$homepage = Modules\Pages\Entities\InfixHomePage::where('active_status', 1)->first();
@endphp 

<div class="banner-area">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 offset-xl-2">
                    <div class="banner-info text-center">
                        <h2>{{@$homepage->homepage_title}}</h2>
                        {{-- <p>{{@$homepage->homepage_description}}</p> --}}
                        <h4>{{@$homepage->homepage_description}}</h4>
                    </div>
                 
                </div>
            </div>
        </div>
    </div>