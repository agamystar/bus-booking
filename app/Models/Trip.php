<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Trip extends Model
{
    protected $table = "trips";

    public function booking(): HasMany
    {
        return $this->hasMany(TripBooking::class);
    }


}
