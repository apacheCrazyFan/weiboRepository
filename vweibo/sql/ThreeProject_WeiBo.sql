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
drop table WeiBo;
drop table WBandThe;
drop table WeiBoHelp;
drop table Operate;
drop table WeiboAndWeibo;

select * from WeiBo;
select * from  WBandThe;
select * from  WeiBoHelp;
select * from  Operate;
select * from  WeiboAndWeibo;

select * from Theme;
select * from Admin;

insert into Admin values('admin','sa');

--΢����ǩ��
create table WeiBoTag(
       WTid int primary key,          --΢����ǩid
       WTname varchar2(10)           --΢����ǩ�����ֶΣ�
                          --��Ƶ ���� ��� ���� �Ƽ� ���� ���� �ƾ� ���� ���� ���� ���Ӿ� 
                          --��Ӱ ���� ���� ���� �˶����� ���� ���� ���� ���� ��ʷ ��Ůģ�� 
                          --��ͼ ��� ��Ц ��ҥ ������ ���� ʱ�� ��ױ ���� �ڽ� �ȳ� ����
                          --���� ��Ϸ ���� ���� ���� ��ʳ ���� �Ҿ� ���� ���� ��ũ ���
);
select * from WeiboTag;

select seq_wbt_wtid.nextval from dual;
drop sequence seq_wbt_wtid from WeiboTag;
create sequence seq_wbt_wtid start with 29;

select wt.*
from
select wt.*,rownum rn from WeiboTag wt
where rn > #{pageSize}*(#{pageNum}-1) and rn <= #{pageSize}*#{pageNum};

select wt.*
from
select wt.*,rownum rn from WeiboTag wt
where rn > 10*(1-1) and rn <= 10*1;

<<<<<<< HEAD


=======
delete sequence seq_wbt_wtid from dual;
>>>>>>> branch 'master' of ssh://git@github.com/apacheCrazyFan/weiboRepository.git
delete from WeiboTag where WTid in (1,2);


create sequence seq_wbt_wtid start with 50;



insert into WeiBoTag values(1,'��Ƶ');
insert into WeiBoTag values(2,'����');
insert into WeiBoTag values(3,'���');
insert into WeiBoTag values(4,'����');
insert into WeiBoTag values(5,'�Ƽ�');
insert into WeiBoTag values(6,'����');
insert into WeiBoTag values(7,'����');
insert into WeiBoTag values(8,'�ƾ�');
insert into WeiBoTag values(9,'����');
insert into WeiBoTag values(10,'����');
insert into WeiBoTag values(11,'����');
insert into WeiBoTag values(12,'���Ӿ�');
insert into WeiBoTag values(13,'��Ӱ');
insert into WeiBoTag values(14,'����');
insert into WeiBoTag values(15,'����');
insert into WeiBoTag values(16,'����');
insert into WeiBoTag values(17,'�˹�����');
insert into WeiBoTag values(18,'����');
insert into WeiBoTag values(19,'����');
insert into WeiBoTag values(20,'����');
insert into WeiBoTag values(21,'����');
insert into WeiBoTag values(22,'��ʷ');
insert into WeiBoTag values(23,'��Ůģ��');
insert into WeiBoTag values(24,'��ͼ');
insert into WeiBoTag values(25,'���');
insert into WeiBoTag values(26,'��Ц');
insert into WeiBoTag values(27,'��ҥ');
insert into WeiBoTag values(28,'������');
insert into WeiBoTag values(29,'����');
insert into WeiBoTag values(30,'ʱ��');
insert into WeiBoTag values(31,'��ױ');
insert into WeiBoTag values(32,'����');
insert into WeiBoTag values(43,'�ڽ�');
insert into WeiBoTag values(34,'�ȳ�');
insert into WeiBoTag values(35,'����');
insert into WeiBoTag values(36,'����');
insert into WeiBoTag values(37,'��Ϸ');
insert into WeiBoTag values(38,'����');
insert into WeiBoTag values(39,'����');
insert into WeiBoTag values(40,'����');
insert into WeiBoTag values(41,'��ʳ');
insert into WeiBoTag values(42,'����');
insert into WeiBoTag values(43,'�Ҿ�');
insert into WeiBoTag values(43,'����');
insert into WeiBoTag values(45,'����');
insert into WeiBoTag values(46,'��ũ');
insert into WeiBoTag values(47,'���');
delete from WeiBoTag where WTname in ('����','�Ƽ�');

