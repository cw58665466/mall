
--  修复微信登录默认值

ALTER TABLE `jshop_user_wx` CHANGE `unionid` `unionid` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;
ALTER TABLE `jshop_user_wx` CHANGE `type` `type` TINYINT(1) UNSIGNED NULL DEFAULT '1' COMMENT '第三方登录类型，1微信小程序，2微信公众号';
ALTER TABLE `jshop_user_wx` CHANGE `openid` `openid` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL;
ALTER TABLE `jshop_user_wx` CHANGE `session_key` `session_key` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;
ALTER TABLE `jshop_user_wx` CHANGE `gender` `gender` SMALLINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别 0：未知、1：男、2：女';
ALTER TABLE `jshop_user_wx` CHANGE `language` `language` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言';
ALTER TABLE `jshop_user_wx` CHANGE `city` `city` VARCHAR(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市';
ALTER TABLE `jshop_user_wx` CHANGE `province` `province` VARCHAR(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省';
ALTER TABLE `jshop_user_wx` CHANGE `country` `country` VARCHAR(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家';
ALTER TABLE `jshop_user_wx` CHANGE `country_code` `country_code` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码国家编码';
ALTER TABLE `jshop_user_wx` CHANGE `mobile` `mobile` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码';


INSERT INTO `jshop_payments` (`id`, `code`, `name`, `is_online`, `params`, `sort`, `memo`, `status`) VALUES
(4, 'balancepay', '余额支付', 1, '', 100, '账户余额支付', 1);


UPDATE  jshop_area SET  `id` =  '920001' WHERE  name ="富阳市";
UPDATE  jshop_area SET  `id` =  '920000' WHERE  name ="静海县";
UPDATE  jshop_area SET  `id` =  '920002' WHERE  name ="郑东新区";
UPDATE  jshop_area SET  `id` =  '920003' WHERE  name ="萝岗区";
ALTER TABLE `jshop_area` ADD PRIMARY KEY(`id`);


ALTER TABLE  `jshop_goods_images` ADD  `sort` INT( 10 ) NULL DEFAULT  '100' COMMENT  '图片排序' AFTER  `image_id` ;



--
-- 表的结构 `微信图文消息表`
--

CREATE TABLE IF NOT EXISTS `jshop_weixin_media_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `brief` varchar(255) DEFAULT NULL COMMENT '摘要',
  `image` char(32) DEFAULT NULL COMMENT '封面',
  `content` text COMMENT '文章详情',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `ctime` bigint(12) DEFAULT '0' COMMENT '创建时间',
  `utime` bigint(12) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='微信图文消息表' AUTO_INCREMENT=8 ;



ALTER TABLE  `jshop_weixin_message` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;


ALTER TABLE  `jshop_weixin_message` ADD  `enable` TINYINT( 1 ) NULL DEFAULT  '1' COMMENT  '1启用，2禁用' AFTER  `is_default` ;


--  地区添加索引
ALTER TABLE `jshop_area` ADD INDEX( `id`, `parent_id`, `name`);



--
-- 插入之前先把表清空（truncate） `jshop_operation`
--

TRUNCATE TABLE `jshop_operation`;
--
-- 转存表中的数据 `jshop_operation`
--

INSERT INTO `jshop_operation` (`id`, `parent_id`, `name`, `code`, `type`, `parent_menu_id`, `perm_type`, `sort`) VALUES
(2, 1, '管理后台', 'manage', 'm', 1, 1, 200),
(238, 2, '会员管理', 'User', 'c', 2, 1, 100),
(239, 238, '用户列表', 'index', 'a', 238, 1, 100),
(240, 238, '商品评价', 'comment', 'a', 305, 1, 101),
(242, 238, '积分记录查询', 'pointlog', 'a', 239, 2, 100),
(243, 238, '积分编辑', 'editpoint', 'a', 239, 2, 100),
(244, 2, '控制面板', 'Setting', 'c', 2, 1, 200),
(245, 244, '店铺设置', 'index', 'a', 244, 1, 100),
(246, 2, '支付方式', 'Payments', 'c', 2, 3, 100),
(247, 246, '支付方式列表', 'index', 'a', 399, 1, 100),
(249, 246, '支付方式修改', 'edit', 'a', 247, 2, 100),
(251, 246, '支付方式启/禁用', 'changestatus', 'a', 249, 2, 100),
(252, 2, '文章分类', 'ArticleType', 'c', 2, 3, 100),
(253, 252, '文章分类', 'index', 'a', 266, 1, 100),
(254, 252, '文章分类添加', 'add', 'a', 253, 2, 100),
(255, 252, '文章分类修改', 'edit', 'a', 253, 2, 100),
(256, 252, '文章分类删除', 'del', 'a', 253, 2, 100),
(257, 252, '文章添加子分类', 'addson', 'a', 253, 3, 100),
(258, 2, '文章管理', 'Article', 'c', 2, 3, 100),
(259, 258, '文章列表', 'index', 'a', 266, 1, 100),
(260, 258, '文章添加', 'add', 'a', 259, 2, 100),
(261, 258, '文章修改', 'edit', 'a', 259, 2, 100),
(262, 258, '文章删除', 'del', 'a', 259, 2, 100),
(263, 2, '优惠券管理', 'Coupon', 'c', 2, 3, 140),
(264, 263, '优惠券领取列表', 'index', 'a', 361, 2, 100),
(265, 263, '优惠券删除', 'del', 'a', 361, 2, 100),
(266, 2, '运营管理', 'Notice', 'c', 2, 1, 130),
(267, 266, '公告列表', 'index', 'a', 266, 1, 100),
(268, 266, '公告添加', 'add', 'a', 267, 2, 100),
(269, 266, '公告修改', 'edit', 'a', 267, 2, 100),
(270, 266, '公告删除', 'del', 'a', 267, 2, 100),
(271, 2, '广告位管理', 'AdvertPosition', 'c', 2, 3, 100),
(272, 271, '广告位列表', 'index', 'a', 266, 1, 100),
(273, 271, '广告位添加', 'add', 'a', 272, 2, 100),
(274, 271, '广告位修改', 'edit', 'a', 272, 2, 100),
(275, 271, '广告位删除', 'del', 'a', 272, 2, 100),
(277, 2, '广告管理', 'Advertisement', 'c', 2, 3, 100),
(278, 277, '广告列表', 'index', 'a', 266, 1, 100),
(279, 277, '广告添加', 'add', 'a', 278, 2, 100),
(280, 277, '广告修改', 'edit', 'a', 278, 2, 100),
(281, 277, '广告删除', 'del', 'a', 278, 2, 100),
(282, 277, '获取商品', 'getgoods', 'a', 278, 3, 100),
(283, 277, '获取文章', 'getarticle', 'a', 278, 3, 100),
(284, 277, '获取商品名称', 'goodsinfo', 'a', 278, 3, 100),
(285, 277, '获取文章名称', 'articleinfo', 'a', 278, 3, 100),
(286, 2, '品牌管理', 'Brand', 'c', 2, 3, 100),
(287, 286, '品牌列表', 'index', 'a', 305, 1, 30),
(288, 286, '品牌添加', 'add', 'a', 287, 2, 100),
(289, 286, '品牌修改', 'edit', 'a', 287, 2, 100),
(290, 286, '品牌删除', 'del', 'a', 287, 2, 100),
(291, 2, '商品分类', 'Categories', 'c', 2, 3, 100),
(292, 291, '商品分类', 'index', 'a', 305, 1, 20),
(293, 291, '添加商品分类', 'add', 'a', 292, 2, 100),
(294, 291, '编辑商品分类', 'edit', 'a', 292, 2, 100),
(295, 291, '删除商品分类', 'del', 'a', 292, 2, 100),
(296, 2, '订单管理', 'Order', 'c', 2, 1, 120),
(297, 296, '订单列表', 'index', 'a', 296, 1, 90),
(298, 296, '查看订单详情', 'view', 'a', 297, 3, 100),
(299, 296, '编辑订单', 'edit', 'a', 297, 2, 100),
(300, 296, '订单发货', 'ship', 'a', 297, 2, 100),
(301, 296, '取消订单', 'cancel', 'a', 299, 3, 100),
(302, 296, '完成订单', 'complete', 'a', 299, 3, 100),
(303, 296, '删除订单', 'del', 'a', 297, 2, 100),
(304, 296, '物流查询', 'logistics', 'a', 297, 3, 100),
(305, 2, '商品管理', 'Goods', 'c', 2, 1, 110),
(306, 305, '商品列表', 'index', 'a', 305, 1, 10),
(307, 305, '添加商品', 'add', 'a', 306, 2, 100),
(308, 305, '保存商品', 'doAdd', 'a', 307, 3, 100),
(309, 305, '商品评价列表', 'commentlist', 'a', 306, 2, 100),
(310, 305, '商品评价详情', 'getcommentinfo', 'a', 309, 3, 100),
(311, 305, '商家回复', 'sellercontent', 'a', 309, 3, 100),
(312, 305, '前台展示状态', 'setdisplay', 'a', 164, 3, 100),
(313, 305, '获取子分类', 'getcat', 'a', 306, 3, 100),
(314, 305, '获取规格信息', 'getspec', 'a', 306, 3, 100),
(315, 305, '生成多规格', 'getspechtml', 'a', 306, 3, 100),
(316, 305, '编辑商品', 'edit', 'a', 306, 2, 100),
(317, 305, '保存编辑商品信息', 'doedit', 'a', 316, 3, 100),
(318, 305, '批量上下架', 'batchmarketable', 'a', 316, 3, 100),
(319, 305, '批量删除', 'batchdel', 'a', 321, 3, 100),
(320, 305, '商品高级筛选', 'goodssearch', 'a', 306, 3, 100),
(321, 305, '删除商品', 'del', 'a', 306, 2, 100),
(322, 305, '设置热门或推荐', 'changestate', 'a', 316, 3, 100),
(323, 2, '商品类型管理', 'GoodsType', 'c', 2, 3, 100),
(324, 323, '商品类型', 'index', 'a', 305, 1, 40),
(325, 323, '添加类型', 'add', 'a', 324, 2, 100),
(326, 323, '关联属性', 'addrel', 'a', 324, 3, 100),
(327, 323, '编辑属性', 'edit', 'a', 324, 2, 100),
(328, 323, '删除属性', 'del', 'a', 324, 2, 100),
(329, 323, '关联参数', 'addparams', 'a', 324, 3, 100),
(330, 2, '商品属性', 'GoodsTypeSpec', 'c', 2, 3, 100),
(331, 330, '商品属性', 'index', 'a', 305, 1, 50),
(332, 330, '添加属性', 'add', 'a', 331, 3, 100),
(333, 330, '编辑属性', 'edit', 'a', 331, 3, 100),
(334, 330, '删除属性', 'del', 'a', 331, 3, 100),
(335, 2, '配送方式', 'Ship', 'c', 2, 3, 100),
(336, 335, '配送方式列表', 'index', 'a', 244, 1, 100),
(337, 335, '添加配送方式', 'add', 'a', 336, 2, 100),
(338, 335, '编辑配送方式', 'edit', 'a', 336, 2, 100),
(339, 335, '删除配送方式', 'del', 'a', 336, 2, 100),
(340, 335, '选择地区', 'choosearea', 'a', 336, 3, 100),
(343, 2, '售后单管理', 'BillAftersales', 'c', 2, 3, 100),
(344, 343, '售后单列表', 'index', 'a', 296, 1, 140),
(345, 343, '售后单审核', 'audit', 'a', 344, 2, 100),
(346, 343, '售后单查看', 'view', 'a', 344, 3, 100),
(347, 2, '退货单管理', 'BillReship', 'c', 2, 3, 100),
(348, 347, '退货单列表', 'index', 'a', 296, 1, 160),
(349, 347, '退货单查看', 'view', 'a', 348, 3, 100),
(350, 347, '退货单确认收货', 'confirmreship', 'a', 348, 2, 100),
(351, 2, '退款单管理', 'BillRefund', 'c', 2, 3, 150),
(352, 351, '退款单列表', 'index', 'a', 399, 1, 110),
(353, 351, '退款单查看', 'view', 'a', 352, 3, 100),
(354, 351, '操作退款', 'refund', 'a', 252, 2, 100),
(355, 351, '再次退款', 'reaudit', 'a', 354, 3, 100),
(356, 2, '促销管理', 'Promotion', 'c', 2, 1, 150),
(357, 356, '促销列表', 'index', 'a', 356, 1, 100),
(358, 356, '添加促销', 'add', 'a', 357, 2, 100),
(359, 356, '促销编辑', 'edit', 'a', 357, 2, 100),
(360, 356, '促销删除', 'del', 'a', 357, 2, 100),
(361, 356, '优惠券列表', 'coupon', 'a', 356, 1, 100),
(362, 356, '添加优惠券规则', 'couponadd', 'a', 361, 2, 100),
(363, 356, '优惠券规则编辑', 'couponedit', 'a', 361, 2, 100),
(364, 356, '优惠券规则删除', 'coupondel', 'a', 361, 2, 100),
(365, 2, '门店管理', 'Store', 'c', 2, 3, 220),
(366, 365, '门店列表', 'index', 'a', 244, 1, 100),
(367, 365, '门店添加', 'add', 'a', 366, 2, 100),
(368, 365, '门店修改', 'edit', 'a', 366, 2, 100),
(369, 365, '门店删除', 'del', 'a', 366, 2, 100),
(370, 365, '门店地图展现', 'showmap', 'a', 366, 3, 100),
(390, 2, '图片列表', 'images', 'c', 2, 3, 100),
(391, 390, '图片列表', 'index', 'a', 244, 1, 100),
(392, 2, '导入导出管理', 'ietask', 'c', 2, 3, 100),
(393, 392, '导入导出', 'index', 'a', 244, 1, 100),
(394, 392, '导出', 'export', 'a', 306, 2, 100),
(395, 392, '导入', 'import', 'a', 306, 2, 100),
(396, 392, '下载导入模板', 'importtemplete', 'a', 306, 3, 100),
(397, 392, '下载文件', 'down', 'a', 393, 2, 100),
(398, 392, '执行下载文件', 'dodown', 'a', 397, 3, 100),
(399, 2, '财务管理', 'BillPayments', 'c', 2, 1, 160),
(400, 399, '支付单列表', 'index', 'a', 399, 1, 100),
(401, 399, '后台支付', 'pay', 'a', 400, 2, 100),
(402, 399, '后台支付实际操作', 'topay', 'a', 401, 3, 100),
(403, 399, '支付单查看', 'index', 'a', 400, 3, 100),
(404, 2, '发货单管理', 'BillDelivery', 'c', 2, 3, 100),
(405, 404, '发货单列表', 'index', 'a', 296, 1, 100),
(406, 404, '发货单详情', 'view', 'a', 405, 3, 100),
(407, 404, '发货单明细', 'items', 'a', 405, 3, 100),
(408, 2, '消息中心', 'MessageCenter', 'c', 2, 3, 100),
(409, 408, '消息配置', 'index', 'a', 244, 1, 100),
(410, 2, '角色管理', 'Role', 'c', 2, 3, 100),
(411, 410, '角色管理', 'index', 'a', 238, 1, 210),
(412, 410, '角色添加', 'add', 'a', 411, 2, 100),
(413, 410, '角色删除', 'del', 'a', 411, 2, 100),
(414, 410, '编辑权限', 'getoperation', 'a', 411, 2, 100),
(415, 410, '角色保存权限', 'saveperm', 'a', 411, 3, 100),
(416, 2, '管理员管理', 'Manage', 'c', 2, 3, 100),
(417, 416, '管理员管理', 'index', 'a', 238, 1, 200),
(418, 416, '管理员添加', 'add', 'a', 417, 2, 100),
(419, 416, '管理员修改', 'edit', 'a', 417, 2, 100),
(420, 416, '管理员删除', 'del', 'a', 417, 2, 100),
(421, 2, '商品参数', 'GoodsParams', 'c', 2, 3, 100),
(422, 421, '参数列表', 'index', 'a', 305, 1, 100),
(423, 421, '添加参数', 'add', 'a', 422, 2, 100),
(424, 421, '编辑参数', 'edit', 'a', 422, 2, 100),
(425, 421, '删除参数', 'del', 'a', 422, 2, 100),
(426, 2, '标签管理', 'Label', 'c', 2, 3, 100),
(427, 426, '设置标签', 'setlabel', 'a', 306, 3, 100),
(428, 426, '设置标签', 'dosetlabel', 'a', 306, 3, 100),
(429, 426, '删除标签', 'dellabel', 'a', 306, 3, 100),
(430, 426, '删除标签', 'dodellabel', 'a', 306, 3, 100),
(431, 2, '账户余额模块', 'Balance', 'c', 2, 3, 100),
(432, 431, '账户资金管理', 'index', 'a', 399, 1, 150),
(434, 2, '节点控制器', 'Operation', 'c', 2, 3, 100),
(435, 434, '节点管理', 'index', 'a', 244, 1, 255),
(436, 434, '节点删除', 'del', 'a', 435, 2, 100),
(437, 434, '节点编辑', 'add', 'a', 435, 2, 100),
(438, 2, '消息控制器', 'Message', 'c', 2, 3, 100),
(439, 438, '消息管理', 'index', 'a', 239, 3, 300),
(440, 438, '消息删除', 'del', 'a', 439, 3, 100),
(441, 2, '短信控制器', 'Sms', 'c', 2, 3, 100),
(442, 441, '短信管理', 'index', 'a', 238, 1, 310),
(443, 441, '短信删除', 'del', 'a', 442, 2, 100),
(460, 431, '提现列表', 'tocash', 'a', 399, 1, 100),
(461, 431, '提现审核', 'tocashexamine', 'a', 460, 2, 100),
(462, 2, '钩子列表', 'Hooks', 'c', 2, 3, 100),
(463, 462, '钩子列表', 'index', 'a', 244, 1, 100),
(464, 2, '插件列表', 'Addons', 'c', 2, 3, 100),
(465, 464, '插件列表', 'index', 'a', 244, 1, 100),
(466, 2, '地区管理', 'Area', 'c', 2, 3, 100),
(467, 466, '地区管理', 'index', 'a', 244, 1, 100),
(468, 466, '添加地区', 'add', 'a', 467, 2, 100),
(469, 466, '编辑地区', 'edit', 'a', 467, 2, 100),
(470, 466, '删除地区', 'del', 'a', 467, 2, 100),
(471, 462, '添加钩子', 'add', 'a', 463, 2, 100),
(472, 462, '编辑钩子', 'edit', 'a', 463, 2, 100),
(473, 462, '删除钩子', 'del', 'a', 463, 2, 100),
(474, 464, '安装插件', 'install', 'a', 465, 2, 100),
(475, 464, '卸载插件', 'uninstall', 'a', 465, 2, 100),
(476, 464, '插件配置', 'setting', 'a', 465, 2, 100),
(477, 464, '保存配置', 'dosetting', 'a', 476, 3, 100),
(478, 464, '插件启用/停用', 'changestatus', 'a', 465, 2, 100),
(479, 2, '微信管理', 'Wechat', 'c', 2, 1, 220),
(480, 479, '小程序配置', 'edit', 'a', 479, 1, 100),
(481, 479, '模板列表', 'template', 'a', 479, 1, 100),
(482, 479, '保存配置', 'doEdit', 'a', 480, 3, 100),
(483, 479, '公众号配置', 'official', 'a', 479, 1, 100),
(484, 365, '店员列表', 'clerklist', 'a', 366, 2, 100),
(485, 365, '添加店员', 'addclerk', 'a', 366, 2, 100),
(486, 365, '删除店员', 'delclerk', 'a', 366, 2, 100),
(487, 2, '提货单列表', 'BillLading', 'c', 2, 3, 100),
(488, 487, '提货单列表', 'index', 'a', 296, 1, 100),
(489, 487, '提货单详情', 'info', 'a', 488, 3, 100),
(490, 487, '删除提货单', 'dellading', 'a', 488, 2, 100),
(491, 356, '团购秒杀列表', 'group', 'a', 356, 1, 100),
(492, 356, '添加团购', 'groupadd', 'a', 491, 2, 100),
(493, 356, '编辑团购', 'groupedit', 'a', 491, 2, 100),
(494, 356, '删除团购', 'groupdel', 'a', 491, 2, 100),
(495, 2, '物流公司', 'Logistics', 'c', 2, 3, 100),
(496, 495, '物流公司列表', 'index', 'a', 244, 1, 200),
(497, 495, '添加', 'add', 'a', 496, 2, 100),
(498, 495, '编辑', 'edit', 'a', 496, 2, 100),
(499, 495, '删除', 'del', 'a', 496, 2, 100),
(500, 277, '获取文章分类', 'getarticletype', 'a', 278, 3, 100),
(501, 277, '获取文章分类名称', 'articletypeinfo', 'a', 278, 3, 100),
(502, 466, '地区列表', 'getlist', 'a', 467, 3, 100),
(503, 487, '提货单核销', 'write', 'a', 488, 2, 100),
(504, 286, '获取所有品牌', 'getAll', 'a', 287, 3, 100),
(505, 291, '全部分类', 'getAll', 'a', 292, 3, 100),
(506, 305, '更新排序', 'updatesort', 'a', 316, 3, 100),
(507, 421, '弹窗参数', 'getlist', 'a', 422, 3, 100),
(508, 323, '获取所有', 'getAll', 'a', 324, 3, 100),
(509, 330, '弹窗属性列表', 'getlist', 'a', 331, 3, 100),
(510, 408, '消息编辑', 'edit', 'a', 409, 2, 100),
(511, 2, '操作日志', 'OperationLog', 'c', 2, 3, 100),
(512, 511, '操作日志', 'index', 'a', 244, 1, 100),
(517, 479, '公众号菜单', 'officialmenu', 'a', 479, 1, 100),
(518, 479, '公众号菜单-编辑', 'officialmenu', 'a', 517, 2, 100),
(519, 479, '公众号菜单-编辑保存', 'doeditmenu', 'a', 517, 2, 100),
(520, 479, '公众号菜单-删除', 'deletemenu', 'a', 517, 2, 100),
(521, 479, '公众号菜单-同步', 'updatemenu', 'a', 517, 2, 100),
(522, 479, '微信消息管理', 'message', 'a', 479, 1, 100),
(523, 479, '微信消息-添加', 'addMessage', 'a', 522, 2, 100),
(524, 479, '微信消息-删除', 'delMessage', 'a', 522, 2, 100),
(525, 479, '微信消息-编辑', 'editMessage', 'a', 522, 2, 100),
(526, 479, '微信消息-互动', 'autoreply', 'a', 522, 2, 100),
(527, 479, '编辑图文', 'editmediamessage', 'a', 522, 3, 100),
(528, 479, '保存图文消息', 'doeditmediamessage', 'a', 522, 3, 100),
(529, 238, '邀请人修改', 'editinvite', 'a', 239, 2, 100),
(530, 238, '会员编辑', 'edituser', 'a', 239, 2, 100),
(531, 238, '余额修改', 'editmoney', 'a', 239, 2, 100),
(532, 238, '余额明细', 'moneylog', 'a', 239, 2, 100),
(533, 238, '添加会员', 'adduser', 'a', 239, 2, 100);
