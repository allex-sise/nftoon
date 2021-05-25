<?php

use App\ThirdPartyApi;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateThirdPartyApisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('third_party_apis', function (Blueprint $table) {
            $table->id();
            $table->string('ga_view_id')->nullable();
            $table->string('ga_site_tag_id')->nullable();
            $table->longText('ga_service_account')->nullable();
            $table->longText('fixer_access_key')->nullable();
            $table->timestamps();
        });

        $third_party_api=new ThirdPartyApi();
        $third_party_api->ga_view_id='214610223';
        $third_party_api->ga_site_tag_id='UA-162089702-1';
        $third_party_api->ga_service_account='app/analytics/service-account-credentials.json';
        $third_party_api->save();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('third_party_apis');
    }
}
