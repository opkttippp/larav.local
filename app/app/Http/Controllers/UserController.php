<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    public function index(User $user)
    {
        $roles = $user->roles->pluck('name');
        $rolesList = [];
        return view('user.index', compact('user', 'roles', 'rolesList'));
    }

    public function update(Request $request, User $user)
    {
        if ($request->has('avatar')) {
            $file = $request->file('avatar');
            $filenameWithExt = $file->hashName();
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extention = $file->extension();
            $fileNameToStore = $filename . '_' . time() . '.' . $extention;
            $path = $file->storeAs(
                'public/avatar',
                $fileNameToStore
            );
        }
        $date = $request->all();
        if (isset($path)) {
            $this->deleteImage($user->avatar);
            $date['avatar'] = $path;
        }
        $request->validate([
            'name' => 'required|max:25',
        ]);

        $user->update($date);

        return redirect()->back()->with(
            'success',
            'User updated!!'
        );
    }
    public function deleteImage($images)
    {
        Storage::delete($images);
    }
}
