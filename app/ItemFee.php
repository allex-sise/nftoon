<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ItemFee extends Model
{
    public function category(){
        return $this->belongsTo('App\ItemCategory','category_id', 'id');
    }
}
