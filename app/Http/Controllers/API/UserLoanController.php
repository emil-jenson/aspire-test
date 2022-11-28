<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\UserLoanRequest;
use App\Models\UserLoanRepayment;

class UserLoanController extends Controller
{
    /**
     * Public user/customer request loan api
     *
     * @param load_amount     
     * @param term    
     *
     * @return Status
     * @return message
     * @return Loan request
     * @return errors
     */
    public function applyUserLoan(Request $request)
    {
        $this->validate($request, [
            'loan_amount' => 'required|numeric',
            'term' => 'required|numeric',
        ]);

        try {

            $loanRqst = new UserLoanRequest();
            $loanRqst->user_id = auth()->user()->id;
            $loanRqst->loan_amount = $request->loan_amount;
            $loanRqst->term = $request->term;
            $loanRqst->status = 1; // Pending approval
            $loanRqst->save();

            if (!empty($loanRqst)) {

                for ($i = 1; $i <= $request->term; $i++) {
                    $repayAmnt =  number_format(($request->loan_amount / $request->term), 2, '.', '');
                    $UserLoanRepayment = new UserLoanRepayment();
                    $UserLoanRepayment->loan_request_id = $loanRqst->id;
                    $UserLoanRepayment->amount =  $repayAmnt;
                    $UserLoanRepayment->repayment_date =  date('Y-m-d', strtotime('+' . $i . ' Week'));
                    $UserLoanRepayment->status = 1; // PENDING
                    $UserLoanRepayment->save();
                }

                return response()->json([
                    'status' => 200,
                    'message' => 'Loan request submitted successfully',
                    'data' => $loanRqst
                ]);
            } else {
                return response()->json([
                    'status' => 400,
                    'message' => 'Failed to submit loan request',
                ]);
            }
        } catch (\Exception $e) {

            return response()->json([
                'status' => 400,
                'message' => 'Failed to submit loan request',
                'errors' => $e
            ]);
        }
    }

    /**
     * Get public user/customer loan requests
     *   
     * @return Status
     * @return message
     * @return Loan request
     * @return errors
     */
    public function getUserLoanRequests(Request $request)
    {

        try {
            $loanRqsts = UserLoanRequest::join('user_loan_statuses as uls', 'uls.id', '=', 'user_loan_requests.status')
                ->select(
                    'user_loan_requests.id as loan_rqst_id',
                    'user_loan_requests.user_id',
                    'user_loan_requests.loan_amount',
                    'user_loan_requests.term',
                    'user_loan_requests.status as status_id',
                    'uls.value as status',
                )->where('user_id', auth()->user()->id)->get();


            for ($i = 0; $i < count($loanRqsts); $i++) {
                $loanRqsts[$i]['repayments'] = UserLoanRepayment::where('loan_request_id', $loanRqsts[$i]['loan_rqst_id'])->get();
            }


            return response()->json([
                'status' => 200,
                'data' => $loanRqsts
            ]);
        } catch (\Exception $e) {

            return response()->json([
                'status' => 400,
                'message' => 'Failed to fetch loan requests',
                'errors' => $e
            ]);
        }
    }

    /**
     * Public user/customer loan repayment
     *
     * @param repay_id 
     * @param repay_amount 
     *
     * @return Status
     * @return message    
     * @return errors
     */
    public function repayLoanAmount(Request $request)
    {
        $this->validate($request, [
            'repay_id' => 'required|numeric',
            'repay_amount' => 'required|numeric',
        ]);

        try {

            $repay = UserLoanRepayment::find($request->repay_id);
            $loanRqst = UserLoanRequest::find($repay->loan_request_id);

            if ($loanRqst->user_id == auth()->user()->id) { // Checking if the loan user and logged in user is same

                if ($request->repay_amount >= $repay->amount) {
                    $repay->repay_amount = $request->repay_amount;
                    $repay->paid_on = date('Y-m-d');
                    $repay->status = 2; // PAID
                    $repay->save();

                    $pendingCount = UserLoanRepayment::where('loan_request_id', $repay->loan_request_id)->where('status', 1)->get()->count();
                    if ($pendingCount == 0) {
                        // Changing the loan status to FULLY PAID                    
                        $loanRqst->status = 4; //FULLY PAID
                        $loanRqst->save();
                    }

                    return response()->json([
                        'status' => 200,
                        'message' => 'Loan repayment successfull'
                    ]);
                } else {
                    return response()->json([
                        'status' => 400,
                        'message' => 'Amount should be greater than or equal to the actual repayment amount',
                    ]);
                }
            } else {
                return response()->json([
                    'status' => 400,
                    'message' => 'Invalid loan repayment',
                ]);
            }
        } catch (\Exception $e) {

            return response()->json([
                'status' => 400,
                'message' => 'Failed to fetch loan requests',
                'errors' => $e
            ]);
        }
    }
}
