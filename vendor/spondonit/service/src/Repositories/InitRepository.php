<?php

namespace SpondonIt\Service\Repositories;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Storage;

class InitRepository {

    public function init() {
		config(['app.verifier' => '']);
    }


    public function checkDatabase(){

        try {
	        DB::connection()->getPdo();

            if(!Schema::hasTable(config('spondonit.settings_table')) || !Schema::hasTable('users')){
			    return false;
            }

        } catch(\Exception $e){
            $error = $e->getCode();
            if($error == 2002){
                return abort(403, 'No connection could be made because the target machine actively refused it');
            } else if($error == 1045){
                $c = Storage::exists('.app_installed') ? Storage::get('.app_installed') : false;{
                    if($c){
                        return abort(403, 'Access denied for user. Please check your database username and password.');
                    }
                }
            }
        }

        return true;
    }

    public function check() {

	
    }

     public function product() {
       
        return compact('about', 'product', 'update_tips', 'support_tips', 'is_downloaded');
    }

}
