<?php

namespace App\Exceptions;


class ApiException extends \Exception
{
    function __construct($msg = '', $code = 501)
    {
        $msg = 'Error: ' . $msg;
        parent::__construct($msg, $code);
    }
}
