<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use GuzzleHttp\Client;

class TwoFactorCode extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return view('auth.twoFactor');
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        // $client = new Client;
		// $request = $client->request('POST', 'https://app.smso.ro/api/v1/send', [
		// 		'headers' => [
		// 			'X-Authorization' => 'Wyu1WaV1LJwx6URrGDTE7AXcspcWJ50Sic7bdgwE',
		// 		],
		// 	'form_params' => [
		// 		'to' => '+4'.$request->phone,
		// 		'body' => $user->pincode,
		// 		'sender' => '4',
		// 	],
		// ]);
        $client = new Client;
        $request = $client->request('POST', 'https://app.smso.ro/api/v1/send', [
                'headers' => [
                    'X-Authorization' => 'Wyu1WaV1LJwx6URrGDTE7AXcspcWJ50Sic7bdgwE',
                ],
            'form_params' => [
                'to' => '+40753411082',
                'body' => $notifiable->two_factor_code,
                'sender' => '4',
            ],
        ]);


        // return (new MailMessage)
        // ->line('Your two factor code is '.$notifiable->two_factor_code)
        // ->line('Your two factor code is '.$notifiable->user)
        // ->action('Verify Here', route('verify.index'))
        // ->line('The code will expire in 10 minutes')
        // ->line('If you have not tried to login, ignore this message.');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
