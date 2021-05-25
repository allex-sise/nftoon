<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BuyPackage extends Model
{
    public function packageType(){
        return $this->belongsTo('App\PackageType','package_plan', 'id');
    }
}
