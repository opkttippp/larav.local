<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Laravel\Socialite\Facades\Socialite;
use Spatie\Permission\Models\Role;

class AuthController extends Controller
{
    use RegistersUsers;

    public function register(Request $request)
    {
        $requestData = $request->all();
        $validator = Validator::make($requestData, [
            'name' => 'required|max:55',
            'email' => 'email|required|unique:users',
            'password' => 'required|confirmed'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 422);
        }

        $user = User::create([
            'name' => $requestData['name'],
            'email' => $requestData['email'],
            'avatar' => 'public/avatar/guest.jpg',
            'status' => User::STATUS_INACTIVE,
            'password' => Hash::make($requestData['password']),
        ]);

        $user->assignRole(Role::findByName('user'));

        event(new Registered($user));

        $this->guard()->login($user);
//        auth()->guard('api')->user();

        $accessToken = Auth::user()->createToken('authToken')->accessToken;
        return response(
            ['user' => Auth::user(), 'access_token' => $accessToken],
            200
        );
    }

    public function login(Request $request)
    {
        $request->validate([
            'login' => 'required|max:45|string',
            'password' => 'required|max:45|string'
        ]);

        $credentials = [
            $this->checkLoginInput() => $request->login,
            'password' => $request->password,
        ];

        if (Auth::attempt($credentials)) {
            return response()->json(
                [
                    'user' => Auth::user(),
                    'access_token' => Auth::user()->createToken(
                        'authToken'
                    )->accessToken,
                ],
                200
            );
        } else {
            return response()->json([
                'errors' => 'Unauthorised',
                'message' => 'These credentials don\'t match our records.',
            ], 401);
        }
    }

    public function me(Request $request)
    {
        $user = $request->user();

        return response()->json(['user' => $user], 200);
    }

    protected function checkLoginInput()
    {
        $inputData = request()->get('login');

        return filter_var($inputData, FILTER_VALIDATE_EMAIL) ? 'email' : 'name';
    }

    public function logout(Request $request)
    {
        $token = $request->user()->token();
        $token->revoke();
        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, 200);
    }

    public function redirectSocialAuth($provider)
    {
        return response()->json([
            'url' => Socialite::driver($provider)->redirect()->getTargetUrl(),
        ]);
    }


    public function callbackSocialAuth($provider)
    {
        try {
            $user = Socialite::driver($provider)->user();
        } catch (Exception $e) {
            return redirect('/login');
//            return response()->json($e->getMessage());
        }

        $authUser = $this->findOrCreateUser($user, $provider);

        Auth::login($authUser);

        $accessToken = Auth::user()->createToken('authToken')->accessToken;

        return view('oauth/callback', [
            'user' => $authUser,
            'access_token' => $accessToken,
        ]);
    }

    private function findOrCreateUser($socialUser, $provider)
    {
        $user = User::firstOrNew(
            [
                'email' => $socialUser->email,
            ],
            [
                'name' => $socialUser->name,
                'email' => $socialUser->email ?? null,
                'avatar' => 'public/avatar/guest.jpg',
                'provider' => $provider,
                'provider_id' => $socialUser->id,
                'access_token' => $socialUser->token,
            ]
        );
        $user->save();
        return $user;
    }
//        $user = User::where('email', $socialUser->email)->orWhere('access_token', $socialUser->token)->first();
//
//        if ($user) {
//            return $user;
//        } else {
//            $user = User::create([
//                'name' => $socialUser->name,
//                'email' => $socialUser->email ?? '',
//                'avatar' => 'public/avatar/guest.jpg',
//                'provider' => $provider,
//                'provider_id' => $socialUser->id,
//                'access_token' => $socialUser->token,
//            ]);
//            if (($socialUser->email !== '') && $socialUser->email
//                && !$user->hasVerifiedEmail()
//            ) {
//                $user->markEmailAsVerified();
//                $user->status = 1;
//            }
//            $user->save();
//            return $user;
//        }
}
