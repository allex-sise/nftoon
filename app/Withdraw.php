<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Withdraw extends Model
{
    function user(){
        return $this->belongsTo('App\User');
    }
}
