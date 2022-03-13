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
use App\Collections;
use App\CollectionsNFTs;
use App\ItemCategory;
use App\SubAttribute;
use App\ItemAttribute;
use App\ProductSetting;
use App\ItemSubCategory;
use App\User;
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

class CollectionsController extends Controller
{
    
    /* ********************* START  COLLECTIONS *************************  */
    public function adCollection()
    {
        try{
            $data['collection'] = Collections::all(); 
            $data['user'] = User::all(); 
            return view('backend.collection.adCollection', compact('data'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back()->withInput(); 
        }
    } 

    public function adCollectionStore(Request $request)
    {
     
      
        try{
            $store = new Collections();
            $store->name = $request->title;
            $store->slug = strtolower(str_replace(' ', '_',$request->title));
            $store->description = $request->description;
            $store->contract = $request->contract;
            $store->creator_id = $request->creator_id;

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

            //start laravel file validation 
            if($request->file('placehlimage') ==""){
                Toastr::error('Lipseste placeholder-ul', 'Failed');
                return redirect()->back()->withInput();
            }
            $placehlimage = "";
            if ($request->file('placehlimage') != "") {
                $file = $request->file('placehlimage');
                $placehlimage = 'thum-'. md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
                $file->move('public/uploads/product/thumbnail/', $placehlimage);
                $placehlimage =  'public/uploads/product/thumbnail/' . $placehlimage;

                $store->placeholder=$placehlimage;
                $store->save();
            }



            $result = $store->save();
    
            if ($result) {
                Toastr::success('Colectia creata cu succes !','Success');
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

    public function editCollection($id)
    {
        try{
            $data['collection'] = Collections::all();
            $data['user'] = User::all(); 
            $data['edit'] = Collections::find($id);
            return view('backend.collection.adCollection', compact('data'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back()->withInput(); 
        }
    }

    public function showCollection($id)
    {
        try{
     
            $data['collection'] = Collections::all();
            $data['edit'] = Collections::find($id);
            $nftcollection = CollectionsNFTs::where('collection_id', $id)->get();
            $nfts = Item::where('in_collection', NULL)->get();
            return view('backend.collection.showCollection', compact('data', 'nfts', 'nftcollection'));
        }catch (\Exception $e) {
           $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back(); 
        }
    }

    public function storeNFTcollection(Request $request)
    {
     
            $store = new CollectionsNFTs();
            $store->nft_id = $request->nft_id;
         //   $store->slug = strtolower(str_replace(' ', '_',$request->title));
            $store->collection_id = $request->collection_id;
            
            $result = $store->save();
            $itemstore = Item::find($request->nft_id);
            $itemstore->in_collection = $request->collection_id;
            $itemstore->save();
        
        
        if ($result) {
            Toastr::success('NFT adaugat cu success !','Success');
            return redirect()->back();
        } else {
            Toastr::error('A aparut o eroare! Incearca din nou! ','Failed');
            return redirect()->back()->withInput();
        }

    }
    
    public function updateCollection(Request $request)
    {
        $request->validate([
            'title' => "required|string|unique:collections,name,".$request->id
        ]);
        try{
         
                $store = Collections::find($request->id);
                $store->name = $request->title;
                $store->slug = strtolower(str_replace(' ', '_',$request->title));
                $store->description = $request->description;
                $store->creator_id = $request->creator_id;
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
                Toastr::success('Colectia updatata cu success !','Success');
                return redirect()->route('admin.adCollection');
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
    public function deleteCollectionP(Request $request, $id)
    {
        // $tables = TableList::getTableList('category_id', $id);
        // $tables= str_replace('Infix category question,','',$tables);
        // dd($tables);
        try {
      //toDo, nu merge Call to a member function delete() on null
                $delete_query = Collections::find($id);
                $delete_query->delete();

                    Toastr::success('Succsesfully Deleted!','Success');
                return redirect()->back();
        
        } catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
        
    }

   public function deleteCollection(Request $request, $id)
    {
        $tables = TableList::getTableList('category_id', $id);
        $tables= str_replace('Infix category question,','',$tables);
        // dd($tables);
        try {
      //toDo, nu merge Call to a member function delete() on null
      $nftul = CollectionsNFTS::where('id', $id)->first();
      $nftuls = $nftul->nft_id;
                $nftdelete = Item::find($nftuls);
                $nftdelete->in_collection = NULL;
                $nftdelete->save();
                $delete_query = CollectionsNFTS::find($id);
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