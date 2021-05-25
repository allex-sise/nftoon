<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemSubCategoriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('item_sub_categories', function(Blueprint $table)
		{
			$table->increments('id', true);
			$table->integer('item_category_id')->unsigned()->index('item_sub_categories_fk0');
			$table->string('title',255)->nullable();
			$table->string('slug',255)->nullable();
			$table->string('description',255)->nullable();
			$table->integer('show_menu')->nullable();
            $table->boolean('active_status')->default(1);
			$table->timestamps();
		});
		DB::table('item_sub_categories')->insert([
            [
                'title' => 'WordPress',    //      1
                'slug' => 'wordpress',    //      1
                'description' => 'this is WordPress',
				'item_category_id' => 1,
				'show_menu' => 1,
			],
            [
                'title' => 'Advertising',    //      1
                'slug' => 'advertising',    //      1
                'description' => 'this is Advertising',
				'item_category_id' => 1,
				'show_menu' => 1,
			],
            [
                'title' => 'SEO',    //      1
                'slug' => 'seo',    //      1
                'description' => 'this is SEO',
				'item_category_id' => 1,
				'show_menu' => 1,
			],
            [
                'title' => 'Media',    //      1
                'slug' => 'media',    //      1
                'description' => 'this is Media',
				'item_category_id' => 1,
				'show_menu' => 1,
			],
            [
                'title' => 'Utilities',    //      1
                'slug' => 'utilities',    //      1
                'description' => 'this is Utilities',
				'item_category_id' => 1,
				'show_menu' => 1,
			],
            [
                'title' => 'Creative',    //      1
                'slug' => 'creative',    //      1
				'description' => 'this is Creative',
				'item_category_id' => 3,
				'show_menu' => 1,
			],
            [
                'title' => 'Canvas',    //      1
                'slug' => 'canvas',    //      1
				'description' => 'this is Canvas',
				'item_category_id' => 3,
				'show_menu' => 1,
			],
            [
                'title' => 'Form',    //      1
                'slug' => 'form',    //      1
				'description' => 'this is Form',
				'item_category_id' => 3,
				'show_menu' => 1,
			],
			[
                'title' => 'Web Template',    //      1
                'slug' => 'web_template',    //      1
				'description' => 'this is Web Template',
				'item_category_id' => 3,
				'show_menu' => 1,
			],
			[
                'title' => 'Email Template',    //      1
                'slug' => 'email_template',    //      1
				'description' => 'this is Email Template',
				'item_category_id' => 3,
				'show_menu' => 1,
			],
           
            [
                'title' => 'Email Template',    //      1
                'slug' => 'email_template',    //      1
				'description' => 'this is Email Template',
				'item_category_id' => 4,
				'show_menu' => 1,
			],
			[
                'title' => 'Drupal',    //      1
                'slug' => 'drupal',    //      1
				'description' => 'this is Drupal',
				'item_category_id' => 5,
				'show_menu' => 1,
			],
			[
                'title' => 'Magneto',    //      1
                'slug' => 'magneto',    //      1
				'description' => 'this is Magneto',
				'item_category_id' => 6,
				'show_menu' => 1,
			],
			[
                'title' => 'Corporate',    //      1
                'slug' => 'corporate',    //      1
				'description' => 'this is Corporate',
				'item_category_id' => 7,
				'show_menu' => 1,
			],
			[
                'title' => 'PSD Template',    //      1
                'slug' => 'psd_template',    //      1
				'description' => 'this is UI Design',
				'item_category_id' => 8,
				'show_menu' => 1,
			],
			[
                'title' => 'Business Logo Maker',    //      1
                'slug' => 'business_logo_maker',    //      1
				'description' => 'this is Business Logo Maker',
				'item_category_id' => 10,
				'show_menu' => 1,
			],
		]);
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('item_sub_categories');
	}

}