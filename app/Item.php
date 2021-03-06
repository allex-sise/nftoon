<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $fillable =[
        'title','feature1','feature2','description','thumdnail','main_file','file','category_id','Re_item',
        'Re_buyer','Reg_total','user_msg','active_status'
    ];

    public function subCategory()
    {
        return $this->hasOne('App\ItemSubCategory', 'id','sub_category_id');
    }

    public function category(){
        return $this->HasOne('App\ItemCategory','id','category_id');
    }
    public function _compatible_browsers(){
        return $this->HasOne('App\SubAttribute','id','compatible_browsers');
    }
    public function _compatible_with(){
        return $this->HasOne('App\SubAttribute','id','compatible_with');
    }
    public function _framework(){
        return $this->HasOne('App\SubAttribute','id','framework');
    }
    public function _software_version(){
        return $this->HasOne('App\SubAttribute','id','software_version');
    }
    
    public function item_image(){
        return $this->hasOne('App\ItemImage','item_id','id')->where('type','theme_preview');
    }
    public function screen_image(){
        return $this->hasOne('App\ItemImage','item_id','id')->where('type','screen_shot');
    }

    public function user(){
        return $this->belongsTo('App\User');
    }
    public function og(){
        return $this->hasOne('App\User','id','ogowner');
    }
    public function freeItem(){
        return $this->hasOne('App\FreeItem','item_id');
    }
    
    public function attribute(){
        return $this->hasMany('App\ItemAttribute','item_id');
    }

    public function CountItem($category=null,$sub=null){
        if (isset($sub) && isset($category)) {
            $data = Item::where('category_id',$category)->where('sub_category_id',$sub)->where('active_status', 1)->where('status', 1)->count(); 
            return $data;
        }
    }

    public function comments()
    {
        return $this->hasMany('App\Comment','item_id','id')->whereNull('parent_id');
    }
    public function reviews()
    {
        return $this->hasMany('App\Review','item_id','id');
    }
    public function feedback()
    {
        return $this->hasMany('App\Feedback','item_id','id');
    }
    public function item_fee()
    {
        return $this->hasOne('App\ItemFee','category_id','category_id');
    }

    
   
}
