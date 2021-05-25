<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemCategoriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('item_categories', function(Blueprint $table)
		{
			$table->increments('id', true);
			$table->string('title',255)->nullable();
			$table->string('slug',255)->nullable();
            $table->string('description',255)->nullable();
            $table->boolean('up_permission')->nullable();
            $table->boolean('file_permission')->nullable();
            $table->integer('position')->nullable();
            $table->string('recommended_price')->nullable();
			$table->string('recommended_price_extended')->nullable();
			$table->string('recommended_price_commercial')->nullable();
			$table->integer('show_menu')->nullable();
            $table->boolean('active_status')->default(1);
			$table->timestamps();
		});

		DB::table('item_categories')->insert([
            [
                'title' => 'Wordpress',    //      1
                'slug' => 'wordpress',    //      1
				'description' => 'this is Wordpress',
				'file_permission' => 1,
				'up_permission' => 1,
				'position' => 1,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
			],
            [
                'title' => 'Hosting',    //      1
                'slug' => 'hosting',    //      1
				'description' => 'this is HTML',
				'file_permission' => 1,
				'up_permission' => 2,
				'position' => 9,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
				
			],
            [
                'title' => 'HTML',    //      1
                'slug' => 'html',    //      1
				'description' => 'this is HTML',
				'file_permission' => 1,
				'up_permission' => 1,
				'position' => 3,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
			],
           
            [
                'title' => 'Marketing',    //      1
                'slug' => 'marketing',    //      1
				'description' => 'this is Marketing',
				'file_permission' => 1,
				'up_permission' => 1,
				'position' => 4,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
			],
			[
                'title' => 'CMS',    //      1
                'slug' => 'cms',    //      1
				'description' => 'this is CMS',
				'file_permission' => 1,
				'up_permission' => 1,
				'position' => 5,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
			],
			[
                'title' => 'eCommerce',    //      1
                'slug' => 'ecommerce',    //      1
				'description' => 'this is eCommerce',
				'file_permission' => 1,
				'up_permission' => 1,
				'position' => 6,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
			],
			[
                'title' => 'Muse',    //      1
                'slug' => 'muse',    //      1
				'description' => 'this is Muse',
				'file_permission' => 2,
				'up_permission' => 1,
				'position' => 7,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
			],
			[
                'title' => 'UI Design',    //      1
                'slug' => 'ui_design',    //      1
				'description' => 'this is UI Design',
				'file_permission' => 2,
				'up_permission' => 2,
				'position' => 8,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
			],
			[
                'title' => 'Plugins',    //      1
                'slug' => 'plugins',    //      1
				'description' => 'this is Plugins',
				'file_permission' => 1,
				'up_permission' => 2,
				'position' => 2,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
			],
			[
                'title' => 'Logo Maker',    //      1
                'slug' => 'logo_maker',    //      1
				'description' => 'this is Logo Maker',
				'file_permission' => 1,
				'up_permission' => 2,
				'position' => 10,
				'recommended_price' => '45-67',
				'recommended_price_extended' => '150-170',
				'recommended_price_commercial' => '75-90',
				'show_menu' => 1,
			],
		]);

		$categories=DB::table('item_categories')->get();

        foreach ($categories as $key => $category) {
            DB::table('sub_attributes')->insert([
                [
                    'name' => 'IE6',    //      1
                    'attributes_id'=> 1,
                    'category_id'=> $category->id,
                ],
                [
                    'name' => 'IE7',    //      1
                    'attributes_id'=> 1,
                    'category_id'=> $category->id,
                ],
                [
                    'name' => 'bbPress 2.4 x',    //      1
                    'attributes_id'=> 2,
                    'category_id'=> $category->id,
                ],
                [
                    'name' => 'bbPress 2.5 x',    //      1
                    'attributes_id'=> 2,
                    'category_id'=> $category->id,
                ],
                [
                    'name' => 'Layers WP',    //      1
                    'attributes_id'=> 3,
                    'category_id'=> $category->id,
                ],
                [
                    'name' => 'Genesis',    //      1
                    'attributes_id'=> 3,
                    'category_id'=> $category->id,
                ],
                [
                    'name' => 'WordPress5.5.x',    //      1
                    'attributes_id'=> 4,
                    'category_id'=> $category->id,
                ],
                [
                    'name' => 'WordPress5.4.x',    //      1
                    'attributes_id'=> 4,
                    'category_id'=> $category->id,
                ],
            ]);
        }
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('item_categories');
	}

}