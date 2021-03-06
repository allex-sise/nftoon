<?php

namespace App\Http\Controllers\Auth;
use Session;
Use App\User;
use Socialite;
use App\Vendor;
use App\Balance;
use App\Profile;
use App\SocialLogin;
use App\RegistrationBonus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Modules\Systemsetting\Entities\InfixEmailSetting;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $reCaptcha = DB::table('re_captcha_settings')->first();
        if (@$reCaptcha->status == 1) {
            return Validator::make($data, [
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255','unique:users'],
            'phone' => ['required|string|size:10|regex:/[0-9]{9}/'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'g-recaptcha-response' => 'required|captcha',
        ]);
        } else {
            return Validator::make($data, [
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255','unique:users'],
            'phone' => ['required|string|size:10|regex:/[0-9]{9}/'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
        }
        // return Validator::make($data, [
        //     'full_name' => ['required', 'string', 'max:255'],
        //     'username' => ['required', 'string', 'max:255','unique:users'],
        //     'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
        //     'password' => ['required', 'string', 'min:8', 'confirmed'],
        // ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
       
        
        DB::beginTransaction();
        try {
            $Regbonus = RegistrationBonus::where('type',2)->where('status',1)->first();
            $user=new User();
            $user->role_id =5;
            $user->full_name=$data['first_name'].$data['last_name'];
            $user->username=$data['username'];
            $user->email=$data['email'];
            $user->style_id=0;
            $user->password=Hash::make($data['password']);
            $user->save();


            $profile=new Profile();
            $profile->user_id=$user->id;
            $profile->username=$data['username'];
            $profile->first_name=$data['first_name'];
            $profile->last_name=$data['last_name'];
            $profile->mobile=$data['phone'];
            $profile->email=$data['email'];
            $profile->save();


            $profile=new Vendor();
            $profile->user_id=$user->id;
            $profile->save();


            $balance=new Balance();
            $balance->user_id = $user->id;
            $balance->type    = 1;
            $balance->amount  = $Regbonus ? $Regbonus->bonus:0;
            $balance->save();

            
            DB::commit(); 
            return $user;
        } catch (\Exception $e) {
            Toastr::error('Something went wrong! please try again','Error');
            return redirect()->back();
        }
    }

    public function register(Request $request)
    {
        $this->validator($request->all())->validate();

        event(new Registered($user = $this->create($request->all())));

        $this->guard()->login($user);

        return $this->registered($request, $user)
                        ?: redirect($this->redirectPath());
    }

    public function showRegistrationForm()
    {
        return view('auth.sign_up');
    }
    public function CustomerRegistrationForm(Request $request)
    {
        if ($request->has('ref')) {
            session(['referrer' => $request->query('ref')]);
        }
        return view('auth.customer_register');
    }

    //social login

    public function redirectToProvider($provider)
    {
        Session::put('role_id', '4');
        return Socialite::driver($provider)->redirect();
    }

    public function customerRegistration(Request $data){
       

        $reCaptcha = DB::table('re_captcha_settings')->first();
        if (@$reCaptcha->status == 1) {
            $this->validate($data,[
                'first_name' => 'required', 'string', 'max:255',
                'last_name' => 'required', 'string', 'max:255',
                'username' => 'required|string|max:255|unique:users',
                'phone' => 'required|string|size:10|regex:/[0-9]{9}/',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:8|confirmed',
                'g-recaptcha-response' => 'required|captcha',
            ]);
        } else {
            $this->validate($data,[
                'first_name' => 'required', 'string', 'max:255',
                'last_name' => 'required', 'string', 'max:255',
                'phone' => 'required|string|size:10|regex:/[0-9]{9}/',
                'username' => 'required|string|max:255|unique:users',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:8|confirmed',
            ]);
        }
        // return $data;
       
        DB::beginTransaction();
        try {
            $Regbonus = RegistrationBonus::where('type',2)->where('status',1)->first();
            $user=new User();
            $user->role_id =5;
            $user->full_name=$data['first_name'].$data['last_name'];
            $user->username=$data['username'];
            $user->style_id=0;
            $user->email=$data['email'];
            $referrer = User::whereUsername(session()->pull('referrer'))->first();
            if($data['refer']){
                $user->referrer_id = $data['refer'];
            }
            else{
                $user->referrer_id = 1;
            }
            $user->password=Hash::make($data['password']);
            $user->save();


            $profile=new Profile();
            $profile->user_id=$user->id;
            $profile->username=$data['username'];
            $profile->first_name=$data['first_name'];
            $profile->last_name=$data['last_name'];
            $profile->mobile=$data['phone'];
            $profile->email=$data['email'];
            $profile->save();


            $profile=new Vendor();
            $profile->user_id=$user->id;
            $profile->save();


            $balance=new Balance();
            $balance->user_id = $user->id;
            $balance->type    = 1;
            $balance->amount  = $Regbonus ? $Regbonus->bonus:0;
            $balance->save();

            
            DB::commit(); 

            Auth::login($user);
            //Start Verification Email Send
            $token = app('auth.password.broker')->createToken($user); 

            $user->verification_token=$token;
            $user->save();
            $data = ['username'=> $user->email,'reset_url'=> route('verify_new_user',$token)];
            
            $settings = InfixEmailSetting::first();
            $reciver_email = $user->email;
            $receiver_name =  $user->full_name;
            $subject = 'Confirmare Adresa de Email';
            $view ="mail.resend_verify_email"; 
            $compact['data'] =  $data; 
            @send_mail($reciver_email, $receiver_name, $subject , $view ,$compact);
            //End Verification Email Send

            Toastr::success('Te rugam sa iti verifici e-mailul pentru link-ul de verificare');
            return redirect('login');
        } catch (\Exception $e) {
            Toastr::error('Something went wrong! please try again','Error');
            return redirect()->back();
        }
    }
 
 
}