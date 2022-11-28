<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use Hash;
use Auth;
use DB;


class AuthController extends Controller
{

    /**
     * Public user/customer registration api
     *
     * @param email     
     * @param name     
     * @param password 
     *
     * @return Status
     * @return message
     * @return data = User
     */
    public function register(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'name' => 'required|max:50',
            'password' => 'required',
        ]);

        $check = User::where('email', $request->email)->count();
        if ($check > 0) {
            return response()->json([
                'status' => 500,
                'msg' => ' This email is already in use ',
            ]);
        }

        $User = new User;
        $User->password = Hash::make($request->password);
        $User->email = $request->email;
        $User->name = $request->name;
        $User->role_id = 2;
        $User->status = 1;

        $User->save();
        $User->access_token = $User->createToken('aspireTest')->plainTextToken;

        return response()->json([
            'status' => 200,
            'message' => 'User registered successfully',
            'data' => $User
        ]);
    }


    /**
     * Public user/customer login api
     *
     * @param email       
     * @param password 
     *
     * @return Status
     * @return message
     * @return data = User
     */
    public function login(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = Auth::User();
            if ($user->status == 1 && $user->role_id == 2) {
                $user->access_token = $user->createToken('aspireTest')->plainTextToken;
                return response()->json([
                    'data' => $user,
                    'status' => 200,
                    'message' => 'Login successfull'
                ]);
            } else {
                return response()->json([
                    'status' => 505,
                    'data' => '0',
                    'message' => 'Your account does not have access to the system'
                ]);
            }
        } else {
            return response()->json([
                'status' => 500,
                'message' => 'Error in Email or Password'
            ]);
        }
    }

    /**
     * Admin user login api
     *
     * @param email       
     * @param password 
     *
     * @return Status
     * @return message
     * @return data = User
     */
    public function adminLogin(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = Auth::User();
            if ($user->status == 1 && $user->role_id == 1) {
                $user->access_token = $user->createToken('aspireTest')->plainTextToken;
                return response()->json([
                    'data' => $user,
                    'status' => 200,
                    'message' => 'Login successfull'
                ]);
            } else {
                return response()->json([
                    'status' => 505,
                    'data' => '0',
                    'message' => 'Your account does not have access to the system'
                ]);
            }
        } else {
            return response()->json([
                'status' => 500,
                'message' => 'Error in Email or Password'
            ]);
        }
    }
}
