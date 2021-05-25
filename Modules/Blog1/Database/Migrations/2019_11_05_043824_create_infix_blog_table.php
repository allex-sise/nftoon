<?php

use Faker\Factory as Faker;
use Modules\Blog\Entities\InfixBlog;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInfixBlogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('infix_blog', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id');
            $table->integer('blog_category_id');
            $table->string('title');
            $table->text('description');
            $table->string('tags');
            $table->string('photo');
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });

        // $faker = Faker::create();
        // for ($i = 1; $i <= 10; $i++) {
        //     $store = new InfixBlog();
        //     $store->user_id = 1;
        //     $store->blog_category_id = $faker->numberBetween($min = 1, $max = 10);
        //     $store->title = $faker->sentence($nbWords = 6, $variableNbWords = true);
        //     $store->description = $faker->paragraphs($nb = 3, $asText = false);
        //     $store->tags = $faker->word;
        //     $store->photo = $faker->imageUrl($width = 640, $height = 480);
        //     $store->save();
        // }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('infix_blog');
    }
}
