<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DailyProductController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProductCotroller;
use App\Http\Controllers\RawMaterialController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});


Route::group(['middleware' => 'api', 'prefix' => 'auth'], function ($router) {

    Route::post('login', [AuthController::Class, 'login']);
    Route::post('logout', [AuthController::Class, 'logout']);
    Route::post('refresh', [AuthController::Class, 'refresh']);
    Route::post('me', [AuthController::Class, 'me']);

});



Route::group(['middleware' => 'api'], function ($router) {

    //Dashboard data
    Route::get('getDashboardData', [DashboardController::class, 'index']);

    //Raw materials
    Route::get('rawMaterials', [RawMaterialController::class, 'index']);
    Route::post('rawMaterials/save', [RawMaterialController::class, 'save']);
    Route::post('rawMaterials/update/{id}', [RawMaterialController::class, 'update']);
    Route::post('rawMaterials/delete/{id}', [RawMaterialController::class, 'delete']);

  //Products
    Route::get('products', [ProductCotroller::class, 'index']);
    Route::post('products/save', [ProductCotroller::class, 'save']);
    Route::post('products/update/{id}', [ProductCotroller::class, 'update']);
    Route::post('products/delete/{id}', [ProductCotroller::class, 'delete']);
    Route::get('products/view/{id}', [ProductCotroller::class, 'view']);
    Route::get('getRawMaterials', [ProductCotroller::class, 'getRawMaterials']);

    //Daily product
    Route::get('getRawMaterials', [DailyProductController::class, 'getRawMaterials']);
    Route::get('getUnits', [DailyProductController::class, 'getUnits']);
    Route::get('getReadyProducts', [DailyProductController::class, 'getReadyProducts']);
    Route::post('getProductMaterials', [DailyProductController::class, 'getProductMaterials']);

});
