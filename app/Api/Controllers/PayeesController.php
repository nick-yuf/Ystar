<?php

namespace App\Api\Controllers;

use App\Api\Logic\PayeesLogic;
use App\Api\Validate\PayeesRequest;
use Dingo\Api\Http\Response;
use App\Http\Controllers\Controller;

class PayeesController extends Controller
{

    private $logic;

    public function __construct()
    {
        $this->logic = new PayeesLogic();
    }


    /**
     * @param PayeesRequest $request
     * @return Response
     */
    public function selectList(PayeesRequest $request): Response
    {
        $request->validate(__FUNCTION__);
        return $this->response->array($this->logic->list());
    }


    /**
     * @param PayeesRequest $request
     * @return Response
     */
    public function list(PayeesRequest $request): Response
    {
        $request->validate(__FUNCTION__);
        return $this->responseJson($this->logic->list());
    }

}
