drop table Admin;
create table Admin(
	Aname varchar2(20),
	Apwd varchar2(30)
);

drop table Admin;
drop table WeiBoTag;
drop table UserTag;
drop table WeiBoUser;
drop table Groups;
drop table UserTagFather;
drop table FanAndFaned;
drop table Theme;
drop table WBandThe;
drop table WeiBo;
drop table WeiBoHelp;
drop table Operate;
drop table WeiboAndWeibo;


select * from Admin;
insert into Admin values('admin','sa');

--微博标签表
create table WeiBoTag(
       WTid int primary key,          --微博标签id
       WTname varchar2(10)           --微博标签名（字段）
                          --视频 衡阳 社会 国际 科技 科普 数码 财经 股市 明星 综艺 电视剧 
                          --电影 音乐 汽车 体育 运动健身 健康 瘦身 养生 军事 历史 美女模特 
                          --美图 情感 搞笑 辟谣 正能量 艺术 时尚 美妆 动漫 宗教 萌宠 法律
                          --政务 游戏 旅游 育儿 教育 美食 房产 家居 星座 读书 三农 设计
);
select * from WeiboTag;
select seq_wbt_wtid.nextval from dual;
select wt.*
from
select wt.*,rownum rn from WeiboTag wt
where rn > #{pageSize}*(#{pageNum}-1) and rn <= #{pageSize}*#{pageNum};

select wt.*
from
select wt.*,rownum rn from WeiboTag wt
where rn > 10*(1-1) and rn <= 10*1;

delete sequence seq_wbt_wtid from dual;
create sequence seq_wbt_wtid start with 50;
delete from WeiboTag where WTid in (1,2);

insert into WeiBoTag values(1,'视频');
insert into WeiBoTag values(2,'衡阳');
insert into WeiBoTag values(3,'社会');
insert into WeiBoTag values(4,'国际');
insert into WeiBoTag values(5,'科技');
insert into WeiBoTag values(6,'科普');
insert into WeiBoTag values(7,'数码');
insert into WeiBoTag values(8,'财经');
insert into WeiBoTag values(9,'股市');
insert into WeiBoTag values(10,'明星');
insert into WeiBoTag values(11,'综艺');
insert into WeiBoTag values(12,'电视剧');
insert into WeiBoTag values(13,'电影');
insert into WeiBoTag values(14,'音乐');
insert into WeiBoTag values(15,'汽车');
insert into WeiBoTag values(16,'体育');
insert into WeiBoTag values(17,'运功健身');
insert into WeiBoTag values(18,'健康');
insert into WeiBoTag values(19,'瘦身');
insert into WeiBoTag values(20,'养生');
insert into WeiBoTag values(21,'军事');
insert into WeiBoTag values(22,'历史');
insert into WeiBoTag values(23,'美女模特');
insert into WeiBoTag values(24,'美图');
insert into WeiBoTag values(25,'情感');
insert into WeiBoTag values(26,'搞笑');
insert into WeiBoTag values(27,'辟谣');
insert into WeiBoTag values(28,'正能量');
insert into WeiBoTag values(29,'艺术');
insert into WeiBoTag values(30,'时尚');
insert into WeiBoTag values(31,'美妆');
insert into WeiBoTag values(32,'动漫');
insert into WeiBoTag values(43,'宗教');
insert into WeiBoTag values(34,'萌宠');
insert into WeiBoTag values(35,'法律');
insert into WeiBoTag values(36,'政务');
insert into WeiBoTag values(37,'游戏');
insert into WeiBoTag values(38,'旅游');
insert into WeiBoTag values(39,'育儿');
insert into WeiBoTag values(40,'教育');
insert into WeiBoTag values(41,'美食');
insert into WeiBoTag values(42,'房产');
insert into WeiBoTag values(43,'家居');
insert into WeiBoTag values(43,'星座');
insert into WeiBoTag values(45,'读书');
insert into WeiBoTag values(46,'三农');
insert into WeiBoTag values(47,'设计');
delete from WeiBoTag where WTname in ('国际','科技');


