<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    public function packageType(){
        return $this->belongsTo('App\PackageType','package_type', 'id');
    }
}
