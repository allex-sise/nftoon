<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Notifications\TwoFactorCode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use GuzzleHttp\Client;
use Brian2694\Toastr\Facades\Toastr;

class TwoFactorController extends Controller
{

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';


    public function __construct()
    {
        $this->middleware(['auth', 'twofactor']);
    }

    public function index() 
    {
        return view('auth.twoFactor');
    }

    public function store(Request $request)
    {
        $request->validate([
            'two_factor_code' => 'integer|required',
        ]);

        $user = Auth::user();

        if($request->input('two_factor_code') == $user->two_factor_code)
        {
            $user->resetTwoFactorCode();
            Toastr::success('Te-ai autentificat cu succes!');
            return redirect($this->redirectTo);
        }

        return redirect()->back()->withErrors(['two_factor_code' => 'Codul introdus nu este acelasi cu cel primit prin SMS']);
    }

    public function resend()
    {
        $user = Auth::user();
        $user->generateTwoFactorCode();
        $client = new Client;
        $request = $client->request('POST', 'https://app.smso.ro/api/v1/send', [
                'headers' => [
                    'X-Authorization' => 'Wyu1WaV1LJwx6URrGDTE7AXcspcWJ50Sic7bdgwE',
                ],
            'form_params' => [
                'to' => '+4'.$user->profile->mobile,
                'body' => $user->two_factor_code,
                'sender' => '4',
            ],
        ]);
        return view('auth.twoFactor')->withMessage('Codul de autentificare a fost trimis din nou!');
      
    }
}
