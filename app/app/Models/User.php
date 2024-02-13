<?php

namespace App\Models;

use App\Jobs\SendRegistrationMail;
use App\Jobs\SendResetPasswordEmail;
use Collective\Html\Eloquent\FormAccessible;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Spatie\Permission\Traits\HasPermissions;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable;
    use FormAccessible;
    use HasApiTokens;
    use HasFactory;
    use HasRoles;
    use HasPermissions;



    //--------------------------------email-----------------------------------
    public const STATUS_ACTIVE = 1;
    public const STATUS_DELETED = 0;
    public const STATUS_INACTIVE = 2;
    //------------------------------------------------------------------------

//    protected string $guard_name = 'web';

    protected $fillable
        = [
            'name',
            'lastname',
            'secondname',
            'email',
            'address',
            'phone',
            'birthday',
            'password',
            'verify_token',
            'status',
            'provider',
            'provider_id',
            'avatar',
            'access_token',
        ];

    protected $hidden
        = [
            'password',
            'remember_token',
        ];

    protected $casts
        = [
            'email_verified_at' => 'datetime',
        ];

    public function order()
    {
        return $this->hasMany(Order::class);
    }

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    public function messages()
    {
        return $this->hasMany(Message::class);
    }

    //--------------------verify Mail in queue (overwrite method)---------------

    public function sendEmailVerificationNotification()
    {
        SendRegistrationMail::dispatch($this);
    }

    public function markEmailAsVerified(): bool
    {
        return $this->forceFill([
            'email_verified_at' => $this->freshTimestamp(),
            'status' => self::STATUS_ACTIVE,
        ])->save();
    }

    //--------------------reset Pass (overwrite method)-------------------------

    public function sendPasswordResetNotification($token)
    {
        SendResetPasswordEmail::dispatch($this, $token);
    }
}
