<?php

namespace Modules\Ticket\Entities;

use Illuminate\Database\Eloquent\Model;

class InfixTicketComment extends Model
{
    protected $fillable =[
        'user_id','client_id','ticket_id','comment','file'
    ];

    public function user(){
    	return $this->belongsTo('App\User', 'user_id', 'id');
    }
}
