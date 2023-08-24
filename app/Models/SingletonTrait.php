<?php

namespace App\Models;

trait SingletonTrait
{

    protected static $instance = null;


    public static function getInstance()
    {
        if (!(self::$instance instanceof self)) {
            self::$instance = new self;
        }
        return self::$instance;
    }
}
