<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PaidPackagePayment extends Model
{
    protected $fillable =[
        'user_id','total'
    ];
}
