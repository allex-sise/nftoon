<?php

namespace App;

use Carbon\Carbon;
use Laravel\Passport\HasApiTokens;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Notifications\Messages\MailMessage;
use Modules\Systemsetting\Entities\InfixEmailSetting;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens;
    // use SoftDeletes;
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username', 'email', 'password','role_id','email_verified_at','referrer_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $appends = ['referral_link'];
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function identities() {
        return $this->hasMany('App\SocialLogin');
     }
    public function item() {
        return $this->hasMany('App\Item');
     }
    public function coupon() {
        return $this->hasMany('App\Coupon');
     }

     public function profile(){
        return $this->hasOne('App\Profile');
    }
    public function balance(){
        return $this->hasOne('App\Balance');
    }
    public function customer(){
        return $this->hasOne('App\Customer');
    }
    public function vendor(){
        return $this->hasOne('App\Vendor');
    }

    public function role(){
        return $this->hasOne('App\Role','id','role_id');
    }

    public function CountItem($category=null,$sub=null){
        if (isset($sub) && isset($category)) {
            $data = Item::where('category_id',$category)->where('sub_category_id',$sub)->where('active_status', 1)->where('status', 1)->count(); 
            return $data;
        }
    }

    public function followers()
    {
        return $this->belongsToMany(User::class, 'followers', 'leader_id', 'follower_id')->withTimestamps();
    }

    public function followings()
    {
        return $this->belongsToMany(User::class, 'followers', 'follower_id', 'leader_id')->withTimestamps();
    }

    function followfind(){
        return $this->hasOne('App\Follower','follower_id');
    }
    function buyPackage(){
        return $this->hasMany('App\BuyPackage','user_id','id');
    }
    function itemOrder(){
        return $this->hasMany('App\ItemOrder','user_id','id')->orderBy('id','desc');
    }
    function AuthorOrder(){
        return $this->hasMany('App\ItemOrder','author_id','id')->orderBy('id','desc');
    }
    function itemRefund(){
        return $this->hasMany('App\Refund','author_id','id');
    }
    public function referrer()
    {
        return $this->belongsTo(User::class, 'referrer_id', 'id');
    }
    public function payment_method()
    {
        return $this->hasOne('App\PaymentMethod', 'user_id', 'id')->where('status',1);
    }
    public function credit_card()
    {
        return $this->hasOne('App\PaymentMethod', 'user_id', 'id');
    }
    public function payment_methods()
    {
        return $this->hasMany('App\PaymentMethod', 'user_id', 'id');
    }
    public function referrals()
    {
        return $this->hasMany(User::class, 'referrer_id', 'id');
    }
    public function getReferralLinkAttribute()
    {
        return $this->referral_link = route('customer.registration', ['ref' => $this->username]);
    }
    public function paid_payment()
    {
        return $this->hasOne('App\PaidPayment', 'user_id', 'id');
    }
    public function payoutSetup()
    {
        return $this->hasOne('App\AuthorPayoutSetup', 'user_id', 'id');
    }
    public function paid_vendor()
    {
        return $this->hasMany('App\PaidVendor', 'user_id', 'id');
    }
    public function reviews()
    {
        return $this->hasMany('App\Review', 'vendor_id', 'id');
    }
    public function agent_ticket()
    {
        return $this->hasMany('Modules\Ticket\Entities\InfixTicket', 'user_agent');
    }

    function CheckPaymnent($id){
        $d = PaidVendor::where('user_id',$id)->whereMonth('created_at', Carbon::now()->month)->orderBy('created_at','desc')->first();
        return $d;
    }

    public function sendPasswordResetNotification($token)
    {
        
        
        $data = [
            $this->email
        ];
        if (!$token) {
            $response='Please resend again!';
            return redirect()->route('password.request');
        }
        
        // Mail::send('mail.password_mail', [
        //     'username'      => $this->username,
        //     'reset_url'     => route('password.reset',$token),
        // ], function($message) use($data){
        //     $message->subject('Reset Password');
        //     $message->to($data[0]);
        //     $message->from('xyz@gmail.com',env('APP_NAME'));
        // });

        $settings = InfixEmailSetting::first();
        $reciver_email = $data[0];
        $receiver_name =  $this->username;
        $subject = 'Reset Password';
        $view ="mail.password_mail";
        $compact['data'] =  array('username' => $this->username,'reset_url'=> route('password.reset',$token)); 
            // return $compact;
        @send_mail($reciver_email, $receiver_name, $subject , $view ,$compact);

    }

  

}
