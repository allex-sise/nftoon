<?php

namespace App\Http\Controllers\Backend;

use Auth;
use File;
use App\Item;
use App\User;
use App\Drops;
use App\DropNFTs;
use App\Review;
use ZipArchive;
use App\Comment;
use App\ItemFee;
use App\BuyerFee;
use App\Feedback;
use App\Attribute;
use App\ItemImage;
use App\TableList;
use Carbon\Carbon;
use App\ItemPreview;
use App\SessionFile;
use App\ItemCategory;
use App\SubAttribute;
use App\ItemAttribute;
use App\ProductSetting;
use App\ItemSubCategory;
use App\Mail\FeedbackMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Mail;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Modules\Systemsetting\Entities\InfixEmailSetting;

class ProductController extends Controller
{
    
    /* ********************* START  CATEGORY *************************  */
    public function adCategory()
    {
        try{
            $data['category'] = ItemCategory::all(); 
            return view('backend.product.adCategory', compact('data'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back(); 
        }
    } 

    public function adCategoryStore(Request $request)
    {
        $request->validate([
            'title' => "required|string|unique:item_categories,title",
            'file_permission' => "required",
            'up_permission' => "required",
            'recommended_price' => "required",
            'recommended_price_extended' => "required",
            'recommended_price_commercial' => "required",
        ]);
      
        try{
            $new_category_position=ItemCategory::max('position')+1;
            $store = new ItemCategory();
            $store->title = $request->title;
            $store->slug = strtolower(str_replace(' ', '_',$request->title));
            $store->up_permission = $request->up_permission;
            $store->file_permission = $request->file_permission;
            $store->description = $request->description;
            $store->active_status = 1;
            $store->position = $new_category_position;
            $store->recommended_price = $request->recommended_price;
            $store->recommended_price_extended = $request->recommended_price_extended;
            $store->recommended_price_commercial = $request->recommended_price_commercial;
            $store->show_menu = isset($request->show_menu) ? 1 : 0;
            $result = $store->save();
    
            if ($result) {
                Toastr::success('Succsesfuly Category Added !','Success');
                return redirect()->back();
            } else {
                Toastr::error('Operation Failed','Error');
                return redirect()->back();
            }
        }catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }

    public function editCategory($id)
    {
        try{
            $data['category'] = ItemCategory::all();
            $data['edit'] = ItemCategory::find($id);
            return view('backend.product.adCategory', compact('data'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back(); 
        }
    }

    
    public function updateCategory(Request $request)
    {
        $request->validate([
            'title' => "required|string|unique:item_categories,title,".$request->id,
            'file_permission' => "required",
            'up_permission' => "required",
            'active_status' => "required",
            'recommended_price' => "required",
            'recommended_price_extended' => "required",
            'recommended_price_commercial' => "required",
        ]);
        try{
            $new_category=ItemCategory::find($request->id);
            $old_position=$new_category->position;
            $current_category=ItemCategory::where('position',$request->position)->first();
            if ($current_category!='') {
                $store = ItemCategory::find($request->id);
                $store->position = null;
                $result = $store->save();

                $current_category->position=$old_position;
                $current_category->save();
    
                $store = ItemCategory::find($request->id);
                $store->title = $request->title;
                $store->slug = strtolower(str_replace(' ', '_',$request->title));
                $store->up_permission = $request->up_permission;
                $store->file_permission = $request->file_permission;
                $store->recommended_price = $request->recommended_price;
                $store->recommended_price_extended = $request->recommended_price_extended;
                $store->recommended_price_commercial = $request->recommended_price_commercial;
                $store->description = $request->description;
                $store->show_menu = isset($request->show_menu) ? 1 : 0;
                $store->active_status = $request->active_status;
                if ($request->active_status==2) {
                    $store->position = null;
                }else{
                    $store->position = $request->position;
                }
                $result = $store->save();
    
            } else {
                $store = ItemCategory::find($request->id);
                $store->title = $request->title;
                $store->slug = strtolower(str_replace(' ', '_',$request->title));
                $store->up_permission = $request->up_permission;
                $store->file_permission = $request->file_permission;
                $store->recommended_price = $request->recommended_price;
                $store->recommended_price_extended = $request->recommended_price_extended;
                $store->recommended_price_commercial = $request->recommended_price_commercial;
                $store->description = $request->description;
                $store->active_status = $request->active_status;
                $store->show_menu = isset($request->show_menu) ? 1 : 0;
                if ($request->active_status==2) {
                    $store->position = null;
                }else{
                    $store->position = $request->position;
                }
                $result = $store->save();
            }
            
            if ($result) {
                Toastr::success('Succsesfully Category updated !','Success');
                return redirect()->route('admin.adCategory');
            } else {
                Toastr::error('Something went wrong ! try again ','Success');
                return redirect()->back();
            }
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back(); 
        }
    }

   public function deleteCategory(Request $request, $id)
    {
        $tables = TableList::getTableList('category_id', $id);
        $tables= str_replace('Infix category question,','',$tables);
        // dd($tables);
        try {
            if ($tables == null|| $tables == ' ') {

                $delete_query=ItemCategory::find($id);
                $delete_query->delete();

                    Toastr::success('Succsesfully Deleted!','Success');
                return redirect()->back();
            } else {
                $msg = 'This data already used in '. $tables.' tables, Please remove those data first';
                Toastr::error($msg, 'Failed');
                return redirect()->back();
            }
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
        
    }
    /* *********************  END CATEGORY  *************************  */


     /* ********************* START SUB CATEGORY *************************  */
    

     /* *********************  END SUB CATEGORY  *************************  */

     /* *********************  START PRODUCT  *************************  */

     function content(){

        try {
            // $data['item']=Item::where(['active_status'=>1,'status'=> 1,'free'=>0])->orderBy('id','desc')->get();
            $data['item']=Item::orderBy('id','desc')->get();

            // return $data;
            $data['settings'] = DB::table('infix_general_settings')->first();
            return view('backend.product.content_list', compact('data'));          
          } catch (\Exception $e) {
               $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
          }
         
     }

     function nftsale_list(){

        try {
            // $data['item']=Item::where(['active_status'=>1,'status'=> 1,'free'=>0])->orderBy('id','desc')->get();
            $data['item']=Item::where('active_status', 1)->where('status', 1)->orderBy('id','desc')->get();

            // return $data;
            $data['settings'] = DB::table('infix_general_settings')->first();
            return view('backend.product.nftsale_list', compact('data'));          
          } catch (\Exception $e) {
               $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
          }
         
     }

     public function showNFT($id)
     {
         try{
            $data['item'] = Item::find($id);  
            if (is_null($data['item'])) {
               return redirect()->back();
            }
             return view('backend.product.showNFT', compact('data'));
         }catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
             Toastr::error($msg, 'Failed');
             return redirect()->back(); 
         }
     }


     public function product_upload(){
        $data['category'] = ItemCategory::where('up_permission',1)->get();
        $data['user'] = User::all();
        $data['subCategory'] = ItemSubCategory::where('active_status',1)->get();
        $data['attribute'] = Attribute::all();
        $data['sub_attribute'] = SubAttribute::latest()->get();

        return view('backend.product.product_upload', compact('data'));

     }
     public function selectCategory(Request $r){
        try {
            $category = User::find($r->user_id);
            Session::put('categorySlect', $category);
            return redirect()->route('admin.product_upload');
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
     }
     function deactiveProduct(){

        try {
            $data['item']=Item::where(['active_status'=>0])->orderBy('id','desc')->get();
            return view('backend.product.deactive_product_list', compact('data'));          
          } catch (\Exception $e) {
               $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
          }
         
     }
     function contentView($id){
         
         try{
            $data['item']=Item::findOrFail($id);
            return view('backend.product.item_review',compact('data'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
     }



     function contentEdit($id){
        try {
           

            $item_preview=ItemPreview::where('item_id',$id)->where('status',1)->first();
            // return $item_preview;
            $data['edit']=Item::find($id);
            $data['attributes']= $data['edit']->attribute;
            $data['category'] = ItemCategory::where('up_permission',1)->get();
            $data['subCategory'] = ItemSubCategory::where('active_status',1)->get();
            $data['attribute'] = Attribute::all();
            $data['sub_attribute'] = SubAttribute::latest()->get();
            $category = ItemCategory::where('up_permission',1)->get();
            $attribute = Attribute::all();


            return view('frontend.vendor.editContent', compact('data','category','item_preview'));
            } catch (\Exception $e) {
                $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
        }
    }

    // admin update product 
public function itemUpdate(Request $r){
           
    // Dynamic attribute validation 
    if(@$r->optional_att){
        $attributes=@$r->optional_att;
        foreach($attributes as $field_name=>$attribute){
            foreach($attribute as $key=>$value){
                if (!is_numeric($value)){
                    $s= Attribute::where('field_name', $field_name )->select('name')->first();
                    if($s){
                        Toastr::error('You have write wrong input for '.@$s->name , 'Failed');
                    }else{
                        Toastr::error('You have write wrong attributes', 'Failed');
                    }
                    return redirect()->back()->withInput();
                }
            }
        }
    }
    // End Dynamic attribute validation

    $r->validate([
        'title' => 'required|string|max:200',
        'feature1' => 'required|string|max:100',
        'feature2' => 'required|string|max:100',
        'description' => 'required|string',
        'thumdnail'=>'sometimes|nullable|required|dimensions:max_width=80,max_height=80',
        'main_file' => 'sometimes|nullable|required|',
        'file' => 'sometimes|nullable|required|',
        'category_id' => 'required|',
        'demo_url' => 'required|url',
        'Re_item' => 'required|',
        'Re_buyer' => 'required|',
        'Reg_total_price' => 'required|',
        'tags' => 'required|string',
    ]);


    DB::beginTransaction();
    try {

        $item_data=Item::find($r->id);
    
        // $item =new ItemPreview();
        $item=Item::find($r->id);
        // $item->item_id = $r->id;
        $item->title = $r->title;
        $item->feature1 = $r->feature1;
        $item->feature2 = $r->feature2;
        $item->description = $r->description;    
        $item->category_id = $r->category_id;
       
        $item->tags = $r->tags;
       
        $item->Re_item = $r->Re_item;
        $item->Re_buyer = $r->Re_buyer;
        $item->Reg_total = $r->Reg_total_price;
      
        $item->demo_url = $r->demo_url;
        $item->active_status = 1;
        //  return $r;
     
    $thumbnail =$item_data->icon;
    if ($r->file('thumdnail') != "") {
        $file = $r->file('thumdnail');
        $thumbnail = 'thum-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
        $file->move('public/uploads/SessionFile/', $thumbnail);
        $thumbnail =  'public/uploads/SessionFile/' . $thumbnail;
    }
    $item->icon=$thumbnail;
    $item->save();

    $main_file1=$item_data->main_file;
    if ($r->file('main_file') != "") {
        $file = $r->file('main_file');
        $main_file1 = 'theme_p-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
        $file->move('public/uploads/product/main_file/zip/', $main_file1);
        $main_file1 =  'public/uploads/product/main_file/zip/' . $main_file1;
    }

    $item->file = $main_file1;
    $item->save();
    $main_file2=$item_data->main_file;
    if ($r->file('file') != "") {
        $file = $r->file('file');
        $main_file2 = 'theme_p-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
        $file->move('public/uploads/product/main_file/zip/', $main_file2);
        $main_file2 =  'public/uploads/product/main_file/zip/' . $main_file2;
    }
    $item->file = $main_file2;
    $item->status = 1;
    $item->save();
    if ($r->theme_preview) {
        if ($image_list) {
            $item->thumbnail = $image_list[0];
            $img = new ItemImage();
            $img->item_id = $item->id;
            $img->type='theme_preview';
            $img->image = implode(",",$image_list);    
            $img->save();    
        }
    }
    $item->save();


        Toastr::success('NFT updatat cu succes!','Success');

        $data =SessionFile::where('user_id',Auth::user()->id)->get();
            foreach ($data as $key => $value) {
                if ($value->file_name) {
                    File::delete('public/uploads/SessionFile/'.$value->file_name);
                }
                $value->delete();
            }
            


            
        

        if(@$r->optional_att){ 
            $s = ItemAttribute::where('item_id',$item_data->id )->delete();
            $attributes=@$r->optional_att;
            foreach($attributes as $field_name=>$attribute){
                $ItemAttribute =new ItemAttribute();
                $ItemAttribute->item_id = $item_data->id;
                $ItemAttribute->field_name = $field_name;
                $ItemAttribute->values =  json_encode($attribute);
                $ItemAttribute->save();
            }
        }

        
             DB::commit(); 
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }

}



      function itemDelete($id){
        try {
            $item =Item::find($id)->update(['active_status' => 0 ]);
            Toastr::success('Item deleted Successfully','Success');
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
      }
      
     /* *********************  END PRODUCT  *************************  */

     // item active deactive section 

     function Item_approve($id){
         try {
            $data=Item::findOrFail($id);
            if ($data->status==1) {
                $data->status = 0;
                $msg = 'item de-active';
            }else {
                $data->status = 1;
                $msg = 'item active';
            }
            $data->save();
            Toastr::success($msg);
            return redirect()->back();
            } catch (\Exception $e) {
               $msg=str_replace("'", " ", $e->getMessage()) ;
                Toastr::error($msg, 'Failed');
                return redirect()->back();
         }
     }

     public function ProductDuplicate($id)
     {
         try {
             $item = Item::findOrfail($id); 
            //  return $item; 
            $newItem = $item->replicate();
            $newItem->title = $item->title.''.'#'.($item->nftunic + 1);
            $newItem->nftunic = 0;
            $newItem->data_exp_unic = NULL;
            $newItem->idnft = rand(0, 999999999);
            $newItem->save();
         } catch (\Exception $e) {
             $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
         }
     }


     public function ProductDownload($id)
     {
         try {
             $item = Item::findOrfail($id); 
            //  return $item; 
             if (file_exists($item->main_file)) {
                 return Response()->download($item->main_file);
             }else {
                Toastr::error('File not found', 'Error');
                return redirect()->back();
             }
         } catch (\Exception $e) {
             $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
         }
     }
     function product_viewSingle(Request $r,$title,$id){
         
        try{
            $data['item'] = Item::find($id);  
            if (is_null($data['item'])) {
               return redirect()->back();
            }
           $data['comment'] = Comment::orderBy('id','desc')->get();
           $data['review'] = Review::orderBy('id','desc')->get();
           $data['BuyerFee'] = BuyerFee::where('status',1)->where('type',1)->first();
           $data['fees']=ItemFee::where('category_id',$data['item']->category_id)->first();
           $data['attributes'] = $data['item']->attribute;
           $level=DB::table('labels')->where('amount','<=',@$data['item']->user->balance->amount)->orderBy('id','desc')->first();
            $item_support=DB::table('item_supports')->first();
           $totalRate =DB::table('reviews')->where('item_id', $data['item']->id)->get();
            $rate5 =DB::table('reviews')->where('item_id', @$data['item']->id)->whereBetween('rating',[4.5,5])->get();
            $rate4 =DB::table('reviews')->where('item_id', $data['item']->id)->whereBetween('rating',[3.5,4])->get();
            $rate3 =DB::table('reviews')->where('item_id', $data['item']->id)->whereBetween('rating',[2.5,3])->get();
            $rate2 =DB::table('reviews')->where('item_id', @$data['item']->id)->whereBetween('rating',[1.5,2])->get();
            $rate1 =DB::table('reviews')->where('item_id', $data['item']->id)->whereBetween('rating',[.5,1])->get();
            $date=Carbon::parse(Carbon::now())->diffInDays($data['item']->user->created_at);
            $comment = DB::table('comments')->where('status',1)->where('item_id',@$data['item']->id)->count();
            $badge=DB::table('badges')->where('day','<=',@$date)->orderBy('id','desc')->first();
           return view('frontend.pages.singleitem', compact('data','rate5','rate4','rate3','rate2','rate1','totalRate','item_support','level','badge','comment'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back(); 
        }
    }

     function content_pending(){

        try {
            $data['item']=Item::where('status','!=', 1)->orderBy('id','desc')->get();
            return view('backend.product.pending_product', compact('data'));          
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
            $item = Item::findOrFail($id);
            $feedback = new Feedback();
            $feedback->feedback_by = Auth::id();
            $feedback->subject = $r->subject;
            $feedback->user_id = $item->user_id;
            $feedback->item_id = $item->id;
            $feedback->feedback = @$r->description;
            $feedback->status = $r->status;
            $feedback->save();
            $item->status = $r->status;
            $item->save();
            $data=[
               'username' => $item->user->username,
               'email' => $item->user->email,
               'body' => $r->description,
               'status' => $r->status,
               'url' =>  route('singleProduct',[str_replace(' ', '-',$item->title),$item->id]),
               'title' => $item->title,
            ];
            
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
            DB::commit();

            Toastr::success('Succsesfully item feedback sent !','Success');
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
       }
     }
     function itemApprove(Request $r,$id){
        // $r->validate([
        //     'status' => "required",
        //     'subject' => "required",
        // ]);
        DB::beginTransaction();
        try {
            $item = Item::findOrFail($id);
            $feedback = new Feedback();
            $feedback->feedback_by = Auth::id();
            $feedback->subject = '';
            $feedback->user_id = $item->user_id;
            $feedback->item_id = $item->id;
            $feedback->feedback = '';
            $feedback->status = 1;
            $feedback->save();
            $item->status = 1;
            $item->save();
            $data=[
               'username' => $item->user->username,
               'email' => $item->user->email,
               'body' => $r->description,
               'status' => 1,
               'url' =>  route('singleProduct',[str_replace(' ', '-',$item->title),$item->id]),
               'title' => $item->title,
            ];
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
                Log::info($e->getMessage());
            }
            DB::commit();

            Toastr::success('Succsesfully item Approved !','Success');
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
       }
     }






}