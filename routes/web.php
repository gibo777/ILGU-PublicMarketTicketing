<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');

});
Route::get('/user/{id}', function ($id) {
    $user = DB::table('users')->where('id', $id)->first();
    return response()->json([
        'name' => $user->name,
        'email' => $user->email
    ]);
});

Route::get('/users', function () {
    return response()->json(DB::table('users')->get());
});
