/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : ys

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 16/08/2023 17:40:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT 0,
  `order` int NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 2, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2023-08-16 09:35:12');
INSERT INTO `admin_menu` VALUES (2, 0, 3, 'Admin', 'fa-tasks', '', NULL, NULL, '2023-08-16 09:35:12');
INSERT INTO `admin_menu` VALUES (3, 2, 4, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2023-08-16 09:35:12');
INSERT INTO `admin_menu` VALUES (4, 2, 5, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2023-08-16 09:35:12');
INSERT INTO `admin_menu` VALUES (5, 2, 6, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2023-08-16 09:35:12');
INSERT INTO `admin_menu` VALUES (6, 2, 7, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2023-08-16 09:35:12');
INSERT INTO `admin_menu` VALUES (7, 2, 8, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2023-08-16 09:35:12');
INSERT INTO `admin_menu` VALUES (9, 0, 1, '订单管理', 'fa-tasks', 'order/list', NULL, NULL, '2023-08-16 09:35:12');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 07:48:40', '2023-08-16 07:48:40');
INSERT INTO `admin_operation_log` VALUES (2, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/logout\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:48:58', '2023-08-16 07:48:58');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 07:49:02', '2023-08-16 07:49:02');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/users\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:49:07', '2023-08-16 07:49:07');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/users\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:49:11', '2023-08-16 07:49:11');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/users\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:49:15', '2023-08-16 07:49:15');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:49:28', '2023-08-16 07:49:28');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/logout\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 07:49:30', '2023-08-16 07:49:30');
INSERT INTO `admin_operation_log` VALUES (9, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 07:49:35', '2023-08-16 07:49:35');
INSERT INTO `admin_operation_log` VALUES (10, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 07:51:13', '2023-08-16 07:51:13');
INSERT INTO `admin_operation_log` VALUES (11, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 07:51:15', '2023-08-16 07:51:15');
INSERT INTO `admin_operation_log` VALUES (12, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 07:52:43', '2023-08-16 07:52:43');
INSERT INTO `admin_operation_log` VALUES (13, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 07:53:12', '2023-08-16 07:53:12');
INSERT INTO `admin_operation_log` VALUES (14, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 07:54:11', '2023-08-16 07:54:11');
INSERT INTO `admin_operation_log` VALUES (15, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 08:45:35', '2023-08-16 08:45:35');
INSERT INTO `admin_operation_log` VALUES (16, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:11:01', '2023-08-16 09:11:01');
INSERT INTO `admin_operation_log` VALUES (17, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:18:17', '2023-08-16 09:18:17');
INSERT INTO `admin_operation_log` VALUES (18, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:20:37', '2023-08-16 09:20:37');
INSERT INTO `admin_operation_log` VALUES (19, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:20:47', '2023-08-16 09:20:47');
INSERT INTO `admin_operation_log` VALUES (20, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:21:09', '2023-08-16 09:21:09');
INSERT INTO `admin_operation_log` VALUES (21, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:25:49', '2023-08-16 09:25:49');
INSERT INTO `admin_operation_log` VALUES (22, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:28:42', '2023-08-16 09:28:42');
INSERT INTO `admin_operation_log` VALUES (23, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:28:44', '2023-08-16 09:28:44');
INSERT INTO `admin_operation_log` VALUES (24, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:28:57', '2023-08-16 09:28:57');
INSERT INTO `admin_operation_log` VALUES (25, 2, 'admin/auth/users', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/users\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:29:07', '2023-08-16 09:29:07');
INSERT INTO `admin_operation_log` VALUES (26, 2, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/roles\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:29:08', '2023-08-16 09:29:08');
INSERT INTO `admin_operation_log` VALUES (27, 2, 'admin/auth/users', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/users\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:29:09', '2023-08-16 09:29:09');
INSERT INTO `admin_operation_log` VALUES (28, 2, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/users\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:29:10', '2023-08-16 09:29:10');
INSERT INTO `admin_operation_log` VALUES (29, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:29:13', '2023-08-16 09:29:13');
INSERT INTO `admin_operation_log` VALUES (30, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:29:16', '2023-08-16 09:29:16');
INSERT INTO `admin_operation_log` VALUES (31, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:29:17', '2023-08-16 09:29:17');
INSERT INTO `admin_operation_log` VALUES (32, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:29:41', '2023-08-16 09:29:41');
INSERT INTO `admin_operation_log` VALUES (33, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:29:45', '2023-08-16 09:29:45');
INSERT INTO `admin_operation_log` VALUES (34, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:30:09', '2023-08-16 09:30:09');
INSERT INTO `admin_operation_log` VALUES (35, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:31:40', '2023-08-16 09:31:40');
INSERT INTO `admin_operation_log` VALUES (36, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:31:50', '2023-08-16 09:31:50');
INSERT INTO `admin_operation_log` VALUES (37, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:32:10', '2023-08-16 09:32:10');
INSERT INTO `admin_operation_log` VALUES (38, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:32:17', '2023-08-16 09:32:17');
INSERT INTO `admin_operation_log` VALUES (39, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-16 09:33:25', '2023-08-16 09:33:25');
INSERT INTO `admin_operation_log` VALUES (40, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:33:27', '2023-08-16 09:33:27');
INSERT INTO `admin_operation_log` VALUES (41, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:33:27', '2023-08-16 09:33:27');
INSERT INTO `admin_operation_log` VALUES (42, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-16 09:33:51', '2023-08-16 09:33:51');
INSERT INTO `admin_operation_log` VALUES (43, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:33:52', '2023-08-16 09:33:52');
INSERT INTO `admin_operation_log` VALUES (44, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:33:53', '2023-08-16 09:33:53');
INSERT INTO `admin_operation_log` VALUES (45, 2, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/menu\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:34:31', '2023-08-16 09:34:31');
INSERT INTO `admin_operation_log` VALUES (46, 2, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/menu\\/9\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:34:48', '2023-08-16 09:34:48');
INSERT INTO `admin_operation_log` VALUES (47, 2, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":\"order\\/list\",\"roles\":[null],\"permission\":null,\"_token\":\"dWcmoUZLZoMUKLhnYPUBPpwf5mApRoo89spKm8Rk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/auth\\/menu\",\"s\":\"\\/\\/admin\\/auth\\/menu\\/9\"}', '2023-08-16 09:35:00', '2023-08-16 09:35:00');
INSERT INTO `admin_operation_log` VALUES (48, 2, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/menu\"}', '2023-08-16 09:35:01', '2023-08-16 09:35:01');
INSERT INTO `admin_operation_log` VALUES (49, 2, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"dWcmoUZLZoMUKLhnYPUBPpwf5mApRoo89spKm8Rk\",\"_order\":\"[{\\\"id\\\":9},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\",\"s\":\"\\/\\/admin\\/auth\\/menu\"}', '2023-08-16 09:35:12', '2023-08-16 09:35:12');
INSERT INTO `admin_operation_log` VALUES (50, 2, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/menu\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:35:12', '2023-08-16 09:35:12');
INSERT INTO `admin_operation_log` VALUES (51, 2, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/menu\"}', '2023-08-16 09:35:24', '2023-08-16 09:35:24');
INSERT INTO `admin_operation_log` VALUES (52, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/\"}', '2023-08-16 09:35:33', '2023-08-16 09:35:33');
INSERT INTO `admin_operation_log` VALUES (53, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:35:38', '2023-08-16 09:35:38');
INSERT INTO `admin_operation_log` VALUES (54, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:35:40', '2023-08-16 09:35:40');
INSERT INTO `admin_operation_log` VALUES (55, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:35:46', '2023-08-16 09:35:46');
INSERT INTO `admin_operation_log` VALUES (56, 2, 'admin/order/list/1/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:35:54', '2023-08-16 09:35:54');
INSERT INTO `admin_operation_log` VALUES (57, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:35:58', '2023-08-16 09:35:58');
INSERT INTO `admin_operation_log` VALUES (58, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-16 09:36:55', '2023-08-16 09:36:55');
INSERT INTO `admin_operation_log` VALUES (59, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-16 09:39:13', '2023-08-16 09:39:13');
INSERT INTO `admin_operation_log` VALUES (60, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-16 09:39:21', '2023-08-16 09:39:21');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name` ASC) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id` ASC, `menu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id` ASC, `permission_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name` ASC) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2023-08-16 07:39:30', '2023-08-16 07:39:30');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id` ASC, `permission_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$CbwcvYr/Lo1Y.h8P5ckjqe/cqzchxp1E2FvNwBrXBZecIqT4E0E9y', 'Administrator', NULL, 'S3wukalMm6II1PYqIYyH1nCxZvZZL0mNYRd8mGlXNkro8Gp6Ubwz5n7dMafr', '2023-08-16 07:39:30', '2023-08-16 07:39:30');
INSERT INTO `admin_users` VALUES (2, 'Nick', '$2y$10$q/F9PlnUtV23sCqpAps6BOuv/11DqY9EgJEb27ByOTnhkRhW8bzQW', 'Nick', NULL, 'AeZEmUwVDu0WP9VKWccwm0PBUop41JMzrQOWTQPfxkJV1O4sCf33OoIqlYLL', '2023-08-16 07:48:19', '2023-08-16 07:48:19');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2016_01_04_173148_create_admin_tables', 2);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for ys_order
-- ----------------------------
DROP TABLE IF EXISTS `ys_order`;
CREATE TABLE `ys_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `customer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户姓名',
  `customer_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户联系方式',
  `source` tinyint(1) NOT NULL DEFAULT 0 COMMENT '客户来源',
  `pay_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付类型：1现金，2.微信, 3支付宝',
  `pay_sum` int NOT NULL DEFAULT 0 COMMENT '支付金额',
  `pay_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付货币种类',
  `pay_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '付款状态：1待结算，2已结算，3未结算',
  `person_sum` tinyint(1) NOT NULL DEFAULT 0 COMMENT '乘客人数',
  `children_sum` tinyint(1) NOT NULL DEFAULT 0 COMMENT '儿童人数',
  `box_sum` tinyint(1) NOT NULL DEFAULT 0 COMMENT '行李总数',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注内容',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：1等待派单，2订单进行中，3订单完成，4订单作废',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ys_order
-- ----------------------------
INSERT INTO `ys_order` VALUES (1, '20130816', '张三', '13800138000', 0, 0, 0, 0, 0, 0, 0, 0, '', 1, '2023-08-16 17:25:38', NULL, NULL);

-- ----------------------------
-- Table structure for ys_order_branchs
-- ----------------------------
DROP TABLE IF EXISTS `ys_order_branchs`;
CREATE TABLE `ys_order_branchs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL DEFAULT 0,
  `reach_time` timestamp NOT NULL COMMENT '抵达时间',
  `flight_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '航班号',
  `begin_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `finish_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：1待完成，2已完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单接送详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ys_order_branchs
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
