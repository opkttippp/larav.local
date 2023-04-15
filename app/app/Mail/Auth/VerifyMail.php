<?php

namespace App\Mail\Auth;

use App\Models\User;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class VerifyMail extends Mailable
{
    use SerializesModels;

    public User $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }

    public function build(): VerifyMail
    {
        return $this
            ->subject('Signup Confirmation')
            ->markdown('emails.auth.verify');
    }
}
