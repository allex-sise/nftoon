<?php

namespace App\Http\Controllers\frontend;
use  Session;
use App\User;
use App\Deposit;
use App\Balance;
use App\Statement;
use App\BankDeposit;
use App\Mail\BankDepositEmail;
use App\Mail\FundMail;
use App\SmNotification;
use Stripe\Stripe;
use App\SpnCountry;
use Stripe\Customer;
use Razorpay\Api\Api;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Gloudemans\Shoppingcart\Facades\Cart;
use Modules\Systemsetting\Entities\InfixPaymentGatewaySetting;

class FundDepositController extends Controller
{
    function FundDeposit($username){
        try {
            if (Auth::user()->username != $username) {
               return redirect()->back();
            }
            $user = User::where('username',$username)->first();
            $data['country'] = SpnCountry::all();
            return view('frontend.payment.fund_add', compact('user','data'));
          } catch (\Exception $e) {
                $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
          }
    }

    function FundSucces(){
        try {
         
            
            return view('frontend.payment.fund_succes');
          } catch (\Exception $e) {
                $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
          }
    }

    public function FundDepositStore(Request $r){        
        $input = $r->input();
        $this->validate($r, [
            'first_name' => 'sometimes|required|string',
            'last_name' => 'sometimes|required|string',
            'company_name' => 'string',
            'mobile' => 'required|string|size:10|regex:/[0-9]{9}/',
            'address' => 'sometimes|required|string',
            'country_id' => 'sometimes|required|integer',
            'state_id' => 'sometimes|string',
            'city_id' => 'sometimes|string',
            'zipcode' => 'sometimes|string',
            'amount' => 'required|min:1',

        ]);
        try{
            // return $r;
            $user = User::findOrFail(Auth::user()->id);
            $user_pro = $user->profile;
            $user_pro->user_id = Auth::user()->id;

            if ($user_pro->first_name =="") {
                $user_pro->first_name = $r->first_name;
            }
            if ($user_pro->last_name =="") {
                $user_pro->last_name = $r->last_name;
            }
            if ($user_pro->company_name =="") {
                $user_pro->company_name = $r->company_name;
            }
            if ($user_pro->address =="") {
                $user_pro->address = $r->address;
            }
            if ($user_pro->country_id =="") {
                $user_pro->country_id = $r->country_id;
            }
            if ($user_pro->state_id =="") {
                $user_pro->state_id = $r->state_id;
            }
            if ($user_pro->state_id =="") {
                $user_pro->state_id = $r->state_id;
            }
            if ($user_pro->city_id =="") {
                $user_pro->city_id = $r->city_id;
            }
            if ($user_pro->zipcode =="") {
                $user_pro->zipcode = $r->zipcode;
            }
            
            if ($r->mobile) {
                $user_pro->mobile = $r->mobile;
            }
            Session::put('deposit_amount',$r->amount);
            Session::put('deposit_amountETH',$r->amountETH);
            $user_pro->save();
            return redirect()->route('user.FundDepositPaymentSelection');     
            } catch (\Exception $e) {
                $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
            }             
                
    }
    function FundDepositPaymentSelection(){

        try {
            // $payment_methods = InfixPaymentGatewaySetting::all();
            $payment_methods = InfixPaymentGatewaySetting::where('active_status', 1)->get();
            $data=[];
            foreach($payment_methods as $p){
                $data[] = $p->gateway_name;
            } 
            if (Session::has('deposit_amount')) {
                return view('frontend.payment.payment_selection', compact('payment_methods','data'));  
            }else {
                return redirect()->route('user.deposit',Auth::user()->username);   
            }
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    public function StripeDeposit(Request $request){  
    
        $input = $request->input();
        DB::beginTransaction();
        try {
            set_time_limit(2700);
            \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
                
                // Creating a customer - If you want to create customer uncomment below code.
                /*  $customer = \Stripe\Customer::create(array(
                        'email' => $request->stripeEmail,
                        'source' => $request->stripeToken,
                        'card' => $request->stripeCard
                    ));

                    $stripe_id = $customer->id;
                
                // Card instance
                // $card = \Stripe\Card::create($customer->id, $request->tokenId); 
                */
            
                $unique_id = uniqid(); // just for tracking purpose incase you want to describe something.
            
                // Charge to customer
                $charge = \Stripe\Charge::create(array(
                    'description' => " - Amount: ".$input['amount'].' - '. $unique_id,
                    'source' => $request->stripeToken,                    
                    'amount' => ((int)($input['amount']) * 100), // the mount will be consider as cent so we need to multiply with 100
                    'currency' => 'RON'
                ));
                               
                // Insert into the database
                \App\StripePayment::create([   
                    'user_id'=>Auth::user()->id,                                      
                    'amount'=> $input['amount'],
                    'charge_id'=>$charge->id,
                    'stripe_id'=>$unique_id,                     
                    'quantity'=>1
                ]);
                $from_currency= 'RON';
                $to_currency= GeneralSetting()->currency;
                $amount = convertCurrency($from_currency,$to_currency,$input['amount']);

                $deposit =new Deposit();
                $deposit->user_id= Auth::user()->id;
                $deposit->title = 'deposit';
                $deposit->details = 'Fund deposit via stripe';
                $deposit->amount = floatval($amount);
                $deposit->save();

                $balnc  = Auth::user()->balance;
                $balnc->amount = $balnc->amount + floatval($amount);
                $balnc->save();

                DB::commit();    
                Toastr::success('Fund added successful!', 'Success');
                return redirect()->route('user.fund_succes');           
            } catch (\Exception $e) {
                $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
            }             
                
    }


    public function blockchainDeposit(){
        try {

            $deposit_request=BankDeposit::where('depositor_id', Auth::user()->id)->where('status', 0)->first();
            $deposit_request->status=1;
            $deposit_request->save();

            $deposit =new Deposit();
            $deposit->user_id= Auth::user()->id;
            $deposit->title = 'Blockchain Deposit';
            $deposit->details = 'Blockchain Deposit';
            $deposit->amount = floatval($deposit_request->amount);
            $deposit->save();

            $balnc  = Balance::where('user_id',Auth::user()->id)->first();
            $balnc->amount = $balnc->amount + floatval($deposit_request->amount);
            $balnc->save();

            DB::commit(); 
            Toastr::success('Fund added successful!','Success'); 
            return redirect()->route('user.fund_succes');
            
        } catch (\Throwable $e) {
            // DB::rollback();  
           $msg=Str::limit(str_replace("'", " ", $e->getMessage()), 50) ;
                $error=new ErrorLog();
                $error->process_name='Product Purchase Email Send';
                $error->error_message=$msg;
                $error->user_id=Auth::user()->id;
                $error->save();
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
}