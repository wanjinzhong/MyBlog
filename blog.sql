-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.15-0ubuntu0.16.04.1

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `blogger_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `reading` int(11) DEFAULT '0',
  `cover_pic` varchar(255) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`article_id`),
  KEY `fk_article_1_idx` (`blogger_id`),
  KEY `fk_article_2_idx` (`type_id`),
  CONSTRAINT `fk_article_1` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`blogger_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_2` FOREIGN KEY (`type_id`) REFERENCES `article_type` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,1,'小米2a几个系统心得','<p>前言：\r\n\r\n 这篇评测文章完全是本人体验后的感想，不代表其他任何人。每个人都有发表自己合法言论的自由，文中我没有刻意要黑某个ROM或者褒扬某个ROM，所以请喷子们嘴下留情，本文仅供参考。体验机型为小米2a，当然只用自己一台手机体验的系统，不免出现偶然性，加上本人能力有限，文中的很多错误请大家见谅。\r\n\r\n 正文：\r\n\r\n 从来没有认真点评过ROM。小米2a已经是被小米公司给放弃了。去年出的MIUI6在小米2a这种低内存的机器上来讲是跑起来非常吃力。已经放弃了MIUI了。从决定刷机到现在，我刷过IUNI，乐蛙OS，Smartisan OS等几个知名操作系统，但是都有很多BUG和一些个人不喜欢的东西。然后又被迫刷回MIUI。再次用了几天MIUI6后实在受不了它吃内存的问题，准备刷入原生Android。无意中发现一个系统名为FIUI，看介绍是国内首个民间第三方团队制作的安卓UI，所以并不对它有多看好。但因为有个独特的奇幻状态栏，我决定刷入体验一下。根据这几个UI，我想各自说说它们的优缺点。\r\n\r\nMIUI： MIUI是国内一个非常成熟的UI，其功能非常全面，几乎覆盖普通用户日常所有需要的功能，而且它的毛玻璃的实时渲染效果看起来非常之美观，加之载体小米手机在手机市场的热度，让它成为数一数二的Android深度定制UI，其固定时间的系统更新也让开发版用户感到暖心。但是从MI1，MI1s,MI2a的1GB内存，到MI2，MI2s，MI3的2GB内存，再到MI4的3GB内存，硬件一代代升级，旧机器一代代淘汰。最新的MIUI 6也为了各种强大的功能和华丽的视觉效果，不惜加大系统的运行难度。当然这对于大内存高配置的MI3及MI4来说不在话下，但是对于MI2a用户来说，实在是难为了这个小机器。首先，开机后会有300MB左右的空闲内存，看起来还不错，但是当打开了几个应用之后（即便是在任务管理中结束了进程）只剩100多MB。当我在一个应用中长时间停留使用后，返回至桌面会有几秒的加载桌面，这是因为桌面没有常驻内存，运行时内存不够被系统杀掉了，但是系统桌面是关键应用啊！！怎么能说杀就杀呢！！而且，经常会出现输入法也被杀的情况，导致无法弹出输入法。对于有强迫症的我来说，这是不允许出现的。既然小米公司放弃MI2a，那我也放弃MIUI吧。\r\n\r\nIUNI：作为刚从MIUI迁徙过来的用户，最大的感受就是通知栏不习惯。因为MIUI对于通知栏的设计是顶部下拉，分为两页，一页是通知，一页是快捷开关。而IUNI则将两者完全分开：顶部下拉仅仅显示通知，而快捷开关和任务管理合并，通过底部上滑方式实现，对于我来说十分新颖，毕竟是第一次接触这样的操作方式。但是在我刚开始用IUNI的时候，这样的操作方式带来了一定的不便：当用户全屏视频或游戏时，并不能从底部上滑呼出快捷开关页面，当然，现在已经被IUNI团队用右侧向左滑的方式解决。而IUNI的“生来纯净，不忘初心”也让我十分感动。不附加过多的预装软件，当我刷好系统第一次进入桌面时真的看到了一个纯净的桌面。其界面也是非常简单，白色为主题，不累赘，该突出的主题一一呈现。时光锁屏能根据时间的推移自动改变锁屏壁纸。但是也许是由于兼容性问题，亮度自动调节功能存在缺陷，外界亮度改变后系统并不能即使做出相应调整屏幕亮度。似乎在这个系统下的拍照效果并不好，而且音效也不太令人满意，我只能通过V4音效来提升。系统UI停止工作也是常事，每每让我重刷。\r\n\r\n 乐蛙OS：这款ROM适配小米的版本为OS5。这款ROM我并没有用多久，因为处女座无法接受顶部时不时会出现白色线条的BUG，而且从2014年3月到现在就没有再更新，也无人修复其BUG。但是，乐蛙OS还是有它独特的地方的。比如鸟瞰，新型的任务管理界面，不过听说有人经常反馈鸟瞰崩溃的问题。还有它的类似于Galaxy S4的来电手机翻转静音等炫酷功能，来电将手机放至耳朵直接接听的问题。但是如果开的铃声就这样放在耳边接电话我怕有点不敢。\r\n\r\nSmartisan OS：以为官方适配了，好吧，我想多了。刷机之前我已经看过老罗的发布会。原本对这个系统没有任何好感，因为如此的工匠技艺并不能吸引我。为了体验，我还是刷入了。开机之后的默认九宫格让我感觉有一种当初的棒棒机的影子。不能更换桌面壁纸，让所有的Smartisan都一样，没有了个性化。但是也让这个系统非常“独特”。在我看来最大的亮点在于点击联系人头像后的扇形选项，还有类似于IOS的短信延迟3秒发送。好吧，界面真的让我又萌生了换系统的欲望。\r\n\r\nFIUI：就像我之前说的，我只是在因为流畅的问题绝望到想换原生Android的时候无意中看到的系统，这是我第一次听说这个系统，原本准备刷上体验一下再换至原生Android的。但是我刷上之后便被吸引住了，类似于魅族风格。其实很早就像刷入魅族的，但是苦于我是小米手机，小米和魅族本来就。。。呵呵。其流畅度也是我用过的深度定制UI中最好的。在开发者选项的设置中再一次无意中发现了ART模式，开启之后更是大大增加了系统的流畅度，觉得这部手机不再只是双核处理器1GB内存的机器。最值得一提的是它的奇幻状态栏。我在MIUI和IUNI中都不断在网上搜索如何支持沉浸式状态栏，但是结果都不太理想。直到这个ROM创新地加入了奇幻状态栏，根据APP主题颜色自动变色，非常漂亮。任务管理采用类似于IUNI的风格。其相机虽说有360度全景拍摄，但是由于噪点严重，大大扣了分。系统本身比较纯净，除了自带的必要功能，就只有GOOGLE市场和GOOGLE PLAY了。值得吐槽的是电话呼出界面和来电界面太难看。而且在锁屏状态下来电要先解锁！！而且在关屏后有一定的几率无法唤醒，要等一下屏幕才会渐渐亮起。对于自动亮度，居然可以自定义在多少流明的时候亮度为百分之多少。我准备长期使用这个OS，正是因为其流畅度让人感动。但不排除会体验其它系统，比如百度云OS，ColorOS，MokeeUI等等。\r\n\r\n 再次声明，这仅仅是笔者使用自己的手机刷入的体验，由于不同的ROM包和手机性能的问题，本文并不能完全说明问题，有错误之处还望大家见谅。</p>','2016-09-29 21:43:51','2016-10-13 11:31:34',10,'手机,科技,ROM',598,'/coverPic/1476329494264.jpg',0),(2,2,'爱情不容有错，即使错了那就重来','<p style=\"text-align: left;\">进一好友空间，再一次看到她置顶的那一篇《他和她的故事》爱情在他俩的生活中经历了不少分分合合，但最后俩人还是走在了一起。当今天再一次阅读的时候，我没有第一次那么感性，我注重他们俩曲折的过程，其中出现过第三者...</p><p style=\"text-align: left;\">如果我是她，对于他当初的脚踏两只船、尽管仍然说爱但亦然离开而选择别人，我很肯定我是无法原谅他的，也许你会说是因为我不是真正爱他吧，我也不知道，这是不是因为爱得不够深，不能包容他的过错...我是很小气的人，就像很多人说的那样，一年365天，你364天对她好，只要有一天对她不好，她也会在n天也许n年后提出来，你哪天对我不好。</p><p style=\"text-align:center\"><img src=\"images/e5e39b1148811261c78b933805d07232.png\" alt=\"分手\"/></p><p>大学时跟我分分合合的男朋友，却是这么一个爱犯错的人。跟他交往，会有意无意的伤到我自尊，至今我也那么认为那伤害了我的自尊。在我骨子里有一种骄傲和很强的自尊，而他却偏偏伤了一次又一次。他的朋友都说我小气，我至今也觉得如果我不小气，那就是我傻！</p><p>我认为大学时的恋爱，是毕业前进入社会的一次恋爱实习。参杂了很多的疑问和抉择。就像工作，从销售到文员到编辑到技术员，最后才知道什么工作适合自己。找一个人陪你恋爱实习，也许很简单，也许很难。</p><p>这么多年过去了，当初分手都会舍不得那段4年的感情，后来也是时间煮了这段记忆。现在我们各自有了各自的生活，他也找到了他心仪的男孩，我能感觉出他们俩很相爱，当初最后一次分手的过渡时间，无论有多么的不舍与难熬，现在看看都是正确的。</p><p style=\"text-align: center;\"><img src=\"images/1f8aea2172f6eb987c3de3f7ba474eb1.png\" alt=\"分手\"/></p><p>为何我会毅然放弃，因为在我心里，那些过去的伤，那些不好的记忆永远都抹不去，我无法面对，哪怕是当初妥协了，我想最后我也一定会再一次选择放弃....</p><p>我觉得爱情也可以重新来过，只是换换主角罢了...</p>','2016-09-29 23:17:47','2016-10-14 16:36:09',41,'爱情,生活',43,'/coverPic/1476325440940.jpg',0),(3,1,'读什么书，要什么自行车','<p style=\"text-align: left;\">哈哈哈<br/></p><p>1、小学入学第一天<br/></p><p style=\"text-align: left;\">我对老师说会背301首唐诗做100以内加减法，口齿清晰条理清楚，老师对我眉开眼笑；<br/>张二狗对老师的提问一问摇头三不知，神情呆滞语无伦次，老师对他暗暗皱眉。<br/>&nbsp;&nbsp;&nbsp; 	<br/></p><p style=\"text-align:center\"><img src=\"http://pic.baike.soso.com/p/20130531/20130531163719-522844516.jpg\"/></p><p style=\"text-align: left;\">2、小学二年级<br/></p><p>我考试次次第一，终于在一次满分后肩膀上多了三条杠杠；<br/>张二狗和人打架有赢有输，终于在一次大败后脸上多了三条疤疤。<br/></p><p>3、小学三年级<br/>期末考试我再次拿到语文数学两门功课双一百，老爸被老师请到家长会上介绍家庭教育经验；<br/>期末考试张二狗再次拿到语文数学两门功课总分三十，老爸被老师请进办公室聆听家庭教育经验。</p><p>4、小学四年级<br/>领导前来视察我校，我作为少先队代表上台发言，被大家称为主席台上的模范学生。<br/>校长宣布从严治校，张二狗作为闯祸精代表上台检讨，被大家说是站壁角的形象大使。</p><p>5、小学五年级<br/>我的作文《一个难忘的晚上》在某次大赛中获奖，老师陪我到省城领奖并游玩了一天。<br/>张二狗在一个难忘的晚上爬墙进入某个工厂搬运废铜，门卫陪他到派出所领奖并休养了一天。<br/>&nbsp;&nbsp;&nbsp; 	<br/>6、升初中了<br/>听说初中的几个班主任为抢我到自己班上而争得面红耳赤。<br/>听说初中的几个班主任为把张二狗踢到别人班上闹得不可开交。<br/>&nbsp;&nbsp;&nbsp; 	<br/>7、初一时<br/>初一时，我爸在酒店设宴庆功，为我在中学生奥数中获奖请别人一起高兴。<br/>初一时，张二狗爸在酒店设宴赔罪，为张二狗闯的祸请别人不要追究<br/>&nbsp;&nbsp;&nbsp; 	<br/>8、初二时<br/>初二时，我光荣地加入了学校里的团组织；<br/>初二时，张二狗光荣地加入了学校里的痞子帮。<br/>&nbsp;&nbsp;&nbsp; 	<br/>9、初三时<br/>班上的班花给我写情书，情书还没到我手里就被班主任发现没收，班主任警告班花：不得妨碍我考重点高中；<br/>张二狗给班上的胖妞如花递纸条，如花转身把纸条扔进垃圾桶，还告诫张二狗：不要妨碍她混初中文凭。<br/>&nbsp;&nbsp;&nbsp; 	<br/>10、初中毕业了<br/>我理所当然地进入了重点高中；<br/>张二狗顺理成章地进入社会深造。<br/>&nbsp;&nbsp;&nbsp; 	<br/>11、毕业那天<br/>我们初中的门卫李大爷指着我教育大孙子：一定要像我这样好好学习天天向上，将来才能做个受尊敬的人；<br/>我们初中的门卫李大爷指着张二狗教育大孙子：千万不要像他这样惹是生非门门红灯，将来一定是个受鄙视的人。<br/>&nbsp;&nbsp;&nbsp; 	<br/>12、高中三年<br/>我做过班长团支书学生会主席，获得了一个又一个荣誉、拿到了一笔又一笔的奖学金；<br/>社会三年，张二狗做过混混推销员包工头，积累了一条又一条的人脉，攒下了一笔又一笔资金。<br/>&nbsp;&nbsp;&nbsp; 	<br/>13、黑色七月<br/>那个黑色七月，我如愿考上省城的大学；<br/>那个火热七月，张二狗如愿在省城注册公司。<br/>&nbsp;&nbsp;&nbsp; 	<br/>14、大学与商海<br/>大学里我在学海遨游创业中，<br/>张二狗在商海搏击。<br/>&nbsp;&nbsp;&nbsp; 	<br/>15、毕业那年与创业四年<br/>毕业那年，优秀毕业生我进入人才市场找工作，处处碰壁后不得不把薪金要求降低。<br/>创业四年，民营企业家张二狗进入人才市场找员工，广受追捧后不得不把学历门槛提高到硕士起点，很轻松招揽一群高学历高层次的人才，感受了一夜之间从丑小鸭到白天鹅的荣耀<br/>16、<br/>我的破永久自行车跑遍全省城，孤身一人凄凄凉凉四处寻找租住的房子；<br/>张二狗的保时捷跑遍全省城，市长区长作陪四处寻找建二狗大厦和工业园区的地块。 	<br/>&nbsp;&nbsp;&nbsp; <br/>17、<br/>我手头紧张，也想学张二狗白手起家自主创业，从小商品市场批发了一大堆东东搞兼职做起了推销，几星期内亏了一大笔，暗自感慨：做生意原来这么难<br/>张二狗闲来无事，也想进大学校门学习深造增加内涵，请教授吃饭泡校里的美眉就是没认真上课，几年内拿到了MBA学位，暗自感慨：读书原来这么简单<br/>&nbsp;&nbsp;&nbsp; 	<br/>18、<br/>七夕节，别人介绍的恐龙女 朋友嫌弃我没房没车没出息，和我吹灯拔蜡分道扬镳<br/>七夕节，大学里的校花因为张二狗家大业大前程大，向他眉目传情投怀送抱 	<br/>&nbsp;&nbsp;&nbsp; <br/>20、<br/>家门口，我哀求俗气的土包子房东缓交房费时唯唯诺诺支支吾吾，净给大学生丢脸<br/>电视上，张二狗对着漂亮的财经频道女主持人大谈企业文化<br/>21、<br/>房价飞涨，我忽然发现在省城有一套房子只能是一个梦想，老爹老妈来省城看过我的租住房，回家后伤心不已<br/>房价飞涨，张二狗把一套又一套的房子赠给各类美女，一小美女的老爹老妈来省城看过二狗赠的复式景观房，回家后得意不已<br/>22、<br/>春节我回家，没人理睬，路过当年就读的初中，听说里面在办校庆，想去看看却被拒之门外，门卫李大爷指着我教育小孙子：不要学习这个人，读了这么多年书还是一穷二白，连自己都养不活。<br/>春节张二狗回家，县长接驾，还参加当年就读的初中特意举办的校庆，张董在校庆上砸下巨额赞助，门卫李大爷指着张董教育小孙子：你要像主席台上的这个人学习，白手起家富甲一方，连亲戚都沾光。<br/>23、<br/>十几年前，老师感叹，要是所有学生都像我一样该有多好.<br/>十几年后，老师感叹，要是所有学生都像张二狗一样该有多好<br/>这就是中国教育！&nbsp;&nbsp;\r\n 	TMD高考 考你妹一碗肉丝粉！</p><p>\r\n 	<span style=\"color:#ff0000;font-family:楷体_GB2312;font-size:32px\">操TMD中国教育制度！！<span style=\"color:#c00000\">腐败 昏庸 无能！！</span></span>\r\n </p>','2016-09-29 23:17:47','2016-10-12 21:47:50',10,'叛逆，吐槽',370,'/coverPic/1476244878237.jpg',0),(4,2,'藕花深处，心淡如莲','<p style=\"text-align: center;\"><img src=\"http://www.chinapoesy.com/UploadFiles/Poesy/20120804_5ec1b0f1-819d-4b4d-af14-839b44d9affd.jpg\" width=\"541\" height=\"466\"/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;花间一壶酒，芳香四溢，迷醉了千人；园中一壶茶，馨香素雅，禅意了人生；林中一水间，泉水叮咚，荡漾了心怀；池中一朵莲，亭亭净植，潋滟了我心。莲，犹如素心结美的女子，立于荷塘淤泥之中，吸天地为精华，饮露水为琼浆。纤尘不染，静静盛开在佛前，不争不吵，不悲不喜，与世无争，以蝶为伍，倚风而眠。阳光下灿烂，细雨中邀歌，微风里飘摇。莲花也叫荷花，她为花之君子，出淤泥而不染，濯清涟而不妖，中通外直，不蔓不枝，香远益清，亭亭净植。自古来，莲就为世人所称赞，高雅的情操，动人的娇颜，坚贞的品质，道不尽，叙不完。有的爱她仙女下凡般的美貌，有的爱她清风道骨般的潇洒，而我更爱她那与世无争般的淡然。</p><p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;犹记得第一次见到她时是在一个夏日的黄昏，刚下过雨，空气稍显凉快了些。走在公园的荷塘边上，远远望去大片大片的绿与嫣红吸引了我。走近一看，哦，原来这就是传说中的莲，真的是百闻不如一见。时值盛夏，花开正好。瞧，走近一些，藕花深处田田叶，叶上初生并蒂莲，好一个美不胜收。细看，荷叶中的莲花，有白的，有红的……有的花开正艳、有的粉面含羞、有的含苞待放、有的一束冲天，大雨过后花瓣和荷叶上还残留着些许的水珠，在夕阳的映衬下越发显得清逸动人。走远一点看去，她们便在风中婀娜多姿的摇曳，又似神话里的仙子在风中翩翩起舞……看的边上的人儿迷了眼，也醉了心。也许是自那以后吧，便悄然爱上了她。终于相信，有些人或者有些物，一见便会倾心。于莲，我想便是如此。我欣赏她在淤泥里也能顽强的生长，又纤尘不染的盛开；虽没有玫瑰的艳丽，也没有牡丹的娇贵，可就是因为她那清雅的容颜和淡雅的馨香，犹如一股涓涓细流般的注入心田，在心头久久萦绕，挥之而不去。生活中琐碎烦忧难免绕心头，学会在心中栽种一朵莲花，学习她那淡泊以名利，宁静以致远的心性，在人生路上点燃这盏心灯，不断的修行自己。又或在现实中闲来无事时栽种几盆花草盆栽，身心的疲惫和烦忧我想也会跟着瞬间烟消云散的。看着不久前网上购买的睡莲，在圆圆的玻璃缸里从萌芽到伸展枝叶，从小叶变成大叶，从含苞到待放，亲眼目睹它茁壮的成长，心里有种莫名的成就感。闻着淡淡的花草气息，疲惫忧伤也都荡然无存了。心若如莲，浅笑安然。都说茶能养心亦能静心，在一盏茶的光阴里可以静品人生亦可静悟参禅。莲也豪不逊色，在闲下来的时光里到荷塘边静静观赏一池清幽，在藕花深处遥望世间的万千风华，沐浴在荷叶田田之下，也是一种美好的熏陶，浮躁的心也会渐渐跟着平静下来。待回归，便能以一朵莲的姿态，泰然自若，处事不惊的面对人世间更多的凄风苦雨。</p>','2016-09-30 16:56:20','2016-10-14 16:37:19',7,'散文',32,'/coverPic/1476257073958.png',0),(5,2,'曹云金国庆怒发演出照，与郭德纲拼人气，看后我竟然笑了','<p style=\"text-align:center\"><img src=\"http://p3.pstatp.com/large/e520004eb5cd6e09369\"/></p><p style=\"text-align: left;\">10月2日，郭德纲发微博：欢度国庆，德云社北展相声专场。配了演出现场人气照，外加自己与于谦老师的合影。演出现场人气爆棚，座无虚席。</p><p style=\"text-align:center\"><img src=\"http://p1.pstatp.com/large/e520004eb5ddf0a6d8b\"/></p><p style=\"text-align: left;\">郭德纲相声演出现场，座无虚席，偌大一个场馆，竟然爆满。</p><p style=\"text-align: left;\">两天之后的10月4日，之前与郭德纲上演过撕逼大战的徒弟曹云金，竟也怒发微博，配了自己的“听云轩”演出现场人气照，并配文：谢谢今晚的观众们冒雨前来观看我们听云轩团队的演出，天气虽冷，但你们的热情温暖了整个场馆！希望今晚的演出能给您带来快乐！我们会更加努力，为您带来更多好作品！</p><p style=\"text-align:center\"><img src=\"http://p3.pstatp.com/large/efb000770c707232125\"/></p><p style=\"text-align: left;\">曹云金虽然没有明确是对郭德纲微博的回应，但是明眼人都能看得出来，曹云金似乎是要与郭德纲拼演出人气。通过此，表明自己离开德云社，自立门户的“听云轩”，依旧可以大红。</p><p style=\"text-align:center\"><img src=\"http://p3.pstatp.com/large/efd000773c9b0907019\"/></p><p style=\"text-align: left;\">曹云金演出现场图，不难看出，现场有一些空位。看着两人发出来的照片，总觉得哪里有点问题。博主发现，这不比不知道，一比吓一跳，两人的人气还真是相差太大啊！对于两人的撕逼大战，不占任何队列，只是觉得，曹云金要达到郭德纲的影响力，还需要一些磨砺啊！有可能这一辈子也达不到吧！虽然达不到师父的成就，但是无可否认，小曹也是一个优秀的相声演员，希望以后的路越走越顺。两家安好。<br/></p>','2016-10-06 13:02:31','2016-10-14 16:38:16',48,'新闻',238,'/coverPic/1476255982160.png',0),(6,5,'gajowjgoajwoaf','<p>nimeimeimde</p><p>afagagagada</p><p>fa</p><p>s</p><p>da</p><p>fa</p><p>d</p><p>af</p><p>fa</p><p>gagadag</p><p>gzgzsdzgzzsczgz<img title=\"1476257935866013945.jpg\" alt=\"06.jpg\" src=\"blogPic/articlePic/20161012/1476257935866013945.jpg\"/></p>','2016-10-12 15:39:04','2016-10-12 15:39:04',11,'',10,'/coverPic/1476257944719.jpg',0),(7,5,'','<p>ffasgadawggfaga</p><p><img title=\"1476257990099098980.png\" alt=\"5794.png\" src=\"blogPic/articlePic/20161012/1476257990099098980.png\"/></p>','2016-10-12 15:40:08','2016-10-12 15:40:08',11,'',0,NULL,0),(9,5,'ef','<p>d</p>','2016-10-12 16:06:33','2016-10-12 16:06:33',11,'',0,NULL,0),(10,5,'f','<p>f</p>','2016-10-12 16:06:53','2016-10-12 16:06:53',11,'',0,NULL,0),(11,2,'美丽的风景','<p>给你们看一看风景<br/></p><p><img src=\"blogPic/articlePic/20161012/1476260685325026439.jpg\" title=\"1476260685325026439.jpg\"/></p><p><img src=\"blogPic/articlePic/20161012/1476260685414075780.jpg\" title=\"1476260685414075780.jpg\"/></p><p><img src=\"blogPic/articlePic/20161012/1476260685498027985.jpg\" title=\"1476260685498027985.jpg\"/></p><p><img src=\"blogPic/articlePic/20161012/1476260685612028732.jpg\" title=\"1476260685612028732.jpg\"/></p><p><br/></p><p><br/></p>','2016-10-12 16:26:25','2016-10-14 16:37:09',47,'风景',8,'/coverPic/1476260785970.jpg',0),(12,5,'1','<blockquote><p>2<img title=\"1476263782121047545.jpg\" alt=\"ico_04_1.jpg\" src=\"blogPic/articlePic/20161012/1476263782121047545.jpg\"/>2</p></blockquote>','2016-10-12 17:16:23','2016-10-12 17:17:35',11,'',3,'/coverPic/1476263783181.jpg',0),(18,2,'天真夺下玷辱','<p>盱睦下在瓀互相帮助<br/></p>','2016-10-13 09:59:51','2016-10-14 16:36:24',42,'',1,'/coverPic/1476323991322.jpg',0),(19,1,'2016年10月9日实习日志','<p>k<br/></p>','2016-10-13 10:41:24','2016-10-13 10:43:09',10,'实习',2,'/coverPic/1476326484187.png',0),(20,1,'哈哈哈','<p><br/></p><p><img src=\"http://img.baidu.com/hi/youa/y_0034.gif\" width=\"300\" height=\"200\"/>图文混排方法</p><p>1. 图片居左，文字围绕图片排版</p><p>方法：在文字前面插入图片，设置居左对齐，然后即可在右边输入多行文本</p><p><br/></p><p>2. 图片居右，文字围绕图片排版</p><p>方法：在文字前面插入图片，设置居右对齐，然后即可在左边输入多行文本</p><p><br/></p><p>3. 图片居中环绕排版</p><p>方法：亲，这个真心没有办法。。。</p><p><br/></p><p><br/></p><p><img src=\"http://img.baidu.com/hi/youa/y_0040.gif\" width=\"300\" height=\"300\"/></p><p>还有没有什么其他的环绕方式呢？这里是居右环绕</p><p><br/></p><p>欢迎大家多多尝试，为UEditor提供更多高质量模板！</p><p><br/></p><p>占位</p><p><br/></p><p>占位</p><p><br/></p><p>占位</p><p><br/></p><p>占位</p><p><br/></p><p>占位</p><p><br/></p><p><br/></p><p><br/></p>','2016-10-13 11:27:46','2016-10-13 11:27:46',10,'乱说',2,'/coverPic/1476329266445.jpg',0),(21,1,'MyBatis的association',' <p>&nbsp;&nbsp;&nbsp;&nbsp;假设每个学生都有一名指导老师，本示例的任务就是查询出学生的详细信息，这就包括学生的指导老师的信息。具体代码如下：</p> \n<p>1、表的结构</p> \n<pre class=\"brush:sql;toolbar: true; auto-links: false;\"><code>DROP&nbsp;TABLE&nbsp;IF&nbsp;EXISTS&nbsp;`student`;\nCREATE&nbsp;TABLE&nbsp;`student`&nbsp;(\n&nbsp;&nbsp;`id`&nbsp;int(11)&nbsp;NOT&nbsp;NULL&nbsp;auto_increment,\n&nbsp;&nbsp;`name`&nbsp;varchar(10)&nbsp;NOT&nbsp;NULL,\n&nbsp;&nbsp;`gender`&nbsp;char(1)&nbsp;NOT&nbsp;NULL,\n&nbsp;&nbsp;`major`&nbsp;varchar(20)&nbsp;NOT&nbsp;NULL,\n&nbsp;&nbsp;`grade`&nbsp;char(4)&nbsp;NOT&nbsp;NULL,\n&nbsp;&nbsp;`supervisor_id`&nbsp;int(11)&nbsp;NOT&nbsp;NULL,\n&nbsp;&nbsp;PRIMARY&nbsp;KEY&nbsp;&nbsp;(`id`)\n)&nbsp;ENGINE=InnoDB&nbsp;AUTO_INCREMENT=2&nbsp;DEFAULT&nbsp;CHARSET=utf8;\n--&nbsp;----------------------------\n--&nbsp;Records&nbsp;of&nbsp;student\n--&nbsp;----------------------------\nINSERT&nbsp;INTO&nbsp;`student`&nbsp;VALUES&nbsp;(\'1\',&nbsp;\'李林\',&nbsp;\'男\',&nbsp;\'计算机科学与技术\',&nbsp;\'2011\',&nbsp;\'1\');\n--&nbsp;----------------------------\n--&nbsp;Table&nbsp;structure&nbsp;for&nbsp;teacher\n--&nbsp;----------------------------\nDROP&nbsp;TABLE&nbsp;IF&nbsp;EXISTS&nbsp;`teacher`;\nCREATE&nbsp;TABLE&nbsp;`teacher`&nbsp;(\n&nbsp;&nbsp;`id`&nbsp;int(11)&nbsp;NOT&nbsp;NULL&nbsp;auto_increment,\n&nbsp;&nbsp;`name`&nbsp;varchar(10)&nbsp;NOT&nbsp;NULL,\n&nbsp;&nbsp;`gender`&nbsp;char(1)&nbsp;NOT&nbsp;NULL,\n&nbsp;&nbsp;`research_area`&nbsp;varchar(20)&nbsp;NOT&nbsp;NULL,\n&nbsp;&nbsp;PRIMARY&nbsp;KEY&nbsp;&nbsp;(`id`)\n)&nbsp;ENGINE=InnoDB&nbsp;AUTO_INCREMENT=2&nbsp;DEFAULT&nbsp;CHARSET=utf8;\n--&nbsp;----------------------------\n--&nbsp;Records&nbsp;of&nbsp;teacher\n--&nbsp;----------------------------\nINSERT&nbsp;INTO&nbsp;`teacher`&nbsp;VALUES&nbsp;(\'1\',&nbsp;\'张伟\',&nbsp;\'男\',&nbsp;\'软件工程\');</code></pre> \n<p>&nbsp;2、对应的JavaBean类</p> \n<pre class=\"brush:java;toolbar: true; auto-links: false;\"><code>public&nbsp;class&nbsp;Student&nbsp;{\n&nbsp;private&nbsp;int&nbsp;id;&nbsp;&nbsp;\n&nbsp;private&nbsp;String&nbsp;name;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;姓名\n&nbsp;private&nbsp;String&nbsp;gender;&nbsp;&nbsp;&nbsp;//&nbsp;性别\n&nbsp;private&nbsp;String&nbsp;major;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;专业\n&nbsp;private&nbsp;String&nbsp;grade;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;年级\n&nbsp;private&nbsp;Teacher&nbsp;supervisor;&nbsp;//指导教师&nbsp;\n&nbsp;\n&nbsp;public&nbsp;int&nbsp;getId()&nbsp;{\n&nbsp;&nbsp;return&nbsp;id;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setId(int&nbsp;id)&nbsp;{\n&nbsp;&nbsp;this.id&nbsp;=&nbsp;id;\n&nbsp;}\n&nbsp;public&nbsp;String&nbsp;getName()&nbsp;{\n&nbsp;&nbsp;return&nbsp;name;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setName(String&nbsp;name)&nbsp;{\n&nbsp;&nbsp;this.name&nbsp;=&nbsp;name;\n&nbsp;}\n&nbsp;public&nbsp;String&nbsp;getGender()&nbsp;{\n&nbsp;&nbsp;return&nbsp;gender;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setGender(String&nbsp;gender)&nbsp;{\n&nbsp;&nbsp;this.gender&nbsp;=&nbsp;gender;\n&nbsp;}\n&nbsp;public&nbsp;String&nbsp;getMajor()&nbsp;{\n&nbsp;&nbsp;return&nbsp;major;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setMajor(String&nbsp;major)&nbsp;{\n&nbsp;&nbsp;this.major&nbsp;=&nbsp;major;\n&nbsp;}\n&nbsp;public&nbsp;String&nbsp;getGrade()&nbsp;{\n&nbsp;&nbsp;return&nbsp;grade;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setGrade(String&nbsp;grade)&nbsp;{\n&nbsp;&nbsp;this.grade&nbsp;=&nbsp;grade;\n&nbsp;}\n&nbsp;public&nbsp;Teacher&nbsp;getSupervisor()&nbsp;{\n&nbsp;&nbsp;return&nbsp;supervisor;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setSupervisor(Teacher&nbsp;supervisor)&nbsp;{\n&nbsp;&nbsp;this.supervisor&nbsp;=&nbsp;supervisor;\n&nbsp;}\n}\npublic&nbsp;class&nbsp;Teacher&nbsp;{\n&nbsp;private&nbsp;int&nbsp;id;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;private&nbsp;String&nbsp;name;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;教师姓名\n&nbsp;private&nbsp;String&nbsp;gender;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;教师性别\n&nbsp;private&nbsp;String&nbsp;researchArea;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;研究领域\n&nbsp;private&nbsp;List&lt;Student&gt;&nbsp;supStudents;&nbsp;//&nbsp;指导学生\n&nbsp;\n&nbsp;public&nbsp;int&nbsp;getId()&nbsp;{\n&nbsp;&nbsp;return&nbsp;id;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setId(int&nbsp;id)&nbsp;{\n&nbsp;&nbsp;this.id&nbsp;=&nbsp;id;\n&nbsp;}\n&nbsp;public&nbsp;String&nbsp;getName()&nbsp;{\n&nbsp;&nbsp;return&nbsp;name;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setName(String&nbsp;name)&nbsp;{\n&nbsp;&nbsp;this.name&nbsp;=&nbsp;name;\n&nbsp;}\n&nbsp;public&nbsp;String&nbsp;getGender()&nbsp;{\n&nbsp;&nbsp;return&nbsp;gender;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setGender(String&nbsp;gender)&nbsp;{\n&nbsp;&nbsp;this.gender&nbsp;=&nbsp;gender;\n&nbsp;}\n&nbsp;public&nbsp;String&nbsp;getResearchArea()&nbsp;{\n&nbsp;&nbsp;return&nbsp;researchArea;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setResearchArea(String&nbsp;researchArea)&nbsp;{\n&nbsp;&nbsp;this.researchArea&nbsp;=&nbsp;researchArea;\n&nbsp;}\n&nbsp;public&nbsp;List&lt;Student&gt;&nbsp;getSupStudents()&nbsp;{\n&nbsp;&nbsp;return&nbsp;supStudents;\n&nbsp;}\n&nbsp;public&nbsp;void&nbsp;setSupStudents(List&lt;Student&gt;&nbsp;supStudents)&nbsp;{\n&nbsp;&nbsp;this.supStudents&nbsp;=&nbsp;supStudents;\n&nbsp;}\n}</code></pre> \n<p>3、配置StudentMapper.xml</p> \n<pre class=\"brush:xml;toolbar: true; auto-links: false;\"><code>&lt;?xml&nbsp;version=\"1.0\"&nbsp;encoding=\"UTF-8\"&nbsp;?&gt;\n&lt;!DOCTYPE&nbsp;mapper&nbsp;PUBLIC&nbsp;\"-//mybatis.org//DTD&nbsp;Mapper&nbsp;3.0//EN\"&nbsp;\n\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\"&gt;\n&lt;mapper&nbsp;namespace=\"org.zsm.myBatis.day02.inner.IStudentOperation\"&gt;\n&nbsp;&lt;!--&nbsp;定义java&nbsp;Bean的属性与数据库的列之间的映射&nbsp;--&gt;\n&nbsp;&lt;resultMap&nbsp;type=\"Student\"&nbsp;id=\"studentResultMap\"&gt;\n&nbsp;&nbsp;&lt;id&nbsp;column=\"id\"&nbsp;property=\"id\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"name\"&nbsp;property=\"name\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"gender\"&nbsp;property=\"gender\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"major\"&nbsp;property=\"major\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"grade\"&nbsp;property=\"grade\"/&gt;\n&nbsp;&nbsp;&lt;!--&nbsp;association处理has-a关系&nbsp;--&gt;\n&nbsp;&nbsp;&lt;!--注意：这种方式javaType必须指定，表示supervisor的类型是Teacher，否则会报错&nbsp;--&gt;\n&nbsp;&nbsp;&lt;association&nbsp;property=\"supervisor\"&nbsp;javaType=\"Teacher\"&gt;\n&nbsp;&nbsp;&nbsp;&lt;!--&nbsp;教师自身的属性与数据库字段的映射&nbsp;--&gt;\n&nbsp;&nbsp;&nbsp;&lt;id&nbsp;property=\"id\"&nbsp;column=\"t_id\"/&gt;\n&nbsp;&nbsp;&nbsp;&lt;result&nbsp;property=\"name\"&nbsp;column=\"t_name\"/&gt;\n&nbsp;&nbsp;&nbsp;&lt;result&nbsp;property=\"gender\"&nbsp;column=\"t_gender\"/&gt;\n&nbsp;&nbsp;&nbsp;&lt;result&nbsp;property=\"researchArea\"&nbsp;column=\"research_area\"/&gt;\n&nbsp;&nbsp;&lt;/association&gt;\n&nbsp;&lt;/resultMap&gt;\n&nbsp;\n&nbsp;&lt;!--&nbsp;SQL语句中以\"#{}\"的形式引用参数&nbsp;--&gt;\n&nbsp;&lt;select&nbsp;id=\"getById\"&nbsp;parameterType=\"int\"&nbsp;resultMap=\"studentResultMap\"&gt;\n&nbsp;&nbsp;SELECT&nbsp;st.id,st.name,st.gender,st.major,st.grade,t.id&nbsp;t_id,t.name&nbsp;t_name,\n&nbsp;&nbsp;t.gender&nbsp;t_gender,t.research_area&nbsp;\n&nbsp;&nbsp;FROM&nbsp;student&nbsp;st,&nbsp;teacher&nbsp;t\n&nbsp;&nbsp;WHERE&nbsp;st.supervisor_id&nbsp;=&nbsp;t.id\n&nbsp;&nbsp;AND&nbsp;st.id=#{id}\n&nbsp;&lt;/select&gt;\n&lt;/mapper&gt;</code></pre> \n<p>3、测试</p> \n<pre class=\"brush:java;toolbar: true; auto-links: false;\"><code>&nbsp;public&nbsp;void&nbsp;testAssociation(){\n&nbsp;&nbsp;SqlSession&nbsp;session&nbsp;=&nbsp;sqlSessionFactory.openSession();\n&nbsp;&nbsp;IStudentOperation&nbsp;studentOperation&nbsp;=&nbsp;session.getMapper(IStudentOperation.class);\n&nbsp;&nbsp;Student&nbsp;student&nbsp;=&nbsp;studentOperation.getById(1);\n&nbsp;&nbsp;System.out.println(student.getName()+\"的指导老师是:\"+student.getSupervisor().getName());\n&nbsp;}</code></pre> \n<p>myBatis association的两种形式</p> \n<p>一、嵌套的resultMap</p> \n<p>&nbsp;&nbsp;&nbsp;&nbsp;这种方法的本质就是把教师实体映射从association元素中提取出来，用一个resultMap元素表示。然后association元素再引用这个resultMap元素。</p> \n<pre class=\"brush:xml;toolbar: true; auto-links: false;\"><code>&lt;?xml&nbsp;version=\"1.0\"&nbsp;encoding=\"UTF-8\"&nbsp;?&gt;\n&lt;!DOCTYPE&nbsp;mapper&nbsp;PUBLIC&nbsp;\"-//mybatis.org//DTD&nbsp;Mapper&nbsp;3.0//EN\"&nbsp;\n\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\"&gt;\n&lt;mapper&nbsp;namespace=\"org.zsm.myBatis.day02.inner.IStudentOperation\"&gt;\n&nbsp;&lt;!--&nbsp;定义java&nbsp;Bean的属性与数据库的列之间的映射&nbsp;--&gt;\n&nbsp;&lt;resultMap&nbsp;type=\"Teacher\"&nbsp;id=\"teacherResultMap\"&gt;\n&nbsp;&nbsp;&lt;id&nbsp;property=\"id\"&nbsp;column=\"t_id\"/&gt;\n&nbsp;&nbsp;&nbsp;&lt;result&nbsp;property=\"name\"&nbsp;column=\"t_name\"/&gt;\n&nbsp;&nbsp;&nbsp;&lt;result&nbsp;property=\"gender\"&nbsp;column=\"t_gender\"/&gt;\n&nbsp;&nbsp;&nbsp;&lt;result&nbsp;property=\"researchArea\"&nbsp;column=\"research_area\"/&gt;\n&nbsp;&lt;/resultMap&gt;\n&nbsp;\n&nbsp;&lt;resultMap&nbsp;type=\"Student\"&nbsp;id=\"studentResultMap\"&gt;\n&nbsp;&nbsp;&lt;id&nbsp;column=\"id\"&nbsp;property=\"id\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"name\"&nbsp;property=\"name\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"gender\"&nbsp;property=\"gender\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"major\"&nbsp;property=\"major\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"grade\"&nbsp;property=\"grade\"/&gt;\n&nbsp;&nbsp;&lt;!--&nbsp;引用teacherResultMap&nbsp;--&gt;\n&nbsp;&nbsp;&lt;association&nbsp;property=\"supervisor\"&nbsp;resultMap=\"teacherResultMap\"/&gt;\n&nbsp;&lt;/resultMap&gt;\n&nbsp;\n&nbsp;&lt;!--&nbsp;SQL语句中以\"#{}\"的形式引用参数&nbsp;--&gt;\n&nbsp;&lt;select&nbsp;id=\"getById\"&nbsp;parameterType=\"int\"&nbsp;resultMap=\"studentResultMap\"&gt;\n&nbsp;&nbsp;SELECT&nbsp;st.id,st.name,st.gender,st.major,st.grade,t.id&nbsp;t_id,t.name&nbsp;t_name,\n&nbsp;&nbsp;t.gender&nbsp;t_gender,t.research_area&nbsp;\n&nbsp;&nbsp;FROM&nbsp;student&nbsp;st,&nbsp;teacher&nbsp;t\n&nbsp;&nbsp;WHERE&nbsp;st.supervisor_id&nbsp;=&nbsp;t.id\n&nbsp;&nbsp;AND&nbsp;st.id=#{id}\n&nbsp;&lt;/select&gt;\n&lt;/mapper&gt;</code></pre> \n<p>二、嵌套的select语句</p> \n<p>&nbsp;&nbsp;&nbsp;&nbsp;这种方式是使用一条单独的select语句来加载关联的实体(本例中就是教师实体)，然后在association元素中引用此select语句(注：此方法会产生N+1问题，尽量不要用嵌套的select语句)</p> \n<pre class=\"brush:xml;toolbar: true; auto-links: false;\"><code>&lt;?xml&nbsp;version=\"1.0\"&nbsp;encoding=\"UTF-8\"&nbsp;?&gt;\n&lt;!DOCTYPE&nbsp;mapper&nbsp;PUBLIC&nbsp;\"-//mybatis.org//DTD&nbsp;Mapper&nbsp;3.0//EN\"&nbsp;\n\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\"&gt;\n&lt;mapper&nbsp;namespace=\"org.zsm.myBatis.day02.inner.IStudentOperation\"&gt;\n&nbsp;&lt;!--&nbsp;定义java&nbsp;Bean的属性与数据库的列之间的映射&nbsp;--&gt;\n&nbsp;&lt;resultMap&nbsp;type=\"Teacher\"&nbsp;id=\"supervisorResultMap\"&gt;\n&nbsp;&nbsp;&lt;id&nbsp;property=\"id\"&nbsp;column=\"t_id\"/&gt;\n&nbsp;&nbsp;&nbsp;&lt;result&nbsp;property=\"name\"&nbsp;column=\"t_name\"/&gt;\n&nbsp;&nbsp;&nbsp;&lt;result&nbsp;property=\"gender\"&nbsp;column=\"t_gender\"/&gt;\n&nbsp;&nbsp;&nbsp;&lt;result&nbsp;property=\"researchArea\"&nbsp;column=\"research_area\"/&gt;\n&nbsp;&lt;/resultMap&gt;\n&nbsp;\n&nbsp;&lt;resultMap&nbsp;type=\"Student\"&nbsp;id=\"studentResultMap\"&gt;\n&nbsp;&nbsp;&lt;id&nbsp;column=\"id\"&nbsp;property=\"id\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"name\"&nbsp;property=\"name\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"gender\"&nbsp;property=\"gender\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"major\"&nbsp;property=\"major\"&nbsp;/&gt;\n&nbsp;&nbsp;&lt;result&nbsp;column=\"grade\"&nbsp;property=\"grade\"/&gt;\n&nbsp;&nbsp;&lt;!--&nbsp;引用teacherResultMap&nbsp;--&gt;\n&nbsp;&nbsp;&lt;association&nbsp;property=\"supervisor\"&nbsp;column=\"supervisor_id\"&nbsp;select=\"selectSupervisor\"/&gt;\n&nbsp;&lt;/resultMap&gt;\n&nbsp;\n&nbsp;&lt;!--&nbsp;SQL语句中以\"#{}\"的形式引用参数&nbsp;--&gt;\n&nbsp;&lt;select&nbsp;id=\"getById\"&nbsp;parameterType=\"int\"&nbsp;resultMap=\"studentResultMap\"&gt;\n&nbsp;&nbsp;select&nbsp;id,name,gender,major,grade,supervisor_id&nbsp;from&nbsp;student&nbsp;where&nbsp;id&nbsp;=#{id}\n&nbsp;&lt;/select&gt;\n&nbsp;\n&nbsp;&lt;select&nbsp;id=\"selectSupervisor\"&nbsp;parameterType=\"int\"&nbsp;resultMap=\"supervisorResultMap\"&gt;\n&nbsp;&nbsp;select&nbsp;id,name,gender,research_area\n&nbsp;&nbsp;from&nbsp;teacher&nbsp;where&nbsp;id&nbsp;=&nbsp;#{id}\n&nbsp;&lt;/select&gt;\n&lt;/mapper&gt;</code></pre>','2016-10-13 13:15:31','2016-10-13 13:15:31',43,'mybatis,association',5,NULL,1),(22,2,'greg','<p><img src=\"blogPic/articlePic/20161014/1476435715476014399.jpg\" title=\"1476435715476014399.jpg\" alt=\"5565b3e789936717.jpg\"/></p>','2016-10-14 17:01:57','2016-10-14 17:01:57',2,'dfs',2,'/coverPic/1476435717277.jpg',0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_type`
