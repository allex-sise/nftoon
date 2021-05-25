<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Statement extends Model
{
    public function Item(){
    	return $this->belongsTo('App\Item', 'item_id', 'id');
    }
}
