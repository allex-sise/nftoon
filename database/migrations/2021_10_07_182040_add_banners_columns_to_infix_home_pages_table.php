<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddBannersColumnsToInfixHomePagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('infix_home_pages', function (Blueprint $table) {
            $table->string('banner_image_drops')->after('banner_image')->nullable();
            $table->string('banner_image_categories')->after('banner_image')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('infix_home_pages', function (Blueprint $table) {
            //
        });
    }
}
