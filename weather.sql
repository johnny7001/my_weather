-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 
-- 伺服器版本： 8.0.26
-- PHP 版本： 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `weather`
--

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add taiwan high', 7, 'add_taiwanhigh'),
(26, 'Can change taiwan high', 7, 'change_taiwanhigh'),
(27, 'Can delete taiwan high', 7, 'delete_taiwanhigh'),
(28, 'Can view taiwan high', 7, 'view_taiwanhigh'),
(29, 'Can add taiwan tem', 8, 'add_taiwantem'),
(30, 'Can change taiwan tem', 8, 'change_taiwantem'),
(31, 'Can delete taiwan tem', 8, 'delete_taiwantem'),
(32, 'Can view taiwan tem', 8, 'view_taiwantem');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- 資料表結構 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'weather', 'taiwanhigh'),
(8, 'weather', 'taiwantem');

-- --------------------------------------------------------

--
-- 資料表結構 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-13 01:40:42.906390'),
(2, 'auth', '0001_initial', '2022-02-13 01:40:43.523207'),
(3, 'admin', '0001_initial', '2022-02-13 01:40:43.718919'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-13 01:40:43.734236'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-13 01:40:43.745714'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-02-13 01:40:43.865907'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-02-13 01:40:43.948602'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-02-13 01:40:44.031221'),
(9, 'auth', '0004_alter_user_username_opts', '2022-02-13 01:40:44.041500'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-02-13 01:40:44.106339'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-02-13 01:40:44.111818'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-13 01:40:44.121895'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-02-13 01:40:44.210142'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-13 01:40:44.278802'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-02-13 01:40:44.351953'),
(16, 'auth', '0011_update_proxy_permissions', '2022-02-13 01:40:44.363549'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-02-13 01:40:44.436414'),
(18, 'sessions', '0001_initial', '2022-02-13 01:40:44.478094'),
(19, 'weather', '0001_initial', '2022-02-13 01:40:44.486366');

-- --------------------------------------------------------

--
-- 資料表結構 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 資料表結構 `taiwan_high`
--

CREATE TABLE `taiwan_high` (
  `id` int NOT NULL,
  `City` text,
  `Jan` float DEFAULT NULL,
  `Feb` float DEFAULT NULL,
  `Mar` float DEFAULT NULL,
  `Apr` float DEFAULT NULL,
  `May` float DEFAULT NULL,
  `Jun` float DEFAULT NULL,
  `Jul` float DEFAULT NULL,
  `Aus` float DEFAULT NULL,
  `Sep` float DEFAULT NULL,
  `Oct` float DEFAULT NULL,
  `Nov` float DEFAULT NULL,
  `Dece` float DEFAULT NULL,
  `Avg` float DEFAULT NULL,
  `Sta_period` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `taiwan_high`
--

INSERT INTO `taiwan_high` (`id`, `City`, `Jan`, `Feb`, `Mar`, `Apr`, `May`, `Jun`, `Jul`, `Aus`, `Sep`, `Oct`, `Nov`, `Dece`, `Avg`, `Sta_period`) VALUES
(1, '淡水', 18.8, 19.3, 21.6, 25.4, 28.8, 31.3, 33.3, 33.1, 30.9, 27.1, 24.4, 20.6, 26.2, '1991~2020'),
(2, '鞍部', 13.3, 14.6, 17.1, 20.5, 23.2, 25.6, 27.4, 26.8, 24.3, 20.5, 18.1, 14.6, 20.5, '1991~2020'),
(3, '臺北', 19.6, 20.7, 22.9, 26.7, 30.1, 32.9, 35, 34.4, 31.6, 27.8, 24.9, 21.1, 27.3, '1991~2020'),
(4, '竹子湖', 15.4, 16.6, 19.1, 22.5, 25.4, 27.8, 29.7, 29.3, 26.8, 22.9, 20.3, 16.7, 22.7, '1991~2020'),
(5, '基隆', 18.4, 19.1, 21, 24.7, 28, 31.2, 33.3, 32.5, 29.8, 26.1, 23.6, 20.1, 25.7, '1991~2020'),
(6, '彭佳嶼', 17.9, 18.5, 20.3, 23.4, 26.4, 29.3, 31.3, 31.1, 29, 25.9, 23.1, 19.6, 24.7, '1991~2020'),
(7, '花蓮', 21.4, 21.9, 23.6, 26.2, 28.7, 30.9, 32.4, 32.2, 30.7, 28.3, 25.8, 22.8, 27.1, '1991~2020'),
(8, '蘇澳', 19.3, 19.9, 22, 24.9, 27.6, 30.4, 31.8, 31.5, 29.7, 26.5, 23.8, 20.6, 25.7, '1991~2020'),
(9, '宜蘭', 19.7, 20.4, 22.7, 25.7, 28.5, 31.4, 33.2, 32.8, 30.6, 27.1, 24.2, 20.9, 26.4, '1991~2020'),
(10, '東吉島', 20, 20.6, 23.2, 26.1, 28.5, 29.9, 31, 30.8, 30, 27.7, 25.1, 21.7, 26.2, '1991~2020'),
(11, '澎湖', 19.4, 20, 22.9, 26.3, 29.1, 30.9, 32.2, 31.8, 31, 28.2, 25.1, 21.3, 26.5, '1991~2020'),
(12, '臺南', 22.9, 24, 26.5, 29.3, 31.4, 32.4, 33.1, 32.6, 32.5, 30.8, 28.1, 24.4, 29, '1991~2020'),
(13, '高雄', 24.2, 25, 27, 29.3, 31, 32.1, 32.7, 32.1, 31.8, 30.1, 28.1, 25.3, 29.1, '1991~2020'),
(14, '嘉義', 22.5, 23, 25.4, 28.4, 30.9, 32.8, 33.4, 32.8, 32.1, 30.1, 27.6, 24.3, 28.6, '1991~2020'),
(15, '臺中', 22.3, 22.9, 25.2, 28.1, 30.7, 32.3, 33.3, 32.7, 32.2, 30.3, 27.6, 23.9, 28.5, '1991~2020'),
(16, '阿里山', 11, 11.7, 13.9, 15.7, 17.2, 18.4, 19.3, 18.8, 18.5, 17.4, 15.6, 12.6, 15.8, '1991~2020'),
(17, '大武', 23.7, 24.4, 26.2, 28.7, 30.7, 32.6, 32.8, 32.3, 31.2, 29.4, 27.4, 24.6, 28.7, '1991~2020'),
(18, '玉山', 4.6, 4.5, 6.4, 8.7, 11.2, 12.9, 14.4, 14, 14, 13.9, 10.6, 6.7, 10.2, '1991~2020'),
(19, '新竹', 19.1, 19.4, 21.6, 25.6, 28.9, 31.5, 33.2, 32.8, 31.2, 28, 25.1, 21.1, 26.5, '1992~2020'),
(20, '恆春', 24.4, 25.5, 27.3, 29.5, 31.2, 31.8, 32.1, 31.8, 31.3, 29.7, 27.8, 25.1, 29, '1991~2020'),
(21, '成功', 22.4, 22.9, 24.3, 26.7, 29, 30.7, 31.8, 31.6, 30.7, 28.8, 26.4, 23.5, 27.4, '1991~2020'),
(22, '蘭嶼', 20.8, 21.4, 22.9, 24.8, 26.7, 28, 28.6, 28.5, 27.7, 25.9, 23.9, 21.5, 25.1, '1991~2020'),
(23, '日月潭', 19.4, 20.3, 22.1, 24.2, 26, 27.2, 28.3, 27.8, 27.2, 25.6, 23.6, 20.5, 24.4, '1991~2020'),
(24, '臺東', 23.2, 23.8, 25.4, 27.8, 30, 31.8, 32.6, 32.2, 31.3, 29.4, 27.1, 24.3, 28.2, '1991~2020'),
(25, '梧棲', 19.2, 19.6, 22.3, 26, 28.9, 31.1, 32.2, 31.9, 30.8, 28, 25.1, 21.2, 26.4, '1991~2020');

-- --------------------------------------------------------

--
-- 資料表結構 `taiwan_tem`
--

CREATE TABLE `taiwan_tem` (
  `id` int NOT NULL,
  `City` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Jan` float DEFAULT NULL,
  `Feb` float DEFAULT NULL,
  `Mar` float DEFAULT NULL,
  `Apr` float DEFAULT NULL,
  `May` float DEFAULT NULL,
  `Jun` float DEFAULT NULL,
  `Jul` float DEFAULT NULL,
  `Aus` float DEFAULT NULL,
  `Sep` float DEFAULT NULL,
  `Oct` float DEFAULT NULL,
  `Nov` float DEFAULT NULL,
  `Dece` float DEFAULT NULL,
  `Avg` float DEFAULT NULL,
  `Sta_period` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `taiwan_tem`
--

INSERT INTO `taiwan_tem` (`id`, `City`, `Jan`, `Feb`, `Mar`, `Apr`, `May`, `Jun`, `Jul`, `Aus`, `Sep`, `Oct`, `Nov`, `Dece`, `Avg`, `Sta_period`) VALUES
(1, '淡水', 15.4, 15.7, 17.7, 21.4, 24.7, 27.3, 29, 28.7, 26.9, 23.6, 21, 17.3, 22.4, '1991~2020'),
(2, '鞍部', 10.3, 11.2, 13.2, 16.6, 19.6, 22.2, 23.4, 23, 21.1, 17.9, 15.4, 11.8, 17.1, '1991~2020'),
(3, '臺北', 16.6, 17.2, 19, 22.5, 25.8, 28.3, 30.1, 29.7, 27.8, 24.7, 22, 18.2, 23.5, '1991~2020'),
(4, '竹子湖', 12, 12.8, 14.8, 18.2, 21.3, 23.7, 25, 24.7, 22.9, 19.8, 17.2, 13.5, 18.8, '1991~2020'),
(5, '基隆', 16.1, 16.4, 18.1, 21.6, 24.8, 27.6, 29.5, 29.1, 27.2, 24.2, 21.5, 18, 22.8, '1991~2020'),
(6, '彭佳嶼', 15.8, 16.2, 17.7, 20.7, 23.6, 26.3, 28.1, 28, 26.4, 23.8, 21.1, 17.6, 22.1, '1991~2020'),
(7, '花蓮', 18.3, 18.7, 20.3, 22.8, 25.3, 27.5, 28.7, 28.4, 27, 24.9, 22.5, 19.7, 23.7, '1991~2020'),
(8, '蘇澳', 16.6, 17.2, 19, 21.8, 24.6, 27.3, 28.8, 28.5, 26.8, 24, 21.2, 18, 22.8, '1991~2020'),
(9, '宜蘭', 16.6, 17.1, 19, 21.9, 24.7, 27.3, 28.9, 28.6, 26.8, 23.8, 21.1, 17.9, 22.8, '1991~2020'),
(10, '東吉島', 18.1, 18.5, 20.7, 23.6, 26, 27.8, 28.7, 28.4, 27.6, 25.5, 23.1, 19.9, 24, '1991~2020'),
(11, '澎湖', 17.1, 17.4, 19.9, 23.2, 25.9, 27.9, 28.9, 28.6, 28, 25.5, 22.7, 19.1, 23.7, '1991~2020'),
(12, '臺南', 17.8, 18.9, 21.6, 24.9, 27.5, 28.9, 29.4, 28.9, 28.6, 26.3, 23.4, 19.6, 24.7, '1991~2020'),
(13, '高雄', 19.7, 20.7, 23, 25.7, 27.8, 28.9, 29.4, 28.9, 28.5, 26.9, 24.5, 21.2, 25.4, '1991~2020'),
(14, '嘉義', 16.8, 17.7, 20.2, 23.5, 26.3, 28.3, 28.9, 28.4, 27.4, 24.9, 22, 18.4, 23.6, '1991~2020'),
(15, '臺中', 17, 17.7, 20.1, 23.5, 26.4, 28.1, 28.9, 28.4, 27.8, 25.5, 22.6, 18.7, 23.7, '1991~2020'),
(16, '阿里山', 6.5, 7.3, 9.5, 11.5, 13.1, 14.4, 14.7, 14.6, 14, 12.4, 10.7, 8, 11.4, '1991~2020'),
(17, '大武', 20.5, 21, 22.5, 24.7, 26.6, 28.3, 28.7, 28.2, 27.4, 26, 24.2, 21.6, 25, '1991~2020'),
(18, '玉山', -0.5, -0.2, 1.4, 3.6, 6, 7.4, 8, 7.8, 7.4, 6.6, 4.1, 1.2, 4.4, '1991~2020'),
(19, '新竹', 15.7, 16, 18, 21.9, 25.2, 27.9, 29.3, 28.9, 27.3, 24.4, 21.5, 17.7, 22.8, '1992~2020'),
(20, '恆春', 21.1, 21.7, 23.3, 25.4, 27.3, 28.4, 28.7, 28.3, 27.8, 26.5, 24.7, 22.2, 25.5, '1991~2020'),
(21, '成功', 19, 19.4, 20.9, 23.2, 25.4, 27.3, 28.1, 27.9, 27, 25.2, 22.9, 20.2, 23.9, '1991~2020'),
(22, '蘭嶼', 18.6, 19, 20.4, 22.3, 24.3, 25.9, 26.2, 26, 25.3, 23.7, 21.9, 19.5, 22.8, '1991~2020'),
(23, '日月潭', 14.4, 15.2, 16.9, 19.2, 21.1, 22.3, 22.9, 22.7, 22.2, 20.6, 18.6, 15.6, 19.3, '1991~2020'),
(24, '臺東', 19.7, 20.2, 21.8, 24.1, 26.4, 28.3, 29.1, 28.8, 27.7, 25.8, 23.6, 20.8, 24.7, '1991~2020'),
(25, '梧棲', 16.1, 16.4, 18.9, 22.7, 25.8, 28.1, 29.2, 28.9, 27.6, 24.7, 21.8, 18.1, 23.2, '1991~2020');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 資料表索引 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- 資料表索引 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- 資料表索引 `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 資料表索引 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- 資料表索引 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- 資料表索引 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- 資料表索引 `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- 資料表索引 `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- 資料表索引 `taiwan_high`
--
ALTER TABLE `taiwan_high`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `taiwan_tem`
--
ALTER TABLE `taiwan_tem`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `taiwan_high`
--
ALTER TABLE `taiwan_high`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `taiwan_tem`
--
ALTER TABLE `taiwan_tem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 資料表的限制式 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 資料表的限制式 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