create table UserTagFather(
	UTFid int primary key,    --用户标签父类表
	UTFname varchar2(20)
);
insert into UserTagFather values(1,'名人');
insert into UserTagFather values(2,'专家');
insert into UserTagFather values(3,'其他');

--用户标签表
create table UserTag(
       UTid int primary key,          --用户标签id
       UTname varchar2(20),          --用户标签名 
       UTFid int references UserTagFather(UTFid)              
       					   --   名人:明星 商界 作家 政府官员..
                           --   专家:医疗 育儿 IT互联网 电台 财经 教育.. 
                           --   其他：..
);
create sequence seq_ut_utid start with 1 increment by 1;

insert into UserTag values(1,'明星',1);
insert into UserTag values(2,'作家',1);
insert into UserTag values(3,'政府官员',1);
insert into UserTag values(4,'商界',1);

insert into UserTag values(5,'医疗',2);
insert into UserTag values(6,'育儿',2);
insert into UserTag values(7,'IT互联网',2);
insert into UserTag values(8,'电台',2);
insert into UserTag values(9,'财经',2);
insert into UserTag values(10,'教育',2);

insert into UserTag values(11,'保姆',3);

--insert into UserTag values(seq_ut_utid.nextval,'明星');
--insert into UserTag values(seq_ut_utid.nextval,'作家');
--insert into UserTag values(seq_ut_utid.nextval,'政府官员');

select * from UserTag;
select seq_ut_utid.nextval from dual;

delete from UserTag where UTid in(4,5,6);

select * from UserTag u,UserTagFather f where u.UTFid=f.UTFid;
----微博用户表
drop table WeiBoUser;
select * from WeiBoUser;
create table WeiBoUser(
       WBUid int,                       --用户Id  √
       Uname varchar2(20),            --用户名   √
       Upassword varchar2(20),        --用户密码  √
       Uphone varchar2(11),           --用户手机号码  √
       Uemail varchar2(40),           --用户注册邮箱  √
       Usex char(2) default 'm',   --用户性别    √
       Uage int,                      --用户年龄    √
       UimgPath varchar2(100),        --用户图像路径  √
       UregisterDate Date,            --注册日期    √
       
       Uxxxx  varchar2(100),   --预留字段
       Uzzzz  varchar2(100),   --预留字段
       
       											--//下面的这一段可以在用户登录后修改个人信息里改（存）
       Uintroduce varchar2(100),      --自我介绍（简介） 						√
       Utag varchar2(100),            --用户标签（如体育，运动达人，手游等等）  自己加    	 √
       Uscore number(8),              --用户积分（用来计算vip等级）				√
       UspecialTag varchar2(40)       --特权标签（实名认证，会员，国籍）			√我们就弄一个国籍
);
update WeiBoUser set  UspecialTag = '0x1f1e80x1f1f3.png' where WBUid = 1006;
update WeiBoUser set  UspecialTag = '0x1f1e80x1f1f0.png' where WBUid = 1005;
update WeiBoUser set  UspecialTag = '0x1f1ec1f1e7.png' where WBUid = 1002;
update WeiBoUser set  UspecialTag = '0x1f1ec1f1e7.png' where WBUid = 1007;

update WeiBoUser set  UimgPath = '9.gif' where WBUid = 1007;


alter table WeiBoUser add constraint pk_wbu_wbuid primary key (WBUid);
alter table WeiBoUser drop column phoneStatus;
alter table WeiBoUser drop column emailStatus;
alter table WeiBoUser add phoneStatus int default 1;	--增加两列，用来处理通过何种方式找到好友,1为可以，0为否
alter table WeiBoUser add emailStatus int default 1;


