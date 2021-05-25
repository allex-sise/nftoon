<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function feedback_user(){
        return $this->belongsTo('App\User','feedback_by','id');
    }
}
