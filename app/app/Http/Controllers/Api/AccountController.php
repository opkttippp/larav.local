<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ProductFormRequest;
use App\Models\Category;
use App\Models\Gallerie;
use App\Models\Manufactur;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AccountController extends Controller
{
    public function update(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if ($request->file('avatar')) {
            $file = $request->file('avatar');
            $filenameWithExt = $file->getClientOriginalName();
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extention = $file->getClientOriginalExtension();
            $fileNameToStore = $filename . '_' . time() . '.' . $extention;
            $path = $file->storeAs(
                'public/avatar',
                $fileNameToStore
            );
        }

        $date = $request->all();

        if (isset($path)) {
            if ($user->avatar) {
                $this->deleteImage($user->avatar);
            }
            $date['avatar'] = $path;
        } elseif ($request->avatar == null) {
            if ($user->avatar) {
                $this->deleteImage($user->avatar);
            }
            $date['avatar'] = '';
        } else {
            ($date['avatar'] = $user->avatar);
        }

        $user->update($date);
        return response()->json(
            ['status' => 'Information has been changed!']
        );
    }

    public function delete(Request $request)
    {
        $user = User::Where('email', $request->email)->first();

        if ($user->avatar !== null) {
            $this->deleteImage($user->avatar);
        }
        if ($user->forceDelete()) {
            return response()->json(['status' => 'Account has been deleted!']);
        } else {
            return response()->json(['error' => 'Error deleted!']);
        }
    }

    public function deleteImage($images)
    {
        Storage::delete($images);
    }
}
