<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PaidPayment extends Model
{
    protected $fillable = [
        'user_id','amount'
    ];
}
