<?php

namespace App\Api\Validate;


class PayeesRequest extends BaseValidate
{
    /**
     * Get the validation rules that apply to the request.
     * 获取应用于请求的验证规则
     * @return array
     */
    public function rules(): array
    {
        return [
            'model' => 'string',
        ];
    }


    /**
     * @desc 验证器错误的自定义消息
     * @return array
     * @example 'required' => ':attribute不能为空',
     */
    public function messages(): array
    {
        return [];
    }

    public $scenes = [
        'list' => ['model']
    ];
}
