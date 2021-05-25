<?php

namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Carbon;
use App\Customer;
use App\Profile;
use App\Balance;
class CustomerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        for($i=5; $i<=10; $i++){
            $p = rand()%100 * rand()%100;
            $user= new User();
            $user->role_id=5;
            $user->email=$faker->email;
            $user->password  = Hash::make(12345678);
            $user->full_name =$faker->name;
            $user->status=1;
            $user->access_status=1;
            $user->username =$faker->firstName.$i;
            $user->email_verified_at = Carbon::now();
            $user->save();
            $profile=new Profile();
            $profile->user_id = $user->id;
            $profile->country_id = 19;
            $profile->state_id = 290;
            $profile->city_id = 1374;
            $profile->save();
            $vendor=new Customer();
            $vendor->user_id = $user->id;
            $vendor->save();
            $balance=new Balance();
            $balance->user_id = $user->id;
            $balance->type    = 1;
            $balance->amount  =25;
            $balance->save();

        }
    }
}
