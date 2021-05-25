<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{

    protected $fillable =[
        'user_id'
    ];
    function user(){
        return $this->belongsTo('App\User');
    }
    public function Item(){
    	return $this->belongsTo('App\Item', 'item_id', 'id');
    }
    public function reviewType(){
    	return $this->belongsTo('App\ReviewType', 'review_type', 'id');
    }
}
