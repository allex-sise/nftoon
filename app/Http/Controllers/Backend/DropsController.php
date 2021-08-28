<?php

namespace App\Http\Controllers\Backend;

use Auth;
use File;
use App\Item;
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
use App\Drops;
use App\DropNFTs;
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

class DropsController extends Controller
{
    
    /* ********************* START  DROPS *************************  */
    public function adDrop()
    {
        try{
            $data['drop'] = Drops::all(); 
            return view('backend.drop.adDrop', compact('data'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back()->withInput(); 
        }
    } 

    public function adDropStore(Request $request)
    {
     
      
        try{
            $store = new Drops();
            $store->name = $request->title;
            $store->slug = strtolower(str_replace(' ', '_',$request->title));
            $store->description = $request->description;
            $store->startdate = Carbon::createFromFormat('m/d/Y H:i', $request->startdate)->format('Y-m-d H:i');
            $store->expdate = Carbon::createFromFormat('m/d/Y H:i', $request->expdate)->format('Y-m-d H:i');
          
            $store->status = $request->status;
             //start laravel file validation 
             if($request->file('thumdnail') ==""){
                Toastr::error('Thumbnail File missing', 'Failed');
                return redirect()->back()->withInput();
            }
            $thumbnail = "";
            if ($request->file('thumdnail') != "") {
                $file = $request->file('thumdnail');
                $thumbnail = 'thum-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
                $file->move('public/uploads/product/thumbnail/', $thumbnail);
                $thumbnail =  'public/uploads/product/thumbnail/' . $thumbnail;

                $store->dropicon=$thumbnail;
                $store->save();
            }

            $result = $store->save();
    
            if ($result) {
                Toastr::success('Drop creat cu succes !','Success');
                return redirect()->back();
            } else {
                Toastr::error('Operatiunea a esuat','Error');
                return redirect()->back();
            }
        }catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back()->withInput();
        }
    }

    public function editDrop($id)
    {
        try{
            $data['drop'] = Drops::all();
            $data['edit'] = Drops::find($id);
            return view('backend.drop.adDrop', compact('data'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back()->withInput(); 
        }
    }

    public function showDrop($id)
    {
        try{
     
            $data['drop'] = Drops::all();
            $data['edit'] = Drops::find($id);
            $nftdrop = DropNFTs::where('drop_id', $id)->get();
            $nfts = Item::where('in_drop', NULL)->get();
            return view('backend.drop.showDrop', compact('data', 'nfts', 'nftdrop'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back(); 
        }
    }

    public function storeNFTdrop(Request $request)
    {
     
            $store = new DropNFTs();
            $store->nft_id = $request->nft_id;
         //   $store->slug = strtolower(str_replace(' ', '_',$request->title));
            $store->drop_id = $request->drop_id;
            
            $result = $store->save();
            $itemstore = Item::find($request->nft_id);
            $itemstore->in_drop = $request->drop_id;
            $itemstore->save();
        
        
        if ($result) {
            Toastr::success('NFT adaugat cu success !','Success');
            return redirect()->back();
        } else {
            Toastr::error('A aparut o eroare! Incearca din nou! ','Failed');
            return redirect()->back()->withInput();
        }

    }
    
    public function updateDrop(Request $request)
    {
        $request->validate([
            'title' => "required|string|unique:drops,name,".$request->id
        ]);
        try{
         
                $store = Drops::find($request->id);
                $store->name = $request->title;
                $store->slug = strtolower(str_replace(' ', '_',$request->title));
                $store->description = $request->description;
                $store->startdate = Carbon::createFromFormat('m/d/Y H:i', $request->startdate)->format('Y-m-d H:i');
                $store->expdate = Carbon::createFromFormat('m/d/Y H:i', $request->expdate)->format('Y-m-d H:i');
                $store->status = $request->status;
                $thumbnail =$store->dropicon;
                if ($request->file('thumdnail') != "") {
                    $file = $request->file('thumdnail');
                    $thumbnail = 'thum-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
                    $file->move('public/uploads/SessionFile/', $thumbnail);
                    $thumbnail =  'public/uploads/SessionFile/' . $thumbnail;
                }
                $store->dropicon=$thumbnail;
                $store->save();

                $result = $store->save();
            
            
            if ($result) {
                Toastr::success('Drop updatat cu success !','Success');
                return redirect()->route('admin.adDrop');
            } else {
                Toastr::error('A aparut o eroare! Incearca din nou! ','Success');
                return redirect()->back()->withInput();
            }
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back(); 
        }
    }
    public function deleteDropP(Request $request, $id)
    {
        // $tables = TableList::getTableList('category_id', $id);
        // $tables= str_replace('Infix category question,','',$tables);
        // dd($tables);
        try {
      //toDo, nu merge Call to a member function delete() on null
                $delete_query = Drops::find($id);
                $delete_query->delete();

                    Toastr::success('Succsesfully Deleted!','Success');
                return redirect()->back();
        
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
        
    }

   public function deleteDrop(Request $request, $id)
    {
        $tables = TableList::getTableList('category_id', $id);
        $tables= str_replace('Infix category question,','',$tables);
        // dd($tables);
        try {
      //toDo, nu merge Call to a member function delete() on null
                $delete_query = DropNFTs::find($id);
                $delete_query->delete();

                    Toastr::success('Succsesfully Deleted!','Success');
                return redirect()->back();
        
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
        
    }
    /* *********************  END DROPS  *************************  */






}