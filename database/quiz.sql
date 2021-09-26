-- Adminer 4.8.1 MySQL 5.5.5-10.1.38-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(30) NOT NULL,
  `quiz_id` int(30) NOT NULL,
  `question_id` int(30) NOT NULL,
  `option_id` int(30) NOT NULL,
  `is_right` tinyint(1) NOT NULL COMMENT ' 1 = right, 0 = wrong',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `answers` (`id`, `user_id`, `quiz_id`, `question_id`, `option_id`, `is_right`, `date_updated`) VALUES
(5,	12,	2,	4,	32,	1,	'2020-09-07 16:59:14'),
(6,	12,	2,	5,	38,	1,	'2020-09-07 16:59:14'),
(7,	14,	2,	4,	32,	1,	'2021-09-26 11:51:49'),
(8,	14,	2,	5,	37,	0,	'2021-09-26 11:51:49');

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(30) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `faculty` (`id`, `user_id`, `subject`, `date_updated`) VALUES
(2,	6,	'Math',	'2020-09-07 12:02:08');

DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `score` int(5) NOT NULL,
  `total_score` int(5) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `history` (`id`, `quiz_id`, `user_id`, `score`, `total_score`, `date_updated`) VALUES
(3,	2,	12,	4,	4,	'2020-09-07 16:59:14'),
(4,	2,	14,	2,	4,	'2021-09-26 11:51:49');

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `qid` int(30) NOT NULL,
  `order_by` int(11) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `questions` (`id`, `question`, `qid`, `order_by`, `date_updated`) VALUES
(4,	'asdasd ads ads f ddfg dfgg',	2,	0,	'2020-09-07 14:32:18'),
(5,	'Sample Question',	2,	0,	'2020-09-07 14:00:39');

DROP TABLE IF EXISTS `question_opt`;
CREATE TABLE `question_opt` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `option_txt` text NOT NULL,
  `question_id` int(30) NOT NULL,
  `is_right` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1= right answer',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `question_opt` (`id`, `option_txt`, `question_id`, `is_right`, `date_updated`) VALUES
(29,	'dsfsf sdf',	4,	0,	'2020-09-07 14:40:57'),
(30,	'dfdf',	4,	0,	'2020-09-07 14:40:57'),
(31,	' dfd',	4,	0,	'2020-09-07 14:40:57'),
(32,	'dsfsd',	4,	1,	'2020-09-07 14:40:57'),
(37,	'Wrong',	5,	0,	'2020-09-07 14:41:32'),
(38,	'Right',	5,	1,	'2020-09-07 14:41:32'),
(39,	'Wrong',	5,	0,	'2020-09-07 14:41:32'),
(40,	'Wrong',	5,	0,	'2020-09-07 14:41:32');

DROP TABLE IF EXISTS `quiz_list`;
CREATE TABLE `quiz_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `qpoints` int(11) NOT NULL DEFAULT '1',
  `user_id` int(20) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `quiz_list` (`id`, `title`, `qpoints`, `user_id`, `date_updated`) VALUES
(2,	'Pre-Test (Math)',	2,	6,	'2020-09-07 13:21:27');

DROP TABLE IF EXISTS `quiz_student_list`;
CREATE TABLE `quiz_student_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `quiz_student_list` (`id`, `quiz_id`, `user_id`, `date_updated`) VALUES
(5,	2,	12,	'2020-09-07 15:05:58'),
(6,	2,	13,	'2020-09-07 15:05:58');

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(30) NOT NULL,
  `level_section` varchar(100) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `students` (`id`, `user_id`, `level_section`, `date_updated`) VALUES
(3,	12,	'2-C',	'2020-09-07 14:51:25'),
(4,	13,	'2-C',	'2020-09-07 14:54:28');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = admin, 2= faculty , 3 = student',
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1,	'Administrator',	1,	'admin',	'0192023a7bbd73250516f069df18b500',	1,	'2021-09-26 11:35:08'),
(6,	'John Smith',	2,	'jsmith',	'admin123',	1,	'2020-09-07 10:23:30'),
(12,	'Sample Student',	3,	'sstudent',	'admin123',	1,	'2020-09-07 14:51:25'),
(13,	'Claire Blake',	3,	'cblake',	'admin123',	1,	'2020-09-07 14:54:28'),
(14,	'chungnn',	3,	'chungnn',	'e10adc3949ba59abbe56e057f20f883e',	1,	'2021-09-26 11:49:04');

-- 2021-09-26 05:24:50