drop table UserTagFather;
select * from UserTagFather;
create table UserTagFather(
	UTFid int primary key,    --�û���ǩ�����
	UTFname varchar2(20)
);
insert into UserTagFather values(1,'����');
insert into UserTagFather values(2,'ר��');
insert into UserTagFather values(3,'����');

--�û���ǩ��
create table UserTag(
       UTid int primary key,          --�û���ǩid
       UTname varchar2(20),          --�û���ǩ�� 
       UTFid int              
       					   --   ����:���� �̽� ���� ������Ա..
                           --   ר��:ҽ�� ���� IT������ ��̨ �ƾ� ����.. 
                           --   ������..
);
drop table UserTag;
drop sequence seq_ut_utid
create sequence seq_ut_utid start with 1 increment by 1;

insert into UserTag values(seq_ut_utid.nextval,'����',1);
insert into UserTag values(seq_ut_utid.nextval,'����',1);
insert into UserTag values(seq_ut_utid.nextval,'������Ա',2);
insert into UserTag values(seq_ut_utid.nextval,'�̽�',2);

insert into UserTag values(seq_ut_utid.nextval,'ҽ��',2);
insert into UserTag values(seq_ut_utid.nextval,'����',2);
insert into UserTag values(seq_ut_utid.nextval,'IT������',2);
insert into UserTag values(seq_ut_utid.nextval,'��̨',3);
insert into UserTag values(seq_ut_utid.nextval,'�ƾ�',3);
insert into UserTag values(seq_ut_utid.nextval,'����',3);

insert into UserTag values(seq_ut_utid.nextval,'��ķ',1);
insert into UserTag values(seq_ut_utid.nextval,'��ѧ��',1);

--insert into UserTag values(seq_ut_utid.nextval,'����');
--insert into UserTag values(seq_ut_utid.nextval,'����');
--insert into UserTag values(seq_ut_utid.nextval,'������Ա');

select * from UserTag;
select seq_ut_utid.nextval from dual;

delete from UserTag where UTid in(4,5,6);

select * from UserTag u,UserTagFather f where u.UTFid=f.UTFid;
----΢���û���
drop table WeiBoUser;
select * from WeiBoUser;
create table WeiBoUser(
       WBUid int,                       --�û�Id  ��
       Uname varchar2(20),            --�û���   ��
       Upassword varchar2(20),        --�û�����  ��
       Uphone varchar2(11),           --�û��ֻ�����  ��
       Uemail varchar2(40),           --�û�ע������  ��
       Usex char(2) default 'm',   --�û��Ա�    ��
       Uage int,                      --�û�����    ��
       UimgPath varchar2(100),        --�û�ͼ��·��  ��
       UregisterDate Date,            --ע������    ��
       
       Uxxxx  varchar2(100),   --Ԥ���ֶ�
       Uzzzz  varchar2(100),   --Ԥ���ֶ�
       
       											--//�������һ�ο������û���¼���޸ĸ�����Ϣ��ģ��棩
       Uintroduce varchar2(100),      --���ҽ��ܣ���飩 						��
       Utag varchar2(100),            --�û���ǩ�����������˶����ˣ����εȵȣ�  �Լ���    	 ��
       Uscore number(8),              --�û����֣���������vip�ȼ���				��
       UspecialTag varchar2(40)       --��Ȩ��ǩ��ʵ����֤����Ա��������			�����Ǿ�Ūһ������
);
update WeiBoUser set  UspecialTag = '0x1f1e80x1f1f3.png' where WBUid = 1006;
update WeiBoUser set  UspecialTag = '0x1f1e80x1f1f0.png' where WBUid = 1005;
update WeiBoUser set  UspecialTag = '0x1f1ec1f1e7.png' where WBUid = 1002;
update WeiBoUser set  UspecialTag = '0x1f1ec1f1e7.png' where WBUid = 1007;

update WeiBoUser set  Uname = 'lalal' where WBUid = 1001;


alter table WeiBoUser add constraint pk_wbu_wbuid primary key (WBUid);
alter table WeiBoUser drop column phoneStatus;
alter table WeiBoUser drop column emailStatus;
alter table WeiBoUser add phoneStatus int default 1;	--�������У���������ͨ�����ַ�ʽ�ҵ�����,1Ϊ���ԣ�0Ϊ��
alter table WeiBoUser add emailStatus int default 1;


