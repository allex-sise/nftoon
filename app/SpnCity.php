<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SpnCity extends Model
{
    public function state(){
        return $this->belongsTo('App\SpnState', 'state_id');
    }
}
