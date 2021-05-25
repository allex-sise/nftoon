<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Refund extends Model
{
    public function Item(){
    	return $this->belongsTo('App\Item', 'item_id', 'id');
    }
    public function RefundReason(){
    	return $this->belongsTo('Modules\Refund\Entities\RefundReason', 'ref_id', 'id');
    }
    function itemOrder(){
        return $this->belongsTo('App\ItemOrder','item_id','item_id');
    }
    function user(){
        return $this->belongsTo('App\User','user_id','id');
    }
    function refundComment(){
        return $this->hasMany('App\RefundComment','item_id','item_id');
    }
}
