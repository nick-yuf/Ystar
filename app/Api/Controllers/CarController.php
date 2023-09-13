<?php

namespace App\Api\Controllers;

use App\Api\Logic\CarLogic;
use App\Api\Validate\CarRequest;
use App\Exceptions\ApiException;
use Dingo\Api\Http\Response;
use App\Http\Controllers\Controller;

class CarController extends Controller
{

    private $logic;

    public function __construct()
    {
        $this->logic = new CarLogic();
    }


    /**
     * @param CarRequest $request
     * @return Response
     */
    public function selectList(CarRequest $request): Response
    {
        $request->validate(__FUNCTION__);
        return $this->response->array($this->logic->list());
    }


    /**
     * @param CarRequest $request
     * @return Response
     */
    public function list(CarRequest $request): Response
    {
        $request->validate(__FUNCTION__);
        return $this->responseJson($this->logic->list());
    }

    /**
     * @desc 推荐车型
     * @param CarRequest $request
     * @return Response
     * @throws ApiException
     */
    public function recommend(CarRequest $request): Response
    {
        $request->validate(__FUNCTION__);
        return $this->responseJson($this->logic->recommend(
            $request->get('adult',0),
            $request->get('children',0),
            $request->get('large',0),
            $request->get('medium',0),
            $request->get('small',0),
        ));
    }

}
