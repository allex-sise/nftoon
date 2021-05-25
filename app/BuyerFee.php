<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BuyerFee extends Model
{
    public function buyerFeetype(){
        return $this->belongsTo('App\BuyerFeeType','type', 'id');
    }
    public function AuthorName(){
        return $this->belongsTo('App\User','user_id', 'id');
    }
}
