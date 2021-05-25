<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SpnCountry extends Model
{
    public function tax(){
    	return $this->hasOne('Modules\Tax\Entities\Tax', 'country_id', 'id');
    }
}
