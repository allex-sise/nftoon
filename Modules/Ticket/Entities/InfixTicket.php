<?php

namespace Modules\Ticket\Entities;

use Illuminate\Database\Eloquent\Model;

class InfixTicket extends Model
{
    protected $fillable = [
        'user_id',
        'subject',
    'description',
    'category_id',
    'priority_id'
    ];

    public function ticket_category(){
        return $this->belongsTo('Modules\Ticket\Entities\InfixTicketCategory','category_id');
    }
    public function ticket_priority(){
        return $this->belongsTo('Modules\Ticket\Entities\InfixTicketPriority','priority_id');
    }
    public function ticket_comment(){
        return $this->belongsTo('Modules\Ticket\Entities\InfixTicketComment','comment_id');
    }
    public function ticket_department(){
        return $this->belongsTo('Modules\HumanResource\Entities\InfixDepartment','department_id');
    }
    public function user(){
    	return $this->belongsTo('App\User', 'user_id', 'id');
    }
    public function assignee(){
    	return $this->belongsTo('App\User', 'user_agent');
    }
    public function notification(){
        return $this->hasMany('App\SmNotification','ticket_id');
    }
}
