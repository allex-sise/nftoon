<?php

namespace App;

use App\ItemSubCategory;
use Illuminate\Database\Eloquent\Model;

class ItemCategory extends Model
{
    public function subCategory()
    {
        return $this->hasMany('App\ItemSubCategory','item_category_id', 'id');
    }
    public function productSetting() 
    {
        return $this->hasOne('App\ProductSetting','item_category_id', 'id');
    }
    public function ItemSubCategory(){
    	return $this->belongsTo('App\ItemSubCategory', 'id', 'item_category_id');
    }
    //  public function ItemSubCategory(){

    //     return $this->belongsTo(ItemSubCategory::class,'subcategory_id','id')->withDefault();
    // }
}
