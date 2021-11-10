<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWithdrawsTable2 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('withdraws', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned()->index('withdraws_001');
            $table->foreign('user_id','withdraws_001')->references('id')->on('users')->onUpdate('RESTRICT')->onDelete('RESTRICT');
            $table->integer('paid_vendors_id')->nullable();

            $table->integer('payment_method_id')->unsigned()->index('withdraws_00900');
            $table->foreign('payment_method_id','withdraws_00900')->references('id')->on('payment_methods')->onUpdate('RESTRICT')->onDelete('RESTRICT');
            $table->float('amount', 10, 2);
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
        Schema::dropIfExists('withdraws');
    }
}
