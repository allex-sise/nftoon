<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    function user(){
        return $this->belongsTo('App\User');
    }

    public function replies()
    {
        return $this->hasMany(Comment::class, 'parent_id');
    }
}
