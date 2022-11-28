<?php

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

Route::get('/user/login', 'App\Http\Controllers\Api\AuthController@login');
Route::get('/user/admin-login', 'App\Http\Controllers\Api\AuthController@adminLogin');
Route::post('/user/register', 'App\Http\Controllers\Api\AuthController@register');

Route::group(['middleware' => ['auth:sanctum']], function () {
    // Public user
    Route::post('/user-loan/apply', 'App\Http\Controllers\Api\UserLoanController@applyUserLoan');
    Route::get('/user-loan/my-loans', 'App\Http\Controllers\Api\UserLoanController@getUserLoanRequests');
    Route::post('/user-loan/repay-loans', 'App\Http\Controllers\Api\UserLoanController@repayLoanAmount');

    // Admin
    Route::get('/admin/pending-loans-requests', 'App\Http\Controllers\Api\AdminController@getAllPendingLoanRequests');
    Route::post('/admin/change-loan-status', 'App\Http\Controllers\Api\AdminController@changeLoanStatus');
});
