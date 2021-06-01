<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DropNFTs extends Model
{
    public $table = 'dropnfts';

    public function Item(){
    	return $this->belongsTo('App\Item', 'nft_id', 'id');
    }

    public function Drop(){
    	return $this->belongsTo('App\Drops', 'drop_id', 'id');
    }

}
