<?php

namespace App\Http\Controllers\Frontend;

use App\Item;
use App\ItemCategory;
use App\ItemSubCategory;
use App\Drops;
use App\Review;
use App\Comment;
use App\ItemFee;
use App\Profile;
use App\BuyerFee;
use App\ItemView;
use DB;
use App\ItemOrder;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;
use Gloudemans\Shoppingcart\Facades\Cart;

class DropController extends Controller
{
    function singleDrop($drop){
        // return $subcategory;
        try{
            $data['category'] = Drops::where('slug', $drop)->first();
            //$data['key']=Session::get('key');
    
                $item = Item::where('drop_id', $data['category']->id)->where('active_status', 1)->where('status', 1);
                $data['item_count'] = $item;
                $data['item'] = $item->paginate(5);
            
             $data= $this->sellWise($data);
                $data= $this->starWise($data);
                $data= $this->dateWise($data);
            return view('frontend.pages.singleDrop', compact('data'));
        }catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }
    }
    function sellWise($data){
        if (@$data['sub_cat']) {
            $data['no'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('sell',0)->get()->count(); 
            $data['low'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('sell','>=',1)->where('sell','<=',300)->get()->count(); 
            $data['medium'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('sell','>=',300)->where('sell','<=',600)->get()->count(); 
            $data['high'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('sell','>=',600)->where('sell','<=',1000)->get()->count(); 
            $data['top'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('sell','>=',1000)->get()->count(); 
        }
        else {
            $data['no'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('sell',0)->get()->count(); 
            $data['low'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('sell','>=',1)->where('sell','<=',300)->get()->count(); 
            $data['medium'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('sell','>',300)->where('sell','<=',600)->get()->count(); 
            $data['high'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('sell','>',600)->where('sell','<=',1000)->get()->count(); 
            $data['top'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('sell','>',1000)->get()->count(); 
        }
        return $data;
    }
    function starWise($data){
        if (@$data['sub_cat']) {
            $data['oneStar'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',1)->where('rate','<',2)->get()->count(); 
            $data['TwoStar'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',2)->where('rate','<',3)->get()->count(); 
            $data['ThreStar'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',3)->where('rate','<',4)->get()->count(); 
            $data['FourStar'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',4)->where('rate','<',5)->get()->count(); 
            $data['FivStar'] = DB::table('items')->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',5)->get()->count(); 
        }
        else {
            $data['oneStar'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',1)->where('rate','<',2)->get()->count();
            $data['TwoStar'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',2)->where('rate','<',3)->get()->count(); 
            $data['ThreStar'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',3)->where('rate','<',4)->get()->count(); 
            $data['FourStar'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',4)->where('rate','<',5)->get()->count();
            $data['FivStar'] = DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->where('rate','>=',5)->get()->count();  
        }
        return $data;
    }
    function dateWise($data){
         if (@$data['sub_cat']) {
            $data['Any_Date']=DB::table('items')->where('category_id',@$data['category']->id)->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->count();
            $data['LastYear']=DB::table('items')->where('category_id',@$data['category']->id)->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->whereDate('created_at', '<=', date('Y-m-d',strtotime('-1 years')))->count();
            $data['Last_month']=DB::table('items')->where('category_id',@$data['category']->id)->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->whereBetween('created_at',[date('Y-m-d',strtotime('-1 months')),date('Y-m-d')])->count();
            $data['Last_week']=DB::table('items')->where('category_id',@$data['category']->id)->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->whereBetween('created_at',[date('Y-m-d',strtotime('-1 weeks')),date('Y-m-d')])->count();
            $data['Last_day']=DB::table('items')->where('category_id',@$data['category']->id)->where('sub_category_id',@$data['sub_cat']->id)->where('active_status', 1)->where('status', 1)->whereBetween('created_at',[date('Y-m-d',strtotime('-1 days')),date('Y-m-d')])->count();
        }else {
            $data['Any_Date']=DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->count();
            $data['LastYear']=DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->whereDate('created_at', '<=', date('Y-m-d',strtotime('-1 years')))->count();
            $data['Last_month']=DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->whereBetween('created_at',[date('Y-m-d',strtotime('-1 months')),date('Y-m-d')])->count();
            $data['Last_week']=DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->whereBetween('created_at',[date('Y-m-d',strtotime('-1 weeks')),date('Y-m-d')])->count();
            $data['Last_day']=DB::table('items')->where('category_id',@$data['category']->id)->where('active_status', 1)->where('status', 1)->whereBetween('created_at',[date('Y-m-d',strtotime('-1 days')),date('Y-m-d')])->count();
        
        }
        return $data;
    }
    

    public function dropWiseItem(Request $request)
    {
        $all = '';
        $bestsell = '';
        $newest = '';
        $bestrated = '';
        $trending = '';
        $high = '';
        $low = '';

        if (isset($_GET['all'])) {
            $all = $_GET['all'];
        }
        if (isset($_GET['bestsell'])) {
            $bestsell = $_GET['bestsell'];
        }
        if (isset($_GET['newest'])) {
            $newest = $_GET['newest'];
        }

        if (isset($_GET['bestrated'])) {
            $bestrated = $_GET['bestrated'];
        }
        if (isset($_GET['trending'])) {
            $trending = $_GET['trending'];
        }
        if (isset($_GET['high'])) {
            $high = $_GET['high'];
        }
        if (isset($_GET['low'])) {
            $low = $_GET['low'];
        }
        $search = DB::table('users')
             ->join('items', function($join) {
            $join->on('users.id', '=', 'items.user_id');
            $join->where('items.active_status', '=', 1);
            $join->where('items.status', '=', 1);
        })
            ->leftjoin('drops', 'items.drop_id', '=', 'drops.id')
            ->leftjoin('item_categories', 'items.category_id', '=', 'item_categories.id')
            ->leftjoin('item_sub_categories', 'items.sub_category_id', '=', 'item_sub_categories.id')
            ->leftjoin('item_fees','item_fees.category_id','=', 'items.category_id')
            ->select('items.*', 'users.username as username', 'item_sub_categories.title as sub_category', 'item_categories.title as category','item_fees.support_fee','drops.title as drop')
            ->where('items.status', 1)->where('items.active_status', 1);
        /*  ->where('bestsell','like','%'.$bestsell.'%') */
        /*  ->where('trending','like','%'.$trending.'%')  */
        if ($request->_categor_id) {
            $search = $search->where('items.category_id', $request->_categor_id);
        }
        if ($request->min_price && $request->max_price) {
            $search = $search->whereBetween('items.Reg_total', [$request->min_price, $request->max_price]);
        }
        if ($request->key) {
            $search = $search->where('items.title', 'like', '%' . $request->key . '%');
        }
        if ($request->_subcategor_id) {
            $search = $search->where('item_sub_categories.slug',  $request->_subcategor_id);
        }

        if ($request->newest) {
            $search->orderBy('id', 'DESC');
        }

        if ($low == "low") {
            $search->orderBy('Reg_total', 'asc');
        }
        if ($high == "high") {
            $search->orderBy('Reg_total', 'DESC');
        }
        if ($request->tag) {
            $search = $search->where('items.tags',  $request->_tag);
            //return response()->json($search->get(), 200);
        }
        if ($request->bestsell) {
            $search->orderBy('sell', 'desc');
        }
        if ($request->bestrated) {
            $search->orderBy('rate', 'desc');
        }

        if ($request->trending) {
            $search->orderBy('views', 'desc');
        }
        if ($request->NoSell) {
            $search->where('sell', 0)->get();
        }
        if ($request->LowSell) {
            $search->where('sell', '>=', 1)->where('sell', '<=', 300);
        }
        if ($request->MediumSell) {
            $search->where('sell', '>', 300)->where('sell', '<=', 600);
        }
        if ($request->HighSell) {
            $search->where('sell', '>', 600)->where('sell', '<=', 1000);
        }
        if ($request->TopSell) {
            $search->where('sell', '>', 1000);
        }
        if (@$request->star) {
            switch ($request->star) {
                case 1:
                    $search->where('rate', '>=', 1)->where('rate', '<', 2);
                    break;
                case 2:
                    $search->where('rate', '>=', 2)->where('rate', '<', 3);
                    break;
                case 3:
                    $search->where('rate', '>=', 3)->where('rate', '<', 4);
                    break;
                case 4:
                    $search->where('rate', '>=', 4)->where('rate', '<', 5);
                    break;
                case 5:
                    $search->where('rate', '>=', 5);
                    break;
                default:
                    $search;
                    break;
            }
        }

        $data = $search->paginate(8);
        return response()->json($data, 200);
    }

    function dropsAll(){
      
        try{
            if (Schema::hasTable('users')) {
                $testInstalled = DB::table('users')->get();
                
                    $data['category'] =  ItemCategory::where('active_status', 1)->where('show_menu',1)->get();
                    $data['item'] =  Item::where('active_status', 1)->where('status', 1)->take(2)->get();
                    $data['drop'] =  Drops::where('status', 1)->get();

                        
                    return view('frontend.pages.drops', compact('data'));
                }
    
            
        }catch (\Exception $e) {
            $msg=str_replace("'", " ", $e->getMessage()) ;
            Toastr::error($msg, 'Failed');
            return redirect()->back();
        }

    }
    function categoryAll(){
        return view('frontend.pages.categoryAll');

    }
    // Cactegoruy wise item 
    function dropsrequest(Request $request)
    {
        $all = '';
        $bestsell = '';
        $newest = '';
        $bestrated = '';
        $trending = '';
        $high = '';
        $low = '';


        if (isset($_GET['all'])) {
            $all = $_GET['all'];
        }
        if (isset($_GET['bestsell'])) {
            $bestsell = $_GET['bestsell'];
        }
        if (isset($_GET['newest'])) {
            $newest = $_GET['newest'];
        }

        if (isset($_GET['bestrated'])) {
            $bestrated = $_GET['bestrated'];
        }
        if (isset($_GET['trending'])) {
            $trending = $_GET['trending'];
        }
        if (isset($_GET['high'])) {
            $high = $_GET['high'];
        }
        if (isset($_GET['low'])) {
            $low = $_GET['low'];
        }


        $search = DB::table('users')
             ->join('items', function($join) {
            $join->on('users.id', '=', 'items.user_id');
            $join->where('items.active_status', '=', 1);
            $join->where('items.status', '=', 1);
        })
            ->leftjoin('item_categories', 'items.category_id', '=', 'item_categories.id')
            ->leftjoin('item_sub_categories', 'items.sub_category_id', '=', 'item_sub_categories.id')
            ->leftjoin('item_fees','item_fees.category_id','=', 'items.category_id')
            ->select('items.*', 'users.username as username', 'item_sub_categories.title as sub_category', 'item_categories.title as category','item_fees.support_fee')
            ->where('items.status', 1)
            ->where('items.active_status', 1);
        /*  ->where('bestrated','like','%'.$bestrated.'%') */
        /*  ->where('bestsell','like','%'.$bestsell.'%') */
        /*  ->where('trending','like','%'.$trending.'%')  */
        if ($request->bestsell) {
            $search->orderBy('sell', 'desc');
        }
        if ($request->bestrated) {
            $search->orderBy('rate', 'desc');
        }
        if ($request->trending) {
            $search->orderBy('views', 'desc');
        }
        if ($request->newest) {
            $search->orderBy('id', 'DESC');
        }
        if ($low == "low") {
            $search->orderBy('Reg_total', 'asc');
        }
        if ($high == "high") {
            $search->orderBy('Reg_total', 'DESC');
        }

        // return $search->get();
        $data = $search->paginate(8);
        return response()->json($data, 200);
    }

}