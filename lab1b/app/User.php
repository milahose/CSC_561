<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    public function transaction()
    {
        return $this->hasMany('App\Transaction');
    }
}
