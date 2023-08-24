<?php

namespace App\Http\Controllers;

use Dingo\Api\Http\Response;
use Dingo\Api\Routing\Helpers;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    use Helpers;

    public $pageSize = 20;

    /**
     * @param array $data
     * @param string $message
     * @param int $code
     * @param null $transformer
     * @return Response
     */
    public function responseJson(array $data = [], string $message = '', int $code = 200, $transformer = null): Response
    {
        !isset($data['data']) ? $array['data'] = $data : $array = $data;
        $result = array_merge($array, ['statusCode' => $code, 'message' => $message]);

//        if (empty($data)) {
//            $this->jsonOptions($result, JSON_FORCE_OBJECT);
//        }

        return $this->response->array($result, $transformer);
    }

    public function jsonOptions($result, $options)
    {
        header('Content-Type:application/json');
        exit(json_encode($result, $options));
    }
}
