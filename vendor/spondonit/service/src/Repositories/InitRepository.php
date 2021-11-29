<?php

namespace SpondonIt\Service\Repositories;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Storage;

class InitRepository {

    public function init() {
	
    }


    public function checkDatabase(){

        return true;
    }

    public function check() {

	
    }

     public function product() {
       
        return compact('about', 'product', 'update_tips', 'support_tips', 'is_downloaded');
    }

}
