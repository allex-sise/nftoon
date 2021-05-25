<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubAttribute extends Model
{
    public function attribute(){
        return $this->belongsTo('App\Attribute','attributes_id', 'id');
    }
    public function category(){
        return $this->belongsTo('App\ItemCategory','category_id', 'id');
    }
}