select * from WeiBoUser;
create sequence seq_WeiBoUser_Wbuid start with 1006;
insert into WeiBoUser values(seq_WeiBoUser_Wbuid.nextval,'巴拉拉','sa','15675471040','1373930643@qq.com',default,22,null,sysdate,null,null,'爱国的大好青年','java工程师,学生',10000,'CN');
insert into WeiBoUser values(1002,'啊大大','sa','15675471111','15675471111@163.com','f',22,null,sysdate,null,null,'女汉子','java工程师,学生,美容',10000,'CN');
insert into WeiBoUser values(1005,'admin','sa','15675470000','15675470000@163.com','f',22,null,sysdate,null,null,'女汉子','java工程师,学生,美容',10000,'CN');
insert into WeiBoUser values(seq_WeiBoUser_Wbuid.nextval,'巴拉拉','sa','15675471040','1373930633@qq.com',default,22,null,sysdate,null,null,'爱国的大好青年','java工程师,日本',10000,'0x1f1ef0x1f1f5.png');


delete from WeiBoUser where WBUid in (1001,1002);

update WeiBoUser set Uphone = '15675471111' where WBUid = 1002;
update WeiBoUser set Uphone = '15675470000' where WBUid = 1005;

update WeiBoUser set Uemail = '15675471111@163.com' where WBUid = 1002;
update WeiBoUser set Uemail = '15675470000@163.com' where WBUid = 1005;

update WeiBoUser set UimgPath='zanwu.jpg' where WBUid=1002;
update WeiBoUser set UimgPath='userimg.jpg' where WBUid=1005;
update WeiBoUser set UimgPath='userphoto003.png' where WBUid=1006;


update WeiBoUser set Uemail='15675470000@qq.com' where WBUid=1002;
update WeiBoUser set Uemail='15675471111@qq.com' where WBUid=1005;

--用户之间联系中间表（n ~ n）
create table Relationship(
       Rid int primary key,           --用户联系id'
       Rname varchar2(20),            --用户之间关系（关注（被关注，粉丝），好友，未分组，黑名单，群？..）
       RidF int,                      --用户idF
       RidE int,                      --用户idE
       Rdate Date                     --时间
       
       --预留字段 
);
select * from Groups;
drop table Groups;
--群
create table Groups(
	Gid int,				--群id
	Gname varchar2(40),					--群名
	WBUid int references WeiBoUser(WBUid),--群里的用户id,如果加上unique则只能加入一个群 所以去掉
	Gdate Date							--进群时间
);
insert into Groups values (2003,'学习',1001,to_date('2016-05-12','yyyy-mm-dd'));
insert into Groups values (2003,'学习',1005,to_date('2016-05-12','yyyy-mm-dd'));
insert into Groups values (2002,'学习',1006,to_date('2016-05-12','yyyy-mm-dd'));
insert into Groups values (2001,'学习',1006,to_date('2016-05-12','yyyy-mm-dd'));
insert into Groups values (2001,'学习',1002,to_date('2016-09-18','yyyy-mm-dd'));
insert into Groups values (2001,'学习',1005,to_date('2016-08-05','yyyy-mm-dd'));

select distinct WBUid from Groups where Gid in(select Gid from Groups where WBUid=1006);
--黑名单
create table BlackList(
	Bid int primary key,				--黑名单id
	WBUid int references WeiBoUser(WBUid),  --哪个用户下的黑名单
	BUid int							--黑名单用户id
);
--粉与被粉（关注与被关注）
create table FanAndFaned(
	FUid int,							--粉丝者 现在是测试 主外键的问题先放一边
	FUedid int,							--被粉者
	Fstatus varchar2(16)				--粉与被粉之间的py状态(好友圈,同学,同事,未分组,名人明星,悄悄关注,特别关注,其他自己添加的。。)
);
alter table FanAndFaned add Fdate Date;
alter table FanAndFaned drop constraint pk_faf_fff;
alter table FanAndFaned add constraint pk_faf_fff primary key(FUid,FUedid,Fstatus);

drop table FanAndFaned;

