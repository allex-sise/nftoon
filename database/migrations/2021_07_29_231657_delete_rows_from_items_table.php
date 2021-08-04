<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DeleteRowsFromItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('items', function (Blueprint $table) {
            $table->dropColumn('compatible_browsers');
            $table->dropColumn('compatible_with');
            $table->dropColumn('framework');
            $table->dropColumn('software_version');
            $table->dropColumn('columns');
            $table->dropColumn('layout');
            $table->dropColumn('resolution');
            $table->dropColumn('widget');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('items', function (Blueprint $table) {
            //
        });
    }
}
