<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RefundComment extends Model
{
    function user(){
        return $this->belongsTo('App\User');
    }
}
