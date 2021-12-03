@extends('frontend.master')
@push('css')
    <link rel="stylesheet" href="{{ asset('public/frontend/css/') }}/index_item.css">
    <style>
    .verify_mail_area{
        padding: 243px 0 250px 0;
    }
    .verify_text h3{
        font-size: 32px;
        color:#000000;
        margin-bottom: 21px;
        font-weight: 700;
        magin-bottom: 0;
        margin-bottom: 50px;
    }
    .verify_text p{
        color: #888888;
        font-size: 14px;
        font-weight: 300;
        margin-bottom: 0;
    }
    .verify_text p a{
        font-weight: 500;
        color: #000;
        border-bottom: 1px solid #000;
    }
    .verify_text p a:hover{
        color: #7c32ff;
        border-bottom: 1px solid #7c32ff;
    }
    .links_back{
        padding: 25px 55px;
        display: inline-block;
    }
    </style>
@endpush
@section('content')

     <!-- section begin -->
    <section id="subheader" class="text-light" data-bgimage="url({{ asset('public/frontend/assets/images/background/subheader.jpg' )}}) top">
        <div class="center-y relative text-center">
            <div class="container">
                <div class="row">
                    
                    <div class="col-md-12 text-center">
                        <h1>Verificare Adresa de Mail</h1>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- section close -->       
    <div class="verify_mail_area">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12">
                    <div class="verify_text text-center">
                        <h3>Confirma adresa de email</h3>
                        <div class="links_back">
                        Inainte de a continua, te rugam sa verifici e-mailul pentru un link de verificare. 
                        <br />
                        Daca nu ai primit e-mailul.
                            <form action="{{ route('verification_resend') }}" method="post" class="mt-20">
                                @csrf
                                <button class="boxed-btn" type="submit">Fa Click aici pentru a retrimite email de confirmare</button>
                            </form>
                        {{-- </p> --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection