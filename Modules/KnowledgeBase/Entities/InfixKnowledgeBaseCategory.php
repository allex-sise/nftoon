<?php

namespace Modules\KnowledgeBase\Entities;

use Illuminate\Database\Eloquent\Model;

class InfixKnowledgeBaseCategory extends Model
{
    protected $table = 'infix_knowledge_base_category';
    protected $primaryKey = 'id';
    protected $fillable = [];

    public function firstQuestion()
        {
            // return $this->hasMany('Modules\KnowledgeBase\Entities\InfixKnBaseCategoryQuestion');
            return $this->hasMany('Modules\KnowledgeBase\Entities\InfixKnBaseCategoryQuestion','category_id','id');
        }
}
