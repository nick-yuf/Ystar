<?php
/**
 * @auther --
 * @date 2023-08-21 09:05:25
 */

namespace App\Models;

use App\Models\Common\BaseModel;

class CarModel extends BaseModel
{
    use SingletonTrait;

    /**
     * 表名
     */
    protected $table = 'ys_car';

    /*
     * 数据库字段
     */
    const F_id = 'id', F_car_type = 'car_type', F_desc = 'desc', F_tips = 'tips', F_images = 'images', F_price_info = 'price_info', F_created_at = 'created_at', F_updated_at = 'updated_at', F_deleted_at = 'deleted_at';


    public function getPriceInfoAttribute($value): array
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setPriceInfoAttribute($value)
    {
        $this->attributes[self::F_price_info] = json_encode(array_values($value));
    }



    public function getAll()
    {
        $query = $this->newQuery();
        $query->limit(100);
        $query->orderBy(self::F_id, 'desc');
        return $query->get();
    }

}
