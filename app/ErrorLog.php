<?php

namespace App;

use App\ErrorLog;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;

class ErrorLog extends Model
{
    public static function saveError($process,$msg){

        $error=new App\ErrorLog();
        $error->process_name=$process;
        $error->error_message=$msg;
        $error->user_id=Auth::user()->id;
        $error->save();
    }
}
