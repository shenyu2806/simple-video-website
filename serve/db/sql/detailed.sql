/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : mp4

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 27/08/2024 08:49:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for detailed
-- ----------------------------
DROP TABLE IF EXISTS `detailed`;
CREATE TABLE `detailed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动漫详情id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '动漫名称',
  `actors` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '声优名字列表',
  `categories` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类列表',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `createtime` datetime NULL DEFAULT NULL COMMENT '首发时间',
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `master` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `playlist` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '播放列表',
  `datelist` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '播放源id-地址列表',
  `rank` float NULL DEFAULT NULL COMMENT '分数',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布国家',
  `season` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '动漫状态（更新、完结...）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detailed
-- ----------------------------
INSERT INTO `detailed` VALUES (1, '敗犬女主太多了！', '{\"梅田修一朗\",\"遠野光\",\"若山詩音\",\"寺澤百花\",\"種崎敦美\",\"田中美海\",\"小林裕介\" }', '{\"喜剧\", \"奇幻\", \"校园\"}', 'http://127.0.0.1:1008/images/nav.webp', '2024-08-03 23:31:00', '日语', '北村翔太郎 ', '{1:[{link: \"\",title: \"第1集\"},{link: \"\",title: \"第2集\"}],2:[{link: \"\",title: \"第1集\"},{link: \"\",title: \"第2集\"}]}', '', 0.9, '日本', '更新中');
INSERT INTO `detailed` VALUES (2, '殺手寓言', NULL, NULL, 'http://example.com/chinese_comic_cover.jpg', NULL, NULL, NULL, NULL, NULL, 0.6, '中国', '更新中');

SET FOREIGN_KEY_CHECKS = 1;
