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

 Date: 29/08/2024 17:19:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for animation
-- ----------------------------
DROP TABLE IF EXISTS `animation`;
CREATE TABLE `animation`  (
  `id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '动漫id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '动漫名称',
  `cover` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '封面',
  `season` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '动漫状态（更新、完结...）',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `type` int(1) NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主分类',
  `recommend` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐(1是推荐，0是不推荐)',
  `viewing` int(11) NULL DEFAULT NULL COMMENT '观看数',
  `date` date NULL DEFAULT NULL COMMENT '番剧开始时间',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of animation
-- ----------------------------
INSERT INTO `animation` VALUES ('101', '敗犬女主太多了！', 'http://172.17.1.13:1008/images/nav.webp', '更新中', '这是一部非常热门的动漫。', 3, '3001', '1', 25, '2024-07-01', '2024-08-26 23:27:35', '周一');
INSERT INTO `animation` VALUES ('102', '不時輕聲地以俄語遮羞的鄰座艾莉同學', 'http://172.17.1.13:1008/images/nav2.webp', '更新中', '这是一部非常热门的动漫。', 3, '3002', '1', 63, '2024-07-02', '2024-08-27 11:40:44', '周三');
INSERT INTO `animation` VALUES ('103', ' 鹿乃子大摇大摆虎视眈眈第一季', 'https://lz.sinaimg.cn/large/8a65eec0gy1hqr3bc6185j207i0al0wq.jpg', '更新中', '你需要修改这个数据', 3, '3003', '1', 0, '2024-07-02', '2024-08-29 15:39:37', '周四');
INSERT INTO `animation` VALUES ('104', '魔王军最强的魔术师是人类第一季', 'https://lz.sinaimg.cn/large/8a65eec0gy1hqqzcfo43lj207i0akn12.jpg', '更新中', '你需要修改这个数据', 2, '2001', '1', 0, '2024-07-05', '2024-08-29 15:46:52', '周三');
INSERT INTO `animation` VALUES ('105', '魔导具师妲莉亚不向人低头第一季', 'https://lz.sinaimg.cn/large/8a65eec0gy1hqr1hizx2yj207i0ak0u7.jpg', '更新中', '你需要修改这个数据', 2, '1002', '1', 0, '2024-07-04', '2024-08-29 15:54:16', '周五');
INSERT INTO `animation` VALUES ('106', '德里科的托儿所第一季', 'https://lz.sinaimg.cn/large/8a65eec0gy1hhx7zh84q9j207i0algml.jpg', '更新中', '你需要修改这个数据', 2, '2001', '1', 0, '2024-08-01', '2024-08-29 15:59:41', '周六');
INSERT INTO `animation` VALUES ('107', '义妹生活', 'https://anime.girigirilove.com/upload/vod/20240626-1/58680f195b9633cd944bd747e594dccf.webp', '更新中', '你需要修改这个数据', 3, '3002', '1', 0, '2024-07-08', '2024-08-29 16:04:53', '周四');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `categories` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类类型列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '动作', '[{\"classname\": \"热血\",\"classid\": \"1001\"},{\"classname\": \"战斗\",\"classid\": \"1002\"}]');
INSERT INTO `categories` VALUES (2, '冒险', '[{\"classname\": \"奇幻\",\"classid\": \"2001\"},{\"classname\": \"探险\",\"classid\": \"2002\"}]');
INSERT INTO `categories` VALUES (3, '校园', '[{\"classname\": \"喜剧\",\"classid\": \"3001\"},{\"classname\": \"恋情\",\"classid\": \"3002\"},{\"classname\": \"搞笑\",\"classid\": \"3003\"}]');

-- ----------------------------
-- Table structure for detailed
-- ----------------------------
DROP TABLE IF EXISTS `detailed`;
CREATE TABLE `detailed`  (
  `id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '动漫详情id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '动漫名称',
  `actors` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '声优名字列表',
  `categories` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类列表',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `createtime` date NULL DEFAULT NULL COMMENT '首发时间',
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `master` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `playlist` json NULL COMMENT '播放列表',
  `datelist` json NULL COMMENT '播放源id-地址列表',
  `rank` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分数',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布国家',
  `season` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '动漫状态（更新、完结...）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detailed
-- ----------------------------
INSERT INTO `detailed` VALUES ('101', '敗犬女主太多了！', '[\"梅田修一朗\",\"遠野光\",\"若山詩音\",\"寺澤百花\",\"種崎敦美\",\"田中美海\",\"小林裕介\"]', '[\"喜剧\", \"奇幻\", \"校园\"]', 'http://172.17.1.13:1008/images/nav.webp', '2024-08-03', '日语', '北村翔太郎 ', '{\"1\": [{\"link\": \"\", \"title\": \"1集\"}], \"2\": [{\"link\": \"\", \"title\": \"1集\"}, {\"link\": \"\", \"title\": \"2集\"}, {\"link\": \"\", \"title\": \"3集\"}, {\"link\": \"\", \"title\": \"4集\"}, {\"link\": \"\", \"title\": \"5集\"}, {\"link\": \"\", \"title\": \"6集\"}, {\"link\": \"\", \"title\": \"7集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\"], \"2\": [\"https://v11.tlkqc.com/wjv11/202407/14/469JNKg4eQ83/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/21/6Az9pTuZWd84/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/28/Ujh4vytMGZ84/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202408/04/4xqW26cvUA82/video/index.m3u8\", \"https://v7.tlkqc.com/wjv7/202408/12/sjmtFms8Xs79/video/index.m3u8\", \"https://v5.tlkqc.com/wjv5/202408/18/AagQt11gaH77/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202408/25/LArnhy29St84/video/index.m3u8\"]}', '9.0', '日本', '更新中');
INSERT INTO `detailed` VALUES ('102', '不時輕聲地以俄語遮羞的鄰座艾莉同學', '[\"天崎滉平\",\"上坂堇\",\"丸冈和佳奈\",\"藤井雪代\",\"会泽纱弥\",\"河濑茉\"]', '[\"喜剧\",\"奇幻\",\"校园\"]', 'https://pic.youkupic.com/upload/vod/20240703-1/fad68faab187c2352a52fde1b564eebd.jpg', '2024-07-03', '日语', '伊藤良太', '{\"1\": [{\"link\": \"\", \"title\": \"1集\"}, {\"link\": \"\", \"title\": \"2集\"}], \"2\": [{\"link\": \"\", \"title\": \"1集\"}, {\"link\": \"\", \"title\": \"2集\"}, {\"link\": \"\", \"title\": \"3集\"}, {\"link\": \"\", \"title\": \"4集\"}, {\"link\": \"\", \"title\": \"5集\"}, {\"link\": \"\", \"title\": \"6集\"}, {\"link\": \"\", \"title\": \"7集\"}, {\"link\": \"\", \"title\": \"8集\"}, {\"link\": \"\", \"title\": \"9集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\", \"\"], \"2\": [\"https://v11.tlkqc.com/wjv11/202407/03/g6paQX7ddB83/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202407/10/sYKqapYKfT82/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/17/Lqnz9NGY4684/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/24/vdD7Xj7pQG84/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/31/zqPV2BxCrd84/video/index.m3u8\", \"https://v11.tlkqc.com/wjv11/202408/07/yKnVnwFUXr83/video/index.m3u8\", \"https://v7.tlkqc.com/wjv7/202408/14/CcwuNiMizQ79/video/index.m3u8\", \"https://v9.tlkqc.com/wjv9/202408/21/p1bR2EENri81/video/index.m3u8\", \"https://v11.tlkqc.com/wjv11/202408/28/xNvT6KESc183/video/index.m3u8\"]}', '9.0', '日本', '更新中');
INSERT INTO `detailed` VALUES ('104', '魔王军最强的魔术师是人类第一季', '[\"福山润\",\"立花日菜\",\"伊藤静\",\"石见舞菜香\",\"和气杏未\",\"利根健太\"]', '[\"战斗\",\"奇幻\",\"后宫\",\"魔法\"]', 'https://lz.sinaimg.cn/large/8a65eec0gy1hqqzcfo43lj207i0akn12.jpg', '2024-08-03', '日语', '长滨亘彦', '{\"1\": [{\"link\": \"\", \"title\": \"1集\"}], \"2\": [{\"link\": \"\", \"title\": \"1集\"}, {\"link\": \"\", \"title\": \"2集\"}, {\"link\": \"\", \"title\": \"3集\"}, {\"link\": \"\", \"title\": \"4集\"}, {\"link\": \"\", \"title\": \"5集\"}, {\"link\": \"\", \"title\": \"6集\"}, {\"link\": \"\", \"title\": \"7集\"}, {\"link\": \"\", \"title\": \"8集\"}, {\"link\": \"\", \"title\": \"9集\"}, {\"link\": \"\", \"title\": \"10集\"}, {\"link\": \"\", \"title\": \"11集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\"], \"2\": [\"https://v12.tlkqc.com/wjv12/202406/26/PxGD4hEeB984/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202407/03/E6BeKBZiBA82/video/index.m3u8\", \"https://v11.tlkqc.com/wjv11/202407/10/vrMfZWdKPw83/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202407/17/pwNeGa4aRz82/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202407/24/QRtCPyvSSy82/video/index.m3u8\", \"https://v7.tlkqc.com/wjv7/202407/31/tvrqNeErVF79/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202408/07/xbHB3g8V7v82/video/index.m3u8\", \"https://v11.tlkqc.com/wjv11/202408/15/brCuzKeCZW83/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202408/21/kervreE7fS84/video/index.m3u8\", \"https://v2.tlkqc.com/wjv2/202408/28/wETsRmawkD74/video/index.m3u8\", \"\"]}', '7.5', '日本', '更新中');
INSERT INTO `detailed` VALUES ('103', ' 鹿乃子大摇大摆虎视眈眈第一季', '[\"潘惠美\",\"藤田咲\",\"田边留依\",\"和泉风花\",\"久保由利香\"]', '[\"搞笑\",\"校园\"]', 'https://lz.sinaimg.cn/large/8a65eec0gy1hqr3bc6185j207i0al0wq.jpg', '2024-08-03', '日语', '太田雅彦', '{\"1\": [{\"link\": \"\", \"title\": \"1集\"}], \"2\": [{\"link\": \"\", \"title\": \"1集\"}, {\"link\": \"\", \"title\": \"2集\"}, {\"link\": \"\", \"title\": \"3集\"}, {\"link\": \"\", \"title\": \"4集\"}, {\"link\": \"\", \"title\": \"5集\"}, {\"link\": \"\", \"title\": \"6集\"}, {\"link\": \"\", \"title\": \"7集\"}, {\"link\": \"\", \"title\": \"8集\"}, {\"link\": \"\", \"title\": \"9集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\"], \"2\": [\"https://v12.tlkqc.com/wjv12/202407/06/xUVSFEt18v84/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202407/14/Q6rU6dXGFn82/video/index.m3u8\", \"https://v11.tlkqc.com/wjv11/202407/21/K0q12CGHEx83/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/28/jD0gsqbMPw84/video/index.m3u8\", \"https://v2.tlkqc.com/wjv2/202407/31/q5XKrZCs4s74/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202408/07/8pqaGrPkqr82/video/index.m3u8\", \"https://v7.tlkqc.com/wjv7/202408/15/gmPLGimC3V79/video/index.m3u8\", \"https://v2.tlkqc.com/wjv2/202408/21/js5mmYCjVB74/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202408/28/FnTzLjYAtw84/video/index.m3u8\"]}', '7.3', '日本', '更新中');
INSERT INTO `detailed` VALUES ('105', '魔导具师妲莉亚不向人低头第一季', '[\"大西沙织\",\"田丸笃志\",\"饭田里穗\",\"松田健一郎\",\"和泉风花\",\"高桥\"]', '[\"喜剧\",\"奇幻\",\"校园\"]', 'https://lz.sinaimg.cn/large/8a65eec0gy1hqr1hizx2yj207i0ak0u7.jpg', '2024-08-03', '日语', '久保洋祐', '{\"1\": [{\"link\": \"\", \"title\": \"1集\"}], \"2\": [{\"link\": \"\", \"title\": \"1集\"}, {\"link\": \"\", \"title\": \"2集\"}, {\"link\": \"\", \"title\": \"3集\"}, {\"link\": \"\", \"title\": \"4集\"}, {\"link\": \"\", \"title\": \"5集\"}, {\"link\": \"\", \"title\": \"6集\"}, {\"link\": \"\", \"title\": \"7集\"}, {\"link\": \"\", \"title\": \"8集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\"], \"2\": [\"https://v12.tlkqc.com/wjv12/202407/24/E33rzU98JD84/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/24/j3mqyKbFPE84/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202407/24/7XWUnF8Da082/video/index.m3u8\", \"https://v9.tlkqc.com/wjv9/202408/14/Ejmw6rWpAp81/video/index.m3u8\", \"https://v9.tlkqc.com/wjv9/202408/14/Eak0eXAvap81/video/index.m3u8\", \"https://v11.tlkqc.com/wjv11/202408/22/twevkRvzY983/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202408/23/J5EviWrvtg82/video/index.m3u8\", \"https://v2.tlkqc.com/wjv2/202408/29/HR1wBL3MGD74/video/index.m3u8\"]}', '8.5', '日本', '更新中');
INSERT INTO `detailed` VALUES ('106', '德里科的托儿所第一季', '[\"森田成一\",\"小西克幸\",\"下野纮\",\"佐藤拓也\",\"日高里菜\",\"小原好美\"]', '[\"奇幻\",\"推理\"]', 'https://lz.sinaimg.cn/large/8a65eec0gy1hhx7zh84q9j207i0algml.jpg', '2024-08-03', '日语', '锦织博', '{\"1\": [{\"link\": \"\", \"title\": \"1集\"}], \"2\": [{\"link\": \"\", \"title\": \"1集\"}, {\"link\": \"\", \"title\": \"2集\"}, {\"link\": \"\", \"title\": \"3集\"}, {\"link\": \"\", \"title\": \"4集\"}, {\"link\": \"\", \"title\": \"5集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\"], \"2\": [\"https://v7.tlkqc.com/wjv7/202408/08/RJtRZvdZLL79/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202408/15/vKGLC9PfzR82/video/index.m3u8\", \"https://v9.tlkqc.com/wjv9/202408/22/UU5kbnRDUq81/video/index.m3u8\", \"https://v2.tlkqc.com/wjv2/202408/29/G3spuqujup74/video/index.m3u8\", \"\"]}', '9.0', '日本', '更新中');
INSERT INTO `detailed` VALUES ('107', '义妹生活', '[\"天崎滉平\",\"中岛由贵\",\"铃木爱唯\",\"滨野大辉\",\"铃木实里\"]', '[\"校園\",\"愛情\",\"日常\",\"劇情\"]', 'https://anime.girigirilove.com/upload/vod/20240626-1/58680f195b9633cd944bd747e594dccf.webp', '2024-08-03', '日语', '上野壮大', '{\"1\": [{\"link\": \"\", \"title\": \"1集\"}], \"2\": [{\"link\": \"\", \"title\": \"1集\"}, {\"link\": \"\", \"title\": \"2集\"}, {\"link\": \"\", \"title\": \"3集\"}, {\"link\": \"\", \"title\": \"4集\"}, {\"link\": \"\", \"title\": \"5集\"}, {\"link\": \"\", \"title\": \"6集\"}, {\"link\": \"\", \"title\": \"7集\"}, {\"link\": \"\", \"title\": \"8集\"}, {\"link\": \"\", \"title\": \"9集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\"], \"2\": [\"https://v11.tlkqc.com/wjv11/202407/12/H6pssUq15k83/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202407/29/yNUL43Efhp82/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/29/w550xv0QJU84/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/29/DVuEdagbNw84/video/index.m3u8\", \"https://v11.tlkqc.com/wjv11/202408/05/pg8uUSx2Ui83/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202408/11/qN01hJkQQY84/video/index.m3u8\", \"https://v9.tlkqc.com/wjv9/202408/16/KuyPueFNwz81/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202408/23/D2qKTyZH6L82/video/index.m3u8\", \"\"]}', '7.5', '日本', '更新中');

SET FOREIGN_KEY_CHECKS = 1;
