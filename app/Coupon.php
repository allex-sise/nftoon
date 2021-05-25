<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $fillable =[
        'status'
    ];
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function Min_Price(){
        return $this->hasOne('App\BuyerFee','id','min_price');
    }
}
