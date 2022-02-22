<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Collections extends Model
{
    //
    public function creator(){
        return $this->hasOne('App\User','id','creator_id');
    }
}
