<?php

namespace App\Http\Services;

use App\Models\Bus;
use App\Models\Trip;
use App\Models\TripBooking;

class BookingService
{

    public function __construct(protected Bus $bus, protected TripBooking $tripBooking, protected Trip $trip)
    {
    }

    public function getAvailableBooking(string $at_day, int $from_stop_id, int $to_stop_id): array
    {
        return $this->bus->with(['trips' => function ($q) use ($at_day) {
            /*$q->where('at_day', '=', $at_day);*/
        }, 'trips.booking'])
            ->where('from_stop_id', '<=', $from_stop_id)
            ->where('to_stop_id', '>=', $to_stop_id)
            ->get()->toArray();
    }

    public function book(int $trip_id, int $from_stop_id, int $to_stop_id): bool
    {
        $available_seats = $this->checkAvailableSeats($trip_id, $from_stop_id, $to_stop_id);
        if ($available_seats) {
            return $this->tripBooking->insert([
                'trip_id' => $trip_id,
                'from_stop_id' => $from_stop_id,
                'to_stop_id' => $to_stop_id
            ]);
        } else {
            return false;
        }
    }

    public function checkAvailableSeats(int $trip_id, int $from_stop_id, int $to_stop_id, $capacity = 12): int
    {
        $booking_count = $this->trip->find($trip_id)->booking()->count();
        if ($booking_count < $capacity) {
            return $capacity - $this->trip->find($trip_id)->booking()->count();
        }
        $will_leave = $this->trip->find($trip_id)->booking()
                ->where('to_stop_id', '<=', $from_stop_id)
                ->orWhere('from_stop_id', '>=', $to_stop_id)
                ->count();
        if ($booking_count >= $capacity + $will_leave) {
            return 0;
        } else {
            return $will_leave;
        }
    }
}
