<?php

namespace App\Http\Controllers\Backend;

use File;
use App\Item;
use ZipArchive;
use App\Feedback;
use App\ItemImage;
use App\ItemPreview;
use App\Mail\FeedbackMail;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Modules\Systemsetting\Entities\InfixEmailSetting;

class PreviewController extends Controller
{
   function item_preview(){
       try {
        $data=ItemPreview::where(['status'=>1])->orderBy('id','desc')->get();
        // return $data;
        return view('backend.product.item_review', compact('data'));    
       } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
      }      
    }


    function item_preview_approve($id){
        DB::beginTransaction();

        try {
            $data=ItemPreview::findOrFail($id);
            if ($data->status == 1) {
                $data->status = 2;
                $msg = 'item active';
            // }else {
                $thumbnail_image=explode(',',$data->theme_preview);
                $thumbnail_image=$thumbnail_image[0];
           
               $item =Item::find($data->item_id);
               $item->user_id = $data->user_id;
               $item->title = $data->title;
               $item->feature1 = $data->feature1;
               $item->feature2 = $data->feature2;
               $item->icon = $data->icon;
               $item->description = $data->description;
               $item->sub_category_id = $data->sub_category_id;
               $item->category_id = $data->category_id;
               $item->tags = $data->tags;
               $item->Re_item = $data->Re_item;
               $item->Re_buyer = $data->Re_buyer;
               $item->Reg_total = $data->Reg_total;
               $item->E_item = $data->E_item;
               $item->E_buyer = $data->E_buyer;
               $item->Ex_total = $data->Ex_total;

               $item->C_item = $data->C_item;
               $item->C_buyer = $data->C_buyer;
               $item->C_total = $data->C_total;

               $item->user_msg = $data->user_msg;
               $item->demo_url = $data->demo_url;
               $item->is_upload = $data->is_upload;
               if ($data->upload_or_link==0) {
                   $item->purchase_link = $data->purchase_link;
                   
               }

                $item->main_file = $data->file;
                $item->icon = $data->icon;
                $item->thumbnail = $data->thumbnail;
                $item->theme_preview = $data->theme_preview;

                // if (Str::contains($data->theme_preview, ',')) {
                //     $item->thumbnail = $thumbnail_image;
                // } else {
                //     $item->thumbnail = $data->thumbnail;
                // }

            //    $item->thumbnail = $thumbnail_image;
               $item->screen_shot = $data->theme_preview;


               //jhg
               $item->status = 1;
               $item->active_status = 1;
               $item->save();
               $img =ItemImage::where('item_id',$item->id)->first();
               $img->type='theme_preview';
               $img->image = $data->theme_preview;    
               $img->save();

            
           
                $msg = 'Succsesfully approved file!';
            }

            DB::commit(); 
            $data->delete();
            Toastr::success($msg);
            return redirect()->back();

           } catch (\Exception $e) {
                $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
          } 
    }

    function item_preview_deactive($id){
        DB::beginTransaction();

        try {
            $data=ItemPreview::findOrFail($id);
            if ($data->status == 1) {
                $data->status = 2;
                $msg = 'item de-active';
        

            DB::commit(); 
            $data->update();
            Toastr::success($msg);
            return redirect()->back();
            }
           } catch (\Exception $e) {
                $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
          } 
    }

    function itemDelete($id){
        try {
                $item =ItemPreview::find($id)->update(['status' => 0 ]);
                Toastr::success('Item deleted Successfully','Success');
                return redirect()->back();
            } catch (\Exception $e) {
                $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
            }
      }

      function item_feedback(Request $r,$id){
        $r->validate([
            'status' => "required",
            'subject' => "required",
        ]);
        DB::beginTransaction();
        try {
            $item = ItemPreview::findOrFail($id);
            $feedback = new Feedback();
            $feedback->feedback_by = Auth::id();
            $feedback->subject = $r->subject;
            $feedback->user_id = $item->user_id;
            $feedback->item_id = $item->item_id;
            $feedback->feedback = @$r->description;
            $feedback->status = $r->status;
            $feedback->save();
            $item->active_status = $r->status;
            $item->save();
            $to_email = $item->user->email;
            $to_name = $item->user->username;
            if (@$r->status == 1) {
                $this->item_preview_approve($id);

                if(@Adminmailsetting($item->user_id)->item_update == 1){
                    $data_info['message'] = isset($r->description) ? $r->description  : $r->subject;
                    $email_sms_title = 'Product review';
                    MailNotification($data_info, $to_name, $to_email, $email_sms_title);
                }
            }
            $data=[
               'username' => $to_name,
               'email' => $to_email,
               'body' => isset($r->description) ? $r->description  : $r->subject,
               'status' => $r->status,
               'url' =>  route('singleProduct',[str_replace(' ', '-',$item->title),$item->id]),
               'title' => $item->title,
            ];

            
            if(@Adminmailsetting($item->user_id)->item_review == 1){
                
                
            
                try{
                    // Mail::to($item->user->email)->send(new FeedbackMail($data));
                    
                    $settings = InfixEmailSetting::first();
                    $reciver_email = $item->user->email;
                    $receiver_name =  $item->user->full_name;
                    $subject = 'Product Review';
                    $view ="mail.feedback_mail";
                    $compact['data'] =  $data; 
                    @send_mail($reciver_email, $receiver_name, $subject , $view ,$compact);
                }catch(\Exception $e){
                    $msg = $e->getMessage();
                    Log::info($msg);
                    Toastr::error($msg, 'Failed');
                }
            }

            DB::commit();

            Toastr::success('Succsesfully item feedback sent !','Success');
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
       }
     }
      function item_feedback_direct(Request $r,$id){
        $status=1;
        DB::beginTransaction();
        try {
            $item = ItemPreview::findOrFail($id);
            // $feedback = new Feedback();
            // $feedback->feedback_by = Auth::id();
            // $feedback->subject = $r->subject;
            // $feedback->user_id = $item->user_id;
            // $feedback->item_id = $item->item_id;
            // $feedback->feedback = @$r->description;
            // $feedback->status = $r->status;
            // $feedback->save();
            $item->active_status =  $status;
            $item->save();
            $to_email = $item->user->email;
            $to_name = $item->user->username;
            
                $this->item_preview_approve($id);

                if(@Adminmailsetting($item->user_id)->item_update == 1){
                    $data_info['message'] = isset($r->description) ? $r->description  : $r->subject;
                    $email_sms_title = 'Product review';
                    MailNotification($data_info, $to_name, $to_email, $email_sms_title);
                }
            
            $data=[
               'username' => $to_name,
               'email' => $to_email,
               'body' => isset($r->description) ? $r->description  : $r->subject,
               'status' =>  $status,
               'url' =>  route('singleProduct',[str_replace(' ', '-',$item->title),$item->id]),
               'title' => $item->title,
            ];

            
            if(@Adminmailsetting($item->user_id)->item_review == 1){
                
            
                try{
                    // Mail::to($item->user->email)->send(new FeedbackMail($data));

                    $settings = InfixEmailSetting::first();
                    $reciver_email = $item->user->email;
                    $receiver_name =  $item->user->full_name;
                    $subject = 'Product Review';
                    $view ="mail.feedback_mail";
                    $compact['data'] =  $data; 
                    @send_mail($reciver_email, $receiver_name, $subject , $view ,$compact);
                }catch(\Exception $e){
                    $msg = $e->getMessage();
                    Log::info($msg);
                    Toastr::error($msg, 'Failed');
                }
               
            }

            DB::commit();

            Toastr::success('Succsesfully item feedback sent !','Success');
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
       }
     }
}