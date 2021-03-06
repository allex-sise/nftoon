<?php

namespace App\Http\Controllers\Frontend;

use URL;
use App\Item;
use App\User;
use App\Label;
use App\Order;
use App\Coupon;
use App\Profile;
use App\SpnCity;
use App\SpnState;
use App\ItemOrder;
use App\Statement;
use App\SpnCountry;
use App\PaidPayment;
use App\BalanceSheet;
use App\PurchaseCode;
use App\CouponHistory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Gloudemans\Shoppingcart\Facades\Cart;
use Modules\Systemsetting\Entities\InfixPaymentGatewaySetting;

class CheckoutController extends Controller
{
    function index()
    {
        //return Cart::content(); 
        /* if (count(Cart::content()) == 0) {
           return redirect('/');
        } */
        try {
            $data['user'] = User::find(Auth::user()->id); 
            $data['country'] = SpnCountry::all();
            $data['state'] = SpnState::all();
            $data['city'] = SpnCity::all();
            return view('frontend.cart.checkout', compact('data'));
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    function store(Request $r)
    {
        $this->validate($r, [
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            // 'company_name' => 'required|string',
            'address' => 'required|string',
            'country_id' => 'required|integer',
            'state_id' => 'sometimes|string',
            'city_id' => 'sometimes|string',
            'zipcode' => 'sometimes',
        ]);
        try {
            $user = User::findOrFail(Auth::user()->id);
            $order = $user->profile;
            $order->user_id = Auth::user()->id;
            $order->first_name = $r->first_name;
            $order->last_name = $r->last_name;
            $order->company_name = $r->company_name;
            $order->address = $r->address;
            $order->country_id = $r->country_id;
            $order->state_id = $r->state_id;
            // $order->city_id = $r->city_id;
            $order->zipcode = $r->zipcode;
            $order->save();


            return redirect()->route('customer.payment');
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    function payment()
    {
        try {
            if (count(Cart::content()) == 0) {
                return redirect('/');
            }
            $cart_content=Cart::content();
            $profile_data=Profile::join('taxes','taxes.country_id','=','profiles.country_id')
             ->where('user_id',Auth::user()->id)->first();
            //  return Cart::content();
            foreach ($cart_content as $key => $my_cart) {
               if (floatval($my_cart->options['tax_added'])==0) {
                $rowId= $my_cart->rowId;
                $totalVal= $my_cart->price;
                if ($profile_data) {
                    $tax=number_format(($totalVal*$profile_data->tax)/100,2);
                    $tax_added=1;
                } else {
                    $tax=0.00;
                    $tax_added=0;
                }
                Cart::update($rowId,['id' => bin2hex(random_bytes(4)), 'name' => $my_cart->name, 'qty' => 1, 'price' => $my_cart->price+$tax, 'weight' => 0, 'options' => 
                ['support_charge' => $my_cart->options['support_charge'],'license_type'=>$my_cart->options['license_type'],'support_time'=>$my_cart->options['support_time'],'buyer_fee'=>$my_cart->options['buyer_fee'],'ogowner'=>$my_cart->options['ogowner'],'incasarecreator'=>$my_cart->options['incasarecreator'],'comisionagent'=>$my_cart->options['comisionagent'],'comisionartistdb'=>$my_cart->options['comisionartistdb'],'comisionminted'=>$my_cart->options['comisionminted'],'item_id'=>$my_cart->options['item_id'],
                'description'=>$my_cart->options['description'],'user_id'=>$my_cart->options['user_id'],'username'=>$my_cart->options['username'],'icon'=>$my_cart->options['icon'], 'image'=>$my_cart->options['image'],'Extd_percent'=>$my_cart->options['Extd_percent'],'tax_added'=>$tax_added,'tax'=>$tax]]);
               }
               
            }
            // return $cart_content;
            $data['user'] = User::find(Auth::user()->id);
            $data['country'] = SpnCountry::all();
            $data['state'] = SpnState::all();
            $data['city'] = SpnCity::all();

            $methods = InfixPaymentGatewaySetting::where('active_status', 1)->get();
            $payment_methods=[];
            foreach($methods as $p){
                $payment_methods[] = $p->gateway_name;
            } 

            return view('frontend.cart.payment', compact('data','payment_methods'));
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }

    function updateStatement(Int $authorId, Int $itemId, Int $orderId, String $type, String $title, String $details, float $price){
        $statement = new Statement();
        $statement->author_id = $authorId;
        $statement->item_id = $itemId;
        $statement->order_id = $orderId;
        $statement->type = $type;
        $statement->title = $title;
        $statement->details = $details;
        $statement->price = $price;
        $statement->save(); 
    }

    function updateBalanceSheet(Int $authorId, Int $itemId, Int $orderId, float $price, float $discountPrice, float $fee, float $incomePrice){
        $balance_sheet = new BalanceSheet();
        $balance_sheet->author_id = $authorId;
        $balance_sheet->item_id = $itemId;
        $balance_sheet->order_id = $orderId;
        $balance_sheet->price = $price;
        $balance_sheet->discount = $discountPrice;
        $balance_sheet->fee = $fee;
        $balance_sheet->income = $incomePrice;
        $balance_sheet->save();
    }

    function payment_store(Request $r)
    {
        DB::beginTransaction();
        try {
            //$_paid_pack = PaidPackagePayment::where('user_id', Auth::user()->id);
            //$_paid_package = $_paid_pack->first();
            
            $paid_payment = PaidPayment::where('user_id', Auth::user()->id)->first();
            $user = User::findOrFail(Auth::user()->id);
            if (empty($paid_payment)) {
                Toastr::error('Please complete payment first');
                return redirect()->back();
            }

            if (Cart::subtotal() > $paid_payment->amount) {
                Toastr::error('Please payment at list $'.Cart::subtotal());
                return redirect()->back(); 
             }
             
            if ($paid_payment->count() > 0) {
                
                if ($user) {
                    $order = new Order();
                    $order->user_id = Auth::user()->id;
                    $order->first_name = $user->profile->first_name;
                    $order->last_name = $user->profile->last_name;
                    $order->company_name = $user->profile->company_name;
                    $order->address = $user->profile->address;
                    $order->country_id = $user->profile->country_id;
                    $order->state_id = $user->profile->state_id;
                    $order->city_id = $user->profile->city_id;
                    $order->zipcode = $user->profile->zipcode;
                    $order->total = Cart::subtotal();
                    $order->save();

                    foreach (Cart::content() as $key => $value) {
                        $author = User::find($value->options['user_id']);
                        if (@$value->options['item_id']) {
                            $label = Label::where('amount', '<=', $author->balance->amount)->orderBy('id', 'desc')->first();
                            $item_order = new ItemOrder();
                            $item_order->user_id = Auth::user()->id;
                            $item_order->order_id = $order->id;
                            $item_order->item_id = $value->options['item_id'];
                     //       $item_order->subtotal = $value->options['Re_item'];
                            $item_order->subtotal = $value->price;
                            $item_order->country_id = $user->profile->country_id;
                            if (isset($value->options['coupon_price'])) {
                                $discount = $value->options['coupon_price'];
                            } else {
                                $discount = 0;
                            }
                            $item_order->discount = $discount;
                            $item_order->author_id = Auth::user()->id;
                            $item_order->item = json_encode($value->options);
                            $item_order->save();

                            //Purchase Code genarate
                            $permitted_chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                            $random_string = $new = '';
                            $timestr = time() . date('Y');
                            for ($i = 0; $i < 4; $i++) {
                                $random_character = $permitted_chars[mt_rand(0, strlen($permitted_chars) - $i)];
                                $random_string .= $random_character;
                            }
                            for ($i = 0; $i <= 11; $i++) {
                                if ($i % 4 == 0) {
                                    $new = $new . '-' . $timestr[$i];
                                } else {
                                    $new = $new . $timestr[$i];
                                }
                            }
                            $purchase_code = $random_string . '' . $new;

                            $purchaseCode = new PurchaseCode();
                            $purchaseCode->product_id = $value->options['item_id'];
                            $purchaseCode->order_id = $item_order->id;
                            $purchaseCode->customer_id = $value->options['user_id'];
                            $purchaseCode->purchase_code = $purchase_code;
                            $purchaseCode->save();

                            $author = User::find($value->options['user_id']);
                            $minted = User::find(1);
    
                            $agent = User::find($author->referrer->id);
                            $ogowner = User::find($value->options['ogowner']);
                    

                            if ($value->options['buyer_fee'] != 0) {
                                Self::updateStatement(1,$value->options['item_id'],$order->id,'i','Comision 2.5','Comision 2.5',$value->options['buyer_fee']);
                            }

                            if ($value->options['comisionagent'] != 0) {
                                Self::updateStatement($agent,$value->options['item_id'],$order->id,'i','Comision Agent','Comision Agent',$value->options['comisionagent']);
                            }

                            if ($value->options['incasarecreator'] != 0) {
                                Self::updateStatement($author->id,$value->options['item_id'],$order->id,'i','Comision Agent','Incasare Vanzator',$value->options['incasarecreator']);
                            }

                            if ($value->options['comisionminted'] != 0) {
                                Self::updateStatement(1,$value->options['item_id'],$order->id,'i','Comision Minted','Comision Minted',$value->options['comisionminted']);
                            }

                            if ($value->options['comisionartistdb'] != 0) {
                                Self::updateStatement($ogowner->id,$value->options['item_id'],$order->id,'i','Comision OG','Comision OG',$value->options['comisionartistdb']);
                            }

                            if (isset($value->options['coupon_price'])) {
                                Self::updateStatement($value->options['user_id'],$order->id,$value->options['item_id'],'e','Coupon discount','Coupon discount',$value->options['coupon_price']);
                            }

                            $details = Item::find($item_order->item_id);
                            Self::updateStatement($value->options['user_id'],$value->options['item_id'],$order->id,'i','Sale','Sale',1000);

                            $itemUp = Item::find($value->options['item_id']);
                            $itemUp->sell = $itemUp->sell + 1;
                            $itemUp->save();

                            $balnc  = $author->balance;
                            $income = $value->options['incasarecreator'];
                            $balnc->amount = $author->balance->amount + $income;
                            
                            $balnc->save();
                            //balancesheet principal bani cont creator
                            //function updateBalanceSheet(Int $authorId, Int $itemId, Int $orderId, Int $price, Int $discountPrice, Int $fee, Int $incomePrice){
                            Self::updateBalanceSheet($author->id,$value->options['item_id'],$item_order->id,$value->price,$discount,0.00,$value->options['incasarecreator']);

                            //balancesheet comision2.5 minted
                            Self::updateBalanceSheet(1,$value->options['item_id'],$item_order->id,$value->price,$discount,0.00,$value->options['buyer_fee']);

                            //balancesheet comisionagent
                            Self::updateBalanceSheet($agent,$value->options['item_id'],$item_order->id,$value->price,$discount,0.00,$value->options['comisionagent']);

                            //balance sheet comisionminted 25
                            Self::updateBalanceSheet(1,$value->options['item_id'],$item_order->id,$value->price,$discount,0.00,$value->options['comisionminted']);

                            //balance sheet comisioog
                            Self::updateBalanceSheet($ogowner->id,$value->options['item_id'],$item_order->id,$value->price,$discount,0.00,$value->options['comisionartistdb']);
                        }
                        // $buy_package->
                        $data['message'] = Auth::user()->username.' bought this  <strong>'. @$item_order->Item->title. '</strong> product';
                       
                        $to_name = Auth::user()->username;
                        $to_email = Auth::user()->email;
                        $email_sms_title = 'Buy product';
                        MailNotification($data, $to_name, $to_email, $email_sms_title);
                    }
                }
            } else {
                Toastr::error('Te rugam sa finalizezi plata!');
                return redirect()->back();
            }
            if ($paid_payment->count() > 0) {
                $paid_payment->delete();
            } 
            DB::commit();
            Toastr::success('Multumim pentru achizitia ta!');
            return redirect()->route('customer.payment_complete');
        } catch (\Exception $e) {
            DB::rollback();
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    function itemBuy()
    {
    }
    function payment_complete()
    { 
        try{
            if (@Cart::content()) {
                Cart::destroy();

                $order_info=ItemOrder::where('user_id',Auth::user()->id)->orderBy('order_id','desc')->first();
               
                $data['order'] = Order::where('user_id', Auth::user()->id)->where('id',$order_info->order_id)-> orderBy('id', 'desc')->first();
                // return $data;
                return view('frontend.cart.paymentComplete', compact('data'));
            }else {
                return redirect('/');
            }
        }catch(\Exception $e){
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
        
       
    }
    function couponCheck(Request $r)
    {
        try {

            if (!Auth::check()) {
                return response()->json(['error' => 'Please Login First'], 201);
            }
        
        foreach (Cart::content() as $key => $value) {
            $coupon = Coupon::where('vendor_id', $value->options['user_id'])
                    ->whereDate('from', '<=', date('y-m-d'))
                    ->whereDate('to', '>=', date('y-m-d'))
                    ->where('coupon_code', $r->coupon_code)
                    ->where('status',1)
                    ->first();

                    if ( $coupon=="") {
                        return response()->json(['error' => 'Invalid Coupon or date expired'], 201);
                    }
            // return $coupon;
        
            
            if ($coupon->coupon_type==0) {
                $check_history=CouponHistory::where('user_id',Auth::user()->id)->where('coupon_id',$coupon->id)->first();
                if ($check_history) {
                    return response()->json(['error' => 'You have already used this coupon'], 201);
                }
            }
            
            if (!empty($coupon)) {
                if (@$coupon->coupon_type == 0) {
                    $userOrder = Auth::user()->itemOrder;
                    foreach ($userOrder as $key => $orderI) {
                        $itmOr = json_decode($orderI->item, true);
                        if (@$itmOr['coupon_code'] == $r->coupon_code) {
                            return response()->json(['error' => 'Coupon Code Already Used'], 201);
                        }
                    }
                }
                if (@$value->options['coupon'] == 1) {
                    return response()->json(['error' => 'Coupon Code Already Used'], 201);
                }
                $data = Cart::get($value->rowId);
                    if ($data->options['tax_added'] !=1) {
                        if (Auth::user()) {
                            $profile_data=Profile::join('taxes','taxes.country_id','=','profiles.country_id')
                            ->where('user_id',Auth::user()->id)->first();
                         
                            if ($profile_data) {
                                $tax=number_format((number_format($data->price)*$profile_data->tax)/100,2);
                                $tax_added=1;
                            } else {
                                $tax=0.00;
                                $tax_added=0;
                            }
                         }else{
                            $tax=0.00;
                            $tax_added=0;
                         }
                    }else{
                        $tax=$data->options['tax'];
                        $tax_added=1;
                    }
            
                     $main_price=$data->price;
                    if ($coupon->discount_type == 1) {
                        $discount_calculation_price = number_format($coupon->discount,2) / 100 * number_format($main_price,2);
                        $coupon_price = number_format($main_price,2)-number_format($discount_calculation_price,2);
                    } else {
                            $coupon_price = number_format($main_price,2)-$coupon->discount;

                            if ($coupon_price<0) {
                                $coupon_price=number_format($main_price,2);
                            }
                    }
                    // if (Auth::user()) {
                    //     $profile_data=Profile::join('taxes','taxes.country_id','=','profiles.country_id')
                    //     ->where('user_id',Auth::user()->id)->first();
                     
                    //     if ($profile_data) {
                    //         $tax=number_format((number_format($coupon_price,2)*$profile_data->tax)/100,2);
                    //         $tax_added=1;
                    //     } else {
                    //         $tax=0.00;
                    //         $tax_added=0;
                    //     }
                    //  }else{
                    //     $tax=0.00;
                    //     $tax_added=0;
                    //  }

                    //  $price = $main_price - $coupon_price;


                    //  $new_price=number_format($coupon_price,2)+number_format($tax,2)+number_format($data->options['buyer_fee'],2);
                    // return number_format($new_price,2);

                $item = Cart::update($value->rowId, ['id' => $data->id, 'name' => $data->name, 'qty' => 1, 'price' => $coupon_price, 'weight' => 0, 'options' =>
                [
                    'support_charge' => $data->options['support_charge'], 'license_type' => $data->options['license_type'], 'support_time' => $data->options['support_time'], 'item_id' => $value->options['item_id'], 'buyer_fee' => $value->options['buyer_fee'],
                    'description' => $data->options['description'], 'user_id' => $data->options['user_id'], 'username' => $data->options['username'], 'icon' => $data->options['icon'], 'image' => $data->options['image'], 'Extd_percent' => $data->options['Extd_percent'], 'coupon_code' => $coupon->coupon_code, 'coupon' => 1, 'coupon_price' => $coupon_price,'tax_added'=>$tax_added,'tax'=>$tax
                ]]);

                $coupon_history=new CouponHistory();
                $coupon_history->user_id=Auth::user()->id;
                $coupon_history->product_id=$value->options['item_id'];
                $coupon_history->coupon_id=$coupon->id;
                $coupon_history->save();


                $all_item = Cart::content();
                $subtotal=Cart::subtotal();
                return response()->json(['item' => $item, 'all_item' => $all_item,'coupon_price'=>$coupon->discount,'$tax'=>$tax,'subtotal'=>Cart::subtotal()], 200);
            } else {
                return response()->json(['error' => 'Invalid Coupon Code'], 201);
            }
        }
    } catch (\Exception $e) {
        return response()->json(['error' => $e], 201);
    }
    }
}
// ,'discount'=>$coupon->discount