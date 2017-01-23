-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: spring_abc
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_miyylw8b3lg44gmh7k5y3u72h` (`topic_id`),
  KEY `FK_aanxkg6n45mck5fl454yd9aaa` (`user_id`),
  CONSTRAINT `FK_aanxkg6n45mck5fl454yd9aaa` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_miyylw8b3lg44gmh7k5y3u72h` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (8,'2017-01-12 23:50:11',17,8);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  `create_at` datetime NOT NULL,
  `floor` bigint(20) NOT NULL,
  `like_count` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1by25k3whex972v78w01wbnar` (`topic_id`),
  KEY `FK_mxoojfj9tmy8088avf57mpm02` (`user_id`),
  CONSTRAINT `FK_1by25k3whex972v78w01wbnar` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `FK_mxoojfj9tmy8088avf57mpm02` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (163,'good，顶顶5','2017-01-12 23:51:40',1,0,0,17,8);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_user`
--

DROP TABLE IF EXISTS `comment_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_user` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`,`user_id`),
  KEY `FK_obutvg4o609wp066ipmoky7ar` (`user_id`),
  CONSTRAINT `FK_obutvg4o609wp066ipmoky7ar` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_ri39mcdgmam0363rvww15yxoo` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_user`
--

LOCK TABLES `comment_user` WRITE;
/*!40000 ALTER TABLE `comment_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  `meta` varchar(255) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r5pkebdshlf1tcq0ldc7k8i0x` (`property_id`),
  CONSTRAINT `FK_r5pkebdshlf1tcq0ldc7k8i0x` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
INSERT INTO `field` VALUES (1,'Spring abc','33333',1),(2,'Spring abc','233',2),(3,'Spring abc','233',3),(4,'Spring abc','233',4),(5,'','233',6),(6,'4444444','233',7),(7,'<script></script>','233',8),(8,'<div class=\"panel-body\">\r\n  \r\n	  <a href=\"http://click.aliyun.com/m/1621/\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/aliyun-c7.jpg\" width=\"100%\"></a>\r\n\r\n	</div>','233',9),(9,'<div class=\"panel-body\">\r\n	  \r\n	  <a href=\"http://click.aliyun.com/m/1621/\" target=\"_blank\">内页广告<img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/aliyun-c7.jpg\" width=\"100%\"></a>\r\n	  \r\n	</div>','233',10),(10,'2323','233',11),(11,'2323','233',12),(12,'tipc_signup','233',13),(13,'<ul style=\"margin-top: 0px;\">\r\n            <li><span class=\"f13\">主题标题</span><div class=\"sep10\"></div>\r\n            请在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。\r\n            <div class=\"sep10\"></div>\r\n            </li>\r\n            <li><div class=\"fr\" style=\"margin-top: -5px; margin-right: 5px;\"><span class=\"f13\">正文</span><div class=\"sep10\"></div>\r\n            可以在正文中为你要发布的主题添加更多细节。 支持 <span style=\"font-family: Consolas, \'Panic Sans\', mono\"><a href=\"https://help.github.com/articles/github-flavored-markdown\" target=\"_blank\">GitHub Flavored Markdown</a></span> 文本标记语法。\r\n            <div class=\"sep10\"></div>\r\n            在正式提交之前，你可以点击“preview”来查看 Markdown 正文的实际渲染效果。\r\n             <div class=\"sep10\"></div>\r\n             你可以点击“upload” 选择需要的图片后上传后点击插入按钮，插入md的图片标签。\r\n            <div class=\"sep10\"></div>\r\n            </li>\r\n            <li><span class=\"f13\">选择节点</span><div class=\"sep10\"></div>\r\n            请为你的主题选择一个节点。恰当的归类会让你发布的信息更加有用。\r\n            <div class=\"sep10\"></div>\r\n          	如果有必要，管理员会帮助迁移节点\r\n            </li>\r\n           <li><span class=\"f13\">选择节点</span><div class=\"sep10\"></div>\r\n            请为你的主题选择一个节点。恰当的归类会让你发布的信息更加有用。\r\n            <div class=\"sep10\"></div>\r\n          	如果有必要，管理员会帮助迁移节点\r\n            </li>\r\n        </ul>','233',14),(14,'tipc_signup','233',15),(15,'233','233',16),(16,'233','233',17),(17,'233','233',18),(19,'<li class=\"\"><a href=\"/springabc/topics\">话题</a></li>\r\n<li class=\"\"><a href=\"/springabc/nodes\">节点</a></li>\r\n<li><a href=\"/springabc/users/\" >Users</a></li>\r\n<li><a href=\"/springabc/videos.html\" >Videos</a></li>\r\n<li class=\"\"><a href=\"/springabc/docs.html\">文档</a></li>\r\n','233',5),(20,'admin','sfsf',19);
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focus`
--

