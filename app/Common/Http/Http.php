<?php


namespace App\Common\Http;

use App\Exceptions\ApiException;

class Http
{
    /**
     * @param string $url
     * @param array $params
     * @param string $method
     * @return mixed
     * @throws ApiException
     */
    function request(string $url, array $params, string $method = 'post')
    {
        \Illuminate\Support\Facades\Log::debug('url:' . $url);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 120);
        if (stripos($url, "https://") !== FALSE) {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
            $method = strtolower($method);
        }
        if ('post' == $method) {
            curl_setopt($ch, CURLOPT_POST, true);
        } else if ('put' == $method) {
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
        }
        if ($params) {
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        }
        \Illuminate\Support\Facades\Log::debug('param:' . json_encode($params));
        $resp = curl_exec($ch);
        \Illuminate\Support\Facades\Log::debug('resp:' . $resp);

        if ($resp === false) {
            $error = curl_error($ch);
            throw new ApiException($error);
        }
        $data = json_decode($resp, true);

        if ($data === null) {
            throw new ApiException('api response error not json');
        }

        return $data;
    }

}
