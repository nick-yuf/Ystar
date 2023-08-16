<?php

namespace App\Api\Validate;

use App\Exceptions\ApiException;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Validation\ValidationException;

/**
 * 使用方法：
 * Class AbstractRequest
 * @package App\Http\Requests
 */
class BaseValidate extends FormRequest
{
    public $scenes = [];
    public $currentScene;               //当前场景
    public $autoValidate = false;       //是否注入之后自动验证

    public function authorize(): bool
    {
        return true;
    }

    /**
     * 设置场景
     * @param $scene
     * @return $this
     */
    public function scene($scene)
    {
        $this->currentScene = $scene;
        return $this;
    }


    /**
     * 覆盖自动验证方法
     * @throws ApiException
     */
    public function validateResolved()
    {
        if ($this->autoValidate) {
            try {
                $this->handleValidate();
            } catch (AuthorizationException $e) {
                throw new ApiException($e->getMessage(), $e->getCode());
            } catch (ValidationException $e) {
                throw new ApiException($e->getMessage(), $e->getCode());
            }
        }
    }

    /**
     * 验证方法
     * @param string $scene
     */
    public function validate($scene = '')
    {
        if ($scene) {
            $this->currentScene = $scene;
        }
        $this->handleValidate();
    }

    /**
     * 根据场景获取规则
     * @return array|mixed
     */
    public function getRules()
    {
        $rules = $this->container->call([$this, 'rules']);
        $newRules = [];
        if ($this->currentScene && isset($this->scenes[$this->currentScene])) {
            $sceneFields = is_array($this->scenes[$this->currentScene])
                ? $this->scenes[$this->currentScene] : explode(',', $this->scenes[$this->currentScene]);
            foreach ($sceneFields as $field) {
                if (array_key_exists($field, $rules)) {
                    $newRules[$field] = $rules[$field];
                }
            }
            return $newRules;
        }
        return $rules;
    }

    /**
     * 覆盖设置 自定义验证器
     * @param $factory
     * @return mixed
     */
    public function validator($factory)
    {
        return $factory->make(
            $this->validationData(), $this->getRules(),
            $this->messages(), $this->attributes()
        );
    }

    /**
     * 最终验证方法
     */
    protected function handleValidate()
    {
        $instance = $this->getValidatorInstance();
        if ($instance->fails()) {
            $this->failedValidation($instance);
        }
        $this->passedValidation();
    }

    /**
     * 重写报错部分-适应API JSON下发的需求
     * @param Validator $validator
     */
    protected function failedValidation(Validator $validator)
    {
        $error = $validator->errors()->all();
        throw new HttpResponseException(response()->json(['statusCode' => 505, 'message' => $error['0'], 'data' => []]));
    }

}
