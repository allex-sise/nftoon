<?php
namespace App;
use Illuminate\Database\Eloquent\Model;
class ItemAttribute extends Model
{
    // Attribute
    public function Attribute(){
    	return $this->belongsToMany('App\Item', 'item_id', 'id');
    }
    
    public function item(){
    	return $this->belongsTo('App\Item', 'item_id', 'id');
    }
}
