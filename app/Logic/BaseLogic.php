<?php

namespace App\Logic;

use Illuminate\Support\Facades\Redis;
use Ramsey\Uuid\Uuid;

class BaseLogic
{
    public function setSession($sessionId, $userId)
    {
        $str = config('constants.redis.USER_SESSION_ID', '');
        if (!$str) {
            return false;
        }

        //用户数据设置session缓存
        if (!$sessionId) {
            $sessionObject = Uuid::uuid1();
            $sessionId = $sessionObject->getHex()->toString();
        }
        $key = sprintf($str, $sessionId);
        $expiresAt = 3600 * 24 * 3;
        Redis::SETEX($key, $expiresAt, $userId);
        return $expiresAt;
    }

    public function getSession($sessionId)
    {
        $str = config('constants.redis.USER_SESSION_ID', '');
        if (!$str) {
            return false;
        }
        $key = sprintf($str, $sessionId);
        return Redis::GET($key);
    }

}
