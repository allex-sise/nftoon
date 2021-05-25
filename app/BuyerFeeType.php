<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BuyerFeeType extends Model
{
    public function buyerFee()
    {
        return $this->hasMany('App\BuyerFee', 'type');
    }
}
