/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : homestead

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 15/08/2020 19:27:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) UNSIGNED NOT NULL COMMENT '管理员ID',
  `role_id` int(10) UNSIGNED NOT NULL COMMENT '角色ID',
  `created_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 1, 1, 1553752888, 1553752888, 0);
INSERT INTO `admin_role` VALUES (2, 2, 1, 1554265387, 1554265387, 0);

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被删除的用户无法登录',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'admin', '$2y$10$l25yEwI66Ej7x7M5nDsIou68LF./S9ZKOqAjDPzjhi8pk74a3J70C', 'xiaoxi@qq.com', 'Eh1DbjixOCoghiYBcvUtP1JXerI1GIL5HDpDuPGc3dYWQdFMxAHiW3ariS0e', 1553752888, 1553752888, 0);
INSERT INTO `admins` VALUES (2, 'xiaoxi', '$2y$10$l25yEwI66Ej7x7M5nDsIou68LF./S9ZKOqAjDPzjhi8pk74a3J70C', 'xiaoxi@qq.com', NULL, 1554265387, 1554265387, 0);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限描述',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级权限 顶级权限为 0',
  `icon` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限 菜单图标 只有顶级权限才有',
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限路由',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '权限排序',
  `created_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, '权限管理', '菜单 - 权限管理', 0, 'layui-icon-auz', '', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (2, '角色列表', '菜单 -- 角色列表', 1, '', 'admin.roles.index', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (3, '权限列表', '菜单 - 权限列表', 1, '', 'admin.permissions.index', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (4, '管理员列表', '管理员列表', 1, '', 'admin.admins.index', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (5, '添加权限页面', '添加权限页面', 3, '', 'admin.permissions.create', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (6, '编辑权限页面', '编辑权限页面', 3, '', 'admin.permissions.edit', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (7, '存储权限', '存储权限', 3, '', 'admin.permissions.store', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (9, '删除权限', '删除权限', 3, '', 'admin.permissions.destroy', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (10, '更新权限', '更新权限', 3, '', 'admin.permissions.update', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (12, '编辑角色页面', '编辑角色页面', 2, '', 'admin.roles.edit', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (13, '删除角色', '删除角色', 2, '', 'admin.roles.destroy', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (14, '修改角色', '修改角色权限', 2, '', 'admin.roles.update', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (15, '创建角色页面', '创建角色页面', 2, '', 'admin.roles.create', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (16, '存储角色', '存储角色', 2, '', 'admin.roles.store', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (18, '添加管理员页面', '添加管理员页面', 4, '', 'admin.admins.create', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (19, '创建管理员', '创建管理员', 4, '', 'admin.admins.store', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (20, '编辑管理员信息页面', '编辑管理员信息页面', 4, '', 'admin.admins.edit', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (21, '更新管理员信息', '更新管理员信息', 4, '', 'admin.admins.update', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (22, '删除管理员', '删除管理员', 4, '', 'admin.admins.destroy', 0, 1553752888, 1553752888, 0);
INSERT INTO `permissions` VALUES (23, 'ce', 'ce', 0, 'layui-icon-heart', '', 0, 1597490683, 1597490683, 0);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL COMMENT '角色ID',
  `permission_id` int(10) UNSIGNED NOT NULL COMMENT '权限ID',
  `created_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1, 1, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (2, 1, 2, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (3, 1, 3, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (4, 1, 4, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (5, 1, 5, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (6, 1, 6, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (7, 1, 7, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (8, 1, 9, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (9, 1, 10, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (10, 1, 12, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (11, 1, 13, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (12, 1, 14, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (13, 1, 15, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (14, 1, 16, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (15, 1, 18, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (16, 1, 19, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (17, 1, 20, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (18, 1, 21, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (19, 1, 22, 1597490700, 1597490700, 0);
INSERT INTO `role_permission` VALUES (20, 1, 23, 1597490700, 1597490700, 0);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色描述',
  `key` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色英文标识',
  `created_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', '拥有所有权限', 'super_admin', 1553752888, 1597490700, 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
