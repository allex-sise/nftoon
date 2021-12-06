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
<div class="no-bottom no-top" id="content">
            <div id="top"></div>
            
            <!-- section begin -->
            <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
                    <div class="center-y relative text-center">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-12 text-center">
									<h1>Autentificare in doi pasi</h1>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- section close -->       
<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card-group">
            <div class="card p-4">
                <div class="card-body text-center">
                    @if(session()->has('message'))
                        <p class="alert alert-info">
                            {{ session()->get('message') }}
                        </p>
                    @endif
                    <form method="POST" action="{{ route('verify.store') }}">
                        {{ csrf_field() }}
                        <h1>Verificare Two Factor</h1>
                        <p class="text-muted">
                            Ai primit un sms cu codul pentru verificarea in doi pasi.
                            Daca nu ai primit sms-ul apasa <a href="{{ route('verify.resend') }}">aici</a>.
                        </p>
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
                            <div class="col-6" style="display: block; margin: 0 auto;">
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
            </div>
        </div>
    </div>
</div>

<form id="logoutform" action="{{ route('logout') }}" method="POST" style="display: none;">
    {{ csrf_field() }}
</form>
</div>
@endsection