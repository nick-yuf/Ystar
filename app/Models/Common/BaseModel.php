<?php

namespace App\Models\Common;

use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BaseModel extends Model
{
    use HasFactory;
    use SoftDeletes;

    public $pageSize = 20;

    public $timestamps = true;

    public function updateById($id, $data)
    {
        if (!$id) {
            return false;
        }
        if ($this->timestamps) {
            $data['updated_at'] = date('Y-m-d H:i:s');
        }
        return self::query()->where('id', $id)->update($data);
    }

    public function addOne(array $data = [])
    {
        if (!$data) {
            return false;
        }
        if ($this->timestamps) {
            $data['created_at'] = date('Y-m-d H:i:s');
        }
        return self::query()->insertGetId($data);
    }

    public function addBatch(array $data = []): bool
    {
        if (!$data) {
            return false;
        }
        if ($this->timestamps) {
            foreach ($data as $k => $v) {
                $data[$k]['created_at'] = date('Y-m-d H:i:s');
            }
        }
        return self::query()->insert($data);
    }

    /**
     * @param $page LengthAwarePaginator
     * @return array
     */
    public function setPagination(LengthAwarePaginator $page): array
    {
        return [
            'total' => $page->total(),
            'currentPage' => $page->currentPage(),
            'perPage' => $page->perPage()
        ];
    }

    /**
     * @desc  Return enum value
     * @param array $array
     * @param $key
     * @return mixed|string
     */
    public static function rtnEnumVal(array $array, $key)
    {
        $array = collect($array)->map(function ($item) {
            return __($item);
        })->toArray();

        return $array[$key] ?? '';
    }

    /**
     * @desc  Return enum value
     * @param array $array
     * @param $key
     * @return array
     */
    public static function rtnEnum(array $array, $key): array
    {
        $array = collect($array)->map(function ($item) {
            return __($item);
        })->toArray();

        if (isset($array[$key])) {
            return [
                'key' => $key,
                'val' => $array[$key]
            ];
        }
        return [];
    }
}
