<?php

namespace App\Http\Controllers\Frontend\Vendor;

use App\AuthorPayoutSetup;
use App\Withdraw;
use App\User;
use App\SmNotification;
use App\PaidVendor;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;

class AuthorPayoutSetupController extends Controller
{
    public function setupPayout(Request $request){
        $this->validate($request,[
            'name' =>'required|',
            'email' =>'required',
        ]);
      
        
        try {
           
            $check_setup=AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('payment_method_name',$request->name)->first();
            if (isset($request->phone)) {
               $phone=$request->phone;
            } else {
                $phone="";
            }
            
            if ($check_setup) {
                $payoutSetup=AuthorPayoutSetup::find($check_setup->id);
                $payoutSetup->payout_email=$request->email;
                $payoutSetup->payout_phone=$phone;
                 $payoutSetup->is_default=1;
                $payoutSetup->save();

            }else{
                $payoutSetup=new AuthorPayoutSetup();
                $payoutSetup->payment_method_name=$request->name;
                $payoutSetup->payout_email=$request->email;
                $payoutSetup->user_id=Auth::user()->id;
                $payoutSetup->payout_phone=$phone;
                $payoutSetup->is_default=1;
                $payoutSetup->save();
            }

            $other_setups=AuthorPayoutSetup::where('user_id',Auth::user()->id)->where('id','!=',$payoutSetup->id)->get();
            // return $other_setups;
            if ($other_setups!=null) {
               foreach ($other_setups as $key => $setup) {
                   $other_setup=AuthorPayoutSetup::find( $setup->id);
                   $other_setup->is_default=0;
                   $other_setup->save();
               }
            }
            Toastr::success('Setarea contului de plata a fost efectuata cu succes!','Succes');
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
        // return $request;
    }

    public function withdrawAmount(Request $r){
        $this->validate($r,[
            'withdraw_amount' =>'required|',
        ]);
        $user  = User::find(Auth::user()->id);
        $user_id = Auth::user()->id;
        $balnc = $user->balance;
       
        try {
            if ($r->withdraw_amount > $balnc->amount) {
                Toastr::error('Nu poti retrage mai mult decat ai in cont','Eroare');
                return redirect()->back();
            }
            $withdraw = new Withdraw();
            $withdraw->user_id = $user_id;
            $withdraw->paid_vendors_id = NULL;
            $withdraw->amount = $r->withdraw_amount;
            $withdraw->amountETH = $r->withdraw_amount_eth;
            $withdraw->pay_address = $r->pay_address;
            $withdraw->payment_method_id = $r->payment_method_id;
            $withdraw->save();
             
            $balnc->amount = $balnc->amount - floatval($r->withdraw_amount);
            $balnc->save();

            // mail sending error handel
            try {
                $data['message'] = Auth::user()->username.' Doreste sa retraga credite de pe Minted.';
                $to_name = 'Admin Minted';
                $admin = User::where('id', 1)->first();
                $to_email = $admin->email;
                $email_sms_title = 'Retragere Credite Minted'; 
                MailNotification($data, $to_name, $to_email, $email_sms_title);
            } catch (\Exception $e) {
                $msg=str_replace("'", " ", $e->getMessage());
                Log::info($msg);
                Toastr::error('Unable to Send Email, Please check configuration!', 'Failed');
            }

            $notification=new SmNotification();
            $notification->user_id = Auth::user()->id;
            $notification->message = Auth::user()->username.' retrage credite!';
            $notification->link = url('admin/withdraw-author',$withdraw->id);
            $notification->ticket_id = $r->id;
            $notification->category = 'retragere_credite';
            $notification->received_id = 1;
            $notification->save();

            Toastr::success('Suma a fost trimisa catre retragere!','Success');
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
        // return $request;
    }

    function anuleazaWithdraw(Request $r){
    
        try {
            // $withdraw = Withdraws::where('id', $id)->first();
            // $withdraws = $withdraw->id;

                    
            $user  = User::find(Auth::user()->id);
            $balnc = $user->balance;
            
            $balnc->amount = $balnc->amount + floatval($r->withdraw_amountz);
            $balnc->save();

                      $delete_query = Withdraw::where('id', $r->withdraw_id)->first();
                      $delete_query->delete();
                     

                          Toastr::success('Succsesfully Deleted!','Success');
                      return redirect()->back();
              
              } catch (\Exception $e) {
                  $msg=str_replace("'", " ", $e->getMessage()) ;
                  Toastr::error($msg, 'Failed');
                  return redirect()->back();
              }
    }


    public function defaultPayoutSetup(Request $request,$method){

        try {
            $make_default=AuthorPayoutSetup::where('payment_method_name','=',$method)->where('user_id',Auth::user()->id)->first();
            $make_default->is_default=1;
            $make_default->save();
            $get_others=AuthorPayoutSetup::where('payment_method_name','!=',$method)->where('user_id',Auth::user()->id)->get();

        foreach ($get_others as $key => $methods) {
            $make_normal=AuthorPayoutSetup::find($methods->id);
            $make_normal->is_default=0;
            $make_normal->save();
        }
        
        Toastr::success($method.'  Set as default','Success');
        return redirect()->back();
    } catch (\Exception $e) {
        $msg=str_replace("'", " ", $e->getMessage()) ;
        Toastr::error($msg, 'Failed');
        return redirect()->back();
    }
       

    }
}
