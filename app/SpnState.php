<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SpnState extends Model
{
    public function country(){
        return $this->belongsTo('App\SpnCountry', 'country_id');
    }
}
