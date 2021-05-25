<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ItemPreview extends Model
{
    protected $fillable =['status'];
    public function subCategory()
    {
        return $this->belongsTo('App\ItemSubCategory','sub_category_id', 'id');
    }
    public function category(){
        return $this->belongsTo('App\ItemCategory','category_id','id');
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
        return $this->HasOne('App\ItemImage','item_id','id');
    }

    public function user(){
        return $this->belongsTo('App\User');
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
    public function item_fee()
    {
        return $this->hasOne('App\ItemFee','category_id','category_id');
    }
    public function item()
    {
        return $this->belongsTo('App\Item','item_id','id');
    }

}
