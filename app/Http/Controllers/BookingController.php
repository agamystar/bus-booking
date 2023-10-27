<?php

namespace App\Http\Controllers;

use App\Http\Requests\BookRequest;
use App\Http\Requests\ShowAvailableBusesRequest;
use App\Http\Services\BookingService;
use Illuminate\Http\JsonResponse;

class BookingController extends Controller
{
    public function showAvailableBuses(ShowAvailableBusesRequest $request, BookingService $bookingService): JsonResponse
    {
        $trips = $bookingService->getAvailableBooking($request->at_day, $request->from_stop_id, $request->to_stop_id);

        return response()->json([
            "bus_trips" => $trips
        ]);
    }


    public function book(BookRequest $request, BookingService $bookingService): JsonResponse
    {
        $result = $bookingService->book($request->trip_id, $request->from_stop_id, $request->to_stop_id);

        return response()->json([
            "result" => $result
        ]);
    }

    public function checkAvailableSeats(BookRequest $request, BookingService $bookingService): JsonResponse
    {
        $result = $bookingService->checkAvailableSeats($request->trip_id, $request->from_stop_id, $request->to_stop_id);

        return response()->json([
            "result" => $result
        ]);
    }
}
