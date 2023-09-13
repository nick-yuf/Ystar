<?php

namespace App\Common\Library;
class util
{

    static function setLang($array = array()): array
    {
        return collect($array)->map(function ($item) {
            return __($item);
        })->toArray();
    }


    /**
     * 驼峰命名转下划线命名
     * 思路:
     * 小写和大写紧挨一起的地方,加上分隔符,然后全部转小写
     */

    /**
     * @param $camelCaps
     * @param string $separator
     * @return string
     */
    static public function uncamelize($camelCaps, string $separator = '_')
    {
        $changed = [];
        if (is_array($camelCaps)) {
            foreach ($camelCaps as $key => $value) {
                $k = strtolower(preg_replace('/([a-z])([A-Z])/', "$1" . $separator . "$2", $key));
                $changed[$k] = $value;
            }
        } else {
            $changed = strtolower(preg_replace('/([a-z])([A-Z])/', "$1" . $separator . "$2", $camelCaps));
        }

        return $changed;
    }

}
