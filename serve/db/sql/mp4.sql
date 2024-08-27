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

 Date: 27/08/2024 21:01:27
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
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
INSERT INTO `animation` VALUES ('101', '敗犬女主太多了！', 'http://172.17.1.13:1008/images/nav.webp', '更新中', '这是一部非常热门的动漫。', '3', '3001', '1', 25, '2024-07-01', '2024-08-26 23:27:35', '周一');
INSERT INTO `animation` VALUES ('102', '不時輕聲地以俄語遮羞的鄰座艾莉同學', 'http://172.17.1.13:1008/images/nav2.webp', '更新中', '这是一部非常热门的动漫。', '3', '3002', '1', 63, '2024-07-02', '2024-08-27 11:40:44', '周三');
INSERT INTO `animation` VALUES ('104', '身爲VTuber的我因爲忘記關台而成了傳說', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '完结', 'Live-ON是一間坐擁諸多才華洋溢的VTuber的大型公司。其中身為三期生，以「清秀」為賣點的VTuber心音淡雪，因為一時失察而忘記關台，結果──「果然高罐開起來的聲音就是爽啊！」「嗄？她也太好擼了吧？」「我要來當妳的媽媽啦！」把真面目（酗酒、喜歡女性、清秀（VTuber））暴露得一覽無遺！而到了隔天，「超多人剪了直播片段！上了趨勢榜的世界第一？這個直播觀看人數是怎麼回事！」非但沒鬧得雞飛狗跳，還因為反差效果而大紅大紫！結果──「好咧！來加把勁直播啦──！」放縱自我的她，衝上了超人氣VTuber之路！', '3', '3001', '1', 245, '2024-08-28', '2024-08-27 16:31:09', '周日');
INSERT INTO `animation` VALUES ('103', '狼與香辛料 重制版', 'https://anime.girigirilove.com/upload/vod/20240323-1/f956eeafab61c085bac118872a579c77.webp', '更新中', '本作品為第二次動畫化的作品。年輕的商人克拉夫特·羅倫斯以一匹馬為夥伴，開著馬車在城鎮之間販賣商品的日子一直持續著。某一天，他來到一個黃金色麥田延伸的小村莊，遇見了一位擁有耳朵和尾巴的美少女。「我的名字是賀洛」自稱為「賢狼」的賀洛是豐饒之神狼的化身——。聽到她渴望回到遙遠北方的故鄉·約伊茨森林的願望後，羅倫斯和賀洛成為商業旅程中的同伴，一同朝北方出發。然而，在商人的旅途中總是伴隨著意想不到的波瀾⋯⋯。孤獨的商人，和孤獨的狼之化身，他們一同踏上馬車，此刻正開始瘋狂地奔馳。', '1', '3001', '1', 142, '2024-08-19', '2024-08-27 15:28:44', '周五');
INSERT INTO `animation` VALUES ('105', '身爲VTuber的我因爲忘記關台而成了傳說', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '完结', 'Live-ON是一間坐擁諸多才華洋溢的VTuber的大型公司。其中身為三期生，以「清秀」為賣點的VTuber心音淡雪，因為一時失察而忘記關台，結果──「果然高罐開起來的聲音就是爽啊！」「嗄？她也太好擼了吧？」「我要來當妳的媽媽啦！」把真面目（酗酒、喜歡女性、清秀（VTuber））暴露得一覽無遺！而到了隔天，「超多人剪了直播片段！上了趨勢榜的世界第一？這個直播觀看人數是怎麼回事！」非但沒鬧得雞飛狗跳，還因為反差效果而大紅大紫！結果──「好咧！來加把勁直播啦──！」放縱自我的她，衝上了超人氣VTuber之路！', '3', '3001', '1', 245, '2024-08-28', '2024-08-27 16:31:09', '周日');
INSERT INTO `animation` VALUES ('106', '身爲VTuber的我因爲忘記關台而成了傳說', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '完结', 'Live-ON是一間坐擁諸多才華洋溢的VTuber的大型公司。其中身為三期生，以「清秀」為賣點的VTuber心音淡雪，因為一時失察而忘記關台，結果──「果然高罐開起來的聲音就是爽啊！」「嗄？她也太好擼了吧？」「我要來當妳的媽媽啦！」把真面目（酗酒、喜歡女性、清秀（VTuber））暴露得一覽無遺！而到了隔天，「超多人剪了直播片段！上了趨勢榜的世界第一？這個直播觀看人數是怎麼回事！」非但沒鬧得雞飛狗跳，還因為反差效果而大紅大紫！結果──「好咧！來加把勁直播啦──！」放縱自我的她，衝上了超人氣VTuber之路！', '3', '3001', '1', 245, '2024-08-28', '2024-08-27 16:31:09', '周日');
INSERT INTO `animation` VALUES ('107', '身爲VTuber的我因爲忘記關台而成了傳說', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '完结', 'Live-ON是一間坐擁諸多才華洋溢的VTuber的大型公司。其中身為三期生，以「清秀」為賣點的VTuber心音淡雪，因為一時失察而忘記關台，結果──「果然高罐開起來的聲音就是爽啊！」「嗄？她也太好擼了吧？」「我要來當妳的媽媽啦！」把真面目（酗酒、喜歡女性、清秀（VTuber））暴露得一覽無遺！而到了隔天，「超多人剪了直播片段！上了趨勢榜的世界第一？這個直播觀看人數是怎麼回事！」非但沒鬧得雞飛狗跳，還因為反差效果而大紅大紫！結果──「好咧！來加把勁直播啦──！」放縱自我的她，衝上了超人氣VTuber之路！', '3', '3001', '1', 245, '2024-08-28', '2024-08-27 16:31:09', '周日');
INSERT INTO `animation` VALUES ('108', '身爲VTuber的我因爲忘記關台而成了傳說', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '完结', 'Live-ON是一間坐擁諸多才華洋溢的VTuber的大型公司。其中身為三期生，以「清秀」為賣點的VTuber心音淡雪，因為一時失察而忘記關台，結果──「果然高罐開起來的聲音就是爽啊！」「嗄？她也太好擼了吧？」「我要來當妳的媽媽啦！」把真面目（酗酒、喜歡女性、清秀（VTuber））暴露得一覽無遺！而到了隔天，「超多人剪了直播片段！上了趨勢榜的世界第一？這個直播觀看人數是怎麼回事！」非但沒鬧得雞飛狗跳，還因為反差效果而大紅大紫！結果──「好咧！來加把勁直播啦──！」放縱自我的她，衝上了超人氣VTuber之路！', '3', '3001', '1', 245, '2024-08-28', '2024-08-27 16:31:09', '周日');
INSERT INTO `animation` VALUES ('109', '身爲VTuber的我因爲忘記關台而成了傳說', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '完结', 'Live-ON是一間坐擁諸多才華洋溢的VTuber的大型公司。其中身為三期生，以「清秀」為賣點的VTuber心音淡雪，因為一時失察而忘記關台，結果──「果然高罐開起來的聲音就是爽啊！」「嗄？她也太好擼了吧？」「我要來當妳的媽媽啦！」把真面目（酗酒、喜歡女性、清秀（VTuber））暴露得一覽無遺！而到了隔天，「超多人剪了直播片段！上了趨勢榜的世界第一？這個直播觀看人數是怎麼回事！」非但沒鬧得雞飛狗跳，還因為反差效果而大紅大紫！結果──「好咧！來加把勁直播啦──！」放縱自我的她，衝上了超人氣VTuber之路！', '3', '3001', '1', 245, '2024-08-28', '2024-08-27 16:31:09', '周日');
INSERT INTO `animation` VALUES ('1010', '身爲VTuber的我因爲忘記關台而成了傳說', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '完结', 'Live-ON是一間坐擁諸多才華洋溢的VTuber的大型公司。其中身為三期生，以「清秀」為賣點的VTuber心音淡雪，因為一時失察而忘記關台，結果──「果然高罐開起來的聲音就是爽啊！」「嗄？她也太好擼了吧？」「我要來當妳的媽媽啦！」把真面目（酗酒、喜歡女性、清秀（VTuber））暴露得一覽無遺！而到了隔天，「超多人剪了直播片段！上了趨勢榜的世界第一？這個直播觀看人數是怎麼回事！」非但沒鬧得雞飛狗跳，還因為反差效果而大紅大紫！結果──「好咧！來加把勁直播啦──！」放縱自我的她，衝上了超人氣VTuber之路！', '3', '3001', '1', 245, '2024-08-28', '2024-08-27 16:31:09', '周日');
INSERT INTO `animation` VALUES ('1011', '身爲VTuber的我因爲忘記關台而成了傳說', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '完结', 'Live-ON是一間坐擁諸多才華洋溢的VTuber的大型公司。其中身為三期生，以「清秀」為賣點的VTuber心音淡雪，因為一時失察而忘記關台，結果──「果然高罐開起來的聲音就是爽啊！」「嗄？她也太好擼了吧？」「我要來當妳的媽媽啦！」把真面目（酗酒、喜歡女性、清秀（VTuber））暴露得一覽無遺！而到了隔天，「超多人剪了直播片段！上了趨勢榜的世界第一？這個直播觀看人數是怎麼回事！」非但沒鬧得雞飛狗跳，還因為反差效果而大紅大紫！結果──「好咧！來加把勁直播啦──！」放縱自我的她，衝上了超人氣VTuber之路！', '3', '3001', '1', 245, '2024-08-28', '2024-08-27 16:31:09', '周日');
INSERT INTO `animation` VALUES ('1012', '身爲VTuber的我因爲忘記關台而成了傳說', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '完结', 'Live-ON是一間坐擁諸多才華洋溢的VTuber的大型公司。其中身為三期生，以「清秀」為賣點的VTuber心音淡雪，因為一時失察而忘記關台，結果──「果然高罐開起來的聲音就是爽啊！」「嗄？她也太好擼了吧？」「我要來當妳的媽媽啦！」把真面目（酗酒、喜歡女性、清秀（VTuber））暴露得一覽無遺！而到了隔天，「超多人剪了直播片段！上了趨勢榜的世界第一？這個直播觀看人數是怎麼回事！」非但沒鬧得雞飛狗跳，還因為反差效果而大紅大紫！結果──「好咧！來加把勁直播啦──！」放縱自我的她，衝上了超人氣VTuber之路！', '3', '3001', '1', 245, '2024-08-28', '2024-08-27 16:31:09', '周日');

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
INSERT INTO `categories` VALUES (3, '校园', '[{\"classname\": \"喜剧\",\"classid\": \"3001\"},{\"classname\": \"恋情\",\"classid\": \"3002\"}]');

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
INSERT INTO `detailed` VALUES ('101', '敗犬女主太多了！', '[\"梅田修一朗\",\"遠野光\",\"若山詩音\",\"寺澤百花\",\"種崎敦美\",\"田中美海\",\"小林裕介\"]', '[\"喜剧\", \"奇幻\", \"校园\"]', 'http://172.17.1.13:1008/images/nav.webp', '2024-08-03', '日语', '北村翔太郎 ', '{\"1\": [{\"link\": \"\", \"title\": \"第1集\"}, {\"link\": \"\", \"title\": \"第2集\"}], \"2\": [{\"link\": \"\", \"title\": \"第1集\"}, {\"link\": \"\", \"title\": \"第2集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\", \"https://v11.tlkqc.com/wjv11/202407/14/469JNKg4eQ83/video/index3.m3u8\"], \"2\": [\"https://v11.tlkqc.com/wjv11/202407/14/469JNKg4eQ83/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/21/6Az9pTuZWd84/video/index.m3u8\"]}', '9.0', '日本', '更新中');
INSERT INTO `detailed` VALUES ('102', '\r\n不時輕聲地以俄語遮羞的鄰座艾莉同學', '[\"天崎滉平\",\" 上坂堇\",\" 丸岡和佳奈\",\"藤井雪代\",\"會澤紗彌\",\"河濑茉希\",\"石川界人\",\"長谷川育美\",\"青山吉能\",\"酒井廣大\",\"市川太一\" ]', '[\"恋爱\",\"校园\"]', 'http://172.17.1.13:1008/images/nav2.webp', '2024-07-03', '日语', '伊藤良太 ', '{\"1\": [{\"link\": \"\", \"title\": \"第1集\"}, {\"link\": \"\", \"title\": \"第2集\"}], \"2\": [{\"link\": \"\", \"title\": \"第1集\"}, {\"link\": \"\", \"title\": \"第2集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\", \"https://v11.tlkqc.com/wjv11/202407/14/469JNKg4eQ83/video/index3.m3u8\"], \"2\": [\"https://v11.tlkqc.com/wjv11/202407/14/469JNKg4eQ83/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/21/6Az9pTuZWd84/video/index.m3u8\"]}', '9.0', '日本', '更新中');
INSERT INTO `detailed` VALUES ('\r\n103', '\r\n狼與香辛料 重制版', '[\"小清水亞美\",\"福山潤\"]', '[\"冒險\",\"愛情\",\"奇幻\",\"劇情\"]', 'https://anime.girigirilove.com/upload/vod/20240323-1/f956eeafab61c085bac118872a579c77.webp', '2024-07-19', '日语', '高橋丈夫 ', '{\"1\": [{\"link\": \"\", \"title\": \"第1集\"}, {\"link\": \"\", \"title\": \"第2集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/狼与香辛料重制版/playGV25880-1-1.mp4\", \"http://172.17.1.13:1008/mp4/狼与香辛料重制版/playGV25880-1-2.mp4\"]}', '7.0', '日本', '更新中');
INSERT INTO `detailed` VALUES ('104', '身爲VTuber的我因爲忘記關台而成了傳說', '[\"佐倉绫音\"]', '[\"喜劇\"]', 'https://anime.girigirilove.com/upload/vod/20240626-1/8388226dfd8a7559b051b0077c95ff17.webp', '2024-08-27', '日语', '朝岡卓矢 ', '{\"1\": [{\"link\": \"\", \"title\": \"第1集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/身为VTuber的我/playGV25999-1-1.mp4\"]}', '10', '日本', '完结');

SET FOREIGN_KEY_CHECKS = 1;
