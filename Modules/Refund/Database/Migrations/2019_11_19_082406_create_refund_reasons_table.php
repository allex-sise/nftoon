<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRefundReasonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('refund_reasons', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->boolean('status')->default(1);
            $table->timestamps();
        });

       
		DB::table('refund_reasons')->insert([
            [
                'name' => 'It was a mistake purchase',    //      1
            ],
            [
                'name' => 'There was a problem with my payment',    //      1
            ],
            [
                'name' => 'I`m having a problem with item support',    //      2
            ],
            [
                'name' => 'The item has been removed from my downloads',    //      2
            ],
            [
                'name' => 'The item is broken , malfunctioning or not as described',    //      3
            ]

        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('refund_reasons');
    }
}