--

DROP TABLE IF EXISTS `article_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `blogger_id` int(11) NOT NULL,
  `publish_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_id`),
  KEY `fk_article_type_1_idx` (`blogger_id`),
  CONSTRAINT `fk_article_type_1` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`blogger_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_type`
--

LOCK TABLES `article_type` WRITE;
/*!40000 ALTER TABLE `article_type` DISABLE KEYS */;
INSERT INTO `article_type` VALUES (1,'手机','手机科技',1,'2016-10-11 09:11:38','2016-10-11 16:22:36',0),(2,'生活','这是生活杂文',2,'2016-10-11 09:11:59','2016-10-12 15:24:47',1),(4,'随笔','这不是乱写的',1,'2016-10-11 15:32:12','2016-10-12 21:12:41',0),(6,'默认分类','这是一个默认分类',4,'2016-10-11 17:07:48','2016-10-11 17:07:48',1),(7,'散文','最多是小清新',2,'2016-10-12 00:55:03','2016-10-12 01:18:58',0),(9,'文言文','看不懂',2,'2016-10-12 01:16:48','2016-10-12 01:19:02',0),(10,'恶搞','搞笑的',1,'2016-10-12 11:45:21','2016-10-12 13:52:18',1),(11,'默认分类','这是一个默认分类',5,'2016-10-12 15:37:56','2016-10-12 15:37:56',1),(41,'爱情','男女那点事',2,'2016-10-13 09:49:40','2016-10-13 09:49:40',0),(42,'日记','每天记录一点点',2,'2016-10-13 09:51:15','2016-10-13 09:51:15',0),(43,'实习日志','中软实习日志',1,'2016-10-13 10:33:04','2016-10-13 10:33:04',0),(45,'盗版书','不要乱说',1,'2016-10-14 15:37:32','2016-10-14 15:37:32',0),(46,'作业','晚上做的作业',1,'2016-10-14 15:38:30','2016-10-14 15:38:30',0),(47,'风景','好看的风景',2,'2016-10-14 16:37:00','2016-10-14 16:37:00',0),(48,'八卦','娱乐圈那点事',2,'2016-10-14 16:38:08','2016-10-14 16:38:08',0),(49,'默认分类','这是一个默认分类',6,'2016-10-16 11:41:04','2016-10-16 11:41:04',1);
/*!40000 ALTER TABLE `article_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogger`
--

DROP TABLE IF EXISTS `blogger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogger` (
  `blogger_id` int(11) NOT NULL AUTO_INCREMENT,
  `blogger_name` varchar(45) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`blogger_id`),
  KEY `fk_bloger_1_idx` (`user_id`),
  CONSTRAINT `fk_bloger_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogger`
--

LOCK TABLES `blogger` WRITE;
/*!40000 ALTER TABLE `blogger` DISABLE KEYS */;
INSERT INTO `blogger` VALUES (1,'土豆鱼',1),(2,'小草笙歌',2),(4,'wowowo',4),(5,'test',5),(6,'阿贾克斯',6);
/*!40000 ALTER TABLE `blogger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_content` text NOT NULL,
  `time` datetime NOT NULL,
  `article_id` int(11) NOT NULL,
  `is_new` int(11) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_1_idx` (`user_id`),
  KEY `fk_comment_2_idx` (`article_id`),
  KEY `fk_comment_3_idx` (`parent_id`),
  CONSTRAINT `fk_comment_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_3` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`comment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (3,5,'前排插楼','2016-10-13 10:44:57',3,0,NULL),(4,1,'测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。测试一条长评论。','2016-10-16 11:09:14',3,0,NULL),(5,6,'我不要读书','2016-10-16 11:41:35',3,1,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_word`
