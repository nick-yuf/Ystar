<?php

namespace App\Api\Controllers;

use App\Api\Logic\OrderLogic;
use App\Api\Validate\OrderRequest;
use App\Exceptions\ApiException;
use Dingo\Api\Http\Response;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{

    private $logic;

    public function __construct()
    {
        $this->logic = new OrderLogic();
    }


    /**
     * @param OrderRequest $request
     * @return Response
     * @throws ApiException
     */
    public function changeStatus(OrderRequest $request): Response
    {
        $request->validate(__FUNCTION__);
        return $this->responseJson($this->logic->changeStatus(
            $request->get('id'),
            $request->get('status', 1),
        ));
    }

}
