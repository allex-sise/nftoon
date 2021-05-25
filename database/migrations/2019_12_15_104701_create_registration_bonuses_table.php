<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRegistrationBonusesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('registration_bonuses', function (Blueprint $table) {
            $table->increments('id');
            $table->float('bonus',10,2);
            $table->boolean('status')->default(1);
            $table->integer('type')->nullable();
            $table->timestamps();

        });

        DB::table('registration_bonuses')->insert([
            // [
            //     'bonus' => 10,    //      1
            //     'type' => 1,    //      1
            // ],
            [
                'bonus' => 20,    //      1
                'type' => 2,    //      1
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
        Schema::dropIfExists('registration_bonuses');
    }
}