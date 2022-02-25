@extends('frontend.master')
@push('css')
<style>
#partitioned {
  padding-left: 17px;
  letter-spacing: 39px;
  border: 0;
  background-image: linear-gradient(to left, black 70%, rgba(255, 255, 255, 0) 0%);
  background-position: bottom;
  background-size: 50px 1px;
  background-repeat: repeat-x;
  background-position-x: 35px;
  width: 305px;
  min-width: 305px;
}

#divInner{
  left: 0;
  position: sticky;
}

#divOuter{
  width: 290px; 
  margin: 0 auto;
  display: block;
  margin-top: 50px;
  margin-bottom: 50px;
  overflow: hidden;
}
header{
    display: none;
}
footer{
    display: none;
}
.btnverif{
    width: 350px!important;
}
@media only screen and (max-width: 767px) {
.btnverif{
    width: 100%!important;
}
.col-6{
    width: 100%!important;
}
h1{
    font-size: 30px!important;
}
}
</style>
@endpush
@section('content')

    <!-- start page title area -->
    <div class="rn-breadcrumb-inner ptb--30">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <h5 class="title text-center text-md-start">Autentificare in doi pasi</h5>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-list">
                        <li class="item"><a href="index.html">Acasa</a></li>
                        <li class="separator"><i class="feather-chevron-right"></i></li>
                        <li class="item current">Autentificare in doi pasi</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end page title area -->
  <!-- start connect area -->
  <div class="rn-connect-area rn-section-gapTop">
        <div class="container">
            <div class="row g mb--50 mb_md--30 mb_sm--30 align-items-center">
                <div class="col-lg-6" data-sal="slide-up" data-sal-delay="150" data-sal-duration="800">
                    <h3 class="connect-title" style="text-align: center;">Verificare Two Factor</h3>
                    <p class="connect-td" style="text-align: center;">Ai primit un sms cu codul pentru verificarea in doi pasi.
                            Daca nu ai primit sms-ul apasa <a href="{{ route('verify.resend') }}">aici</a>.</p>
                </div>
              
            </div>
            <div class="row g-5">
            @if(session()->has('message'))
                    <p class="alert alert-info">
                        {{ session()->get('message') }}
                    </p>
                @endif

                <form method="POST" action="{{ route('verify.store') }}">
                    {{ csrf_field() }}
               
                    <div id="divOuter">
                        <div id="divInner">
                            <input id="partitioned" type="text" name="two_factor_code" maxlength="6" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  onKeyPress="if(this.value.length==6) return false;" class="{{ $errors->has('two_factor_code') ? ' is-invalid' : '' }}"  required autofocus />
                            @if($errors->has('two_factor_code'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('two_factor_code') }}
                                </div>
                            @endif  
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6" style="display: block; margin: 0 auto; text-align: center;">
                            <button type="submit" class="btn btn-success px-4 btnverif">
                                Verfica
                            </button>
                            <p style="padding-top: 20px;"> sau </p>
                            <a class="btn btn-danger px-4" href="#" onclick="event.preventDefault(); document.getElementById('logoutform').submit();">
                                Logout
                            </a>
                        </div>
                    </div>
                </form>
          

            </div>
            <form id="logoutform" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
            </form>
        </div>
    </div>
      


@endsection