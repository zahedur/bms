<?php

namespace Database\Seeders;

use App\Models\Unit;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        $user = new User();
        $user->name = 'Zahedur Rahman';
        $user->email = 'zahedurr47@gmail.com';
        $user->email_verified_at = now();
        $user->password = Hash::make('123456789');
        $user->remember_token = Str::random(10);
        $user->role = 'Admin';
        $user->save();


        // Create unit
        Unit::truncate();
        $units =  [
            [
                'name' => 'Kilogram',
                'symbol' => 'KG',
            ],
            [
                'name' => 'Litre',
                'symbol' => 'L',
            ],
            [
                'name' => 'Milliliter',
                'symbol' => 'mL',
            ],
            [
                'name' => 'Milligram',
                'symbol' => 'mg',
            ]
        ];
        Unit::create($units);
    }
}