DROP TABLE IF EXISTS `focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_at` datetime NOT NULL,
  `node_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dcysq5t6w4yvt0twe7a6umw1h` (`node_id`),
  KEY `FK_shp43xvgrewctw5s4vo2993eq` (`user_id`),
  CONSTRAINT `FK_dcysq5t6w4yvt0twe7a6umw1h` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`),
  CONSTRAINT `FK_shp43xvgrewctw5s4vo2993eq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus`
--

LOCK TABLES `focus` WRITE;
/*!40000 ALTER TABLE `focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_at` datetime NOT NULL,
  `follower_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_i2ewwo9inkvk8vaqrxj5v8f5i` (`follower_id`),
  KEY `FK_tkjr0k3x569btja89gb5vccck` (`following_id`),
  CONSTRAINT `FK_i2ewwo9inkvk8vaqrxj5v8f5i` FOREIGN KEY (`follower_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_tkjr0k3x569btja89gb5vccck` FOREIGN KEY (`following_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `topic_count` bigint(20) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fwigxdmj6bsrpcmhcgpmlsirh` (`name`),
  KEY `FK_kihhhba7yo0oh5kplfgafba4e` (`section_id`),
  CONSTRAINT `FK_kihhhba7yo0oh5kplfgafba4e` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (8,NULL,'zone first, Advice',1,'Zone12',0,5),(19,NULL,'杂谈一下',1,'杂谈',0,6),(20,NULL,'',0,'zone11',0,5),(21,NULL,'zatantan desc',0,'zatan',0,6),(22,NULL,'to doing',0,'todo',0,9);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inxhsk5bf6gpm7b41orsar7fc` (`comment_id`),
  KEY `FK_1urdwwsh2ti15ta6f6p5dbdcp` (`user_id`),
  CONSTRAINT `FK_1urdwwsh2ti15ta6f6p5dbdcp` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_inxhsk5bf6gpm7b41orsar7fc` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (40,0,163,8,'回复');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `view_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f6ctahf1jnokrtpp5wblm0shb` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'# Spring abc 社区\r\n\r\n```\r\n呵呵哒\r\n\r\n```','2015-12-03 03:02:04','about',NULL,'about',1),(2,'# Comming soon !\r\n*where is it? *',NULL,'Videos',NULL,'videos',1),(3,'# 这是文档','2015-12-15 21:37:58','相关文档',NULL,'docs',1);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,'site_name','site_name'),(2,'site_description','site_description'),(3,'site_keywords','site_keywords'),(4,'site_ICP','site_ICP'),(5,'nav_main','nav_main'),(6,'nav_footer','nav_footer'),(7,'footer_description','footer_description'),(8,'footer_script','footer_script'),(9,'ad_side','ad_side'),(10,'ad_inner','ad_inner'),(11,'tip_notic','tip_notic'),(12,'tip_welcome','tip_welcome'),(13,'tip_signup','tip_signup'),(14,'tip_topic','tip_topic'),(15,'tip_comment','tip_comment'),(16,'limit_edit','limit_edit'),(17,'limit_delete','limit_delete'),(18,'limit_comment','limit_comment'),(19,'comment_edit','comment_edit');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rwqtt5x96oahjdtqt20vxu4um` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (5,'zone',0),(6,'杂谈',0),(7,'zone2',0),(9,'TODO',0);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collecton_id` int(11) DEFAULT NULL,
  `comment_count` bigint(20) unsigned DEFAULT '0',
  `content` longtext NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `last_comment_at` datetime DEFAULT NULL,
  `last_comment_user` tinyblob,
  `last_comment_user_id` int(11) DEFAULT NULL,
  `like_count` bigint(20) unsigned DEFAULT '0',
  `score` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `view_count` bigint(20) unsigned DEFAULT '0',
  `node_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_99um5d29ufxu4mrm2lbt3a9ms` (`node_id`),
  KEY `FK_c975xs66f0v6extdjdl0csctr` (`user_id`),
  CONSTRAINT `FK_99um5d29ufxu4mrm2lbt3a9ms` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`),
  CONSTRAINT `FK_c975xs66f0v6extdjdl0csctr` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (17,NULL,1,'主题标题\r\n请在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。\r\n正文\r\n可以在正文中为你要发布的主题添加更多细节。 支持 GitHub Flavored Markdown 文本标记语法。\r\n在正式提交之前，你可以点击“preview”来查看 Markdown 正文的实际渲染效果。\r\n你可以点击“upload” 选择需要的图片后上传后点击插入按钮，插入md的图片标签。\r\n选择节点\r\n请为你的主题选择一个节点。恰当的归类会让你发布的信息更加有用。\r\n如果有必要，管理员会帮助迁移节点\r\n选择节点\r\n请为你的主题选择一个节点。恰当的归类会让你发布的信息更加有用。\r\n如果有必要，管理员会帮助迁移节点','2017-01-08 23:55:54',NULL,NULL,NULL,0,0,0,'first topic',NULL,24,8,7),(18,NULL,0,'杂谈知识aa','2017-01-12 23:50:54',NULL,NULL,NULL,0,0,0,'杂谈知识aa',NULL,1,19,8),(19,NULL,0,'new topic ','2017-01-23 22:21:47',NULL,NULL,NULL,0,0,0,'new topic ',NULL,1,8,8);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `comment_count` bigint(20) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `home_page` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `number` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `points` bigint(20) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `topic_count` bigint(20) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'img/noavatar_small.gif',NULL,NULL,'2016-09-15 21:34:52','spring-abc','admin@spring-abc.xyz','https://github.com/zh-h/spring-abc','http://spring-abc.xyz/','广州市','springabc',0,'1afae1b673ce662874ec44cad872d9d6',0,'admin','spring-abc',NULL,'https://github.com/zh-h',NULL,'springabc'),(8,'img/noavatar_small.gif',NULL,NULL,'2017-01-11 23:37:12',NULL,'zhu.jinhua@foxmail.com',NULL,NULL,NULL,'aaabes',1,'1310a03d9aebdfedc0c77ba7d7e09316',0,'admin','Stay hungry',NULL,NULL,NULL,'aaabes');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-23 22:53:26
