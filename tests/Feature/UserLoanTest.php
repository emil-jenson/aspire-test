<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class UserLoanTest extends TestCase
{

    public function test_apply_loan()
    {
        $response = $this->withHeader('Authorization', 'Bearer ' . '12|ttlIF8M8AmsAzzNqL0Qe70P9HdbIrNN13lwXxNw7')
            ->postJson('/api/user-loan/apply', ['loan_amount' => '15000', 'term' => 3]);

        $response->assertStatus(200);
    }

    public function test_getUserLoanRequests()
    {
        $response = $this->withHeader('Authorization', 'Bearer ' . '12|ttlIF8M8AmsAzzNqL0Qe70P9HdbIrNN13lwXxNw7')
            ->getJson('/api/user-loan/my-loans');

        $response->assertStatus(200);
    }

    public function test_repayLoanAmount()
    {
        $response = $this->withHeader('Authorization', 'Bearer ' . '12|ttlIF8M8AmsAzzNqL0Qe70P9HdbIrNN13lwXxNw7')
            ->postJson('/api/user-loan/repay-loans', ['repay_id' => 3, 'repay_amount' => 30000]);

        $response->assertStatus(200);
    }
}
