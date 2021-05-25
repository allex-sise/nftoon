<?php

namespace App\Jobs;

use App\Mail\SendMail;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Modules\Systemsetting\Entities\InfixEmailSetting;

class SendEmailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    protected $data;
    protected $to_email;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($data,$to_email)
    {
        $this->data = $data;
        $this->to_email = $to_email;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // Mail::send('mail.mail', ['data' => $this->data] , function ($message) {
        //     $message->from($this->data['system_email']);
        //     $message->subject($this->data['email_sms_title']);
        //     $message->to($this->to_email);
        //     // $message->to($this->to_email)->cc('xxx@yahoo.co.uk');
        // });

        // $data = ['username'=> $user->email,'reset_url'=> route('verify_new_user',$token)];
            
        $settings = InfixEmailSetting::first();
        $reciver_email = $this->to_email;
        $receiver_name =  $this->data['to_name'];
        $subject = $this->data['email_sms_title'];
        $view ="mail.mail"; 
        $compact['data'] =  $this->data; 
        @send_mail($reciver_email, $receiver_name, $subject , $view ,$compact);

        // $email = new SendMail();
        // Mail::to($this->data['email'])->send($email);
    }
}