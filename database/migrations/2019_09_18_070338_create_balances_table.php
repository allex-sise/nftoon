<?php

use App\Balance;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBalancesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('balances', function(Blueprint $table)
		{
			$table->increments('id', true);
			$table->integer('user_id')->unsigned()->index('balances_fk0');
			$table->boolean('type');
			$table->float('amount', 10, 2);
			$table->timestamps();
		});

		$balance=new Balance();
		$balance->user_id = 1;
		$balance->type    = 1;
		$balance->amount  =25;
		$balance->save();
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('balances');
	}

}
