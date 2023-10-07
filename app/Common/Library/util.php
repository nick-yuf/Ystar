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
     * 获取指定时间戳所在的月份的开始时间戳和结束时间戳
     *
     * @param int $timestamp
     * @return array(开始时间,结束时间)
     */
    static function getMonthBeginAndEnd(int $timestamp = 0): array
    {
        $timestamp = $timestamp ? $timestamp : time();
        $year = date('Y', $timestamp);
        $month = date('m', $timestamp);
        $d = date('t', strtotime($year . '-' . $month));
        return ['begin' => strtotime($year . '-' . $month), 'end' => mktime(23, 59, 59, $month, $d, $year)];
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
