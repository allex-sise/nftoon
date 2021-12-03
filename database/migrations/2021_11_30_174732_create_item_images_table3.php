<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItemImagesTable3 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('item_images', function (Blueprint $table) {
            $table->increments('id', true);
			$table->integer('item_id')->unsigned()->index('item_images_fk0');
			$table->foreign('item_id', 'item_images_fk0')->references('id')->on('items')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->text('type',100)->nullable();
			$table->longText('image');
			$table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('item_images');
    }
}