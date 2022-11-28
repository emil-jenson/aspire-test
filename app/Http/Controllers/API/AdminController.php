<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\UserLoanRequest;
use App\Models\User;
use App\Models\UserLoanStatus;
use App\Models\UserLoanRepayment;

class AdminController extends Controller
{
    /**
     * Public user/customer loan requests
     *    
     * @return Status
     * @return message
     * @return Loan requests
     * @return errors
     */
    public function getAllPendingLoanRequests(Request $request)
    {

        try {

            $loanRqsts = UserLoanRequest::join('user_loan_statuses as uls', 'uls.id', '=', 'user_loan_requests.status')
                ->join('users', 'users.id', '=', 'user_loan_requests.user_id')
                ->select(
                    'user_loan_requests.id as loan_rqst_id',
                    'user_loan_requests.user_id',
                    'user_loan_requests.loan_amount',
                    'user_loan_requests.term',
                    'user_loan_requests.status as status_id',
                    'uls.value as status',
                    'users.name as user_name',
                    'users.email as user_email',
                )->where('user_loan_requests.status', 1)->get();

            return response()->json([
                'status' => 200,
                'data' => $loanRqsts
            ]);
        } catch (\Exception $e) {

            return response()->json([
                'status' => 400,
                'message' => 'Something went wrong. Please try again',
                'errors' => $e
            ]);
        }
    }

    /**
     * Public user/customer loan requests
     *    
     * @param status_id
     * @return Status
     * @return message
     * @return Loan request
     * @return errors
     */
    public function changeLoanStatus(Request $request)
    {
        $this->validate($request, [
            'id' => 'required|numeric',
            'status' => 'required|numeric',
        ]);

        try {

            $loanRqst = UserLoanRequest::find($request->id);

            if (!empty($loanRqst)) {               
                
                $loanRqst->status = $request->status;
                $loanRqst->save();

                return response()->json([
                    'status' => 200,
                    'message' => 'Loan request status changed',
                    'data' => $loanRqst
                ]);
            } else {
                return response()->json([
                    'status' => 200,
                    'message' => 'No loan request found'
                ]);
            }
        } catch (\Exception $e) {

            return response()->json([
                'status' => 400,
                'message' => 'Something went wrong. Please try again',
                'errors' => $e
            ]);
        }
    }
}
