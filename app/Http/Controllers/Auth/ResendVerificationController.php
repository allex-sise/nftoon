<?php

namespace App\Http\Controllers\Auth;

use App\User;
use DateTime;
use App\Mail\TestMail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Modules\Systemsetting\Entities\InfixEmailSetting;

class ResendVerificationController extends Controller
{
    public function resendVerificationEmail(){
      
        try {
            $user=User::find(Auth::user()->id);

            if ($user) {

                //Laravel 
                // $user->sendEmailVerificationNotification();

                //Custom 
                //  Session::put('email',$user->email);

                    $token = app('auth.password.broker')->createToken($user); 

                    $user->verification_token=$token;
                    $user->save();

                    $data = ['username'=> $user->email,'reset_url'=> route('verify_new_user',$token)];
                    
                    // Mail::send('mail.resend_verify_email', $data, function($message) use($user){
                    //     $message->to($user->email)
                    //     ->subject('Verification Email');
                    // });

                    $settings = InfixEmailSetting::first();
                    $reciver_email = Auth::user()->email;
                    $receiver_name =  Auth::user()->full_name;
                    $subject = 'Email de Confirmare';
                    $view ="mail.resend_verify_email";
                    // $compact['data'] =  array('email' => $settings->from_email,'name' => Auth::user()->full_name); 
                    $compact['data'] =  $data; 
                    @send_mail($reciver_email, $receiver_name, $subject , $view ,$compact);

                Toastr::success('Te rugam sa iti verifici e-mailul pentru link-ul de verificare');
                return view('frontend.email.veriry_mail');
            }else{
                Toastr::success('Informatii utilizator de negasit!');
                return redirect('login');
            }
        } catch (\Exception $th) {
            // dd($th);
            Toastr::error('Operation Failed', 'Failed');
            return redirect('login');
        }
      
        
    }
    public function userVerify($token){
        // return Auth::user()->verification_token;
        try {
            if (Auth::user()->verification_token==$token) {
            
                $user=User::find(Auth::user()->id);
                $date = new DateTime();
                $user->verified=1;
                $user->status=1;
                $user->verification_token=null;
                $user->email_verified_at=$date->getTimestamp();
                $user->save();
                Toastr::success('You are verified!');
                return redirect('/');
            } else {
                Toastr::success('Token not matched !');
                return redirect('/');
            }
        } catch (\Throwable $th) {
            Toastr::error('Operation Failed', 'Failed');
            return redirect('login');
        }
      
        
    }
}
