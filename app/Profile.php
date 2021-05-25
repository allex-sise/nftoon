<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    public function user(){
    	return $this->belongsTo('App\User', 'user_id', 'id');
    }
    public function country(){
        return $this->hasOne('App\SpnCountry','id','country_id');
    }
    public function state(){
        return $this->hasOne('App\SpnState','id','state_id');
    }
    public function city(){
        return $this->hasOne('App\SpnCity','id','city_id');
    }
   
}
