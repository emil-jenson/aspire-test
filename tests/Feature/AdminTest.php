<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AdminTest extends TestCase
{
    public function test_get_all_pending()
    {
        $response = $this->withHeader('Authorization', 'Bearer ' . '18|fs9u0nJOj1s4l0AXsssri6pEGCqxq5FggvlZop18')
            ->getJson('/api/admin/pending-loans-requests');

        $response->assertStatus(200);
    }

    public function test_change_loan_status()
    {
        $response = $this->withHeader('Authorization', 'Bearer ' . '18|fs9u0nJOj1s4l0AXsssri6pEGCqxq5FggvlZop18')
            ->postJson('/api/admin/change-loan-status', ['id' => 2, 'status' => 3]);

        $response->assertStatus(200);
    }
}
