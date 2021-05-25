<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public function itemOrder() {
        return $this->hasMany('App\ItemOrder');
     }
}