--

DROP TABLE IF EXISTS `leave_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_word` (
  `leave_word_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `content` text NOT NULL,
  `blogger_id` int(11) NOT NULL,
  `is_new` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`leave_word_id`),
  KEY `fk_new_table_1_idx` (`blogger_id`),
  KEY `fk_new_table_2_idx` (`user_id`),
  CONSTRAINT `fk_new_table_1` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`blogger_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_new_table_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_word`
--

LOCK TABLES `leave_word` WRITE;
/*!40000 ALTER TABLE `leave_word` DISABLE KEYS */;
INSERT INTO `leave_word` VALUES (1,1,'2016-10-03 15:40:57','你是万进忠',1,1),(3,1,'2016-10-03 15:41:33','你是蒲宇璇',2,0),(4,2,'2016-10-03 15:42:07','3',1,0),(5,1,'2016-10-03 15:40:57','4',1,1),(6,1,'2016-10-03 15:41:33','5',2,0),(7,2,'2016-10-03 15:42:07','6',1,0),(8,1,'2016-10-03 15:40:57','7',1,1),(9,1,'2016-10-03 15:41:33','8',2,0),(10,2,'2016-10-03 15:42:07','9',1,0),(11,1,'2016-10-03 15:40:57','10',1,1),(12,1,'2016-10-03 15:41:33','11',2,0),(13,2,'2016-10-03 15:42:07','12',1,0),(14,1,'2016-10-03 15:40:57','13',1,1),(15,1,'2016-10-03 15:41:33','14',2,0),(16,2,'2016-10-03 15:42:07','15',1,0),(17,1,'2016-10-03 15:40:57','16',1,1),(18,1,'2016-10-03 15:41:33','17',2,0),(19,2,'2016-10-03 15:42:07','18',1,0),(20,1,'2016-10-03 15:40:57','19',1,1),(21,1,'2016-10-03 15:41:33','20',2,0),(22,2,'2016-10-03 15:42:07','21',1,0),(23,1,'2016-10-03 15:40:57','22',1,1),(24,1,'2016-10-03 15:41:33','23',2,0),(25,2,'2016-10-03 15:42:07','24',1,0),(26,1,'2016-10-03 15:40:57','25',1,1),(27,1,'2016-10-03 15:41:33','26',2,0),(28,2,'2016-10-03 15:42:07','27',1,0),(29,1,'2016-10-03 15:40:57','28',1,1),(30,1,'2016-10-03 15:41:33','29',2,0),(31,2,'2016-10-03 15:42:07','30',1,1),(32,1,'2016-10-03 15:40:57','31',1,1),(33,1,'2016-10-03 15:41:33','32',2,0),(34,2,'2016-10-03 15:42:07','33',1,0),(35,1,'2016-10-03 15:40:57','34',1,1),(36,1,'2016-10-03 15:41:33','35',2,0),(37,2,'2016-10-03 15:42:07','36',1,0),(38,1,'2016-10-03 15:40:57','37',1,1),(39,1,'2016-10-03 15:41:33','38',2,0),(40,2,'2016-10-03 15:42:07','39',1,0),(41,1,'2016-10-03 15:40:57','40',1,1),(42,1,'2016-10-03 15:41:33','41',2,0),(43,2,'2016-10-03 15:42:07','42',1,0),(44,1,'2016-10-03 15:40:57','43',1,1),(45,1,'2016-10-03 15:41:33','44',2,0),(46,2,'2016-10-03 15:42:07','45',1,0),(47,1,'2016-10-03 15:40:57','46',1,1),(48,1,'2016-10-03 15:41:33','47',2,0),(49,2,'2016-10-03 15:42:07','48',1,0),(50,1,'2016-10-03 15:40:57','49',1,1),(51,1,'2016-10-03 15:41:33','50',2,0),(52,2,'2016-10-03 15:42:07','51',1,0),(53,1,'2016-10-03 15:40:57','52',1,1),(54,1,'2016-10-03 15:41:33','53',2,0),(55,2,'2016-10-03 15:42:07','54',1,0),(56,1,'2016-10-03 15:40:57','55',1,1),(57,1,'2016-10-03 15:41:33','56',2,0),(58,2,'2016-10-03 15:42:07','57',1,0),(59,1,'2016-10-03 15:40:57','58',1,1),(60,1,'2016-10-03 15:41:33','59',2,0),(61,2,'2016-10-03 15:42:07','60',1,1),(62,1,'2016-10-03 15:40:57','61',1,1),(63,1,'2016-10-03 15:41:33','62',2,0),(64,2,'2016-10-03 15:42:07','63',1,1),(65,1,'2016-10-03 15:40:57','64',1,1),(66,1,'2016-10-03 15:41:33','65',2,1),(67,2,'2016-10-03 15:42:07','66',1,1),(68,1,'2016-10-03 15:40:57','67',1,1),(69,1,'2016-10-03 15:41:33','68',2,1),(70,2,'2016-10-03 15:42:07','69',1,1),(71,1,'2016-10-03 15:40:57','70',1,1),(72,1,'2016-10-03 15:41:33','71',2,1),(73,2,'2016-10-03 15:42:07','72',1,1),(74,1,'2016-10-03 15:40:57','73',1,1),(75,1,'2016-10-03 15:41:33','74',2,1),(76,2,'2016-10-03 15:42:07','75',1,1),(77,1,'2016-10-03 15:40:57','76',1,1),(78,1,'2016-10-03 15:41:33','77',2,1),(79,2,'2016-10-03 15:42:07','78',1,1),(80,1,'2016-10-03 15:40:57','79',1,1),(81,1,'2016-10-03 15:41:33','80',2,1),(82,2,'2016-10-03 15:42:07','81',1,1),(83,1,'2016-10-03 15:40:57','82',1,1),(84,1,'2016-10-03 15:41:33','83',2,1),(85,2,'2016-10-03 15:42:07','84',1,1),(86,1,'2016-10-03 15:40:57','85',1,1),(87,1,'2016-10-03 15:41:33','86',2,1),(88,2,'2016-10-03 15:42:07','87',1,1),(89,1,'2016-10-03 15:40:57','88',1,1),(90,1,'2016-10-03 15:41:33','89',2,1),(91,2,'2016-10-03 15:42:07','90',1,1),(92,1,'2016-10-03 15:40:57','91',1,1),(93,1,'2016-10-03 15:41:33','92',2,1),(94,2,'2016-10-03 15:42:07','93',1,1),(95,1,'2016-10-03 15:40:57','94',1,1),(96,1,'2016-10-03 15:41:33','95',2,1),(97,2,'2016-10-03 15:42:07','96',1,1),(98,1,'2016-10-03 15:40:57','97',1,1),(99,1,'2016-10-03 15:41:33','98',2,1),(100,2,'2016-10-03 15:42:07','99',1,1),(101,1,'2016-10-03 15:40:57','100',1,1),(102,2,'2016-10-06 22:28:15','你的科技文章写得不错',1,0),(103,1,'2016-10-07 01:44:07','专门进你的博客看看！我叫万进忠～',2,0),(104,1,'2016-10-11 17:09:02','你好好',4,0),(105,7,'2016-10-16 15:53:17','测试超长用户名留言',1,1),(106,7,'2016-10-16 15:57:02','测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。测试超长留言文本。',1,1);
/*!40000 ALTER TABLE `leave_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mood`
--

DROP TABLE IF EXISTS `mood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mood` (
  `mood_id` int(11) NOT NULL AUTO_INCREMENT,
  `blogger_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `place` varchar(45) DEFAULT '保密',
  `mood_type_id` int(11) NOT NULL,
  `isprivate` int(11) DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`mood_id`),
  KEY `fk_mood_1_idx` (`blogger_id`),
  KEY `fk_mood_2_idx` (`mood_type_id`),
  CONSTRAINT `fk_mood_1` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`blogger_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mood_2` FOREIGN KEY (`mood_type_id`) REFERENCES `mood_type` (`mood_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mood`
--

LOCK TABLES `mood` WRITE;
/*!40000 ALTER TABLE `mood` DISABLE KEYS */;
/*!40000 ALTER TABLE `mood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mood_type`
--

DROP TABLE IF EXISTS `mood_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mood_type` (
  `mood_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `pic_url` varchar(255) NOT NULL,
  PRIMARY KEY (`mood_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mood_type`
--

LOCK TABLES `mood_type` WRITE;
/*!40000 ALTER TABLE `mood_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mood_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `real_name` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `qq` varchar(32) DEFAULT NULL,
  `introduce` varchar(1024) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT 'images/defaultUserPic.gif',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'wanjinzhong','wjz','万进忠','1994-09-08',1,'1051750377@qq.com','15881193175','成都','1051750377','我是一个快乐的程序员','/userPic/1476277014795.jpg'),(2,'puyuxuan','pyx','蒲宇璇','1994-07-20',0,'1141257374@qq.com','15756876175','西昌','1141257374','一个懂事的好姑娘','/userPic/1476256484290.jpg'),(4,'wowowo','123','',NULL,1,'','',NULL,'','','/userPic/1476176900690.jpg'),(5,'test','123','6666',NULL,1,'','',NULL,'','','/userPic/1476344707927.jpg'),(6,'ajax','ajax',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'images/defaultUserPic.gif'),(7,'abcdefghijklmnopq','123',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'images/defaultUserPic.gif');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-17  1:44:04
