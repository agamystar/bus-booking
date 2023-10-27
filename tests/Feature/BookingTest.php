<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Http\Services\BookingService;
use Tests\TestCase;

class BookingTest extends TestCase
{

    public function test_the_service_book_a_trip(): void
    {
        $bookingService = $this->app->make(BookingService::class);
        $result = $bookingService->book(1,1,5);
        $this->assertIsBool($result);
    }

    public function test_the_service_return_list_of_trips(): void
    {
        $bookingService = $this->app->make(BookingService::class);
        $trips = $bookingService->getAvailableBooking('2023-10-30',1,5);
        $this->assertGreaterThan(0,count($trips));
    }
}
