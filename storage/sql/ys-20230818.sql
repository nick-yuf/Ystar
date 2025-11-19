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

 Date: 18/08/2023 16:12:15
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
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `admin_operation_log` VALUES (61, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-16 09:41:45', '2023-08-16 09:41:45');
INSERT INTO `admin_operation_log` VALUES (62, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-17 05:33:42', '2023-08-17 05:33:42');
INSERT INTO `admin_operation_log` VALUES (63, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 05:34:55', '2023-08-17 05:34:55');
INSERT INTO `admin_operation_log` VALUES (64, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 05:35:46', '2023-08-17 05:35:46');
INSERT INTO `admin_operation_log` VALUES (65, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 05:35:54', '2023-08-17 05:35:54');
INSERT INTO `admin_operation_log` VALUES (66, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 05:36:17', '2023-08-17 05:36:17');
INSERT INTO `admin_operation_log` VALUES (67, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 05:36:34', '2023-08-17 05:36:34');
INSERT INTO `admin_operation_log` VALUES (68, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 05:36:36', '2023-08-17 05:36:36');
INSERT INTO `admin_operation_log` VALUES (69, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 05:36:38', '2023-08-17 05:36:38');
INSERT INTO `admin_operation_log` VALUES (70, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-17 05:38:28', '2023-08-17 05:38:28');
INSERT INTO `admin_operation_log` VALUES (71, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/\"}', '2023-08-17 05:50:53', '2023-08-17 05:50:53');
INSERT INTO `admin_operation_log` VALUES (72, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-17 05:50:58', '2023-08-17 05:50:58');
INSERT INTO `admin_operation_log` VALUES (73, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 07:40:19', '2023-08-17 07:40:19');
INSERT INTO `admin_operation_log` VALUES (74, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 07:40:25', '2023-08-17 07:40:25');
INSERT INTO `admin_operation_log` VALUES (75, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 07:40:27', '2023-08-17 07:40:27');
INSERT INTO `admin_operation_log` VALUES (76, 2, 'admin/order/list/1/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 07:40:32', '2023-08-17 07:40:32');
INSERT INTO `admin_operation_log` VALUES (77, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-17 07:40:38', '2023-08-17 07:40:38');
INSERT INTO `admin_operation_log` VALUES (78, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:24:51', '2023-08-18 05:24:51');
INSERT INTO `admin_operation_log` VALUES (79, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 05:24:52', '2023-08-18 05:24:52');
INSERT INTO `admin_operation_log` VALUES (80, 2, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 05:24:56', '2023-08-18 05:24:56');
INSERT INTO `admin_operation_log` VALUES (81, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 05:24:58', '2023-08-18 05:24:58');
INSERT INTO `admin_operation_log` VALUES (82, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 05:25:18', '2023-08-18 05:25:18');
INSERT INTO `admin_operation_log` VALUES (83, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 05:25:39', '2023-08-18 05:25:39');
INSERT INTO `admin_operation_log` VALUES (84, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 05:25:40', '2023-08-18 05:25:40');
INSERT INTO `admin_operation_log` VALUES (85, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 05:25:40', '2023-08-18 05:25:40');
INSERT INTO `admin_operation_log` VALUES (86, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 05:32:52', '2023-08-18 05:32:52');
INSERT INTO `admin_operation_log` VALUES (87, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 05:34:28', '2023-08-18 05:34:28');
INSERT INTO `admin_operation_log` VALUES (88, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:34:29', '2023-08-18 05:34:29');
INSERT INTO `admin_operation_log` VALUES (89, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:34:38', '2023-08-18 05:34:38');
INSERT INTO `admin_operation_log` VALUES (90, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:34:50', '2023-08-18 05:34:50');
INSERT INTO `admin_operation_log` VALUES (91, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:35:16', '2023-08-18 05:35:16');
INSERT INTO `admin_operation_log` VALUES (92, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:35:23', '2023-08-18 05:35:23');
INSERT INTO `admin_operation_log` VALUES (93, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:35:53', '2023-08-18 05:35:53');
INSERT INTO `admin_operation_log` VALUES (94, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:36:01', '2023-08-18 05:36:01');
INSERT INTO `admin_operation_log` VALUES (95, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:36:29', '2023-08-18 05:36:29');
INSERT INTO `admin_operation_log` VALUES (96, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:36:57', '2023-08-18 05:36:57');
INSERT INTO `admin_operation_log` VALUES (97, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:37:21', '2023-08-18 05:37:21');
INSERT INTO `admin_operation_log` VALUES (98, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 05:37:32', '2023-08-18 05:37:32');
INSERT INTO `admin_operation_log` VALUES (99, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u554a\\u554a\\u554a\",\"customer_phone\":\"111111\",\"person_sum\":\"1\",\"children_sum\":\"1\",\"box_sum\":\"1\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:38:05', '2023-08-18 05:38:05');
INSERT INTO `admin_operation_log` VALUES (100, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:38:06', '2023-08-18 05:38:06');
INSERT INTO `admin_operation_log` VALUES (101, 2, 'admin/order/list/6/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/6\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 05:38:15', '2023-08-18 05:38:15');
INSERT INTO `admin_operation_log` VALUES (102, 2, 'admin/order/list/6', 'PUT', '127.0.0.1', '{\"customer_name\":\"\\u554a\\u554a\\u554a111\",\"customer_phone\":\"11111112222\",\"person_sum\":\"2\",\"children_sum\":\"2\",\"box_sum\":\"2\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\\/6\"}', '2023-08-18 05:38:20', '2023-08-18 05:38:20');
INSERT INTO `admin_operation_log` VALUES (103, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 05:38:20', '2023-08-18 05:38:20');
INSERT INTO `admin_operation_log` VALUES (104, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 05:39:11', '2023-08-18 05:39:11');
INSERT INTO `admin_operation_log` VALUES (105, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 05:57:14', '2023-08-18 05:57:14');
INSERT INTO `admin_operation_log` VALUES (106, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 05:58:14', '2023-08-18 05:58:14');
INSERT INTO `admin_operation_log` VALUES (107, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 06:00:51', '2023-08-18 06:00:51');
INSERT INTO `admin_operation_log` VALUES (108, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 06:01:56', '2023-08-18 06:01:56');
INSERT INTO `admin_operation_log` VALUES (109, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 06:02:06', '2023-08-18 06:02:06');
INSERT INTO `admin_operation_log` VALUES (110, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 06:02:08', '2023-08-18 06:02:08');
INSERT INTO `admin_operation_log` VALUES (111, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:02:33', '2023-08-18 06:02:33');
INSERT INTO `admin_operation_log` VALUES (112, 2, 'admin/order/list/1/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:02:35', '2023-08-18 06:02:35');
INSERT INTO `admin_operation_log` VALUES (113, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:02:49', '2023-08-18 06:02:49');
INSERT INTO `admin_operation_log` VALUES (114, 2, 'admin/order/list/2/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/2\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:02:53', '2023-08-18 06:02:53');
INSERT INTO `admin_operation_log` VALUES (115, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:02:55', '2023-08-18 06:02:55');
INSERT INTO `admin_operation_log` VALUES (116, 2, 'admin/order/list/3/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/3\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:02:58', '2023-08-18 06:02:58');
INSERT INTO `admin_operation_log` VALUES (117, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:02:59', '2023-08-18 06:02:59');
INSERT INTO `admin_operation_log` VALUES (118, 2, 'admin/order/list/1/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:03:04', '2023-08-18 06:03:04');
INSERT INTO `admin_operation_log` VALUES (119, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:03:06', '2023-08-18 06:03:06');
INSERT INTO `admin_operation_log` VALUES (120, 2, 'admin/order/list/2/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/2\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:03:07', '2023-08-18 06:03:07');
INSERT INTO `admin_operation_log` VALUES (121, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:03:09', '2023-08-18 06:03:09');
INSERT INTO `admin_operation_log` VALUES (122, 2, 'admin/order/list/1', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:03:49', '2023-08-18 06:03:49');
INSERT INTO `admin_operation_log` VALUES (123, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:03:51', '2023-08-18 06:03:51');
INSERT INTO `admin_operation_log` VALUES (124, 2, 'admin/order/list/1', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:08:11', '2023-08-18 06:08:11');
INSERT INTO `admin_operation_log` VALUES (125, 2, 'admin/order/list/1', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\"}', '2023-08-18 06:10:10', '2023-08-18 06:10:10');
INSERT INTO `admin_operation_log` VALUES (126, 2, 'admin/order/list/1', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\"}', '2023-08-18 06:10:27', '2023-08-18 06:10:27');
INSERT INTO `admin_operation_log` VALUES (127, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:10:32', '2023-08-18 06:10:32');
INSERT INTO `admin_operation_log` VALUES (128, 2, 'admin/order/list/1/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:11:00', '2023-08-18 06:11:00');
INSERT INTO `admin_operation_log` VALUES (129, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:11:02', '2023-08-18 06:11:02');
INSERT INTO `admin_operation_log` VALUES (130, 2, 'admin/order/list/1', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:11:04', '2023-08-18 06:11:04');
INSERT INTO `admin_operation_log` VALUES (131, 2, 'admin/order/list/1', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\"}', '2023-08-18 06:11:44', '2023-08-18 06:11:44');
INSERT INTO `admin_operation_log` VALUES (132, 2, 'admin/order/list/1', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\"}', '2023-08-18 06:12:33', '2023-08-18 06:12:33');
INSERT INTO `admin_operation_log` VALUES (133, 2, 'admin/order/list/1', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\"}', '2023-08-18 06:12:45', '2023-08-18 06:12:45');
INSERT INTO `admin_operation_log` VALUES (134, 2, 'admin/order/list/1', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\"}', '2023-08-18 06:12:45', '2023-08-18 06:12:45');
INSERT INTO `admin_operation_log` VALUES (135, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:12:47', '2023-08-18 06:12:47');
INSERT INTO `admin_operation_log` VALUES (136, 2, 'admin/order/list/1/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:12:51', '2023-08-18 06:12:51');
INSERT INTO `admin_operation_log` VALUES (137, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 06:12:54', '2023-08-18 06:12:54');
INSERT INTO `admin_operation_log` VALUES (138, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:07:41', '2023-08-18 07:07:41');
INSERT INTO `admin_operation_log` VALUES (139, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:07:54', '2023-08-18 07:07:54');
INSERT INTO `admin_operation_log` VALUES (140, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:19:44', '2023-08-18 07:19:44');
INSERT INTO `admin_operation_log` VALUES (141, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:20:22', '2023-08-18 07:20:22');
INSERT INTO `admin_operation_log` VALUES (142, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:22:44', '2023-08-18 07:22:44');
INSERT INTO `admin_operation_log` VALUES (143, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:22:58', '2023-08-18 07:22:58');
INSERT INTO `admin_operation_log` VALUES (144, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:24:08', '2023-08-18 07:24:08');
INSERT INTO `admin_operation_log` VALUES (145, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u54c8\\u54c8\",\"customer_phone\":\"138001380000\",\"source\":\"1\",\"person_sum\":\"1\",\"children_sum\":\"1\",\"box_sum\":\"1\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"\\u8c22\\u8c22\\u8c22\\u8c22\\u8c22\\u8c22\",\"travel_info\":{\"new_1\":{\"\\u62b5\\u8fbe\\u65f6\\u95f4\":\"2023-08-18 00:00:00\",\"\\u822a\\u73ed\\u53f7\":\"2222\",\"\\u63a5\\u9001\\u8d77\\u70b9\":\"\\u673a\\u573a2\\u53f7\\u53e3\",\"\\u63a5\\u9001\\u76ee\\u7684\\u5730\":\"KLCC\",\"_remove_\":\"0\"}},\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\\/create?s=%2F%2Fadmin%2Forder%2Flist%2Fcreate\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:25:02', '2023-08-18 07:25:02');
INSERT INTO `admin_operation_log` VALUES (146, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:25:02', '2023-08-18 07:25:02');
INSERT INTO `admin_operation_log` VALUES (147, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u54c8\\u54c8\",\"customer_phone\":\"138001380000\",\"source\":\"1\",\"person_sum\":\"1\",\"children_sum\":\"1\",\"box_sum\":\"1\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"\\u8c22\\u8c22\\u8c22\\u8c22\\u8c22\\u8c22\",\"travel_info\":{\"new_1\":{\"\\u62b5\\u8fbe\\u65f6\\u95f4\":\"2023-08-18 00:00:00\",\"\\u822a\\u73ed\\u53f7\":\"2222\",\"\\u63a5\\u9001\\u8d77\\u70b9\":\"\\u673a\\u573a2\\u53f7\\u53e3\",\"\\u63a5\\u9001\\u76ee\\u7684\\u5730\":\"KLCC\",\"_remove_\":\"0\"}},\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:27:11', '2023-08-18 07:27:11');
INSERT INTO `admin_operation_log` VALUES (148, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:27:12', '2023-08-18 07:27:12');
INSERT INTO `admin_operation_log` VALUES (149, 2, 'admin/order/list/7', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/7\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:27:22', '2023-08-18 07:27:22');
INSERT INTO `admin_operation_log` VALUES (150, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:31:59', '2023-08-18 07:31:59');
INSERT INTO `admin_operation_log` VALUES (151, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:32:01', '2023-08-18 07:32:01');
INSERT INTO `admin_operation_log` VALUES (152, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:32:02', '2023-08-18 07:32:02');
INSERT INTO `admin_operation_log` VALUES (153, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:32:10', '2023-08-18 07:32:10');
INSERT INTO `admin_operation_log` VALUES (154, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:32:28', '2023-08-18 07:32:28');
INSERT INTO `admin_operation_log` VALUES (155, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:34:26', '2023-08-18 07:34:26');
INSERT INTO `admin_operation_log` VALUES (156, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:34:27', '2023-08-18 07:34:27');
INSERT INTO `admin_operation_log` VALUES (157, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:34:43', '2023-08-18 07:34:43');
INSERT INTO `admin_operation_log` VALUES (158, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:34:57', '2023-08-18 07:34:57');
INSERT INTO `admin_operation_log` VALUES (159, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:35:56', '2023-08-18 07:35:56');
INSERT INTO `admin_operation_log` VALUES (160, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:37:29', '2023-08-18 07:37:29');
INSERT INTO `admin_operation_log` VALUES (161, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:38:09', '2023-08-18 07:38:09');
INSERT INTO `admin_operation_log` VALUES (162, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:38:51', '2023-08-18 07:38:51');
INSERT INTO `admin_operation_log` VALUES (163, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:39:01', '2023-08-18 07:39:01');
INSERT INTO `admin_operation_log` VALUES (164, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:39:51', '2023-08-18 07:39:51');
INSERT INTO `admin_operation_log` VALUES (165, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:39:56', '2023-08-18 07:39:56');
INSERT INTO `admin_operation_log` VALUES (166, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u8ba2\\u5355\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"1\",\"children_sum\":\"1\",\"box_sum\":\"1\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"\\u9876\\u9876\\u9876\\u9876\",\"travel_info\":{\"new_1\":{\"reach_time\":\"2023-08-31 00:00:00\",\"flight_number\":\"11111\",\"begin_address\":\"22222\",\"finish_address\":\"3333\",\"_remove_\":\"0\"}},\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:40:14', '2023-08-18 07:40:14');
INSERT INTO `admin_operation_log` VALUES (167, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:40:14', '2023-08-18 07:40:14');
INSERT INTO `admin_operation_log` VALUES (168, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:40:35', '2023-08-18 07:40:35');
INSERT INTO `admin_operation_log` VALUES (169, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"d\\u8ba2\\u5355\",\"customer_phone\":\"1111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":null,\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:40:42', '2023-08-18 07:40:42');
INSERT INTO `admin_operation_log` VALUES (170, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:40:42', '2023-08-18 07:40:42');
INSERT INTO `admin_operation_log` VALUES (171, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:41:22', '2023-08-18 07:41:22');
INSERT INTO `admin_operation_log` VALUES (172, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:41:25', '2023-08-18 07:41:25');
INSERT INTO `admin_operation_log` VALUES (173, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:41:26', '2023-08-18 07:41:26');
INSERT INTO `admin_operation_log` VALUES (174, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"32321\",\"customer_phone\":\"321321\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":null,\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:41:30', '2023-08-18 07:41:30');
INSERT INTO `admin_operation_log` VALUES (175, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:41:30', '2023-08-18 07:41:30');
INSERT INTO `admin_operation_log` VALUES (176, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:42:25', '2023-08-18 07:42:25');
INSERT INTO `admin_operation_log` VALUES (177, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:42:27', '2023-08-18 07:42:27');
INSERT INTO `admin_operation_log` VALUES (178, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:42:29', '2023-08-18 07:42:29');
INSERT INTO `admin_operation_log` VALUES (179, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"213213\",\"customer_phone\":\"21321321\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:42:36', '2023-08-18 07:42:36');
INSERT INTO `admin_operation_log` VALUES (180, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:42:37', '2023-08-18 07:42:37');
INSERT INTO `admin_operation_log` VALUES (181, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:47:31', '2023-08-18 07:47:31');
INSERT INTO `admin_operation_log` VALUES (182, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:47:33', '2023-08-18 07:47:33');
INSERT INTO `admin_operation_log` VALUES (183, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:47:33', '2023-08-18 07:47:33');
INSERT INTO `admin_operation_log` VALUES (184, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:48:52', '2023-08-18 07:48:52');
INSERT INTO `admin_operation_log` VALUES (185, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:48:53', '2023-08-18 07:48:53');
INSERT INTO `admin_operation_log` VALUES (186, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u53cd\\u5bf9\\u6492\\u5927\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:49:00', '2023-08-18 07:49:00');
INSERT INTO `admin_operation_log` VALUES (187, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:49:00', '2023-08-18 07:49:00');
INSERT INTO `admin_operation_log` VALUES (188, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u53cd\\u5bf9\\u6492\\u5927\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"travel_info\":{\"new_1\":{\"reach_time\":null,\"flight_number\":null,\"begin_address\":null,\"finish_address\":null,\"_remove_\":\"0\"}},\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:49:10', '2023-08-18 07:49:10');
INSERT INTO `admin_operation_log` VALUES (189, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u53cd\\u5bf9\\u6492\\u5927\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"travel_info\":{\"new_1\":{\"reach_time\":null,\"flight_number\":null,\"begin_address\":null,\"finish_address\":null,\"_remove_\":\"0\"}},\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:49:18', '2023-08-18 07:49:18');
INSERT INTO `admin_operation_log` VALUES (190, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u53cd\\u5bf9\\u6492\\u5927\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:49:28', '2023-08-18 07:49:28');
INSERT INTO `admin_operation_log` VALUES (191, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:49:29', '2023-08-18 07:49:29');
INSERT INTO `admin_operation_log` VALUES (192, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:50:31', '2023-08-18 07:50:31');
INSERT INTO `admin_operation_log` VALUES (193, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u54e5\\u54e5\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:50:36', '2023-08-18 07:50:36');
INSERT INTO `admin_operation_log` VALUES (194, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\"}', '2023-08-18 07:50:36', '2023-08-18 07:50:36');
INSERT INTO `admin_operation_log` VALUES (195, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u54e5\\u54e5\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:51:45', '2023-08-18 07:51:45');
INSERT INTO `admin_operation_log` VALUES (196, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u54e5\\u54e5\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:51:51', '2023-08-18 07:51:51');
INSERT INTO `admin_operation_log` VALUES (197, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u54e5\\u54e5\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:52:29', '2023-08-18 07:52:29');
INSERT INTO `admin_operation_log` VALUES (198, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u54e5\\u54e5\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"travel_info\":{\"new_1\":{\"reach_time\":null,\"flight_number\":null,\"begin_address\":null,\"finish_address\":null,\"_remove_\":\"0\"}},\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:52:34', '2023-08-18 07:52:34');
INSERT INTO `admin_operation_log` VALUES (199, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"\\u54e5\\u54e5\",\"customer_phone\":\"11111\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"travel_info\":{\"new_1\":{\"reach_time\":\"2023-08-18 00:00:00\",\"flight_number\":null,\"begin_address\":null,\"finish_address\":null,\"_remove_\":\"0\"}},\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:52:39', '2023-08-18 07:52:39');
INSERT INTO `admin_operation_log` VALUES (200, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:53:11', '2023-08-18 07:53:11');
INSERT INTO `admin_operation_log` VALUES (201, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:53:13', '2023-08-18 07:53:13');
INSERT INTO `admin_operation_log` VALUES (202, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"123213\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:53:18', '2023-08-18 07:53:18');
INSERT INTO `admin_operation_log` VALUES (203, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"123213\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:53:24', '2023-08-18 07:53:24');
INSERT INTO `admin_operation_log` VALUES (204, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"123213\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:54:08', '2023-08-18 07:54:08');
INSERT INTO `admin_operation_log` VALUES (205, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"123213\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:54:13', '2023-08-18 07:54:13');
INSERT INTO `admin_operation_log` VALUES (206, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"123213\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:55:23', '2023-08-18 07:55:23');
INSERT INTO `admin_operation_log` VALUES (207, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"123213\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:56:26', '2023-08-18 07:56:26');
INSERT INTO `admin_operation_log` VALUES (208, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"123213\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:56:38', '2023-08-18 07:56:38');
INSERT INTO `admin_operation_log` VALUES (209, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"123213\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"travel_info\":{\"new_2\":{\"reach_time\":\"2023-08-23 00:00:00\",\"flight_number\":\"1\",\"begin_address\":\"2\",\"finish_address\":\"1\",\"_remove_\":\"0\"}},\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:56:52', '2023-08-18 07:56:52');
INSERT INTO `admin_operation_log` VALUES (210, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"123213\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:57:32', '2023-08-18 07:57:32');
INSERT INTO `admin_operation_log` VALUES (211, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:57:51', '2023-08-18 07:57:51');
INSERT INTO `admin_operation_log` VALUES (212, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:57:53', '2023-08-18 07:57:53');
INSERT INTO `admin_operation_log` VALUES (213, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"111\",\"customer_phone\":\"2222\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:57:58', '2023-08-18 07:57:58');
INSERT INTO `admin_operation_log` VALUES (214, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"111\",\"customer_phone\":\"2222\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":\"--\",\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:58:17', '2023-08-18 07:58:17');
INSERT INTO `admin_operation_log` VALUES (215, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:58:17', '2023-08-18 07:58:17');
INSERT INTO `admin_operation_log` VALUES (216, 2, 'admin/order/list/create', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/create\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:58:55', '2023-08-18 07:58:55');
INSERT INTO `admin_operation_log` VALUES (217, 2, 'admin/order/list', 'POST', '127.0.0.1', '{\"customer_name\":\"23213\",\"customer_phone\":\"3333333\",\"source\":\"1\",\"person_sum\":\"0\",\"children_sum\":\"0\",\"box_sum\":\"0\",\"pay_type\":\"1\",\"pay_currency\":\"1\",\"pay_status\":\"1\",\"status\":\"1\",\"remark\":null,\"_token\":\"FxW3JaAYiCoP5EjRJDTPNgzM01CdhOs0P9ds4bXN\",\"_previous_\":\"http:\\/\\/dev.ystar.com\\/admin\\/order\\/list\",\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:59:00', '2023-08-18 07:59:00');
INSERT INTO `admin_operation_log` VALUES (218, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 07:59:01', '2023-08-18 07:59:01');
INSERT INTO `admin_operation_log` VALUES (219, 2, 'admin/order/list/10/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/10\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:59:04', '2023-08-18 07:59:04');
INSERT INTO `admin_operation_log` VALUES (220, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:59:07', '2023-08-18 07:59:07');
INSERT INTO `admin_operation_log` VALUES (221, 2, 'admin/order/list/3/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/3\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:59:12', '2023-08-18 07:59:12');
INSERT INTO `admin_operation_log` VALUES (222, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 07:59:15', '2023-08-18 07:59:15');
INSERT INTO `admin_operation_log` VALUES (223, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:00:19', '2023-08-18 08:00:19');
INSERT INTO `admin_operation_log` VALUES (224, 2, 'admin/order/list/1/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 08:00:21', '2023-08-18 08:00:21');
INSERT INTO `admin_operation_log` VALUES (225, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 08:00:24', '2023-08-18 08:00:24');
INSERT INTO `admin_operation_log` VALUES (226, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:00:39', '2023-08-18 08:00:39');
INSERT INTO `admin_operation_log` VALUES (227, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:00:46', '2023-08-18 08:00:46');
INSERT INTO `admin_operation_log` VALUES (228, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:01:17', '2023-08-18 08:01:17');
INSERT INTO `admin_operation_log` VALUES (229, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:01:18', '2023-08-18 08:01:18');
INSERT INTO `admin_operation_log` VALUES (230, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:01:29', '2023-08-18 08:01:29');
INSERT INTO `admin_operation_log` VALUES (231, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:01:55', '2023-08-18 08:01:55');
INSERT INTO `admin_operation_log` VALUES (232, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:02:35', '2023-08-18 08:02:35');
INSERT INTO `admin_operation_log` VALUES (233, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:02:36', '2023-08-18 08:02:36');
INSERT INTO `admin_operation_log` VALUES (234, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:02:46', '2023-08-18 08:02:46');
INSERT INTO `admin_operation_log` VALUES (235, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:02:47', '2023-08-18 08:02:47');
INSERT INTO `admin_operation_log` VALUES (236, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:05:03', '2023-08-18 08:05:03');
INSERT INTO `admin_operation_log` VALUES (237, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:05:57', '2023-08-18 08:05:57');
INSERT INTO `admin_operation_log` VALUES (238, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:06:11', '2023-08-18 08:06:11');
INSERT INTO `admin_operation_log` VALUES (239, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:06:26', '2023-08-18 08:06:26');
INSERT INTO `admin_operation_log` VALUES (240, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:06:40', '2023-08-18 08:06:40');
INSERT INTO `admin_operation_log` VALUES (241, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:06:58', '2023-08-18 08:06:58');
INSERT INTO `admin_operation_log` VALUES (242, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:07:06', '2023-08-18 08:07:06');
INSERT INTO `admin_operation_log` VALUES (243, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:07:43', '2023-08-18 08:07:43');
INSERT INTO `admin_operation_log` VALUES (244, 2, 'admin/order/list/1/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/1\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 08:08:05', '2023-08-18 08:08:05');
INSERT INTO `admin_operation_log` VALUES (245, 2, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 08:08:07', '2023-08-18 08:08:07');
INSERT INTO `admin_operation_log` VALUES (246, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/auth\\/logout\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 08:08:38', '2023-08-18 08:08:38');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\"}', '2023-08-18 08:08:43', '2023-08-18 08:08:43');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:10:05', '2023-08-18 08:10:05');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:10:47', '2023-08-18 08:10:47');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\"}', '2023-08-18 08:10:53', '2023-08-18 08:10:53');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/order/list/4/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/4\\/edit\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 08:10:57', '2023-08-18 08:10:57');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/order/list/4/edit', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\\/4\\/edit\"}', '2023-08-18 08:11:23', '2023-08-18 08:11:23');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/order/list', 'GET', '127.0.0.1', '{\"s\":\"\\/\\/admin\\/order\\/list\",\"_pjax\":\"#pjax-container\"}', '2023-08-18 08:11:26', '2023-08-18 08:11:26');

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
INSERT INTO `admin_users` VALUES (2, 'Nick', '$2y$10$q/F9PlnUtV23sCqpAps6BOuv/11DqY9EgJEb27ByOTnhkRhW8bzQW', 'Nick', NULL, 'Jgg5d9qvttuo0XBg9VkSY5xodE0uBZ35E0tf1ajdwlAbSJ3vILiK8BA3oBD3', '2023-08-16 07:48:19', '2023-08-16 07:48:19');

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
  `travel_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行程内容',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：1等待派单，2订单进行中，3订单完成，4订单作废',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ys_order
-- ----------------------------
INSERT INTO `ys_order` VALUES (1, '20130816', '张三', '13800138000', 1, 1, 1, 1, 1, 2, 1, 1, '备注内容1111', '[{\"reach_time\":\"2023-08-31 00:00:00\",\"flight_number\":\"11111\",\"begin_address\":\"22222\",\"finish_address\":\"3333\"}]', 1, '2023-08-16 17:25:38', NULL, NULL);
INSERT INTO `ys_order` VALUES (2, '20130816', '小明', '13800138000', 1, 1, 1, 1, 1, 2, 1, 1, '备注内容1111', '[{\"reach_time\":\"2023-08-31 00:00:00\",\"flight_number\":\"11111\",\"begin_address\":\"22222\",\"finish_address\":\"3333\"}]', 2, '2023-08-16 17:25:38', NULL, NULL);
INSERT INTO `ys_order` VALUES (3, '20130816', '小红', '13800138000', 1, 1, 1, 1, 1, 2, 1, 1, '备注内容1111', '[{\"reach_time\":\"2023-08-31 00:00:00\",\"flight_number\":\"11111\",\"begin_address\":\"22222\",\"finish_address\":\"3333\"}]', 3, '2023-08-16 17:25:38', NULL, NULL);
INSERT INTO `ys_order` VALUES (4, '20130816', 'nick', '13800138000', 1, 1, 1, 1, 1, 2, 1, 1, '备注内容1111', '[{\"reach_time\":\"2023-08-31 00:00:00\",\"flight_number\":\"11111\",\"begin_address\":\"22222\",\"finish_address\":\"3333\"}]', 4, '2023-08-16 17:25:38', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单接送详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ys_order_branchs
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
