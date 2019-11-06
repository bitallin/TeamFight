/*
 Navicat Premium Data Transfer

 Source Server         : 127001
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : teamfight

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 06/11/2019 19:57:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hero_info
-- ----------------------------
DROP TABLE IF EXISTS `hero_info`;
CREATE TABLE `hero_info`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用',
  `hp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血量',
  `armor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '护甲',
  `magic_resistance` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '魔抗',
  `attack` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '攻击力',
  `attack_speed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '攻击速度',
  `attack_distance` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '攻击距离',
  `dps` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每秒伤害',
  `skill` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技能名称',
  `skill_intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技能介绍',
  `race` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种族',
  `profession` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职业',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hero_info
-- ----------------------------
INSERT INTO `hero_info` VALUES (1, '冰晶凤凰', '5', '650/1170/2340', '20', '20', '40', '0.6', '3', '24', 'R：冰川风暴', '艾尼维亚引导一次大型冰风暴，对其中的敌人造成伤害。伤害：700/950/1200', '极地', '元素使');
INSERT INTO `hero_info` VALUES (2, '铸星龙王', '4', '650/1080/2160', '20', '20', '40', '0.6', '3', '24', 'R：星弦高落', '奥瑞利安 · 索尔沿直线喷出一道龙息，来对敌人造成伤害。 伤害：250/500/700', '龙', '法师');
INSERT INTO `hero_info` VALUES (3, '暗裔剑魔', '3', '700/1350/2700', '25', '20', '65', '0.65', '1', '42', 'Q：暗裔之刃', '亚托克斯顺劈他面前的区域，对区域内的敌人造成伤害。伤害：250/600/950', '恶魔', '剑士');
INSERT INTO `hero_info` VALUES (4, '蒸汽机器人', '2', '600/1080/2160', '35', '20', '50', '0.5', '1', '25', 'Q：机器人飞爪', '布里茨将距离最远的敌人拉到他面前。  伤害：100/450/800', '机器人', '斗士');
INSERT INTO `hero_info` VALUES (5, '复仇焰魂', '4', '700/1260/2520', '25', '20', '60', '0.6', '3', '36', 'R：烈焰风暴', '布兰德发射一团会弹射的火球，对命中的所有敌人造成伤害。 伤害：200/375/550', '恶魔', '元素使');
INSERT INTO `hero_info` VALUES (6, '寒冰射手', '3', '550/990/1980', '20', '20', '65', '0.7', '4', '42', 'R：魔法水晶箭', '艾希发射一支箭来横穿地图。在一段长久的延迟后，它会对一名随机敌人造成伤害和晕眩效果。 伤害：200/400/600', '极地', '游侠');
INSERT INTO `hero_info` VALUES (7, '九尾妖狐', '2', '450/810/1620', '20', '20', '50', '0.55', '3', '28', 'Q：欺诈宝珠', '阿狸沿直线发射一颗会折返的法球，对沿途的敌人造成伤害。伤害：100/175/250', '狂野', '法师');
INSERT INTO `hero_info` VALUES (8, '离群之刺', '4', '700/1260/2520', '20', '20', '70', '0.75', '1', '53', 'Q：我流奥义！寒影', '阿卡丽朝她前方掷出手里剑，造成伤害。伤害：150/275/400', '忍者', '刺客');
INSERT INTO `hero_info` VALUES (9, '科加斯', '4', '1000/2000/4000', '20', '20', '70', '0.6', '1', '39', 'Q：破裂', '科加斯碎裂一片区域，对区域内的敌人造成伤害和击飞晕眩效果。 伤害：200/400/600', '虚空', '斗士');
INSERT INTO `hero_info` VALUES (10, '诺克萨斯之手', '1', '600/1080/2106', '25', '20', '50', '0.5', '1', '25', 'Q：大杀四方', '德莱厄斯挥舞他的斧头，对附近的敌人造成伤害并基于他的已损失生命值来治疗自身。 伤害：150/200/250', '帝国', '骑士');
INSERT INTO `hero_info` VALUES (11, '德莱文', '4', '700/1260/2520', '25', '20', '75', '0.75', '3', '49', 'Q：旋转飞斧', '德莱文获得额外攻击特效伤害和攻击速度。至多可叠加2次。', '帝国', '剑士');
INSERT INTO `hero_info` VALUES (12, '蜘蛛女皇', '1', '450/900/1800', '20', '20', '40', '0.6', '2', '40', 'R：蜘蛛形态', '伊莉丝自身变形成为蜘蛛，并召唤幼蛛。 小蜘蛛的数目：1/2/4。现在小蜘蛛会获得恶魔种族的特质', '恶魔', '换形师');
INSERT INTO `hero_info` VALUES (13, '痛苦之拥', '3', '600/990/1980', '20', '20', '70', '0.6', '1', '30', 'R：最终抚慰', '伊芙琳对距离最近的3名敌人造成伤害，同时自身传送到远处。 伤害：200/300/400 处决血限：65% 生命值   处决伤害倍数：300/500/700%', '恶魔', '刺客');
INSERT INTO `hero_info` VALUES (14, '无双剑姬', '1', '400/720/1440', '25', '20', '40', '1.0', '1', '28', 'W：劳伦特心眼刀', '菲奥娜变得免疫伤害和技能。在短暂的延迟后，她会对距离最近的敌人造成伤害和晕眩效果。  伤害：100/200/400​', '贵族', '剑士');
INSERT INTO `hero_info` VALUES (15, '海洋之灾', '3', '700/1080/2160', '20', '20', '55', '0.65', '1', '33', 'E：炸药桶', '普朗克周期性地制造火药桶。在施放时，普朗克会引爆火药桶来伤害附近的敌人。 伤害：200/325/450', '海盗', '剑士|枪手');
INSERT INTO `hero_info` VALUES (16, '布隆', '2', '750/1350/2700', '75', '20', '40', '0.6', '1', '24', 'E：坚不可摧', '布隆创造一道屏障来格挡所有即将到来的伤害。 减少伤害：70/80/90', '极地', '护卫');
INSERT INTO `hero_info` VALUES (17, '盖伦', '1', '600/1080/2160', '40', '20', '50', '0.6', '1', '30', 'E：审判', '盖伦快速地围绕自身旋转他的剑刃，变得免疫魔法伤害，同时会对附近的敌人造成伤害。 总伤害：360/585/810', '贵族', '骑士');
INSERT INTO `hero_info` VALUES (18, '迷失之牙', '4', '750/1530/3060', '30', '20', '50', '0.7', '2', '31', 'R：呐啊！', '纳尔变形并调到距离最远的敌人身后，同时伤害并将敌人向后猛推。 伤害：200/300/400', '狂野|约德尔人', '换形师');
INSERT INTO `hero_info` VALUES (19, '法外狂徒', '1', '450/900/1800', '20', '20', '55', '0.55', '1', '28', '被动：大号铅弹', '格雷福斯的攻击对附近的敌人造成溅射伤害。 伤害乘数：5％/10％/15％', '海盗', '枪手');
INSERT INTO `hero_info` VALUES (20, '卡尔萨斯', '5', '850/1530/3060', '25', '20', '65', '0.65', '3', '42', 'R：安魂曲', '卡尔萨斯在一段长时间的引导后对5/9/13个敌人造成伤害。 伤害：400/700/1000', '暗影', '法师');
INSERT INTO `hero_info` VALUES (21, '虚空行者', '1', '550/990/1980', '25', '20', '55', '0.6', '1', '29', 'W：虚空之刃', '卡萨丁的攻击可从敌人那里偷取法力值，并将其转化成一层护盾。 法力偷取：20/40/60', '虚空', '法师');
INSERT INTO `hero_info` VALUES (22, '卡特琳娜', '3', '450/810/1620', '20', '20', '50', '0.6', '1', '30', 'R：死亡莲华', '卡塔琳娜引导并朝附近的4/6/8名敌人投掷匕首，对他们造成伤害并减少治疗效果。伤害：40/60/80', '帝国', '刺客');
INSERT INTO `hero_info` VALUES (23, '正义天使', '5', '750/1440/2880', '40', '20', '66', '1.1', '3', '60', 'R：圣裁之刻', '凯尔为一名友军提供护盾来使该友军免疫伤害。 伤害：500/800/1100 屏蔽持续时间：2/3/4', '贵族', '骑士');
INSERT INTO `hero_info` VALUES (24, '狂暴之心', '3', '550/990/1980', '20', '20', '70', '0.6', '2', '36', 'R：秘奥义！万雷天牢引', '凯南召唤一阵风暴来环绕自身，对其内的敌人造成伤害和晕眩效果。 伤害：225/450/675', '忍者|约德尔人', '元素使');
INSERT INTO `hero_info` VALUES (25, '永猎双子', '4', '600/1080/2160', '20', '20', '60', '0.65', '3', '36', 'R：羊灵生息', '千珏创造一个领域来环绕自身，可预防友军阵亡。 持续时间：4/5/6', '暗影', '游侠');
INSERT INTO `hero_info` VALUES (26, '冰霜女巫', '2', '450/810/1620', '20', '20', '40', '0.6', '2', '24', 'R：冰封陵墓', '丽桑卓将目标封入冰块，并对附近的敌人造成伤害。在半血以下时，丽桑卓会将自己封入冰块，并变得无法被选取。  伤害：150/275/400', '极地', '元素使');
INSERT INTO `hero_info` VALUES (27, '虚空掠夺者', '1', '500/900/1800', '20', '20', '55', '', '1', '30', 'Q：品尝恐惧', '卡兹克斩击距离最近的敌人，并可对孤立无援的敌人造成额外伤害。 伤害：150/300/450', '虚空', '刺客');
INSERT INTO `hero_info` VALUES (28, '曙光女神', '4', '750/1350/2700', '100', '20', '45', '0.55', '1', '25', 'R：日炎耀斑', '蕾欧娜召唤一道天降的太阳光束，对其中心的敌人造成晕眩效果并对其内的敌人造成伤害。 晕眩时间：5/8/11', '贵族', '护卫');
INSERT INTO `hero_info` VALUES (29, '圣枪游侠', '2', '600/1080/2160', '25', '20', '65', '0.65', '3', '42', 'E：冷酷追击', '卢锡安突进到安全处，并攻击一名敌人两次，一次造成攻击伤害，另一次造成技能伤害。 第二次技能伤害：150/250/350​', '贵族', '枪手');
INSERT INTO `hero_info` VALUES (30, '仙灵女巫', '2', '500/900/1800', '20', '20', '50', '0.6', '2', '30', 'R：狂野生长', '璐璐为一名友军提供额外生命值，并击飞该友军附近的敌人。  HP恢复：300/475 / 650', '约德尔人', '法师');
INSERT INTO `hero_info` VALUES (31, '赏金猎人', '5', '650/1170/2340', '20', '20', '75', '0.85', '660', '64', 'R：弹幕时间', '厄运小姐呈锥形引导并发射若干波子弹。 伤害：800/1250/1700', '海盗', '枪手');
INSERT INTO `hero_info` VALUES (32, '铁铠冥魂', '1', '550/900/1800', '40', '20', '50', '0.5', '1', '25', 'Q：破灭之锤', '莫德凯撒朝他前方挥舞他的权杖，沿直线造成伤害。 伤害：200/325/450', '暗影', '骑士');
INSERT INTO `hero_info` VALUES (33, '狂野女猎手', '1', '500/900/1800', '20', '20', '50', '0.65', '3', '33', 'E：野性奔腾', '奈德丽治疗自身和伤势最重的友军，然后变形。  伤害：20/70/120', '狂野', '换形师');
INSERT INTO `hero_info` VALUES (34, '圣锤之毅', '3', '750/1350/2700', '40', '20', '50', '0.5', '1', '25', 'R：持卫的裁决', '波比砸下她的铁锤，来震开附近的敌人并造成眩晕。 伤害：300/400/500  命中目标个数：1/2/3​', '约德尔人', '骑士');
INSERT INTO `hero_info` VALUES (35, '堕落天使', '3', '650/1170/2340', '20', '20', '50', '0.6', '2', '30', 'R：灵魂镣铐', '莫甘娜对附近的敌人放处于枷锁，在短暂的延迟后，如果敌人仍在附近，则莫甘娜会对他们造成伤害和晕眩效果。 伤害：200/325/500', '恶魔', '法师');
INSERT INTO `hero_info` VALUES (36, '血港魅影', '2', '600/1080/2160', '25', '20', '60', '0.6', '1', '36', 'E：魅影浪洄', '派克突进到距离最远的敌人身后，创造一道残影来晕眩沿途的敌人。 伤害：150/200/250', '海盗', '刺客');
INSERT INTO `hero_info` VALUES (37, '虚空遁地兽', '2', '650/1170/2340', '20', '20', '50', '0.65', '1', '26', 'W：遁地', '雷克塞遁入地底一小段时间，来变得无法被选取并治疗自身。当雷克塞破土而出时，她会造成伤害并击飞距离最近的敌人。 伤害：200/350/500，治疗：150/300/450', '虚空', '斗士');
INSERT INTO `hero_info` VALUES (38, '龙血武姬', '3', '650/990/1980', '30', '20', '50', '0.7', '1', '33', 'R：魔龙降世', '希瓦娜突进到远处并变形。在变形状态下，希瓦娜的攻击力增加并变为远程，攻击会使地面燃烧。 烧伤伤害：200/300/400 龙形态下的额外攻击力：100/150/200​', '龙', '换形师');
INSERT INTO `hero_info` VALUES (39, '傲之追猎者', '3', '550/990/1920', '20', '20', '55', '0.55', '1', '30', 'Q：残忍无情', '雷恩加尔跃向伤势最近的敌人并对其进行背刺。 伤害乘数：210％/320％/430％', '狂野', '刺客');
INSERT INTO `hero_info` VALUES (40, '暮光之眼', '2', '650/1170/2340', '30', '20', '65', '0.7', '1', '39', 'W：奥义！魂佑', '慎创造一个领域来环绕自身，允许友军闪避所有攻击。 区域持续时间：3/4/5', '忍者', '剑士');
INSERT INTO `hero_info` VALUES (41, '北地之怒', '4', '850/1530/3060', '40', '25', '45', '0.55', '1', '25', 'R：极冰寒狱', '瑟庄妮创造一团大型的冰川风暴，在短暂的延迟后，对其内的敌人造成晕眩效果。 伤害：100/175/250 眩晕时间：2/4/6秒', '极地', '骑士');
INSERT INTO `hero_info` VALUES (42, '斯维因', '5', '850/1530/3060', '25', '20', '65', '0.65', '2', '42', 'R：恶魔耀光', '斯维因变形，可从附近的所有敌人那里吸取生命值。  伤害：300/600/900', '恶魔|帝国', '换形师');
INSERT INTO `hero_info` VALUES (43, '惩戒之箭', '2', '500/900/1800', '25', '20', '50', '0.7', '4', '35', 'Q：破甲箭', '韦鲁斯引导并射出一支箭，对一条直线上的所有敌人造成伤害。 伤害：300/550/900', '恶魔', '游侠');
INSERT INTO `hero_info` VALUES (44, '暗夜猎手', '1', '550/990/1980', '25', '20', '40', '0.75', '3', '27', 'W：圣银弩箭', '薇恩每第三次攻击造成基于目标最大生命值的额外真实伤害。', '贵族', '游侠');
INSERT INTO `hero_info` VALUES (45, '祖安怒兽', '1', '600/1080/2160', '30', '20', '50', '0.6', '1', '30', 'R：无尽束缚', '沃里克扑向生命值最低的敌人，造成伤害和晕眩效果，同时附加普攻特效。 伤害：150/225/300', '狂野', '斗士');
INSERT INTO `hero_info` VALUES (46, '邪恶小法师', '3', '500/810/1620', '20', '20', '45', '0.55', '3', '25', 'R：能量爆裂', '维迦用魔法能量来轰击一名敌人。如果敌人的星级低于维迦，那么这个技能会将其立刻击杀。  伤害：300/450/600', '约德尔人', '法师');
INSERT INTO `hero_info` VALUES (47, '疾风剑豪', '5', '700/1260/2520', '35', '20', '75', '1', '1', '65', 'Q：斩钢闪', '亚索向前戳刺来造成伤害。在第三次施放时，亚索会吹出一道龙卷风，来对一条直线上的敌人造成伤害和击飞效果。 伤害：150/350/550', '浪人', '剑士');
INSERT INTO `hero_info` VALUES (48, '影流之主', '2', '500/900/1800', '25', '20', '65', '0.65', '1', '39', 'Q：影奥义！诸刃', '劫沿直线扔出一枚手里剑，对沿途的敌人造成伤害。 伤害：200/300/400', '忍者', '刺客');
INSERT INTO `hero_info` VALUES (49, '卡牌大师', '2', '450/810/1620', '20', '20', '40/72/144', '0.75', '3', '30/54/108', '选牌', '选牌 卡牌大师丢出一张卡牌，可以随机造成眩晕(金色)，目标周围的范围伤害(红色)或者是为自己和附近友军回复法力值(蓝色)的效果。技能伤害：150/250/350。', '海盗', '法师');
INSERT INTO `hero_info` VALUES (50, '麦林炮手', '1', NULL, '20', NULL, '50', NULL, '4', NULL, 'E：爆炸火花', '崔丝塔娜将一颗炸弹放置到她的当前目标的身上，并在4次攻击后引爆该炸弹，来伤害附近的敌人。 伤害：150/225/300', '约德尔人', '枪手');
INSERT INTO `hero_info` VALUES (51, '雷霆咆哮', '3', NULL, '35', NULL, '75', NULL, '1', NULL, NULL, NULL, '极地', '斗士');
INSERT INTO `hero_info` VALUES (52, '卡蜜尔', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '卡蜜尔的技能是【海克斯最后通牒】，会禁锢一名敌人并迫使她范围内的队友优先攻击她的当前目标。', '海克斯科技', '剑士');
INSERT INTO `hero_info` VALUES (53, '杰斯', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '用他的【雷霆一击】击退一名敌方单位来扰乱敌人的前排。他随后会切换到他的【墨丘利之炮】来提升攻击速度和攻击距离。', '海克斯科技', '换形师');
INSERT INTO `hero_info` VALUES (54, '蔚', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '选择距离最远的敌人并向其冲锋，震开并伤害沿途的每个敌人。一旦她到达目标敌人那里，她就会将其击飞并造成伤害。', '海克斯科技', '斗士');
INSERT INTO `hero_info` VALUES (55, '金克丝', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '在她首次参与击杀后获得【罪恶快感】，提供攻击速度加成。在她第二次参与击杀后，她会抽出她的火箭发射器【鱼骨头】，来使她的攻击造成范围伤害。', '海克斯科技', '枪手');
INSERT INTO `hero_info` VALUES (56, '战争之王', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '龙', '护卫');
INSERT INTO `hero_info` VALUES (57, '虚空之女', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '虚空', '刺客|游侠');

-- ----------------------------
-- Table structure for professions
-- ----------------------------
DROP TABLE IF EXISTS `professions`;
CREATE TABLE `professions`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `profession_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fetter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fetter_intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of professions
-- ----------------------------
INSERT INTO `professions` VALUES (1, '刺客', '3/6/9', '刺客们会额外获得150/350%的暴击伤害。非刺客类英雄的移动会在战斗开始时被减慢');
INSERT INTO `professions` VALUES (2, '剑士', '3/6/9', '剑士们的每次攻击有45%几率打出1/2/4次额外攻击。');
INSERT INTO `professions` VALUES (3, '斗士', '2/4/6', '斗士获得额外的300/700点最大生命值。');
INSERT INTO `professions` VALUES (4, '元素使', '3', '元素使们的攻击提供双倍法力值，在战斗开始时，召唤一个元素魔像。元素生命值：2500');
INSERT INTO `professions` VALUES (5, '护卫', '2', '在战斗开始时，所有守护者和邻近格子的友军获得50点护甲加成。守护者们不会给自己提供增益。');
INSERT INTO `professions` VALUES (6, '枪手', '2/4/6', '在攻击之后，枪手们的攻击有50%几率对另一名随机/另两名随机/另三名随机敌人打出额外的攻击。');
INSERT INTO `professions` VALUES (7, '骑士', '2/4/6', '整支队伍无视来自所有来源的15/30/55伤害。');
INSERT INTO `professions` VALUES (8, '游侠', '2/4', '游侠们每过3秒都有25/65%几率来使他们在接下来的3秒内攻速翻倍');
INSERT INTO `professions` VALUES (9, '换形师', '3/6', '换形师会在他们变形时获得额外的60/120%最大生命值。');
INSERT INTO `professions` VALUES (10, '法师', '3/6/9', '所有友军增加35/100%技能伤害。');

-- ----------------------------
-- Table structure for races
-- ----------------------------
DROP TABLE IF EXISTS `races`;
CREATE TABLE `races`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `race_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fetter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fetter_intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of races
-- ----------------------------
INSERT INTO `races` VALUES (1, '恶魔', '2/4/6', '恶魔的攻击有20/35/60%几率灼烧一名敌人的所有法力值并造成300%的伤害。');
INSERT INTO `races` VALUES (2, '龙', '2', '龙免疫83%魔法伤害。');
INSERT INTO `races` VALUES (3, '浪人', '1', '战斗开始时，如果一名浪人的邻近格子没有友军，获得一层等同于自身最大生命值的护盾。');
INSERT INTO `races` VALUES (4, '极地', '2/4/6', '极地生物们的攻击有20/30/45%几率对目标造成持续2秒的晕眩效果。');
INSERT INTO `races` VALUES (5, '帝国', '2/4', '1名随机/所有的帝国单位造成双倍伤害。');
INSERT INTO `races` VALUES (6, '忍者', '1/4', '提高忍者40/60攻击力和法术强度。');
INSERT INTO `races` VALUES (7, '贵族', '3/6', '增加1个随机/所有友军60护甲和魔抗并且每次攻击治疗该友军35点生命值。');
INSERT INTO `races` VALUES (8, '暗影', '2', '在战斗开始时诅咒一名随机的敌人，将其生命值设置为100');
INSERT INTO `races` VALUES (9, '海盗', '3', '在与另一名玩家作战之后，最多可赚取4枚额外的金币。（每个箱子的平均金币：1.75）');
INSERT INTO `races` VALUES (10, '机器人', '1', '机器人在开始战斗时就有满额的法力值。');
INSERT INTO `races` VALUES (11, '虚空', '2/4', '虚空单位现在造成真实伤害。');
INSERT INTO `races` VALUES (12, '狂野', '2/4', '野性友军/所有友军的攻击会生成怒气层数，最多5层，每层怒气提供8%的攻击速度加成。');
INSERT INTO `races` VALUES (13, '约德尔人', '3/6', '对友方约德尔人进行的攻击会有30/55%几率未命中。（也能闪避攻击特效。）');
INSERT INTO `races` VALUES (14, '海克斯科技', '2/4', '朝一名带着装备的敌方单位扔出一颗炸弹，并且禁用1格/2格半径范围内的所有装备，持续8秒。');

SET FOREIGN_KEY_CHECKS = 1;
