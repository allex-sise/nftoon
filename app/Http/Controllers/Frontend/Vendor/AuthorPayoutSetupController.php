<?php

namespace App\Http\Controllers\Frontend\Vendor;

use App\AuthorPayoutSetup;
use App\Withdraw;
use App\User;
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
            Toastr::success('Payout Setup Done Succsesfully!','Success');
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

            Toastr::success('Suma a fost trimisa catre retragere!','Success');
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
        // return $request;
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
