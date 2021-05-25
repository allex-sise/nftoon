<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Attribute extends Model
{
    public function subAttribute()
    {
        return $this->hasMany('App\SubAttribute', 'attributes_id');
    }
}
