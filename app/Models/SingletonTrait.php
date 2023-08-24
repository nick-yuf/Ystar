<?php

namespace App\Models;

trait SingletonTrait
{

    protected static $instance = null;


    /**
     * @return SingletonTrait|null
     */
    public static function getInstance(): ?SingletonTrait
    {
        if (!(self::$instance instanceof self)) {
            self::$instance = new self;
        }
        return self::$instance;
    }
}
