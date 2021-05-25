<?php

use App\ItemFee;
use App\ItemCategory;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemFeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('item_fees', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('category_id')->nullable()->unsigned()->index('item_fees_007');
            $table->foreign('category_id','item_fees_007')->references('id')->on('item_categories')->onUpdate('RESTRICT')->onDelete('RESTRICT');
            $table->float('re_fee',10,2);
            $table->float('ex_fee',10,2);
            $table->float('co_fee',10,2);
            $table->float('support_fee',10,2);
            $table->boolean('status')->default(1);
            $table->timestamps();
        });
        
        $data = ItemCategory::get();
        $faker = Faker::create();
        foreach ($data as $key => $value) {
            $item_fee = new ItemFee();
            $item_fee->category_id = $value->id;
            $item_fee->re_fee = $faker->numberBetween($min = 1, $max = 15);
            $item_fee->ex_fee = $faker->numberBetween($min = 30, $max = 80);
            $item_fee->co_fee = $faker->numberBetween($min = 20, $max = 30);
            $item_fee->support_fee = $faker->numberBetween($min = 1, $max = 10);
            $item_fee->save();
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('item_fees');
    }
}