select FUid,FUedid,Fstatus from FanAndFaned where Fuid=1001 and Fstatus='好友圈';
select count(*) from FanAndFaned where Fstatus = '同学' and Fuid = 1001;

delete from FanAndFaned where FUid=1001 and FUedid=1007 and Fstatus='同学';
delete from FanAndFaned where FUid=1001 and FUedid=1008 and Fstatus='同学';
delete from FanAndFaned where FUid=1001 and FUedid=1009 and Fstatus='同学';
delete from FanAndFaned where FUid=1001 and FUedid=1010 and Fstatus='同学';

--关注的人数
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus != '未分组';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '未分组';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '同学';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '好友圈';

select (select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '未分组') 未分组,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '好友圈') 好友圈,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '黑名单') 黑名单,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '群') 好友圈, --？？
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001) 关注,
		(select count(distinct(FUid)) from FanAndFaned where FUedid = 1001) 粉丝,
		(select count(WBid) from WeiBo where WBUId = 1001) 微博
from dual;
		
insert into FanAndFaned values(1001,1002,'好友圈');
insert into FanAndFaned values(1001,1003,'好友圈');
insert into FanAndFaned values(1001,1004,'好友圈');
insert into FanAndFaned values(1001,1005,'好友圈');
insert into FanAndFaned values(1001,1006,'好友圈');

insert into FanAndFaned values(1002,1001,'好友圈');
insert into FanAndFaned values(1002,1003,'好友圈');
insert into FanAndFaned values(1002,1004,'好友圈');
insert into FanAndFaned values(1002,1005,'好友圈');

insert into FanAndFaned values(1001,1002,'同学');
insert into FanAndFaned values(1001,1003,'同学');
insert into FanAndFaned values(1001,1004,'同学');
insert into FanAndFaned values(1001,1005,'同学');
insert into FanAndFaned values(1001,1006,'同学');


insert into FanAndFaned values(1001,1007,'未分组');
insert into FanAndFaned values(1006,1008,'好友圈',null);
insert into FanAndFaned values(1006,1009,'好友圈',null);
insert into FanAndFaned values(1006,1010,'未分组',null);

