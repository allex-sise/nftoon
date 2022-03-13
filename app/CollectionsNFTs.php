<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CollectionsNFTs extends Model
{
    public $table = 'collectionsnft';

    public function Item(){
    	return $this->belongsTo('App\Item', 'nft_id', 'id');
    }

    public function Collection(){
    	return $this->belongsTo('App\Collections', 'collection_id', 'id');
    }

    public function creator(){
        return $this->hasOne('App\User','id','creator_id');
    }

}
