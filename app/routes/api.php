<?php

use App\Http\Controllers\Api\AccountController;
use App\Http\Controllers\Api\ChatApiController;
use App\Http\Controllers\Api\ForgotPasswordController;
use App\Http\Controllers\Api\ManufacturApiController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\OrderApiController;
use App\Http\Controllers\Api\ProductApiController;
use App\Http\Controllers\Api\ResetPasswordAccountController;
use App\Http\Controllers\Api\ReviewApiController;
use App\Http\Controllers\Api\SearchApiController;
use App\Http\Controllers\Api\UserApiController;
use App\Http\Controllers\Api\CategoryApiController;
use App\Http\Controllers\Api\VerifyEmailController;
use App\Jobs\SendOrderEmail;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\ResetPasswordController;

Route::middleware('auth:api')->get('/auth', function (Request $request) {
    return $request->user();
});

Route::post('/password/email', [ForgotPasswordController::class, 'sendResetLinkEmail']);
Route::post('/password/reset', [ResetPasswordController::class, 'reset']);
Route::post('/password/account', [ResetPasswordAccountController::class, 'reset']);

Route::patch('/account/update', [AccountController::class, 'update']);
Route::post('/account/delete', [AccountController::class, 'delete']);



Route::post('/email/verify/{user}', [VerifyEmailController::class, 'verify'])->name('verification.verify');
Route::post('/email/resend', [VerifyEmailController::class, 'resend']);

Route::post('/oauth/{driver}', [AuthController::class, 'redirectSocialAuth'])->middleware('api-session');
Route::get('/oauth/{driver}/callback', [AuthController::class, 'callbackSocialAuth'])->middleware('api-session');

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:api')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
});

Route::apiResources([
    'products' => ProductApiController::class,
    'category' => CategoryApiController::class,
    'manufactur' => ManufacturApiController::class,
    'user' => UserApiController::class,
    'order' => OrderApiController::class,
    'review' => ReviewApiController::class,
]);

Route::post('/search', [SearchApiController::class, 'show']);

Route::post('/filter', [SearchApiController::class, 'filter']);

Route::post('/catalog', [SearchApiController::class, 'catalog']);

//Route::get('/password/confirm', [ConfirmPasswordController::class, 'showConfirmForm'])->name('password.confirm');
//Route::post('/password/confirm', [ConfirmPasswordController::class, 'confirm']);
//Route::post('/password/email', [ForgotPasswordController::class, 'sendResetLinkEmail'])->name('password.email');
//Route::get('/password/reset', [ForgotPasswordController::class, 'showLinkRequestForm'])->name('password.request');
//Route::post('/password/reset', [ResetPasswordController::class, 'reset'])->name('password.update');
//Route::get('/password/reset/{token}', [ResetPasswordController::class, 'showResetForm'])->name('password.reset');

Route::group([
    'prefix' => 'chat',
    'controller' => ChatApiController::class,
    'middleware' => 'auth:api'
], function () {
    Route::get('/', 'index');
    Route::get('/messages', 'messages');
    Route::post('/send', 'send');
    Route::post('/update', 'update');
    Route::post('/delete', 'delete');
});

Route::post('/mail/order', function (Request $request) {
    dispatch(new SendOrderEmail($request->all()));
})->middleware('verified');
