<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ItemOrder extends Model
{
    public function Item(){
    	return $this->belongsTo('App\Item', 'item_id', 'id');
    }
    public function buyer(){
    	return $this->belongsTo('App\User', 'user_id', 'id');
    }
    public function OrderItem(){
    	return $this->belongsTo('App\Order', 'order_id', 'id');
    }
    public function review_item(){
    	return $this->hasMany('App\Review', 'user_id','user_id');
    }

    public function ItemNotify(){
    	return $this->belongsTo('App\ItemUpdateNotify', 'item_id', 'item_id');
    }
   
}
