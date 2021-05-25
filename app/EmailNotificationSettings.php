<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EmailNotificationSettings extends Model
{
        public function user()
        {
            return $this->belongsTo('App\User', 'user_id')->where(['status'=>1,'access_status'=>1]);
        }
}