--首先话题是可以放在微博里发表的
--所以说话题可以是微博的一个附属
--话题表
select * from theme;
drop table Theme;
create table Theme(
	Tid int primary key,					--话题id
	Tname varchar2(40),						--话题标题
	TUid int, 								--话题发起人
	Tdate Date,								--话题发起时间
	Ttxt clob,								--话题的文本内容
	Tpics varchar2(540),					--话题图片路径
	Tdeliver int,							--话题被发表的次数
	Tview int								--话题访问次数
);
create sequence seq_Theme_Tid start with 1;
select tname from 
(select n.*,rownum rn from (select * from Theme) n 
where 5 * 1 >= rownum) 
where rn > 5 * (1 - 1);
insert into Theme values(seq_Theme_Tid.nextval,'#前任来撩约不约#',1001,to_date('2016-8-30','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1000,20000);
insert into Theme values(seq_Theme_Tid.nextval,'#反贪风暴2提档914#',1002,to_date('2016-8-30','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1100,21000);
insert into Theme values(seq_Theme_Tid.nextval,'#李云迪西藏捐音乐教室#',1002,to_date('2016-8-31','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1200,22000);
insert into Theme values(seq_Theme_Tid.nextval,'#窦靖童七月与安生#',1003,to_date('2016-8-31','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1300,23000);
insert into Theme values(seq_Theme_Tid.nextval,'#一图读懂#',1003,to_date('2016-8-31','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1400,24000);
insert into Theme values(seq_Theme_Tid.nextval,'#法医每天#',1003,to_date('2016-9-1','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1500,25000);
insert into Theme values(seq_Theme_Tid.nextval,'#三叠物种记录#',1004,to_date('2016-9-1','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1600,26000);
insert into Theme values(seq_Theme_Tid.nextval,'#天象预报#',1004,to_date('2016-9-1','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1700,27000);
insert into Theme values(seq_Theme_Tid.nextval,'#倾城夫妇情话满级#',1004,to_date('2016-9-1','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1800,28000);
insert into Theme values(seq_Theme_Tid.nextval,'#超女冠军方圆#',1004,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1400,24000);
insert into Theme values(seq_Theme_Tid.nextval,'#开学第二天吓死人了#',1005,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1500,25000);
insert into Theme values(seq_Theme_Tid.nextval,'#杨美娜百万身价#',1005,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1600,26000);
insert into Theme values(seq_Theme_Tid.nextval,'#郭俊辰北影报到#',1005,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1700,27000);
insert into Theme values(seq_Theme_Tid.nextval,'#故事里的旧时光#',1005,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1800,28000);


--微博和话题的中间表
create table WBandThe(
	WBid int references WeiBo(WBid),
	Tid int references Theme(Tid)
);

--微博
create table WeiBo(
       WBid int primary key,          --微博id
       Tid int						  --话题id
       WBtag varchar2(50),            --微博标签（）
       WBtitle varchar2(100),         --微博标题（可以写，也可以不写，但必须有）
       WBUid int
           constraint RK_WeiBo_Uid references WeiBoUser(WBUid),--用户Id( 哪几种标签的用户发表了哪几种类型的微博)
       WBdate Date,                   --微博发表日期
       WBtxt varchar2(2000),          --微博文字内容
       WBpic  varchar2(500),          --微博图片路径
       WBvideo varchar2(500),         --微博视屏路径(或者给个视屏路径，存本地，存数据库？存服务器？)
       WBmusic varchar2(500),		  --微博音乐路径
       yesOrno char(2),				  --是否是话题产生的weibo	
       yon char(2),					  --是否是转发微博  --这个有点重要吧
       WBlocation varchar2(120),	  --发表微博的地址
       WBstatue int					  --微博的状态 是否公开，群可见，好友圈可见，尽自己可见
       --预留字段      
);
alter table WeiBo add Tid int;

create sequence seq_wb_wbid start with 10001 increment by 1;

alter table WeiBo add WBlocation varchar2(100);
alter table WeiBo add WBstatue varchar2(20);     --微博的状态  公开 好友圈 群 仅自己可见
alter table WeiBo modify WBstatue int; 

drop table WeiBo;

delete from WeiBo;

select * from WeiBo;

select count(WBid) from WeiBo where WBUId = 1001;

select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
			(select * from WeiBo where (WBstatue = 0) or (WBUid in (select distinct(FUedid) from FanAndFaned where Fuid = 1001)) order by WBdate desc) n where 15 * 1 >= rownum)
 			where rn > 15 * (1-1)) b
 			where w.wbid = b.wbid;

insert into WeiBo values(seq_wb_wbid.nextval,'视频','小鸭子',1001,sysdate,'aaaaaaaaaaaaaaaaaaaaaaaaaaaa',null,null,null,'N','N','衡阳,长沙市',0);
insert into WeiBo values(seq_wb_wbid.nextval,'视频','大鸭子',1001,sysdate,'bbbbbbbbbbbbbbbbbbbbbbbbbbbb',null,null,null,'N','N','衡阳,长沙市',0);
insert into WeiBo values(seq_wb_wbid.nextval,'衡阳','湖工',1001,sysdate,'ccccccccccccccccccccccccccccccccccc',null,null,null,'N','N','衡阳,长沙市',0);
insert into WeiBo values(seq_wb_wbid.nextval,'军事','中日战争',1001,sysdate,'ddddddddddddddddddddddddddddd',null,null,null,'N','N','衡阳,长沙市',0);

insert into WeiBo values(seq_wb_wbid.nextval,'视频','大鸭子',1002,sysdate,'bbbbbbbbbbbbbbbbbbbbbbbbbbbb',null,null,null,'N','N','衡阳,长沙市',0);
insert into WeiBo values(seq_wb_wbid.nextval,'衡阳','湖工',1002,sysdate,'ccccccccccccccccccccccccccccccccccc',null,null,null,'N','N','衡阳,长沙市',0);
insert into WeiBo values(seq_wb_wbid.nextval,'时尚','麻衣寸衫',1002,sysdate,'ddddddddddddddddddddddddddddd',null,null,null,'Y','N','衡阳,长沙市',0);

update WeiBo set wbtag='大学' where wbid=10001;
update WeiBo set wbtag='搞笑' where wbid=10002;
update WeiBo set wbtag='时尚' where wbid=10003;
update WeiBo set wbtag='大学,时尚' where wbid=10004;
update WeiBo set wbtag='大学,搞笑' where wbid=10021;
update WeiBo set wbtag='大学,搞笑,时尚' where wbid=10022;

select * from WeiBo where wbtag like '%大学%'
>>>>>>> branch 'master' of ssh://git@github.com/apacheCrazyFan/weiboRepository.git

select * from weibo order by 
--微博附加表
create table WeiBoHelp(
       WBid int references WeiBo(WBid),--微博id
       WHviewAccount int,              --微博浏览次数
       WHreprintAccount int,           --微博转载次数
       WHfavoriteAccount int,          --微博收藏次数
       WHcommentAccount int,           --微博评论次数
       WHgreateAccount int	           --微博点赞次数
       
       --预留字段  
);
select * from  (
	select rownum rn, w.*,h.WHviewAccount,h.WHreprintAccount,h.WHfavoriteAccount,h.WHcommentAccount,h.WHgreateAccount,b.UimgPath,b.Uname from WeiBo w,WeiBoHelp h, weibouser b where w.wbid=h.wbid and b.wbuid=w.wbuid order by WHviewAccount,WHreprintAccount
	) where rn<5 and rn>1;

update WeiBoHelp set WHgreateAccount = 2210 where WBid in(10437);
insert into WeiBoHelp values(10424,9854,4562,1433,2555,1345);
insert into WeiBoHelp values(10425,1550,900,800,1020,1120);
insert into WeiBoHelp values(10426,7550,3200,600,120,620);
insert into WeiBoHelp values(10427,1550,900,800,1020,720);
insert into WeiBoHelp values(10428,2550,900,800,1020,140);
insert into WeiBoHelp values(10429,1550,1100,600,1020,119);
insert into WeiBoHelp values(10430,1950,400,800,1020,1220);


insert into WeiBoHelp values(10432,1550,900,850,1020,2120);
insert into WeiBoHelp values(10433,2150,880,800,1020,1120);
insert into WeiBoHelp values(10434,2150,880,650,1020,1120);
insert into WeiBoHelp values(10435,1560,900,800,1020,1120);
insert into WeiBoHelp values(10436,3050,2010,650,1020,1120);

insert into WeiBoHelp values(10437,1550,950,800,1020,1120);
insert into WeiBoHelp values(10438,7520,300,600,120,620);
insert into WeiBoHelp values(10439,1530,940,370,867,720);
insert into WeiBoHelp values(10440,2540,920,840,437,140);
insert into WeiBoHelp values(10441,1250,668,660,670,119);
insert into WeiBoHelp values(10442,1450,420,838,857,1220);
insert into WeiBoHelp values(10443,1550,900,880,285,2120);
insert into WeiBoHelp values(10444,8150,810,120,673,1120);
insert into WeiBoHelp values(10445,2850,840,682,438,1120);

insert into WeiBoHelp values(10446,1460,990,756,785,1120);
insert into WeiBoHelp values(10447,3090,2470,676,738,1120);
insert into WeiBoHelp values(10348,1553,935,730,820,1120);
insert into WeiBoHelp values(10349,7520,3560,678,150,620);
insert into WeiBoHelp values(10350,1550,240,570,120,720);
insert into WeiBoHelp values(10351,2556,935,560,1240,140);

insert into WeiBoHelp values(10352,1553,1040,600,1077,119);
insert into WeiBoHelp values(10353,4350,450,400,7220,220);
insert into WeiBoHelp values(10354,1578,960,850,1077,820);
insert into WeiBoHelp values(10355,2870,870,400,8760,880);
insert into WeiBoHelp values(10356,2450,430,600,1780,732);
insert into WeiBoHelp values(10357,4380,943,845,1480,520);
insert into WeiBoHelp values(10358,5450,2530,650,1053,565);


select k.*,wbu.Uname,wbu.UimgPath from  --找出了为什么刚发出的微博送不到的原因：在weibohelp表中并没有插入新值
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
			(select * from WeiBo where (WBstatue = 0) or (WBUid in (select distinct(FUedid) from FanAndFaned where Fuid = 1001)) order by WBdate desc) n where 15 * 1 >= rownum)
 			where rn > 15 * (1-1)) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid;
 			
select * from WeiBo;
select * from WeiBoHelp;

select max(WBid) from WeiBo;
select k.*,wbu.Uname,wbu.UimgPath from  --应该也没有问题√
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
			(select * from WeiBo where WBstatue = 0 or WBUid in (select distinct(FUedid) from FanAndFaned where Fuid = 1001) order by WBdate desc) n where 5 * 1 >= rownum)
 			where rn > 5 * (1-1)) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid;
 
 			
 

 			
select k.*,wbu.Uname,wbu.UimgPath from  --没有问题√
		(select w.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBo w,
		(select * from 
			(select n.*,rownum rn from 
			(select * from WeiBoHelp order by WHviewAccount desc) n where 5 * 1 >= rownum)
 			where rn > 5 * (1-1)) b
 			where w.wbid = b.wbid and WBstatue = 0
 			order by WHviewAccount desc) k,WeiBoUser wbu where k.WBUid = wbu.WBUid
--找到id(浏览次数优先，点赞次数其次)

select w.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBo w,

(select * from 
(select n.*,rownum rn from 
(select * from WeiBoHelp order by WHviewAccount desc) n where 15 * 1 >= rownum)
 where rn > 15 * (1-1)) b

 where w.wbid = b.wbid
 order by WHviewAccount desc;
 
 
--找到id(点赞次数优先，浏览次数其次)
select WBid,rownum rn from WeiBoHelp where rownum < 15 order by WHgreateAccount desc;  --降序查询 前十五条

select k.*,wbu.Uname,wbu.UimgPath from
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
			(select * from WeiBo where (WBstatue = 0) or (WBUid in (select distinct(FUedid) from FanAndFaned )) order by WBdate desc) n where 2 * 2 >= rownum)
 			where rn > 2 * (2-1)) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid

select * from (select w.*,rownum rn from WeiBoHelp w order by WHgreateAccount desc where 2*1 >= rownum) n
where 2*0 < rn;

select * from
		(select n.WBid,rownum rn from (select * from WeiBoHelp order by WHgreateAccount desc) n where 4 * 1 >= rownum)
		where rn > 4 * (1-1);
--找到微博
select * from WeiBo;
select * from WeiBoHelp;
--微博操作表
create table Operate(
       Oid int primary key,           --微博操作id
       WBUid int
           constraint RK_Operate_Uid references WeiBoUser(WBUid),--用户Id( 哪几种标签的用户操作了哪几种类型的微博)
       WBid int
           constraint RK_Operate_WBid references WeiBo(WBid),--微博Id( 哪几种标签的用户操作了哪几种类型的微博)
       Ostate varchar2(20),           --操作名（转载，收藏，评论，点赞..）
       
       Ocontent varchar2(500),
       Odate Date--预留字段  
);

alter table Operate add Odate date;
alter table OPerate drop column  Odate;
create sequence seq_op_oid start with 1001;
select * from WeiBo;
select * from WeiBoHelp;
select * from Operate;
select * from WeiboAndWeibo;


drop table WeiBo;
drop table WeiBoHelp;
drop table Operate;
insert into Operate values(seq_op_oid.nextval,1006,10001,'收藏',null);

select w.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from (select * from WeiBo where WBid = 10582) w,WeiBoHelp h where w.WBid = h.WBid


create table WeiboAndWeibo(
	WBid int references WeiBo(WBid),
	TWBid int
);
select * from WeiboAndWeibo;

--评论（回复）微博表  --找爸爸
create table Comments(
       Cid int primary key,          	--评论（回复）id
       WBUid int, 						--评论（回复）人id
       WBid int,						--微博Id( 哪几种标签的用户操作了哪几种类型的微博)
       ContentTxt varchar2(500),        --评论（回复）文本内容+图片路径(这里只指表情)
       Cdate Date,                    	--评论日期
       CgreateAccount int,            	--评论点赞次数
       Csonode int					  	--下一个评论的id  这里可以列一个树状图出来 自己是自己的爸爸 自表查询
       
       --预留字段
);
create sequence seq_comments_cid start with 100001 increment by 1;

drop table Comments; 
--私信
create table PrivateMessage(
       PMid int primary key,          --私信id
       PM1user int,                   --发信人
       PM2user int,                   --收信人
       PMcontent varchar2(500),       --信息内容(  [文字，图片，视屏，url，文件，语音]  到时候再想吧)
       PMdate Date                   --信息日期
       
       --预留字段
);


--微博访问权限设置
create table PersonalPermission(
       PPid int primary key,          --权限id
       UId int
           constraint RK_PP_Uid references WeiBoUser(Uid),--用户Id
       PPid int,                      --用户id
       PPstate char(2)               --权限是否开放{ F(开放) or T(关闭) }
);


select b.*,w.* from
 (select * from WeiBo where WBUid in
    (select distinct f.FUedid from WeiBo wb,FanAndFaned f where f.FUid=wb.WBUid and Fstatus ='好友圈' and wb.WBUid=1006 )) b,WeiBoUser w where w.WBUid = b.WBUid ;

    select k.*,wbu.Uname,wbu.UimgPath from
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
				(select * from WeiBo  where WBUid in (select distinct WBUid from Groups where Gid in(select Gid from Groups where WBUid=1006) )order by WBdate) n where 100 >= rownum)
 			where rn >0) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid
 			
 create sequence seq_op_oid start with 1001;
 
 select * from WeiBo w ,Operate p where w.wbid=p.wbid and Ostate='收藏' and p.wbuid=1006;
 
 select p.odate from operate p where p.wbid in (select wbid from Operate where wbid in (select wbid from WeiBo where WBUid=1006) and Ostate='点赞');
 select uname from WeiBouser where wbuid in (select wbuid from Operate where wbuid in (select wbuid from WeiBo where WBUid=1006) and Ostate='点赞')
 select * from (select rownum rn,b.wbtxt,b.wbpic,b.wbvideo,w.uname, p.odate from WeiBo b,WeiBoUser w, operate p where b.wbid in (select wbid from Operate where wbid in (select wbid from WeiBo where WBUid=1006) and Ostate='点赞') and w.wbuid in (select wbuid from Operate where wbuid in (select wbuid from WeiBo where WBUid=1006) and Ostate='点赞') and p.wbid in (select wbid from Operate where wbid in (select wbid from WeiBo where WBUid=1006) and Ostate='点赞') order by odate) where rn<15;

 			
select k.*,wbu.Uname,wbu.UimgPath from
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
				(select * from WeiBo where WBUid in (select distinct WBUid from Groups where Gid in(select Gid from Groups where WBUid=1006) )order by WBdate) n where 5 >= rownum)
 					rn>1) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid
 			
 			
select b.*,w.* from WeiBoUser b,WeiBo w where b.WBUid=w.WBUid and W.WBUid=1006

select * from (select rownum rn, WBdate,WBpic from WeiBo where WBUid=1006 and WBpic is not null) where 10>rn;
