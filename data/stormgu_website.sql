-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-19 17:36:23
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stormgu_website`
--

-- --------------------------------------------------------

--
-- 表的结构 `stormgu_tasks`
--

CREATE TABLE `stormgu_tasks` (
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `user_id` int(11) NOT NULL COMMENT '用户id（维护者id）',
  `web_id` int(11) NOT NULL COMMENT '网站id',
  `is_temporary` int(11) NOT NULL COMMENT '是否临时委托0否，1是',
  `temporary_user_id` int(11) DEFAULT NULL COMMENT '临时委托用户id',
  `temporary_endtime` varchar(255) DEFAULT NULL COMMENT '临时委托',
  `is_change` int(11) NOT NULL COMMENT '是否非暂时性委托，0否，1委托中',
  `change_user_id` int(11) DEFAULT NULL COMMENT '长期委托用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务状态表';

-- --------------------------------------------------------

--
-- 表的结构 `stormgu_user`
--

CREATE TABLE `stormgu_user` (
  `user_id` int(11) NOT NULL COMMENT '用户id（网站维护者）',
  `name` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `qq` varchar(255) DEFAULT NULL COMMENT '用户常用联系qq',
  `phone` varchar(255) DEFAULT NULL COMMENT '用户常用联系手机'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- --------------------------------------------------------

--
-- 表的结构 `stormgu_weblog`
--

CREATE TABLE `stormgu_weblog` (
  `log_id` int(11) NOT NULL COMMENT '日志id',
  `user_id` int(11) DEFAULT NULL COMMENT '维护者id',
  `web_id` int(11) NOT NULL COMMENT '网站id',
  `log_time` int(11) NOT NULL COMMENT '日志产生时间',
  `log_type` int(11) NOT NULL COMMENT '日志类型1入库，2分配，3交换，4日常维护，5临时维护',
  `log_msg` varchar(255) NOT NULL COMMENT '日志记录信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维护日志表';

-- --------------------------------------------------------

--
-- 表的结构 `stormgu_website`
--

CREATE TABLE `stormgu_website` (
  `web_id` int(11) NOT NULL COMMENT '网站id',
  `web_name` varchar(255) NOT NULL COMMENT '网站名',
  `web_url` varchar(255) NOT NULL COMMENT '网站url',
  `web_account` varchar(255) NOT NULL COMMENT '网站账户',
  `web_pass` varchar(255) NOT NULL COMMENT '网站密码',
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
-- Indexes for table `stormgu_tasks`
--
ALTER TABLE `stormgu_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `stormgu_user`
--
ALTER TABLE `stormgu_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `stormgu_weblog`
--
ALTER TABLE `stormgu_weblog`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `stormgu_website`
--
ALTER TABLE `stormgu_website`
  ADD PRIMARY KEY (`web_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `stormgu_tasks`
--
ALTER TABLE `stormgu_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id';
--
-- 使用表AUTO_INCREMENT `stormgu_user`
--
ALTER TABLE `stormgu_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id（网站维护者）';
--
-- 使用表AUTO_INCREMENT `stormgu_weblog`
--
ALTER TABLE `stormgu_weblog`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id';
--
-- 使用表AUTO_INCREMENT `stormgu_website`
--
ALTER TABLE `stormgu_website`
  MODIFY `web_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网站id';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
