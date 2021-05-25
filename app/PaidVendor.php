<?php

namespace App;

use Carbon\Carbon; 
use Illuminate\Database\Eloquent\Model;

class PaidVendor extends Model
{
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function payment_method(){
        return $this->belongsTo('App\PaymentMethod', 'user_id', 'id');
    }
}
