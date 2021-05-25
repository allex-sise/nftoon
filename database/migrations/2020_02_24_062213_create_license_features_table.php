<?php

use App\LicenseFeature;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLicenseFeaturesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('license_features', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('feature_title');
            $table->tinyInteger('regular')->default(1); 
            $table->tinyInteger('extended')->default(1); 
            $table->tinyInteger('active_status')->default(1); 
            $table->integer('created_by')->nullable()->default(1)->unsigned();  
            $table->integer('updated_by')->nullable()->default(1)->unsigned(); 
            $table->timestamps();
        });

        $feature= new LicenseFeature();
        $feature->feature_title="Number of end products";
        $feature->regular=1;
        $feature->extended=1;
        $feature->save();


        $feature= new LicenseFeature();
        $feature->feature_title="Use in a single end product";
        $feature->regular=1;
        $feature->extended=0;
        $feature->save();
        $feature= new LicenseFeature();
        $feature->feature_title="Use in a free end product";
        $feature->regular=1;
        $feature->extended=1;
        $feature->save();
        $feature= new LicenseFeature();
        $feature->feature_title="Use in an end product that's sold";
        $feature->regular=1;
        $feature->extended=1;
        $feature->save();
        $feature= new LicenseFeature();
        $feature->feature_title="On-demand products/services";
        $feature->regular=1;
        $feature->extended=1;
        $feature->save();
        $feature= new LicenseFeature();
        $feature->feature_title="Use in stock items/templates";
        $feature->regular=1;
        $feature->extended=1;
        $feature->save();

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('license_features');
    }
}
