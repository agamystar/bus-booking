<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Bus extends Model
{
    protected $table = "bus";

    public function trips(): HasMany
    {
        return $this->hasMany(Trip::class);
    }
}
