<?php

namespace App\Api\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function createModel(Request $request)
    {
        $table = $request->get('table', '');

        if (!$table) {
            return '表名称未传';
        }

        $name = explode('_', $table);
        foreach ($name as $k => $n) {
            $name[$k] = ucwords($n);
        }
        $name = implode('', $name) . 'Model';
        $table = 'ys_' . $table;

        $rs = DB::select("show COLUMNS FROM " . $table);

        $fields = '';
        foreach ($rs as $r) {
            $fields .= ",F_{$r->Field} = '{$r->Field}'";
        }

        $fields = substr($fields, 1);

        header("Content-Type:application/force-download");
        header("Content-Type:application/octet-stream");
        header("Content-Type:application/download");
        header("Content-Disposition:inline;filename=\"" . $name . ".php\"");
        header("Content-Transfer-Encoding:binary");
        header("Cache-Control: must-revalidate,post-check=0,pre-check=0");
        header("Pragma: no-cache");

        echo "<?php\r\n/**\r\n * @auther --\r\n * @date " . date('Y-m-d H:i:s') . "\r\n */\r\n" . "namespace App\Models;\r\n\r\nuse App\Models\Common\BaseModel;\r\n\r\n" . "class " . $name . " extends BaseModel\r\n{\r\n    /**\r\n     * 表名\r\n     */\r\n    protected \$table='{$table}';\r\n    \r\n    /*\r\n     * 数据库字段\r\n     */\r\n    const " . $fields . ";\r\n\r\n     \r\n}";
        exit;
    }

}