select * from WeiBoUser;
create sequence seq_WeiBoUser_Wbuid start with 1006;
insert into WeiBoUser values(seq_WeiBoUser_Wbuid.nextval,'������','sa','15675471040','1373930643@qq.com',default,22,null,sysdate,null,null,'�����Ĵ������','java����ʦ,ѧ��',10000,'CN');
insert into WeiBoUser values(1002,'�����','sa','15675471111','15675471111@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
insert into WeiBoUser values(1005,'admin','sa','15675470000','15675470000@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
insert into WeiBoUser values(seq_WeiBoUser_Wbuid.nextval,'������','sa','15675471040','1373930633@qq.com',default,22,null,sysdate,null,null,'�����Ĵ������','java����ʦ,�ձ�',10000,'0x1f1ef0x1f1f5.png');

insert into WeiBoUser values(1001,'�һ�','sa','15675470001','15675470001@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
insert into WeiBoUser values(1003,'�ٺ�','sa','15675470002','15675470002@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
insert into WeiBoUser values(1004,'����','sa','15675470003','15675470003@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
insert into WeiBoUser values(1008,'���','sa','15675470004','15675470004@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
insert into WeiBoUser values(1009,'���ͺ�','sa','15675470005','15675470005@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
insert into WeiBoUser values(1010,'ʱ�򽻻�','sa','15675470006','15675470006@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');


update weibouser set uimgpath ='../../vweibo/weibouserimages/userimg.jpg' where wbuid=1001
update weibouser set uimgpath ='../../vweibo/weibouserimages/userphoto3.png' where wbuid=1002

delete from WeiBoUser where WBUid in (1001,1002);

update WeiBoUser set Uphone = '15675471111' where WBUid = 1002;
update WeiBoUser set Uphone = '15675470000' where WBUid = 1005;

update WeiBoUser set Uemail = '15675471111@163.com' where WBUid = 1002;
update WeiBoUser set Uemail = '15675470000@163.com' where WBUid = 1005;

update WeiBoUser set UimgPath='zanwu.jpg' where WBUid=1002;
update WeiBoUser set UimgPath='userimg.jpg' where WBUid=1005;
update WeiBoUser set UimgPath='userphoto003.png' where WBUid=1006;
update WeiBoUser set UimgPath='IMG_0369.JPG' where WBUid=1007;
update WeiBoUser set UimgPath='IMG_0442.JPG' where WBUid=1001;
update WeiBoUser set UimgPath='IMG_0443.JPG' where WBUid=1003;
update WeiBoUser set UimgPath='IMG_0448.JPG' where WBUid=1004;
update WeiBoUser set UimgPath='IMG_0449.JPG' where WBUid=1008;
update WeiBoUser set UimgPath='IMG_0450.JPG' where WBUid=1009;
update WeiBoUser set UimgPath='IMG_0451.JPG' where WBUid=1010;

update WeiBoUser set Uemail='15675470000@qq.com' where WBUid=1002;
update WeiBoUser set Uemail='15675471111@qq.com' where WBUid=1005;

--�û�֮����ϵ�м��n ~ n��
create table Relationship(
       Rid int primary key,           --�û���ϵid'
       Rname varchar2(20),            --�û�֮���ϵ����ע������ע����˿�������ѣ�δ���飬��������Ⱥ��..��
       RidF int,                      --�û�idF
       RidE int,                      --�û�idE
       Rdate Date                     --ʱ��
       
       --Ԥ���ֶ� 
);

select * from Relationship;
select * from Groups;
drop table Groups;
--Ⱥ
create table Groups(
	Gid int,				--Ⱥid
	Gname varchar2(40),					--Ⱥ��
	WBUid int references WeiBoUser(WBUid),--Ⱥ����û�id,�������unique��ֻ�ܼ���һ��Ⱥ ����ȥ��
	Gdate Date							--��Ⱥʱ��
);
insert into Groups values (2003,'ѧϰ',1001,to_date('2016-05-12','yyyy-mm-dd'));
insert into Groups values (2003,'ѧϰ',1005,to_date('2016-05-12','yyyy-mm-dd'));
insert into Groups values (2002,'ѧϰ',1006,to_date('2016-05-12','yyyy-mm-dd'));
insert into Groups values (2001,'ѧϰ',1006,to_date('2016-05-12','yyyy-mm-dd'));
insert into Groups values (2001,'ѧϰ',1002,to_date('2016-09-18','yyyy-mm-dd'));
insert into Groups values (2001,'ѧϰ',1005,to_date('2016-08-05','yyyy-mm-dd'));


select * from Groups;

select distinct WBUid from Groups where Gid in(select Gid from Groups where WBUid=1006);
--������
create table BlackList(
	Bid int primary key,				--������id
	WBUid int references WeiBoUser(WBUid),  --�ĸ��û��µĺ�����
	BUid int							--�������û�id
);
--���뱻�ۣ���ע�뱻��ע��
create table FanAndFaned(
	FUid int,							--��˿�� �����ǲ��� ������������ȷ�һ��
	FUedid int,							--������
	Fstatus varchar2(16)				--���뱻��֮���py״̬(����Ȧ,ͬѧ,ͬ��,δ����,��������,���Ĺ�ע,�ر��ע,�����Լ���ӵġ���)
);

select * from FanAndFaned;


insert into FanAndFaned values (1006,1021,'��������',sysdate);
select  Uname from WeiBoUser where WBUid in (select distinct FUid from FanAndFaned where FUid=1006);

alter table FanAndFaned add Fdate Date;
alter table FanAndFaned drop constraint pk_faf_fff;
alter table FanAndFaned add constraint pk_faf_fff primary key(FUid,FUedid,Fstatus);

delete from  FanAndFaned where FUid=1006 and FUedid=1021;
drop table FanAndFaned;
select fuedid from fanandfaned where fuid=1001 and fstatus='����Ȧ'

select FUid,FUedid,Fstatus from FanAndFaned where Fuid=1001 and Fstatus='����Ȧ';
select count(*),distinct(fstatus) from FanAndFaned where Fuid = 1001; 

delete from FanAndFaned where FUid=1001 and FUedid=1007 and Fstatus='ͬѧ';
delete from FanAndFaned where FUid=1001 and FUedid=1008 and Fstatus='ͬѧ';
delete from FanAndFaned where FUid=1001 and FUedid=1009 and Fstatus='ͬѧ';
delete from FanAndFaned where FUid=1001 and FUedid=1010 and Fstatus='ͬѧ';

--��ע������
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus != 'δ����';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = 'δ����';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = 'ͬѧ';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '����Ȧ';

select (select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = 'δ����') δ����,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '����Ȧ') ����Ȧ,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '������') ������,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = 'Ⱥ') ����Ȧ, --����
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001) ��ע,
		(select count(distinct(FUid)) from FanAndFaned where FUedid = 1001) ��˿,
		(select count(WBid) from WeiBo where WBUId = 1001) ΢��
from dual;
		
insert into FanAndFaned values(1001,1002,'����Ȧ');
insert into FanAndFaned values(1001,1003,'����Ȧ');
insert into FanAndFaned values(1001,1004,'����Ȧ');
insert into FanAndFaned values(1001,1005,'����Ȧ');
insert into FanAndFaned values(1001,1006,'����Ȧ');

insert into FanAndFaned values(1002,1001,'����Ȧ');
insert into FanAndFaned values(1002,1003,'����Ȧ');
insert into FanAndFaned values(1002,1004,'����Ȧ');
insert into FanAndFaned values(1002,1005,'����Ȧ');

insert into FanAndFaned values(1001,1002,'ͬѧ');
insert into FanAndFaned values(1001,1003,'ͬѧ');
insert into FanAndFaned values(1001,1004,'ͬѧ');
insert into FanAndFaned values(1001,1005,'ͬѧ');
insert into FanAndFaned values(1001,1006,'ͬѧ');


insert into FanAndFaned values(1003,1002,'ͬѧ');
insert into FanAndFaned values(1003,1001,'ͬѧ');
insert into FanAndFaned values(1003,1004,'ͬѧ');
insert into FanAndFaned values(1003,1005,'ͬѧ');
insert into FanAndFaned values(1003,1006,'ͬѧ');
insert into FanAndFaned values(1003,1007,'ͬѧ');
insert into FanAndFaned values(1003,1008,'����Ȧ');
insert into FanAndFaned values(1003,1009,'����Ȧ');

insert into FanAndFaned values(1005,1002,'ͬѧ');
insert into FanAndFaned values(1005,1001,'ͬѧ');
insert into FanAndFaned values(1005,1004,'ͬѧ');
insert into FanAndFaned values(1005,1005,'ͬѧ');
insert into FanAndFaned values(1005,1006,'ͬѧ');
insert into FanAndFaned values(1005,1007,'ͬѧ');
insert into FanAndFaned values(1005,1008,'����Ȧ');
insert into FanAndFaned values(1005,1009,'����Ȧ');

insert into FanAndFaned values(1007,1002,'ͬѧ');
insert into FanAndFaned values(1007,1001,'ͬѧ');
insert into FanAndFaned values(1007,1004,'����Ȧ');
insert into FanAndFaned values(1007,1005,'����Ȧ');
insert into FanAndFaned values(1007,1006,'����Ȧ');
insert into FanAndFaned values(1007,1003,'ͬѧ');
insert into FanAndFaned values(1007,1008,'����Ȧ');
insert into FanAndFaned values(1007,1009,'����Ȧ');

insert into FanAndFaned values(1007,1010,'��ѧ');


insert into FanAndFaned values(1001,1007,'δ����');
insert into FanAndFaned values(1006,1008,'����Ȧ',null);
insert into FanAndFaned values(1006,1009,'����Ȧ',null);
insert into FanAndFaned values(1006,1010,'δ����',null);

--���Ȼ����ǿ��Է���΢���﷢���
--����˵���������΢����һ������
--�����
select * from theme;

drop table Theme;
create table Theme(
	Tid int primary key,					--����id
	Tname varchar2(40),						--�������
	TUid int, 								--���ⷢ����
	Tdate Date,								--���ⷢ��ʱ��
	Ttxt clob,								--������ı�����
	Tpics varchar2(540),					--����ͼƬ·��
	Tdeliver int,							--���ⱻ����Ĵ���
	Tview int								--������ʴ���
);
select * from (select rownum rn ,t.*,w.* from Theme t,WeiBoUser w  order by Tview desc) where 11>rn
update Theme set tpics='bg-6.jpg' where tid=8;
create sequence seq_Theme_Tid start with 1;
select tname from 
(select n.*,rownum rn from (select * from Theme) n 
where 5 * 1 >= rownum) 
where rn > 5 * (1 - 1);
insert into Theme values(seq_Theme_Tid.nextval,'#ǰ������Լ��Լ#',1001,to_date('2016-8-30','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1000,20000);
insert into Theme values(seq_Theme_Tid.nextval,'#��̰�籩2�ᵵ914#',1002,to_date('2016-8-30','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1100,21000);
insert into Theme values(seq_Theme_Tid.nextval,'#���Ƶ����ؾ����ֽ���#',1002,to_date('2016-8-31','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1200,22000);
insert into Theme values(seq_Theme_Tid.nextval,'#񼾸ͯ�����밲��#',1003,to_date('2016-8-31','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1300,23000);
insert into Theme values(seq_Theme_Tid.nextval,'#һͼ����#',1003,to_date('2016-8-31','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1400,24000);
insert into Theme values(seq_Theme_Tid.nextval,'#��ҽÿ��#',1003,to_date('2016-9-1','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1500,25000);
insert into Theme values(seq_Theme_Tid.nextval,'#�������ּ�¼#',1004,to_date('2016-9-1','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1600,26000);
insert into Theme values(seq_Theme_Tid.nextval,'#����Ԥ��#',1004,to_date('2016-9-1','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1700,27000);
insert into Theme values(seq_Theme_Tid.nextval,'#��Ƿ��黰����#',1004,to_date('2016-9-1','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1800,28000);
insert into Theme values(seq_Theme_Tid.nextval,'#��Ů�ھ���Բ#',1004,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1400,24000);
insert into Theme values(seq_Theme_Tid.nextval,'#��ѧ�ڶ�����������#',1005,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1500,25000);
insert into Theme values(seq_Theme_Tid.nextval,'#�����Ȱ������#',1005,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1600,26000);
insert into Theme values(seq_Theme_Tid.nextval,'#��������Ӱ����#',1005,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1700,27000);
insert into Theme values(seq_Theme_Tid.nextval,'#������ľ�ʱ��#',1005,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1800,28000);


--΢���ͻ�����м��
create table WBandThe(
	WBid int references WeiBo(WBid),
	Tid int references Theme(Tid)
);

--΢��
create table WeiBo(
       WBid int primary key,          --΢��id
       WBtag varchar2(50),            --΢����ǩ����
       WBtitle varchar2(100),         --΢�����⣨����д��Ҳ���Բ�д���������У�
       WBUid int
           constraint RK_WeiBo_Uid references WeiBoUser(WBUid),--�û�Id( �ļ��ֱ�ǩ���û��������ļ������͵�΢��)
       WBdate Date,                   --΢����������
       WBtxt varchar2(2000),          --΢����������
       WBpic  varchar2(500),          --΢��ͼƬ·��
       WBvideo varchar2(500),         --΢������·��(���߸�������·�����汾�أ������ݿ⣿���������)
       WBmusic varchar2(500),		  --΢������·��
       yesOrno char(2),				  --�Ƿ��ǻ��������weibo	
       yon char(2),					  --�Ƿ���ת��΢��  --����е���Ҫ��
       WBlocation varchar2(120),	  --����΢���ĵ�ַ
       WBstatue int				  --΢����״̬ �Ƿ񹫿���Ⱥ�ɼ�������Ȧ�ɼ������Լ��ɼ�
       --Tid int						  --����id
       --Ԥ���ֶ�      
);

alter table WeiBo add Tid int;
drop table WeiBo;

select * from WeiBo;


alter table WeiBo add Tid int;   --����id

select k.*,wbu.Uname,wbu.UimgPath from
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
			(select * from WeiBo where (WBstatue = 0 and WBvideo != null) or (WBUid in (select distinct(FUedid) from FanAndFaned where Fuid = 1001) and WBvideo != null) order by WBdate desc) n where 15 * 1 >= rownum)
 			where rn > 15 * (1-1)) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid;
 			


create sequence seq_wb_wbid start with 10001 increment by 1;

alter table WeiBo add WBlocation varchar2(100);
alter table WeiBo add WBstatue varchar2(20);     --΢����״̬  ���� ����Ȧ Ⱥ ���Լ��ɼ�
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

insert into WeiBo values(seq_wb_wbid.nextval,'��Ƶ','СѼ��',1001,sysdate,'aaaaaaaaaaaaaaaaaaaaaaaaaaaa',null,null,null,'N','N','����,��ɳ��',0);
insert into WeiBo values(seq_wb_wbid.nextval,'��Ƶ','��Ѽ��',1001,sysdate,'bbbbbbbbbbbbbbbbbbbbbbbbbbbb',null,null,null,'N','N','����,��ɳ��',0);
insert into WeiBo values(seq_wb_wbid.nextval,'����','����',1001,sysdate,'ccccccccccccccccccccccccccccccccccc',null,null,null,'N','N','����,��ɳ��',0);
insert into WeiBo values(seq_wb_wbid.nextval,'����','����ս��',1001,sysdate,'ddddddddddddddddddddddddddddd',null,null,null,'N','N','����,��ɳ��',0);

insert into WeiBo values(seq_wb_wbid.nextval,'��Ƶ','��Ѽ��',1002,sysdate,'bbbbbbbbbbbbbbbbbbbbbbbbbbbb',null,null,null,'N','N','����,��ɳ��',0);
insert into WeiBo values(seq_wb_wbid.nextval,'����','����',1002,sysdate,'ccccccccccccccccccccccccccccccccccc',null,null,null,'N','N','����,��ɳ��',0);
insert into WeiBo values(seq_wb_wbid.nextval,'ʱ��','���´���',1002,sysdate,'ddddddddddddddddddddddddddddd',null,null,null,'Y','N','����,��ɳ��',0);

update WeiBo set wbtag='��ѧ' where wbid=10001;
update WeiBo set wbtag='��Ц' where wbid=10002;
update WeiBo set wbtag='ʱ��' where wbid=10003;
update WeiBo set wbtag='��ѧ,ʱ��' where wbid=10004;
update WeiBo set wbtag='��ѧ,��Ц' where wbid=10021;
update WeiBo set wbtag='��ѧ,��Ц,ʱ��' where wbid=10022;

select * from WeiBo where wbtag like '%��ѧ%'

select * from weibo order by 
--΢�����ӱ�
create table WeiBoHelp(
       WBid int references WeiBo(WBid),--΢��id
       WHviewAccount int,              --΢���������
       WHreprintAccount int,           --΢��ת�ش���
       WHfavoriteAccount int,          --΢���ղش���
       WHcommentAccount int,           --΢�����۴���
       WHgreateAccount int	           --΢�����޴���
       
       --Ԥ���ֶ�  
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


select k.*,wbu.Uname,wbu.UimgPath from  --�ҳ���Ϊʲô�շ�����΢���Ͳ�����ԭ����weibohelp���в�û�в�����ֵ
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
			(select * from WeiBo where (WBstatue = 0) or (WBUid in (select distinct(FUedid) from FanAndFaned where Fuid = 1001)) order by WBdate desc) n where 15 * 1 >= rownum)
 			where rn > 15 * (1-1)) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid;
 			
select * from WeiBo;
select * from WeiBoHelp;

select max(WBid) from WeiBo;
select k.*,wbu.Uname,wbu.UimgPath from  --Ӧ��Ҳû�������
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
			(select * from WeiBo where WBstatue = 0 or WBUid in (select distinct(FUedid) from FanAndFaned where Fuid = 1001) order by WBdate desc) n where 5 * 1 >= rownum)
 			where rn > 5 * (1-1)) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid;
 
 			
 

 			
select k.*,wbu.Uname,wbu.UimgPath from  --û�������
		(select w.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBo w,
		(select * from 
			(select n.*,rownum rn from 
			(select * from WeiBoHelp order by WHviewAccount desc) n where 5 * 1 >= rownum)
 			where rn > 5 * (1-1)) b
 			where w.wbid = b.wbid and WBstatue = 0
 			order by WHviewAccount desc) k,WeiBoUser wbu where k.WBUid = wbu.WBUid
--�ҵ�id(����������ȣ����޴������)

select w.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBo w,

(select * from 
(select n.*,rownum rn from 
(select * from WeiBoHelp order by WHviewAccount desc) n where 15 * 1 >= rownum)
 where rn > 15 * (1-1)) b

 where w.wbid = b.wbid
 order by WHviewAccount desc;
 
 
--�ҵ�id(���޴������ȣ�����������)
select WBid,rownum rn from WeiBoHelp where rownum < 15 order by WHgreateAccount desc;  --�����ѯ ǰʮ����

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
--�ҵ�΢��
select * from WeiBo;
select * from WeiBoHelp;
--΢��������
create table Operate(
       Oid int primary key,           --΢������id
       WBUid int
           constraint RK_Operate_Uid references WeiBoUser(WBUid),--�û�Id( �ļ��ֱ�ǩ���û��������ļ������͵�΢��)
       WBid int
           constraint RK_Operate_WBid references WeiBo(WBid),--΢��Id( �ļ��ֱ�ǩ���û��������ļ������͵�΢��)
       Ostate varchar2(20),           --��������ת�أ��ղأ����ۣ�����..��
       
       Ocontent varchar2(500),
       Odate Date--Ԥ���ֶ�  
);

alter table Operate add Odate date;
alter table OPerate drop column  Odate;
create sequence seq_op_oid start with 1001;
select * from WeiBo;
select * from WeiBoHelp;
select * from Operate;
select * from WeiboAndWeibo;



insert into Operate values(seq_op_oid.nextval,1006,10001,'�ղ�',null);

select w.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from (select * from WeiBo where WBid = 10582) w,WeiBoHelp h where w.WBid = h.WBid


create table WeiboAndWeibo(
	WBid int references WeiBo(WBid),
	TWBid int
);
select * from WeiboAndWeibo;
select * from Comments;
--���ۣ��ظ���΢����  --�Ұְ�
create table Comments(
       Cid int primary key,          	--���ۣ��ظ���id
       WBUid int, 						--���ۣ��ظ�����id
       WBid int,						--΢��Id( �ļ��ֱ�ǩ���û��������ļ������͵�΢��)
       ContentTxt varchar2(500),        --���ۣ��ظ����ı�����+ͼƬ·��(����ָֻ����)
       Cdate Date,                    	--��������
       CgreateAccount int,            	--���۵��޴���
       Csonode int					  	--��һ�����۵�id  ���������һ����״ͼ���� �Լ����Լ��İְ� �Ա��ѯ
       
       --Ԥ���ֶ�
);
create sequence seq_comments_cid start with 100001 increment by 1;

select * from Comments;

select * from WeiBoUser;

select * from WeiBo;

select Cid,ContentTxt,Cdate,CgreateAccount,s1.UimgPath,Ucomment,u1.Uname as Ucommented from
(select s.*,c1.WBUid as commentid from
(select c.*,UimgPath,Uname as Ucomment from
(select WBUid,UimgPath,Uname from WeiBoUser) u,
(select Cid,WBUid,Csonode,ContentTxt,to_char(Cdate,'mm/dd hh24:mi') Cdate,CgreateAccount from Comments where WBid = 10900 order by Cdate desc) c 
where u.WBUid = c.WBUid) s,Comments c1 where c1.Csonode = s.Cid) s1,WeiBoUser u1 where s1.commentid = u1.WBUid;



select c.*,UimgPath,Uname as Ucomment from
(select WBUid,UimgPath,Uname from WeiBoUser) u,
(select Cid,WBUid,Csonode,ContentTxt,to_char(Cdate,'mm/dd hh24:mi') Cdate,CgreateAccount from Comments where WBid = 10900 order by Cdate desc) c 
where u.WBUid = c.WBUid

select Uname from WeiBoUser where WBUid in (select WBUid from Comments where Csonode = 100113);


select Uname from WeiBoUser where WBUid in ( select WBUid from Comments where Cid = #{cid} )
select * from Comments;

select s.* from
(select c.*,UimgPath,Uname as Ucomment from
(select WBUid,UimgPath,Uname from WeiBoUser) u,
(select Cid,WBUid,Csonode,ContentTxt,to_char(Cdate,'mm/dd hh24:mi') Cdate,CgreateAccount from Comments where WBid = 10900 order by Cdate desc) c 
where u.WBUid = c.WBUid) s,Comments c1 where c1.Cid = s.Cid;

select Uname from WeiBoUser where WBUid in (select WBUid from Comments where Csonode = 100113);


select * from
(select WBUid,UimgPath,Uname from WeiBoUser) u,
(select WBUid,ContentTxt,to_char(Cdate,'mm-dd hh24:mi:ss') Cdate,CgreateAccount from Comments where WBid = 10894 and Csonode = -1 order by Cdate desc) c 
where u.WBUid = c.WBUid;


select * from
(select WBUid,UimgPath,Uname from WeiBoUser) u,
(select WBUid,ContentTxt,to_char(Cdate,'mm-dd hh24:mi:ss') Cdate,CgreateAccount from Comments where WBid = 10894 and Csonode != -1 order by Cdate desc) c 
where u.WBUid = c.WBUid;

drop table Comments; 
--˽��
create table PrivateMessage(
       PMid int primary key,          --˽��id
       PM1user int,                   --������
       PM2user int,                   --������
       PMcontent varchar2(500),       --��Ϣ����(  [���֣�ͼƬ��������url���ļ�������]  ��ʱ�������)
       PMdate Date  ,                 --��Ϣ����
       PMRead varchar2(4)           --�Ѷ���δ����Y N��
      
);
select * from PrivateMessage;

create sequence seq_pmid start with 10001


select * from PrivateMessage
select * from PrivateMessage where PMRead='N' and pm2user=1001
drop table PrivateMessage

select distinct(weibouser.uname) uname from fanandfaned,weibouser where fanandfaned.fuedid=weibouser.wbuid and fuedid=1008


--΢������Ȩ������
create table PersonalPermission(
       PPid int primary key,          --Ȩ��id
       UId int
           constraint RK_PP_Uid references WeiBoUser(Uid),--�û�Id
       PPid int,                      --�û�id
       PPstate char(2)               --Ȩ���Ƿ񿪷�{ F(����) or T(�ر�) }
);


select b.*,w.* from
 (select * from WeiBo where WBUid in
    (select distinct f.FUedid from WeiBo wb,FanAndFaned f where f.FUid=wb.WBUid and Fstatus ='����Ȧ' and wb.WBUid=1006 )) b,WeiBoUser w where w.WBUid = b.WBUid ;

    select k.*,wbu.Uname,wbu.UimgPath from
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
				(select * from WeiBo  where WBUid in (select distinct WBUid from Groups where Gid in(select Gid from Groups where WBUid=1006) )order by WBdate) n where 100 >= rownum)
 			where rn >0) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid
 			
 create sequence seq_op_oid start with 1001;
 
 select * from WeiBo w ,Operate p where w.wbid=p.wbid and Ostate='�ղ�' and p.wbuid=1006;
 
 select p.odate from operate p where p.wbid in (select wbid from Operate where wbid in (select wbid from WeiBo where WBUid=1006) and Ostate='����');
 select uname from WeiBouser where wbuid in (select wbuid from Operate where wbuid in (select wbuid from WeiBo where WBUid=1006) and Ostate='����')
 select * from (select rownum rn,b.wbtxt,b.wbpic,b.wbvideo,w.uname, p.odate from WeiBo b,WeiBoUser w, operate p where b.wbid in (select wbid from Operate where wbid in (select wbid from WeiBo where WBUid=1006) and Ostate='����') and w.wbuid in (select wbuid from Operate where wbuid in (select wbuid from WeiBo where WBUid=1006) and Ostate='����') and p.wbid in (select wbid from Operate where wbid in (select wbid from WeiBo where WBUid=1006) and Ostate='����') order by odate) where rn<15;

 			
select k.*,wbu.Uname,wbu.UimgPath from
		(select b.*,WHviewAccount,WHreprintAccount,WHfavoriteAccount,WHcommentAccount,WHgreateAccount from WeiBoHelp w,
		(select * from 
			(select n.*,rownum rn from 
				(select * from WeiBo where WBUid in (select distinct WBUid from Groups where Gid in(select Gid from Groups where WBUid=1006) )order by WBdate) n where 5 >= rownum)
 					rn>1) b
 			where w.wbid = b.wbid) k,WeiBoUser wbu where k.WBUid = wbu.WBUid
 			
 			
select b.*,w.* from WeiBoUser b,WeiBo w where b.WBUid=w.WBUid and W.WBUid=1006

select * from (select rownum rn, WBdate,WBpic from WeiBo where WBUid=1006 and WBpic is not null) where 10>rn;

select * from (select w.*, rownum rn from WeiBoUser w) where 5>rn