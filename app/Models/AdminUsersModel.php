<?php
/**
 * @auther --
 * @date 2023-09-13 07:56:20
 */
namespace App\Models;

use App\Models\Common\BaseToModel;

class AdminUsersModel extends BaseToModel
{
    /**
     * 表名
     */
    protected $table='admin_users';

    /*
     * 数据库字段
     */
    const F_id = 'id',F_username = 'username',F_password = 'password',F_name = 'name',F_avatar = 'avatar',F_remember_token = 'remember_token',F_created_at = 'created_at',F_updated_at = 'updated_at';


}
