<?php

namespace Tests\Feature;

use PHPUnit\Framework\TestCase;

use Illuminate\Foundation\Testing\WithoutMiddleware;

use Illuminate\Foundation\Testing\DatabaseMigrations;

use Illuminate\Foundation\Testing\DatabaseTransactions;

class ExampleTest extends TestCase

{

   /**

    * A basic test example.

    *

    * @return void

    */

   public function testBasicTest()
//    public function test_basic_test()

   { 
       $response = $this->get("/");
       $response->assertStatus(200);

   }

}