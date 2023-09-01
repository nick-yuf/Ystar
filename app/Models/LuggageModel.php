<?php
/**
 * @auther --
 * @date 2023-09-01 02:11:24
 */

namespace App\Models;

use App\Models\Common\BaseToModel;

class LuggageModel extends BaseToModel
{

    public $timestamps = false;
    /**
     * 表名
     */
    protected $table = 'ys_luggage';

    /*
     * 数据库字段
     */
    const F_id = 'id', F_desc = 'desc', F_size = 'size', F_ratio = 'ratio', F_type = 'type';


    //类型：1大，2中，3小
    const type_large = 1, type_medium = 2, type_small = 3;
    const TypeArray = [
        self::type_large => 'Large',
        self::type_medium => 'Medium',
        self::type_small => 'Small',
    ];
}
