-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-21 06:19:59
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stormgu_workstation`
--

-- --------------------------------------------------------

--
-- 表的结构 `websearch_keywords`
--

CREATE TABLE `websearch_keywords` (
  `key_id` int(11) NOT NULL COMMENT '关键词id',
  `name` varchar(255) NOT NULL COMMENT '关键词集群名称',
  `keywords` text NOT NULL COMMENT '关键词集群，空格为分割'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索关键词表';

--
-- 转存表中的数据 `websearch_keywords`
--

INSERT INTO `websearch_keywords` (`key_id`, `name`, `keywords`) VALUES
(2, '违规词', '最大 最多 最好 最大 最多 最好  最大 最多 最好');

-- --------------------------------------------------------

--
-- 表的结构 `websearch_matching`
--

CREATE TABLE `websearch_matching` (
  `matching_id` int(11) NOT NULL COMMENT '相关匹配id',
  `url_id` int(11) NOT NULL COMMENT '域名id',
  `sonurl_id` int(11) NOT NULL COMMENT '子域名id',
  `url` varchar(255) NOT NULL COMMENT '子域名url',
  `keyword` varchar(255) NOT NULL COMMENT '被检测的关键词',
  `content` text NOT NULL COMMENT '被检测相关文字定位，以<->为分隔符'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='匹配表';

-- --------------------------------------------------------

--
-- 表的结构 `websearch_sonurl`
--

CREATE TABLE `websearch_sonurl` (
  `sonurl_id` int(11) NOT NULL COMMENT '子域名id',
  `url_id` int(11) NOT NULL COMMENT '主域名',
  `sonurl` varchar(255) NOT NULL COMMENT '子域名域名',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0不可访问，1待检测，2正常，3有匹配'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子域名表';

-- --------------------------------------------------------

--
-- 表的结构 `websearch_url`
--

CREATE TABLE `websearch_url` (
  `url_id` int(11) NOT NULL COMMENT '网址id',
  `url` varchar(255) NOT NULL COMMENT '网址',
  `title` varchar(255) DEFAULT NULL COMMENT '网站标题',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：0不可访问，1待执行，2,执行中，3执行成功'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='要排查的网址列表';

--
-- 转存表中的数据 `websearch_url`
--

INSERT INTO `websearch_url` (`url_id`, `url`, `title`, `note`, `status`) VALUES
(2, 'www.baidu.com', NULL, '未备注', 1),
(3, 'www.baidu.com', NULL, '未备注', 1),
(4, 'www.baidu.com', NULL, '未备注', 1),
(5, 'www.baidu.com', NULL, '未备注', 0),
(6, 'www.baidu.com', NULL, '未备注', 1),
(7, 'www.baidu.com', NULL, '未备注', 0);

-- --------------------------------------------------------

--
-- 表的结构 `website_tasks`
--

CREATE TABLE `website_tasks` (
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `user_id` int(11) NOT NULL COMMENT '用户id（维护者id）',
  `web_id` int(11) NOT NULL COMMENT '网站id',
  `is_temporary` int(11) NOT NULL COMMENT '是否临时委托0否，1是',
  `temporary_user_id` int(11) DEFAULT NULL COMMENT '临时委托用户id',
  `temporary_endtime` varchar(255) DEFAULT NULL COMMENT '临时委托结束时间',
  `is_change` int(11) NOT NULL COMMENT '是否长期性委托，0否，1委托中，2主动要',
  `change_user_id` int(11) DEFAULT NULL COMMENT '长期委托用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务状态表';

-- --------------------------------------------------------

--
-- 表的结构 `website_user`
--

CREATE TABLE `website_user` (
  `user_id` int(11) NOT NULL COMMENT '用户id（网站维护者）',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `user_qq` varchar(255) DEFAULT NULL COMMENT '用户常用联系qq',
  `user_phone` varchar(255) DEFAULT NULL COMMENT '用户常用联系手机'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- --------------------------------------------------------

--
-- 表的结构 `website_weblog`
--

CREATE TABLE `website_weblog` (
  `log_id` int(11) NOT NULL COMMENT '日志id',
  `user_id` int(11) DEFAULT NULL COMMENT '维护者id',
  `web_id` int(11) NOT NULL COMMENT '网站id',
  `log_time` int(11) NOT NULL COMMENT '日志产生时间',
  `log_type` int(11) NOT NULL COMMENT '日志类型1入库，2分配，3交换，4日常维护，5临时维护',
  `log_msg` varchar(255) NOT NULL COMMENT '日志记录信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维护日志表';

-- --------------------------------------------------------

--
-- 表的结构 `website_website`
--

CREATE TABLE `website_website` (
  `web_id` int(11) NOT NULL COMMENT '网站id',
  `web_name` varchar(255) NOT NULL COMMENT '网站名',
  `web_url` varchar(255) NOT NULL COMMENT '网站url',
  `web_admin_url` varchar(255) NOT NULL COMMENT '网站后台url',
  `web_account` varchar(255) NOT NULL COMMENT '网站账户',
  `web_pass` varchar(255) NOT NULL COMMENT '网站密码',
  `web_icp` varchar(255) DEFAULT NULL COMMENT '网站备案号',
  `web_icp_account` varchar(255) DEFAULT NULL COMMENT '备案账户',
  `web_icp_pass` varchar(255) DEFAULT NULL COMMENT '备案登录密码',
  `web_icp_email` varchar(255) DEFAULT NULL COMMENT '备案邮箱',
  `web_status` int(11) NOT NULL COMMENT '网站状态1维护中，0停止维护',
  `domain_buildtime` int(11) DEFAULT NULL COMMENT '域名开通时间',
  `domain_endtime` int(11) DEFAULT NULL COMMENT '域名到期时间',
  `ftp_url` varchar(255) DEFAULT NULL COMMENT 'ftp连接',
  `ftp_account` varchar(255) DEFAULT NULL COMMENT 'ftp账号',
  `ftp_pass` varchar(255) DEFAULT NULL COMMENT 'ftp密码',
  `owner_name` varchar(255) DEFAULT NULL COMMENT '所有者姓名',
  `owner_phone` varchar(255) DEFAULT NULL COMMENT '所有者联系手机',
  `owner_qq` varchar(255) DEFAULT NULL COMMENT '所有者qq'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维护列表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `websearch_keywords`
--
ALTER TABLE `websearch_keywords`
  ADD PRIMARY KEY (`key_id`);

--
-- Indexes for table `websearch_matching`
--
ALTER TABLE `websearch_matching`
  ADD PRIMARY KEY (`matching_id`);

--
-- Indexes for table `websearch_sonurl`
--
ALTER TABLE `websearch_sonurl`
  ADD PRIMARY KEY (`sonurl_id`);

--
-- Indexes for table `websearch_url`
--
ALTER TABLE `websearch_url`
  ADD PRIMARY KEY (`url_id`);

--
-- Indexes for table `website_tasks`
--
ALTER TABLE `website_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `website_user`
--
ALTER TABLE `website_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `website_weblog`
--
ALTER TABLE `website_weblog`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `website_website`
--
ALTER TABLE `website_website`
  ADD PRIMARY KEY (`web_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `websearch_keywords`
--
ALTER TABLE `websearch_keywords`
  MODIFY `key_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关键词id', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `websearch_matching`
--
ALTER TABLE `websearch_matching`
  MODIFY `matching_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '相关匹配id';
--
-- 使用表AUTO_INCREMENT `websearch_sonurl`
--
ALTER TABLE `websearch_sonurl`
  MODIFY `sonurl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '子域名id';
--
-- 使用表AUTO_INCREMENT `websearch_url`
--
ALTER TABLE `websearch_url`
  MODIFY `url_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网址id', AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `website_tasks`
--
ALTER TABLE `website_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id';
--
-- 使用表AUTO_INCREMENT `website_user`
--
ALTER TABLE `website_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id（网站维护者）';
--
-- 使用表AUTO_INCREMENT `website_weblog`
--
ALTER TABLE `website_weblog`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id';
--
-- 使用表AUTO_INCREMENT `website_website`
--
ALTER TABLE `website_website`
  MODIFY `web_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网站id';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
