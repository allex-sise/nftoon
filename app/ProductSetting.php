<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductSetting extends Model
{
    
    public function category(){
        return $this->HasOne('App\ItemCategory','id','item_category_id');
    }

}
