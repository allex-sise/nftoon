<?php

namespace Modules\Tax\Entities;

use Illuminate\Database\Eloquent\Model;

class Tax extends Model
{
    protected $fillable = [];
    public function country(){
        return $this->hasOne('App\SpnCountry','id','country_id');
    }
}
