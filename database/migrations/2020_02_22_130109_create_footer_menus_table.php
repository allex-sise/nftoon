<?php

use App\FooterMenu;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFooterMenusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('footer_menus', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('menu_title');
            $table->string('menu_url');
            $table->tinyInteger('position_no')->nullable(); 
            $table->tinyInteger('active_status')->default(1); 
            $table->integer('created_by')->nullable()->default(1)->unsigned();  
            $table->integer('updated_by')->nullable()->default(1)->unsigned();  
            $table->timestamps();
        });
        $footer_menu= new FooterMenu();
        $footer_menu->menu_title="About Company";
        $footer_menu->menu_url=route('about_company');
        $footer_menu->position_no="1";
        $footer_menu->save();

        $footer_menu= new FooterMenu();
        $footer_menu->menu_title="Terms & Conditions";
        $footer_menu->menu_url=route('termsConditions');
        $footer_menu->position_no="2";
        $footer_menu->save();

        $footer_menu= new FooterMenu();
        $footer_menu->menu_title="Privacy Policy";
        $footer_menu->menu_url=route('privacyPolicy');
        $footer_menu->position_no="3";
        $footer_menu->save();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('footer_menus');
    }
}
