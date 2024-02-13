<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules;

class ResetPasswordAccountController extends Controller
{
    public function reset(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!Hash::check($request->password_old, $user->password)) {
            return response()->json(['error' => 'Password encorrect!']);
        }
        $request->validate($this->rules(), $this->validationErrorMessages());

        $response = $this->resetPassword($user, $request->password);


        return $response
            ? $this->sendResetResponse($request, 'Your password has been successfully changed!')
            : $this->sendResetFailedResponse($request, 'The password has not been changed');
    }

    protected function sendResetResponse(Request $request, string $response)
    {
        return response()->json(['status' => $response]);
    }

    protected function sendResetFailedResponse(Request $request, string $response)
    {
        return response()->json(['error' => $response]);
    }

    protected function rules()
    {
        return [
            'email' => 'required|email',
            'password' => ['required', 'confirmed'],
        ];
    }

    protected function validationErrorMessages()
    {
        return [];
    }

    protected function credentials(Request $request)
    {
        return $request->only(
            'email',
            'password',
            'password_confirmation',
        );
    }

    protected function resetPassword($user, $password)
    {
        if ($user->password = Hash::make($password)) {
            $user->setRememberToken(Str::random(60));

            $user->save();

            event(new PasswordReset($user));

            return true;
        }
        return false;
    }

}
