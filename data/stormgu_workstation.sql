-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-22 11:24:13
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
  `keywords` varchar(255) NOT NULL COMMENT '关键词集群，空格为分割'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索关键词表';

--
-- 转存表中的数据 `websearch_keywords`
--

INSERT INTO `websearch_keywords` (`key_id`, `keywords`) VALUES
(13, '最大');

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
  `url` varchar(255) NOT NULL COMMENT '子域名域名',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0不可访问，1等待匹配测试，2已匹配',
  `collection` int(11) DEFAULT '0' COMMENT '0未采集子网址，1已采集'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子域名表';

-- --------------------------------------------------------

--
-- 表的结构 `websearch_url`
--

CREATE TABLE `websearch_url` (
  `url_id` int(11) NOT NULL COMMENT '网址id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父ID，0表示顶级',
  `url` varchar(255) NOT NULL COMMENT '网址',
  `title` varchar(255) DEFAULT NULL COMMENT '网站标题',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0不可访问，1等待匹配测试，2已匹配',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT '0未采集子网址，1已采集'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='要排查的网址列表';

--
-- 转存表中的数据 `websearch_url`
--

INSERT INTO `websearch_url` (`url_id`, `parent_id`, `url`, `title`, `note`, `status`, `collection`) VALUES
(587, 0, 'http://www.njxinghua.com/', NULL, '未备注', 1, 1),
(588, 587, 'http://www.njxinghua.com/sitemap/', NULL, NULL, 1, 1),
(589, 587, 'http://www.njxinghua.com/rss.xml', NULL, NULL, 1, 0),
(590, 587, 'http://www.njxinghua.com/sitemap.xml', NULL, NULL, 1, 0),
(591, 587, 'http://www.njxinghua.com/dm/', NULL, NULL, 1, 0),
(592, 587, 'http://www.njxinghua.com/search.php?wd=%E8%80%90%E9%AB%98%E6%B8%A9%E7%BD%91%E5%B8%A6', NULL, NULL, 1, 0),
(593, 587, 'http://www.njxinghua.com/search.php?wd=%E9%87%91%E5%B1%9E%E7%BD%91%E5%B8%A6%E5%8E%82', NULL, NULL, 1, 0),
(594, 587, 'http://www.njxinghua.com/search.php?wd=%E9%95%BF%E5%9F%8E%E7%BD%91%E5%B8%A6', NULL, NULL, 1, 0),
(595, 587, 'http://www.njxinghua.com/about/', NULL, NULL, 1, 0),
(596, 587, 'http://www.njxinghua.com/about/company.html', NULL, NULL, 1, 0),
(597, 587, 'http://www.njxinghua.com/about/contact.html', NULL, NULL, 1, 0),
(598, 587, 'http://www.njxinghua.com/product/', NULL, NULL, 1, 0),
(599, 587, 'http://www.njxinghua.com/product/ltwdafe/', NULL, NULL, 1, 0),
(600, 587, 'http://www.njxinghua.com/product/lbwd515/', NULL, NULL, 1, 0),
(601, 587, 'http://www.njxinghua.com/product/gyrdzf1d/', NULL, NULL, 1, 0),
(602, 587, 'http://www.njxinghua.com/product/gyrdof51/', NULL, NULL, 1, 0),
(603, 587, 'http://www.njxinghua.com/product/ywjlljb99/', NULL, NULL, 1, 0),
(604, 587, 'http://www.njxinghua.com/product/sjswdj38a/', NULL, NULL, 1, 1),
(605, 587, 'http://www.njxinghua.com/product/bxglw209/', NULL, NULL, 1, 0),
(606, 587, 'http://www.njxinghua.com/product/ylbsqbdd/', NULL, NULL, 1, 0),
(607, 587, 'http://www.njxinghua.com/product/wdbsq657/', NULL, NULL, 1, 0),
(608, 587, 'http://www.njxinghua.com/product/znxsyb3f2/', NULL, NULL, 1, 0),
(609, 587, 'http://www.njxinghua.com/product/wzjlye20/', NULL, NULL, 1, 0),
(610, 587, 'http://www.njxinghua.com/product/ylyb7fe/', NULL, NULL, 1, 0),
(611, 587, 'http://www.njxinghua.com/product/wdcgq580/', NULL, NULL, 1, 0),
(612, 587, 'http://www.njxinghua.com/product/ddjwd8d0/', NULL, NULL, 1, 0),
(613, 587, 'http://www.njxinghua.com/news/', NULL, NULL, 1, 0),
(614, 587, 'http://www.njxinghua.com/news/company/', NULL, NULL, 1, 0),
(615, 587, 'http://www.njxinghua.com/news/xydt/', NULL, NULL, 1, 0),
(616, 587, 'http://www.njxinghua.com/news/cpbk0c9/', NULL, NULL, 1, 0),
(617, 587, 'http://www.njxinghua.com/case/', NULL, NULL, 1, 0),
(618, 587, 'http://www.njxinghua.com/case/yjal/', NULL, NULL, 1, 0),
(619, 587, 'http://www.njxinghua.com/job/', NULL, NULL, 1, 0),
(620, 587, 'http://www.njxinghua.com/message/', NULL, NULL, 1, 0),
(621, 587, 'http://www.njxinghua.com/news/669.html', NULL, NULL, 1, 0),
(622, 587, 'http://www.njxinghua.com/news/668.html', NULL, NULL, 1, 0),
(623, 587, 'http://www.njxinghua.com/news/667.html', NULL, NULL, 1, 0),
(624, 587, 'http://www.njxinghua.com/news/666.html', NULL, NULL, 1, 0),
(625, 587, 'http://www.njxinghua.com/news/665.html', NULL, NULL, 1, 0),
(626, 587, 'http://www.njxinghua.com/news/664.html', NULL, NULL, 1, 0),
(627, 587, 'http://www.njxinghua.com/product/186.html', NULL, NULL, 1, 0),
(628, 587, 'http://www.njxinghua.com/product/137.html', NULL, NULL, 1, 0),
(629, 587, 'http://www.njxinghua.com/product/173.html', NULL, NULL, 1, 0),
(630, 587, 'http://www.njxinghua.com/product/174.html', NULL, NULL, 1, 0),
(631, 587, 'http://www.njxinghua.com/product/183.html', NULL, NULL, 1, 0),
(632, 587, 'http://www.njxinghua.com/product/185.html', NULL, NULL, 1, 0),
(633, 587, 'http://www.njxinghua.com/product/128.html', NULL, NULL, 1, 0),
(634, 587, 'http://www.njxinghua.com/product/129.html', NULL, NULL, 1, 0),
(635, 587, 'http://www.njxinghua.com/product/130.html', NULL, NULL, 1, 0),
(636, 587, 'http://www.njxinghua.com/product/131.html', NULL, NULL, 1, 0),
(637, 587, 'http://www.njxinghua.com/product/133.html', NULL, NULL, 1, 0),
(638, 587, 'http://www.njxinghua.com/product/134.html', NULL, NULL, 1, 0),
(639, 587, 'http://www.njxinghua.com/product/135.html', NULL, NULL, 1, 0),
(640, 587, 'http://www.njxinghua.com/product/138.html', NULL, NULL, 1, 0),
(641, 587, 'http://www.njxinghua.com/product/139.html', NULL, NULL, 1, 0),
(642, 587, 'http://www.njxinghua.com/product/140.html', NULL, NULL, 1, 0),
(643, 587, 'http://www.njxinghua.com/product/141.html', NULL, NULL, 1, 0),
(644, 587, 'http://www.njxinghua.com/product/142.html', NULL, NULL, 1, 0),
(645, 587, 'http://www.njxinghua.com/product/143.html', NULL, NULL, 1, 0),
(646, 587, 'http://www.njxinghua.com/product/144.html', NULL, NULL, 1, 0),
(647, 587, 'http://www.njxinghua.com/product/147.html', NULL, NULL, 1, 0),
(648, 587, 'http://www.njxinghua.com/product/148.html', NULL, NULL, 1, 0),
(649, 587, 'http://www.njxinghua.com/product/149.html', NULL, NULL, 1, 0),
(650, 587, 'http://www.njxinghua.com/product/150.html', NULL, NULL, 1, 0),
(651, 587, 'http://www.njxinghua.com/product/154.html', NULL, NULL, 1, 0),
(652, 587, 'http://www.njxinghua.com/product/155.html', NULL, NULL, 1, 0),
(653, 587, 'http://www.njxinghua.com/product/156.html', NULL, NULL, 1, 0),
(654, 587, 'http://www.njxinghua.com/product/157.html', NULL, NULL, 1, 0),
(655, 587, 'http://www.njxinghua.com/product/158.html', NULL, NULL, 1, 0),
(656, 587, 'http://www.njxinghua.com/product/159.html', NULL, NULL, 1, 0),
(657, 587, 'http://www.njxinghua.com/product/160.html', NULL, NULL, 1, 0),
(658, 587, 'http://www.njxinghua.com/product/161.html', NULL, NULL, 1, 0),
(659, 587, 'http://www.njxinghua.com/product/162.html', NULL, NULL, 1, 0),
(660, 587, 'http://www.njxinghua.com/product/163.html', NULL, NULL, 1, 0),
(661, 587, 'http://www.njxinghua.com/product/164.html', NULL, NULL, 1, 0),
(662, 587, 'http://www.njxinghua.com/product/165.html', NULL, NULL, 1, 0),
(663, 587, 'http://www.njxinghua.com/product/166.html', NULL, NULL, 1, 0),
(664, 587, 'http://www.njxinghua.com/product/169.html', NULL, NULL, 1, 0),
(665, 587, 'http://www.njxinghua.com/product/171.html', NULL, NULL, 1, 0),
(666, 587, 'http://www.njxinghua.com/product/175.html', NULL, NULL, 1, 0),
(667, 587, 'http://www.njxinghua.com/news/653.html', NULL, NULL, 1, 0),
(668, 587, 'http://www.njxinghua.com/news/652.html', NULL, NULL, 1, 0),
(669, 587, 'http://www.njxinghua.com/news/651.html', NULL, NULL, 1, 0),
(670, 587, 'http://www.njxinghua.com/news/650.html', NULL, NULL, 1, 0),
(671, 587, 'http://www.njxinghua.com/news/628.html', NULL, NULL, 1, 0),
(672, 587, 'http://www.njxinghua.com/news/627.html', NULL, NULL, 1, 0),
(673, 587, 'http://www.njxinghua.com/news/626.html', NULL, NULL, 1, 0),
(674, 587, 'http://www.njxinghua.com/news/625.html', NULL, NULL, 1, 0),
(675, 587, 'http://www.njxinghua.com/news/624.html', NULL, NULL, 1, 0),
(676, 587, 'http://www.njxinghua.com/news/623.html', NULL, NULL, 1, 0),
(677, 587, 'http://www.njxinghua.com/news/596.html', NULL, NULL, 1, 0),
(678, 587, 'http://www.njxinghua.com/product/145.html', NULL, NULL, 1, 0),
(679, 587, 'http://www.njxinghua.com/product/146.html', NULL, NULL, 1, 0),
(680, 587, 'http://www.njxinghua.com/product/151.html', NULL, NULL, 1, 0),
(681, 587, 'http://www.njxinghua.com/search.php?wd=耐高温网带', NULL, NULL, 1, 0),
(682, 587, 'http://www.njxinghua.com/search.php?wd=金属网带厂', NULL, NULL, 1, 0),
(683, 587, 'http://www.njxinghua.com/search.php?wd=长城网带', NULL, NULL, 1, 0),
(684, 588, 'http://www.njxinghua.com/product/sjlwd026/', NULL, NULL, 1, 0),
(685, 588, 'http://www.njxinghua.com/product/chlwd4e3/', NULL, NULL, 1, 0),
(686, 588, 'http://www.njxinghua.com/product/khlwd638/', NULL, NULL, 1, 0),
(687, 588, 'http://www.njxinghua.com/product/sdlhgwd2df/', NULL, NULL, 1, 0),
(688, 588, 'http://www.njxinghua.com/product/152.html', NULL, NULL, 1, 0),
(689, 588, 'http://www.njxinghua.com/product/187.html', NULL, NULL, 1, 0),
(690, 588, 'http://www.njxinghua.com/product/188.html', NULL, NULL, 1, 0),
(691, 588, 'http://www.njxinghua.com/product/190.html', NULL, NULL, 1, 0),
(692, 588, 'http://www.njxinghua.com/product/191.html', NULL, NULL, 1, 0),
(693, 588, 'http://www.njxinghua.com/product/197.html', NULL, NULL, 1, 0),
(694, 588, 'http://www.njxinghua.com/product/203.html', NULL, NULL, 1, 0),
(695, 588, 'http://www.njxinghua.com/product/205.html', NULL, NULL, 1, 0),
(696, 588, 'http://www.njxinghua.com/product/189.html', NULL, NULL, 1, 0),
(697, 588, 'http://www.njxinghua.com/product/196.html', NULL, NULL, 1, 0),
(698, 588, 'http://www.njxinghua.com/product/198.html', NULL, NULL, 1, 0),
(699, 588, 'http://www.njxinghua.com/product/202.html', NULL, NULL, 1, 0),
(700, 588, 'http://www.njxinghua.com/product/180.html', NULL, NULL, 1, 0),
(701, 588, 'http://www.njxinghua.com/product/195.html', NULL, NULL, 1, 0),
(702, 588, 'http://www.njxinghua.com/product/201.html', NULL, NULL, 1, 0),
(703, 588, 'http://www.njxinghua.com/product/179.html', NULL, NULL, 1, 0),
(704, 588, 'http://www.njxinghua.com/product/178.html', NULL, NULL, 1, 0),
(705, 588, 'http://www.njxinghua.com/product/207.html', NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `website_log`
--

CREATE TABLE `website_log` (
  `log_id` int(11) NOT NULL COMMENT '日志id',
  `user_id` int(11) DEFAULT NULL COMMENT '维护者id',
  `web_id` int(11) NOT NULL COMMENT '网站id',
  `log_time` int(11) NOT NULL COMMENT '日志产生时间',
  `log_type` int(11) NOT NULL COMMENT '日志类型1入库，2分配，3交换，4日常维护，5临时维护',
  `log_msg` varchar(255) NOT NULL COMMENT '日志记录信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维护日志表';

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
  `name` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `qq` varchar(255) DEFAULT NULL COMMENT '用户常用联系qq',
  `phone` varchar(255) DEFAULT NULL COMMENT '用户常用联系手机'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `website_user`
--

INSERT INTO `website_user` (`user_id`, `name`, `qq`, `phone`) VALUES
(1, 'test', '12345', '1234');

-- --------------------------------------------------------

--
-- 表的结构 `website_web`
--

CREATE TABLE `website_web` (
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
-- Indexes for table `website_log`
--
ALTER TABLE `website_log`
  ADD PRIMARY KEY (`log_id`);

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
-- Indexes for table `website_web`
--
ALTER TABLE `website_web`
  ADD PRIMARY KEY (`web_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `websearch_keywords`
--
ALTER TABLE `websearch_keywords`
  MODIFY `key_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关键词id', AUTO_INCREMENT=18;
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
  MODIFY `url_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网址id', AUTO_INCREMENT=706;
--
-- 使用表AUTO_INCREMENT `website_log`
--
ALTER TABLE `website_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id';
--
-- 使用表AUTO_INCREMENT `website_tasks`
--
ALTER TABLE `website_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id';
--
-- 使用表AUTO_INCREMENT `website_user`
--
ALTER TABLE `website_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id（网站维护者）', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `website_web`
--
ALTER TABLE `website_web`
  MODIFY `web_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网站id';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
