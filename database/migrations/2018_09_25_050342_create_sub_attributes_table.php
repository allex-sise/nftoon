<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;


class CreateSubAttributesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sub_attributes', function (Blueprint $table) {
            $table->increments('id');
            
            $table->integer('attributes_id')->unsigned()->index();
            $table->integer('category_id')->unsigned()->index();
            // $table->foreign('category_id')->references('id')->on('item_categories')->onUpdate('RESTRICT')->onDelete('RESTRICT');
            $table->string('name');
            $table->boolean('status')->default(1);
            $table->timestamps();
        });

        // $categorys=DB::table('item_categories')->get();
        // $attributes=DB::table('attributes')->get();

        // foreach ($categories as $key => $category) {
        //     DB::table('sub_attributes')->insert([
        //         [
        //             'name' => 'IE6',    //      1
        //             'attributes_id'=> 1,
        //             'category_id'=> $category->id,
        //         ],
        //         [
        //             'name' => 'IE7',    //      1
        //             'attributes_id'=> 1,
        //             'category_id'=> $category->id,
        //         ],
        //         [
        //             'name' => 'bbPress 2.4 x',    //      1
        //             'attributes_id'=> 2,
        //             'category_id'=> $category->id,
        //         ],
        //         [
        //             'name' => 'bbPress 2.5 x',    //      1
        //             'attributes_id'=> 2,
        //             'category_id'=> $category->id,
        //         ],
        //         [
        //             'name' => 'Layers WP',    //      1
        //             'attributes_id'=> 3,
        //             'category_id'=> $category->id,
        //         ],
        //         [
        //             'name' => 'Genesis',    //      1
        //             'attributes_id'=> 3,
        //             'category_id'=> $category->id,
        //         ],
        //         [
        //             'name' => 'WordPress5.5.x',    //      1
        //             'attributes_id'=> 4,
        //             'category_id'=> $category->id,
        //         ],
        //         [
        //             'name' => 'WordPress5.4.x',    //      1
        //             'attributes_id'=> 4,
        //             'category_id'=> $category->id,
        //         ],
        //     ]);
        // }


        // DB::table('sub_attributes')->insert([
        //     [
        //         'name' => 'IE6',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'IE7',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'IE8',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'IE9',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'IE9',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Firefox',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Safari',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Opera',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Chrome',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Edge',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'bbPress 2.5 x',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'bbPress 2.4 x',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Aesop Story Engine',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Bootstrap 4.x',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Bootstrap 3.x',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Beaver Builder 2.0 x',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'BuddyPress 4.1 x',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'BuddyPress 3.0 x',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Easy Digital Downloads',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Elementor',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Elementor Pro',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'WooCommerce 4.6.x',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'WooCommerce 4.7.x',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Layers WP',    //      2
        //         'attributes_id'=> 3,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'Genesis',    //      2
        //         'attributes_id'=> 3,
        //         'category_id'=> 1,
        //     ],
        //      [
        //         'name' => 'WordPress5.5.x',    //      2
        //         'attributes_id'=> 4,
        //         'category_id'=> 1,
        //     ],
        //     [
        //         'name' => 'WordPress5.4.x',    //      2
        //         'attributes_id'=> 4,
        //         'category_id'=>1,
        //     ],
        //     [
        //         'name' => 'WordPress5.3.x',    //      2
        //         'attributes_id'=> 4,
        //         'category_id'=>1,
        //     ],
        //     [
        //         'name' => 'WordPress5.2.x',    //      2
        //         'attributes_id'=> 4,
        //         'category_id'=>1,
        //     ],

        //     [
        //         'name' => 'Facebook',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 2,
        //     ],
        //     [
        //         'name' => 'Aesop Story Engine',    //      1
        //         'attributes_id'=> 2,
        //         'category_id'=> 2,
        //     ],
        //     [
        //         'name' => 'Layers',    //      2
        //         'attributes_id'=> 3,
        //         'category_id'=> 3,
        //     ],
        //     [
        //         'name' => 'Genesis',    //      2
        //         'attributes_id'=> 3,
        //         'category_id'=> 3,
        //     ],
        //     [
        //         'name' => 'WordPress5.5.x',    //      2
        //         'attributes_id'=> 4,
        //         'category_id'=> 4,
        //     ],
        //     [
        //         'name' => 'WordPress5.4.x',    //      2
        //         'attributes_id'=> 4,
        //         'category_id'=> 4,
        //     ],
        //      [
        //         'name' => 'IE6',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 5,
        //     ],
        //      [
        //         'name' => 'IE6',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 6,
        //     ],
        //      [
        //         'name' => 'IE6',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 7,
        //     ],
        //      [
        //         'name' => 'IE6',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 8,
        //     ],
        //      [
        //         'name' => 'IE6',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 9,
        //     ],
        //      [
        //         'name' => 'IE6',    //      1
        //         'attributes_id'=> 1,
        //         'category_id'=> 10,
        //         'category_id'=>4,
        //     ],
        //     [
        //         'name' => 'WordPress5.3.x',    //      2
        //         'attributes_id'=> 4,
        //         'category_id'=>4,
        //     ],

        // ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sub_attributes');
    }
}