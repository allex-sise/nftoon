<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BalanceSheet extends Model
{
  


    function GetUser(){
        return $this->hasOne('App\User','id','author_id');
    }

}
