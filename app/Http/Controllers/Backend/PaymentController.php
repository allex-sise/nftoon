<?php

namespace App\Http\Controllers\Backend;

use App\User;
use App\Withdraw;
use App\PaidVendor;
use App\PaymentMethod;
use App\AuthorPayoutSetup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;

class PaymentController extends Controller
{

    // start credit card methods 
    function CreditCard(){
        try{ 
            $data = PaymentMethod::where(['role' => 5])->latest()->get();     
            return view('backend.payment.credit_card_list',compact('data'));
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    function CreditCardView($id){
        try{ 
            $data = PaymentMethod::findOrFail($id);    
            return view('backend.payment.credit_card_view',compact('data'));
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    function CreditCardViewApprove($id){
        try{ 
            $data = PaymentMethod::findOrFail($id);     
            if($data->status != 1){
                $status = 1;
                $msg = 'Credit card approved!';
            }else{
                $status = 0;
                $msg = 'Credit card disabled!';
            }
            $data->status = $status;
            $data->save();
            Toastr::success($msg);
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    function CreditCardViewReject($id){
        try{ 
            $data = PaymentMethod::findOrFail($id); 
            $data->status = 2;
            $data->save();
            Toastr::success('Credit card rejected!');
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
     // end credit card methods 
    function paymentMethod(){
        try{ 
            $data = PaymentMethod::where(['role' => 4])->where('status','!=',2)->latest()->get();     
            return view('backend.payment.payment_method',compact('data'));
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    function paymentMethodView($id){
        try{ 
            $data = PaymentMethod::findOrFail($id);     
            return view('backend.payment.payment_method_view',compact('data'));
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    function paymentMethodApprove($id){
        try{ 
            $data = PaymentMethod::findOrFail($id);     
            if($data->status == 0){
                $status = 1;
                $msg = 'Payment method approved!';
            }else{
                $status = 0;
                $msg = 'Payment method disabled!';
            }
            $data->status = $status;
            $data->save();
            Toastr::success($msg);
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }

    
// make payment for aothr 
function payableUser(){
    try{
        $user=User::where(['role_id' => 4,'status' => 1,'access_status' => 1])->get(); 
        
        $author_list2=AuthorPayoutSetup::join('users','users.id','=','author_payout_setups.user_id')->where('author_payout_setups.is_default',1)->get();
        $author_list=Withdraw::get();

        return view('backend.payment.pay',compact('user','author_list'));
    } catch (\Exception $e) {
        $msg=str_replace("'", " ", $e->getMessage()) ;
        Toastr::error($msg,app('translator')->get('lang.failed_alert'));
        return redirect()->back();
    }
}
function WithdrawUser($id){
    try{
       // \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
       $withdraws = Withdraw::find($id);
       $user_id = $withdraws->user_id;
        $data=User::find($user_id);
        $withdraw_id = $withdraws->id;
        $metoda_plata = $withdraws->payment_method_id;
        if($metoda_plata == 1){
            $metoda = 'Stripe';
        }
        elseif($metoda_plata == 2){
            $metoda = 'Bank';
        }
        $payout_setup=AuthorPayoutSetup::where('payment_method_name', $metoda)->where('user_id',$user_id)->first();
        $payout_setup2=Withdraw::where('id',$withdraw_id)->get();
        $withdraw=Withdraw::join('author_payout_setups','author_payout_setups.id','=','withdraws.payment_method_id')
        ->join('users','users.id','=','withdraws.user_id')
        ->where('withdraws.user_id',$user_id)
        ->select('users.username','withdraws.amount','withdraws.created_at','author_payout_setups.*')
        ->get();
        $withdraw2 = Withdraw::where('user_id', $user_id)->get();
        // return $withdraw;
        return view('backend.payment.withdraw_vendor',compact('data','withdraws','payout_setup','withdraw','withdraw2'));
    } catch (\Exception $e) {
        $msg=str_replace("'", " ", $e->getMessage()) ;
        Toastr::error($msg,app('translator')->get('lang.failed_alert'));
        return redirect()->back();
    }
}
function paymentAuthor(Request $r){
    $validate_rules = [
        'card_name' => 'required',
        'email' => 'required',
        'amount' => 'required'
    ];
    $r->validate($validate_rules, validationMessage($validate_rules));
    DB::beginTransaction();
    $input = $r->input();
     try {
        $user  = User::find($r->user_id);
        $balnc = $user->balance;

        if ($input['amount'] <= 0) {
            Toastr::error(app('translator')->get('lang.can_not_pay_0'));
            return redirect()->back();
        }
        
         if ($balnc->amount >= $input['amount']) { 

            try {
                $payment_method=PaymentMethod::where('user_id',$r->user_id)->first();
                if ($payment_method) {
                    $payment_method=$payment_method;
                } else {
                    $payment_method=new PaymentMethod();
                    $payment_method->card_name='';
                    $payment_method->name='';
                }
                
                $payment_method->save();
            } catch (\Exception $e) {
                Log::info($e);
            }   

           $paid = new PaidVendor();
           $paid->user_id = $r->user_id;
           $paid->amount = $r->amount;
           $paid->save();

           $withdraw = Withdraw::find($r->withdraw_id);
           $withdraw->paid_vendors_id = $paid->id;
           $withdraw->save();  
           

             DB::commit(); 
             Toastr::success(app('translator')->get('lang.paid_successfully'));
             return redirect()->back();
         }
         else {
            Toastr::error(app('translator')->get('lang.similer_or_equal_amount'));
            return redirect()->back();
         }
                           
         } catch (\Exception $e) {
             dd($e);
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg,app('translator')->get('lang.failed_alert'));
            return redirect()->back();
         }  
}
}