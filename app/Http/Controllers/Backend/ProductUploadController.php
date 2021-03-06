<?php

namespace App\Http\Controllers\Backend;

use App\Item;
use App\User;
use ZipArchive;
use App\Attribute;
use App\ItemImage;
use App\SessionFile;
use App\ItemCategory;
use App\SubAttribute;
use App\Collections;
use App\CollectionsNFTs;
use File;
use Carbon\Carbon;
use App\ItemAttribute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;

class ProductUploadController extends Controller
{
    public function product_upload(){
        $attribute=Attribute::all();
        $data['category'] = ItemCategory::where('up_permission',1)->get();
        $data['user'] = User::where('role_id', 4)->get();
        $data['collection'] = Collections::get();
        $data['attribute'] = Attribute::all();
        $data['sub_attribute'] = SubAttribute::latest()->get();

        return view('backend.product.product_upload', compact('data','attribute'));

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
     public function product_upload_store(Request $r){
        //  return $r;
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
            'title' => 'required|string|max:100',
            'description' => 'required|string',
            'thumdnail'=>'required_without:main_file|',
            'category_id' => 'required|',
            'demo_url' => 'required|url',
            'Re_item' => 'required|',
            'Re_buyer' => 'required|',
            'Reg_total_price' => 'required|',
            'user_msg' => 'sometimes|nullable|string',
            'upload_or_link' => 'required',
            'tags' => 'required|string',
        ]);
        if ($r->upload_or_link==0) {
            $r->validate([
                'purchase_link' => 'required|url',
            ]);
        } 
        
        
    
    
        DB::beginTransaction();
        try {
        
            $item = new Item();
            $item->user_id = $r->user_id;
            $item->title = $r->title;
            $item->feature1 = $r->feature1;
            $item->feature2 = $r->feature2;
            $item->description = $r->description;    
            $item->category_id = $r->category_id;
            $item->file = $r->videoimage;
            $item->nftmultiplu = $r->nftmultiplu;
            if($r->nftmultiplu){
                $item->nftmultiplumax = $r->nftmultiplumax;    
            }
           
            // $item->idnft = rand(0, 999999999);
            if($r->data_exp_unic){
                $item->data_exp_unic = Carbon::createFromFormat('d/m/Y H:i', $r->data_exp_unic.$r->ora_exp_unic)->format('Y-m-d H:i');
            }
          
            $item->tags = $r->tags;
            

            

            $item->in_collection = $r->collection_id;
            $item->Re_item = $r->Re_item;
            $item->Re_buyer = $r->Re_buyer;
            $item->C_item = $r->C_item;
            $item->C_buyer = $r->C_buyer;
            $item->E_buyer = 0;
            $item->Reg_total = $r->Reg_total_price;
            $item->og_price = $r->Re_item;

            $item->user_msg = $r->user_msg;
            $item->demo_url = $r->demo_url;
            $item->active_status = 1;
            $item->ogowner = $r->user_id;
            $item->status = 1;
            $item->is_upload = $r->upload_or_link;
            if ($r->upload_or_link==0) {
                $item->purchase_link = $r->purchase_link;
                
            }
    
        
         
            if ($r->nftmultiplu){
            $zip = new \ZipArchive();
            $file = $r->file('theme_preview');
            $zip->open($file->path());

            $filesInside = [];
            for ($i = 0; $i < $zip->count(); $i++) {            
                $file_name=$zip->getNameIndex($i);
                $exten= substr($file_name, strpos($file_name, ".") + 1);
                if ($exten=='jpg' ||$exten=='jpeg' ||$exten=='png') {
                    array_push($filesInside, $zip->getNameIndex($i));
                }
            }
        

           
            $theme_preview = "";
            if ($r->file('theme_preview') != "") {
                $file = $r->file('theme_preview');
                $theme_preview = 'theme_p-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
                $file->move('public/uploads/SessionFile/', $theme_preview);
                $theme_preview =  'public/uploads/SessionFile/' . $theme_preview;

                $session_file=new SessionFile();
                $session_file->user_id=Auth::user()->id;
                $session_file->file_name=$theme_preview;
                $session_file->save();
            } 
            $theme_preview =$theme_preview;
            $dest= 'public/uploads/product/themePreview';

            
            if ($r->theme_preview && file_exists($theme_preview)) {
            
                $product_id=Item::max('id')+1;
                $product_image_path = 'public/uploads/product/themePreview/'.$product_id.'/';                            
                $Image =  time().'-';                         
                if (!file_exists($product_image_path)){
                    mkdir($product_image_path, 0777, true);
                }

                $zip_extract = new ZipArchive;
                $res = $zip_extract->open($theme_preview);
                if ($res === TRUE) {
                    $zip_extract->extractTo($product_image_path);
                    $zip_extract->close();
                } else {
                    return false;
                }

                // return $theme_preview;
                // return $r;


                $filesInFolder = \File::files($product_image_path);  
                $image_list=[]; 
                for ($i = 0; $i < $zip->count(); $i++) {
                
                    $file_name=$zip->getNameIndex($i);
                    $file_exten=explode('.',$file_name);
                    if (@$file_exten[1]=='jpeg' || @$file_exten[1]=='png'|| @$file_exten[1]=='jpg' ) {
                        $image_list[]=$product_image_path.$file_name ;
                    }
                }

                $preview_image_list= implode(',',$image_list);
                $item->screen_shot = $preview_image_list;
                $item->theme_preview = $preview_image_list;
                $item->save();
        
                
            }else{
                return false;
            }

            }
         
            //end laravel file validation 

                
            $thumbnail = "";
            if ($r->file('thumdnail') != "") {
                $file = $r->file('thumdnail');
                $thumbnail = 'thum-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
                $file->move('public/uploads/product/thumbnail/', $thumbnail);
                $thumbnail =  'public/uploads/product/thumbnail/' . $thumbnail;

                $item->icon=$thumbnail;
                $item->save();
            }

            if (GeneralSetting()->is_s3_host==0) {
                    $main_file1='';
                    if ($r->file('main_file') != "") {
                        $file = $r->file('main_file');
                        $main_file1 = 'theme_p-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
                        $file->move('public/uploads/product/main_file/zip/', $main_file1);
                        $main_file1 =  'public/uploads/product/main_file/zip/' . $main_file1;
        
                        $item->main_file = $main_file1;
                        $item->save();
                    }
            } else {
                if (moduleStatusCheck("AmazonS3")) {
                    $filePath = '/';
                    if ($r->file('main_file') != "") {
                    $path = $r->file('main_file')->store($filePath, 's3');
                    $link = Storage::disk('s3')->url($path);
                    $item->main_file = $link;
                    $item->save();
                    }
                }
            }
            
          
    
            if (@$image_list) {
                $item->thumbnail = $image_list[0];
                $img = new ItemImage();
                $img->item_id = $item->id;
                $img->type='theme_preview';
                $img->image = implode(",",$image_list);    
                $img->save();    
            }
            $item->save();

            if(@$r->optional_att){
                $attributes=@$r->optional_att;
                foreach($attributes as $field_name=>$attribute){
                    $ItemAttribute =new ItemAttribute();
                    $ItemAttribute->item_id = $item->id;
                    $ItemAttribute->field_name = $field_name;
                    $ItemAttribute->values =  json_encode($attribute);
                    $ItemAttribute->save();
                }
            }

            $storecollectionNFT = new CollectionsNFTs();
            $storecollectionNFT->nft_id = $item->id;
            $storecollectionNFT->collection_id = $r->collection_id;
            
            $storecollectionNFT->save();
 


            Toastr::success('Product Uploaded Successfully','Success');  
            DB::commit(); 

            $data =SessionFile::where('user_id',Auth::user()->id)->get();
            foreach ($data as $key => $value) {
                if ($value->file_name) {
                    File::delete($value->file_name);
                }
                $value->delete();
            }
            return redirect()->back();
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
     }
        function product_upload_update(Request $r){
            
            // return $r;
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
                    'title' => 'required|string|max:100',
                    // 'feature1' => 'required|string|max:45',
                    // 'feature2' => 'string|max:45',
                    'description' => 'required|string',
                    'thumdnail'=>'sometimes|nullable|required_without:main_file|',
                    'main_file' => 'sometimes|nullable|required|',
                    'file' => 'sometimes|nullable|required|',
                    'category_id' => 'required|',
                    'demo_url' => 'required|url',
                    'Re_item' => 'required|',
                    'Re_buyer' => 'required|',
                    'Reg_total_price' => 'required|',
                    'user_msg' => 'sometimes|nullable|string',
                    'tags' => 'required|string',
                    'upload_or_link' => 'required',
                    'purchase_link' => 'sometimes|url',
                ]);
                
                
            DB::beginTransaction();
            try {
        
            
            $item =Item::find($r->id);
            $item->user_id = Auth::user()->id;
            
            $item->title = $r->title;
            $item->feature1 = $r->feature1;
            $item->feature2 = $r->feature2;
            $item->description = $r->description;    
            $item->category_id = $r->category_id;
            $item->tags = $r->tags;
            $item->is_upload = $r->upload_or_link;
            if ($r->upload_or_link==0) {
                $item->purchase_link = $r->purchase_link;
                
            }
        
       
            $item->Re_item = $r->Re_item;
            $item->Re_buyer = $r->Re_buyer;
            $item->Reg_total = $r->Reg_total_price;
            $item->user_msg = $r->user_msg;
            $item->demo_url = $r->demo_url;
            $item->active_status = 1;
        
           
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
                if (GeneralSetting()->is_s3_host==0) {
                    $file = $r->file('main_file');
                    $main_file1 = 'theme_p-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
                    $file->move('public/uploads/product/main_file/zip/', $main_file1);
                    $main_file1 =  'public/uploads/product/main_file/zip/' . $main_file1;
               } else {
                if (moduleStatusCheck("AmazonS3")) {
                    $filePath = '/';
                    if ($r->file('main_file') != "") {
        
                    // Storage::delete($item_data->main_file);
        
                    $path = $r->file('main_file')->store($filePath, 's3');
                    $link = Storage::disk('s3')->url($path);
                    $main_file1 = $link;
                    }
                }
               }
               
          
            }
            $item->file = $main_file1;
            $item->save();
            $main_file2=$item_data->main_file;
            if ($r->file('file') != "") {
        
                if (GeneralSetting()->is_s3_host==0) {
                    $file = $r->file('file');
                    $main_file2 = 'file-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
                    $file->move('public/uploads/product/main_file/zip/', $main_file2);
                    $main_file2 =  'public/uploads/product/main_file/zip/' . $main_file2;
        
                }else{
                    if (moduleStatusCheck("AmazonS3")) {
                        $filePath = '/';
                        if ($r->file('file') != "") {
        
                        // Storage::delete($item_data->main_file);
        
                        $path = $r->file('file')->store($filePath, 's3');
                        $link = Storage::disk('s3')->url($path);
                        $main_file2 = $link;
                        }
                    }
                }  
        
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
            Toastr::success('Product Uploaded Successfully','Success');
        
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
                    // dd($e);
                    $msg=str_replace("'", " ", $e->getMessage()) ;
                    Toastr::error($msg, 'Failed');
                    return redirect()->back();
                }
           
          }
}
