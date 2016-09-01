create table Admin(
	Aid int primary key,
	Aname varchar2(20),
	Apwd varchar2(30)
);
select * from Admin;
insert into Admin values(1,'admin','sa');

--微博标签表
create table WeiBoTag(
       WTid int primary key,          --微博标签id
       WTname varchar2(10),           --微博标签名（字段）
                          --视频 衡阳 社会 国际 科技 科普 数码 财经 股市 明星 综艺 电视剧 
                          --电影 音乐 汽车 体育 运动健身 健康 瘦身 养生 军事 历史 美女模特 
                          --美图 情感 搞笑 辟谣 正能量 艺术 时尚 美妆 动漫 宗教 萌宠 法律
                          --政务 游戏 旅游 育儿 教育 美食 房产 家居 星座 读书 三农 设计
);

--用户标签表
create table UserTag(
       UTid int primary key,          --用户标签id
       UTname varchar2(10)          --用户标签名 
                           --   名人:明星 商界 作家 政府官员..
                           --   专家:医疗 育儿 IT互联网 电台 财经 教育.. 
                           --   其他：..
);
create or replace sequence seq_ut_utid start with 1 increment by 1;

insert into UserTag values(1,'明星');
insert into UserTag values(2,'作家');
insert into UserTag values(3,'政府官员');

insert into UserTag values(seq_ut_utid.nextval,'明星');
insert into UserTag values(seq_ut_utid.nextval,'作家');
insert into UserTag values(seq_ut_utid.nextval,'政府官员');

select * from UserTag;
select seq_ut_utid.nextval from dual;

delete from UserTag where UTid in(4,5,6);
----微博用户表
select * from WeiBoUser;
create table WeiBoUser(
       Uid int,                       --用户Id
       Uname varchar2(20),            --用户名
       Upassword varchar2(20),        --用户密码
       Uphone varchar2(11),           --用户手机号码
       Uemail varchar2(40),           --用户注册邮箱
       Usex char(2) default 'male',   --用户性别
       Uage int,                      --用户年龄
       UimgPath varchar2(100),        --用户图像路径
       UregisterDate Data,            --注册日期
       
       Uxxxx  varchar2(100),   --预留字段
       Uzzzz  varchar2(100),   --预留字段
       
       
       Uintroduce varchar2(100),      --自我介绍（简介）
       Utag varchar2(100),            --用户标签（如体育，运动达人，手游等等）  自己加
       Uscore number(8),              --用户积分（用来计算vip等级）
       UspecialTag varchar2(40),      --特权标签（实名认证，会员，国籍）
);
--用户之间联系中间表（n ~ n）
create table Relationship(
       Rid int primary key,           --用户联系id'
       Rname varchar2(20),            --用户之间关系（关注（被关注，粉丝），好友，未分组，黑名单，群？..）
       RidF int,                      --用户idF
       RidE int,                      --用户idE
       Rdate Date,                    --时间
       
       --预留字段 
);






--微博
create table WeiBo(
       WBid int primary key,          --微博id
       WBtag varchar2(50),            --微博标签（）
       WBtitle varchar2(100),         --微博标题（可以写，也可以不写，但必须有）
       UId int
           constraint RK_WeiBo_Uid references WeiBoUser(Uid),--用户Id( 哪几种标签的用户发表了哪几种类型的微博)
       WBdate Date,                   --微博发表日期
       WBtxt  clob,                   --微博文字内容
       WBpic  varchar2(500)           --微博图片路径
       WBvideo blob,                  --微博视屏(或者给个视屏路径，存本地，存数据库？存服务器？)
       
       --预留字段      
);
--微博附加表
create table WeiBoHelp(
       WHid int primary key,          --微博追加表id'            
       WBid int references WeiBo(WBid),--微博id
       WHviewAccount int,              --微博浏览次数
       WHreprintAccount int,           --微博转载次数
       WHfavoriteAccount int,          --微博收藏次数
       WHcommentAccount int,           --微博评论次数
       WHgreateAccount int,            --微博点赞次数
       
       --预留字段  
);
--微博操作表
create table Operate(
       Oid int primary key,           --微博操作id
       UId int
           constraint RK_Operate_Uid references WeiBoUser(Uid),--用户Id( 哪几种标签的用户操作了哪几种类型的微博)
       WBid int
           constraint RK_Operate_WBid references WeiBo(WBid),--微博Id( 哪几种标签的用户操作了哪几种类型的微博)
       Ostate varchar2(20),           --操作名（转载，收藏，评论，点赞..）
       
       --预留字段  
);
--评论（回复）微博表
create table Comments(
       Cid int primary key,           --评论（回复）id
       CUidF int,                     --评论（回复）人id
       CUidN int,                     --下一个评论（回复）人id
       WBid int
           constraint RK_Operate_WBid references WeiBo(WBid),--微博Id( 哪几种标签的用户操作了哪几种类型的微博)
       ContentTxt blob                --评论（回复）文本内容
       ContentPics varchar2(500)      --评论（回复）图片路径
       Cdate Date,                    --评论日期
       CgreateAccount int,            --评论点赞次数
       
       --预留字段
);

--私信
create table PrivateMessage(
       PMid int primary key,          --私信id
       PM1user int,                   --发信人
       PM2user int,                   --收信人
       PMcontent varchar2(500),       --信息内容(  [文字，图片，视屏，url，文件，语音]  到时候再想吧)
       PMdate Date,                   --信息日期
       
       --预留字段
);


--微博访问权限设置
create table PersonalPermission(
       PPid int primary key,          --权限id
       UId int
           constraint RK_PP_Uid references WeiBoUser(Uid),--用户Id
       PPid int,                      --用户id
       PPstate char(2),               --权限是否开放{ F(开放) or T(关闭) }
);
