<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use App\Profile;
class CreateProfilesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('profiles', function(Blueprint $table)
		{
			$table->increments('id', true);
			$table->integer('user_id')->unsigned()->index();
            $table->foreign('user_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');
			$table->string('image', 191)->nullable();
			$table->string('logo_pic', 191)->nullable();
			$table->string('mobile',20)->nullable();
			$table->string('username',80)->nullable();
			$table->string('first_name',80)->nullable();
			$table->string('last_name',80)->nullable();
			$table->string('father_name',80)->nullable();
			$table->string('mother_name',80)->nullable();
			$table->string('company_name')->nullable();
			$table->longText('about')->nullable();
			$table->integer('country_id')->nullable();
			$table->string('state_id')->nullable();
			$table->string('city_id')->nullable();
			$table->string('zipcode')->nullable();
			$table->longText('address')->nullable();
			$table->string('email',80)->nullable();
			$table->date('dob')->nullable();
			$table->date('date_of_joining')->nullable();
			$table->string('marital_status',80)->nullable();
			$table->boolean('status')->default(1);
			$table->timestamps();
		});

		$profile=new Profile();
		$profile->user_id = 1;
		$profile->country_id = 19;
		$profile->state_id = 290;
		$profile->city_id = 1374;
		$profile->save();
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('profiles');
	}

}
