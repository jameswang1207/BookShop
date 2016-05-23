/*创建商品大类   id 商品大类主键   name 商品大类名字  remarks 商品大类评价 */
drop  table t_bigtype;
drop sequence  t_bigtypeseq;
create  table  t_bigtype(
 id   number(11) primary  key,
 name varchar2(50),
 remarks varchar2(255)
);
create sequence t_bigtypeseq;
insert  into  t_bigtype values(t_bigtypeseq.nextval,'理学/管理学','好书');
insert  into  t_bigtype values(t_bigtypeseq.nextval,'公共卫生学','好书');
insert  into  t_bigtype values(t_bigtypeseq.nextval,'中医学','好书');
insert  into  t_bigtype values(t_bigtypeseq.nextval,'药学','好书');
insert  into  t_bigtype values(t_bigtypeseq.nextval,'基础医学','好书');
insert  into  t_bigtype values(t_bigtypeseq.nextval,'临床医学','好书');
insert  into  t_bigtype values(t_bigtypeseq.nextval,'口腔医学','好书');
insert  into  t_bigtype values(t_bigtypeseq.nextval,'检验学','好书');
insert  into  t_bigtype values(t_bigtypeseq.nextval,'公共基础学','好书');
insert  into  t_bigtype values(t_bigtypeseq.nextval,'护理学','好书');
select  *  from  t_bigtype; 
/*创建评论  personName评论人的名字  replayContent 回复内容  */
drop  table  t_comment;
drop sequence t_commentseq;
create  table t_comment(
id number(11) primary key,
content varchar2(1000),
createTime date,
personName varchar2(30),
replyContent varchar2(1000),
replyTime date 
);
create  sequence t_commentseq; 
insert into  t_comment  values(
 t_commentseq.nextval,'这本书不是我想要的,啥情况啊？',to_date('2013-10-12','yy-MM-dd'),
 '小明','傻逼啊你,这么便宜',to_date('2013-10-13','yy-MM-dd')
);
insert into  t_comment  values(
 t_commentseq.nextval,'这本书不是我想要的,啥情况啊？',to_date('2013-10-13','yy-MM-dd'),
 '猪八戒','傻逼啊你,这么便宜',to_date('2013-10-14','yy-MM-dd')
);
insert into  t_comment  values(
 t_commentseq.nextval,'这本书不是我想要的,啥情况啊？',to_date('2013-10-14','yy-MM-dd'),
 '悟空','傻逼啊你,这么便宜',to_date('2013-10-15','yy-MM-dd')
);
insert into  t_comment  values(
 t_commentseq.nextval,'这本书不是我想要的,啥情况啊？',to_date('2013-10-16','yy-MM-dd'),
 '唐僧','傻逼啊你,这么便宜',to_date('2013-10-17','yy-MM-dd')
);  
select  *  from   t_comment;
 select  *  from 
                 (select  rownum rom,p.*  from (
                 select id,content,createTime,personName,replyContent,replyTime from t_comment) p)
        where  rom>1 and rom<4;
/*创建新闻*/
drop  table t_news;
drop  sequence t_newsseq;
create  table   t_news(
id number(11) primary  key,
content varchar2(1000),
createTime date,
title varchar2(100)
);
create  sequence  t_newsseq;
insert  into  t_news  values(t_newsseq.nextval,'公交纵火案',to_date('2013-10-16','yy-MM-dd'),'公交纵火案');
insert  into  t_news  values(t_newsseq.nextval,'女生失踪',to_date('2013-10-16','yy-MM-dd'),'女生失踪');
insert  into  t_news  values(t_newsseq.nextval,'朝鲜新闻',to_date('2013-10-16','yy-MM-dd'),'***');
insert  into  t_news  values(t_newsseq.nextval,'爱情',to_date('2013-10-16','yy-MM-dd'),'***');
insert  into  t_news  values(t_newsseq.nextval,'***大学新闻',to_date('2013-10-16','yy-MM-dd'),'***闻');
insert  into  t_news  values(t_newsseq.nextval,'NBA赛事战况',to_date('2013-10-16','yy-MM-dd'),'NBA赛事战况');
insert  into  t_news  values(t_newsseq.nextval,'CBA赛事战况',to_date('2013-10-16','yy-MM-dd'),'CBA赛事战况');
select  *    from  t_news;
/*创建公告*/
drop  table  t_notice;
drop  sequence t_noticeseq;
create  table t_notice(
id number(11) primary  key,
content varchar2(1000),
createTime date,
title varchar2(100)
);
create  sequence t_noticeseq;
insert  into  t_notice  values(t_noticeseq.nextval,'降价啦',to_date('2013-10-16','yy-MM-dd'),'理学书降价啦');
insert  into  t_notice  values(t_noticeseq.nextval,'好书',to_date('2013-10-16','yy-MM-dd'),'中医学书降价啦');
insert  into  t_notice  values(t_noticeseq.nextval,'好书',to_date('2013-10-16','yy-MM-dd'),'药学书');
insert  into  t_notice values(t_noticeseq.nextval,'好书',to_date('2013-10-16','yy-MM-dd'),'基础医学');
  insert into  t_notice values(t_noticeseq.nextval,'好书',to_date('2013-10-16','yy-MM-dd'),'公共卫生学书降价啦');
 insert into  t_notice values(t_noticeseq.nextval,'好书',to_date('2013-10-16','yy-MM-dd'),'临床医学书减价啦');
 insert into  t_notice values(t_noticeseq.nextval,'好书',to_date('2013-10-16','yy-MM-dd'),'检验学书大甩卖');
 delete  t_notice  where title='药学书';
select  *  from t_notice; 

/*创建订单 status 状态  1 待审核  2 审核通过 3 卖家已发货  4 已收获*/
create table t_order(
id  number(11) primary  key ,
cost number(10,2),
createTime date,
orderNo  varchar2(255),
status number(11),
userId number(11) 
);
drop table  t_order;
drop  sequence t_orderseq;
select *  from  t_order;
create  sequence   t_orderseq;
/*订单储产品表 num表示产品数量*/
create table t_order_product(
id  number(11) primary  key,
num number(11),
orderId  number(11),
productId number(11)
); 
drop  table t_order_product;
drop  sequence t_order_productseq;
select  *  from  t_order_product;
create  sequence t_order_productseq;
/*创建产品表 hot:热卖产品编号  stock：库存 specialPrice：表示是否是特价*/
drop  table  t_product;
drop  sequence t_productseq;
create table t_product(
id  number(11) primary  key,
description varchar2(2000),
hot number(11),
hotTime date,
name  varchar(200),
price number(11),
picture varchar2(255),
specialPrice number(11),
specialPriceTime date,
stock number(11),
bigtypeId number(11),
smallTypeId number(11)
);
create  sequence t_productseq start  with 150 ;
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'<软件开发视频大讲堂>丛书系清华社<视频大讲堂>重点大系之一。该大系包括多个子系列，每个子系列的图书在其同品种的图书中销售名列前茅，其中：u4个品种荣获<全行业优秀畅销品种>u1个品种荣获2012年清华大学出版社','Java从入门到精通',78,'images/product/1.jpg',65,1,1,1,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'Java核心技术 卷II 高级特性（第9版·中文版） ★全球程序员必备图书《Java编程思想》的最新版本！ 获奖历史：?2003年《Software Development》杂志最佳书籍Jolt大奖
','Java编程思想',88,'images/product/2.jpg',23,1,1,1,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'第16届Jolt大奖提名图书JavaOne大会最畅销图书了解Java并发编程必读佳作','Java并发编程实战',56,'images/product/3.jpg',14,1,1,1,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'轻量级Java EE企业应用实战（第4版）：Struts 2+Spring 4+Hibernate整合开发 疯狂Android讲义（第2版）','疯狂Java讲义',87,'images/product/4.jpg',14,1,1,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'本书第1版两年内印刷近10次，4家网上书店的评论近4?000条，98%以上的评论全部为5星级的好评，是整个Java图书领域公认的经典著作和超级畅销书，繁体版在台湾也十分受欢迎','深入理解Java虚拟机',87,'images/product/5.jpg',14,1,1,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'（畅销硬件与系统组建图书全新改版；重装上市，以飨读者。深入剖析“芯片组','计算机硬件与系统组建高手真经',25,'images/product/6.jpg',14,2,1,1,to_date('2013-10-16','yy-MM-dd'),1,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'本书共分7章，第1章介绍了计算机硬件基础理论知识，对计算机硬件系统有一个全面的了解。第2章介绍了常见的计算机硬件，如主板、CPU、存储设备、输入输出设备等','计算机硬件及组装维护',45,'images/product/7.jpg',14,2,1,0,to_date('2013-10-16','yy-MM-dd'),1,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'孙承庭 主编 /2009-08-01 /化学工业出版社','计算机硬件维修实训教程',55,'images/product/8.jpg',14,2,1,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'欧星文化，冉书建　编著 /2010-07-01 /海洋出版社','计算机硬件组装与维修经典教程',55,'images/product/9.jpg',14,2,1,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'王学屯编著的《学习模电三部曲之电路分析（2）》主要内容为：第1章直流稳压电源电路、第2章单级电压放大电路、第3章多级放大电路及负反馈电路、第4章集成运放及应用、第5章功放电路、第6章调谐放大器与正弦波振荡器。','模电三部曲之电路分析',13,'images/product/10.jpg',14,3,1,0,to_date('2013-10-16','yy-MM-dd'),1,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'王卫东，李旭琼　编著 /2010-05-01 /电子工业出版社','模拟电子技术基础',41,'images/product/11.jpg',14,3,1,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'算法导论 原书第3版 +Java编程思想 第4版 套装共2册 算法圣经','算法导论',22,'images/product/12.jpg',25,4,1,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'美）冈萨雷斯，（美）伍兹　著，阮秋琦　等译 /2011-06-01 /电子工业出版社','数字图像处理',55,'images/product/13.jpg',25,6,1,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'（国外计算机科学经典教材）','数字图像处理的MATLAB实现',45,'images/product/14.jpg',25,6,1,1,to_date('2013-10-16','yy-MM-dd'),1,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'贝利　著，原魁，何文浩，肖晗　译 /2013-02-01 /电子工业出版社','基于FPGA的嵌入式图像处理系统设计',45,'images/product/15.jpg',25,5,1,1,to_date('2013-10-16','yy-MM-dd'),1,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'孙燮华　编著 /2011-03-01 /机械工业出版社','
数字图像处理——JAVA编程与实验',45,'images/product/16.jpg',25,5,1,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'第六版第八轮/本科临床/十二五规划教材）傅华　主编 /2013-03-01 /人民卫生出版社','预防医学',50,'images/product/17.jpg',25,19,2,0,to_date('2013-10-16','yy-MM-dd'),1,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'孙志伟　主编 /2012-01-01 /高等教育出版社','预防医学(医学教育改革系列教材)',10,'images/product/18.jpg',25,19,2,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'钟要红　主编 /2012-07-01 /浙江大学出版社','公共卫生',10,'images/product/19.jpg',25,20,2,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'秦怀金　主编 /2012-11-01 /人民卫生出版社','国家基本公共卫生服务项目100问',20,'images/product/20.jpg',25,20,2,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'詹思延　主编 /1981-08-01 /人民卫生出版社','流行病学',14,'images/product/21.jpg',25,21,2,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'《营养与食品卫生学(附光盘供预防医学类专业用第7版全国高等学校教材)》由孙长颢主编，在严格遵循预防医学专业学生的培养目标和要求的基础上，密切结合高等医学教育改革中提出的培养创新性人才的需求','营养与食品卫生学',14,'images/product/22.jpg',25,21,2,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'方剂学是阐明和研究方剂配伍及临床运用的学科，是中医的基础学科之一。本书是为方便广大的中医自学者、爱好者更多、更好地了解中医方剂知识所编写的，全书共分18章，分别对清热、理气、治风、祛痰、驱虫、涌吐等方剂作了详细说明','中医方剂自学入门',10,'images/product/23.jpg',25,7,3,0,to_date('2013-10-16','yy-MM-dd'),1,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'精心整理历代方剂文献，梳理方剂学术发展脉络，挖掘前人宝贵理论经验，促进基于继承源头创新','中医方剂学发展史',10,'images/product/24.jpg',25,7,3,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'陈家旭　等主编 /2012-06-01 /人民卫生出版社（二版/本科中医药类/共用）','中医诊断学',10,'images/product/25.jpg',24,8,3,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));
 
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'张云云　主编 /2012-06-01 /人民卫生出版社','神经定位诊断学',10,'images/product/26.jpg',24,8,3,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));
 
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'供针灸推拿、中医学、骨伤、康复、护理专业用','推拿学',12,'images/product/27.jpg',24,9,3,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));
 
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'邵湘宁 主编 /2004-08-01 /中国中医药出版社','针灸推拿学',12,'images/product/28.jpg',24,9,3,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));
 
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'伤寒论 原文 注释 译文 伤寒杂病论 张仲景 图文珍藏本 中国古典医学名著 国学典藏书系 伤寒论 中医经典书籍','伤寒论',5,'images/product/29.jpg',24,10,3,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));
 
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'伤寒论精典白话版（图文本）正版 书籍 中国古典中医医学精华 一部阐述外感热病治疗规律的专著','伤寒论精典白话版',5,'images/product/30.jpg',24,10,3,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));
 
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'本教材为新世纪全国高等中医药院校规划教材，普通高等教育“十一五”国家级规划教材，国家中医类别中医、中西医结合执业医师、执业助理医师资格考试指定参考书，全国临床中医学、中西医结合医学、中药学、中医护理学专业','中药学',5,'images/product/31.jpg',24,11,4,0,to_date('2013-10-16','yy-MM-dd'),1,to_date('2013-10-16','yy-MM-dd'));
  
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'常章富 编著 /2005-03-01 /人民卫生出版社','中药学习题集',5,'images/product/32.jpg',24,11,4,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));
 
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'侯连兵　著 /2013-12-01 /人民军医出版社','西药服用禁忌日常用药禁忌系列',5,'images/product/33.jpg',24,12,4,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));
 
insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'苗明三 主编 /2009-06-01 /人民军医出版社','非处方西药临床应用指南',5,'images/product/34.jpg',24,12,4,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'人卫八版/本科临床/十二五规划教材','药理学',15,'images/product/35.jpg',24,13,4,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'廖端芳　等主编 /2012-09-01 /人民卫生出版社','药理学学习指导与习题集',25,'images/product/36.jpg',24,13,4,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'《临床基础检验质量管理与标准操作程序》按照ISO 15189质量管理体系中作业指导书的要求编写，是我们编写的实验室认可参考书系列专著之一','临床基础检验',25,'images/product/37.jpg',24,15,5,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'全国医药职业教育检验类规划教材） 张纪云　主编 /2009-08-01 /中国医药科技出版社','临床基础检验实验指导',25,'images/product/38.jpg',24,16,5,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));


insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'陈杰 等主编 /2010-08-01 /人民卫生出版社','病理学1',25,'images/product/39.jpg',24,17,5,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'唐建武　主编 /2012-01-01 /科学出版社','病理学2',25,'images/product/40.jpg',24,17,5,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'姚泰　主编 /2005-08-01 /人民卫生出版社','生理学1',25,'images/product/41.jpg',24,18,5,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'唐四元　主编 /2012-06-01 /人民卫生出版社','生理学2',25,'images/product/42.jpg',24,18,5,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'人卫八版/本科临床/十二五规划','外科学',25,'images/product/43.jpg',24,22,6,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'人卫八版/本科临床/十二五规划','内科学',25,'images/product/44.jpg',24,23,6,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'鱼博浪　主编 /2008-06-01 /科学出版社','放射科手册',25,'images/product/45.jpg',24,24,6,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'全彩人体解剖学图谱(新版) 第二版 解刨学 医学图谱 刘恒兴 主编 外科医生的必备工具书 572幅真实解剖图片','全彩人体解剖学图谱',25,'images/product/47.jpg',24,25,6,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'(第七版/本科临床/十二五规划教材) 贾建平　等主编 /2013-03-01 /人民卫生出版社','神经病学',30,'images/product/46.jpg',24,26,6,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'陈谦明　主编 /2012-07-01 /人民卫生出版社','口腔黏膜病学',30,'images/product/48.jpg',24,27,7,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'赵佛容 主编 /2009-08-01 /复旦大学出版社','口腔护理学',30,'images/product/49.jpg',24,29,7,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));


insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'临床生化检验诊断学(全2册) 张秀明 等编','临床生化检验诊断学',15,'images/product/50.jpg',24,30,8,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'临床检验是将病人的血液、体液、分泌物、排泄物和脱落物等标本，通过目视观察、物理、化学、仪器或分子生物学方法检测，为临床的诊疗工作提供有价值的实验资料','临床检验',15,'images/product/51.jpg',24,31,8,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));


insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'全国卫生专业技术资格考试专家委员会 /2014-07-23 /人民卫生出版社','临床医学检验技术',12,'images/product/52.jpg',24,32,8,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));




insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'《儿科护理》由楼建华主编，每个章节以护理系统性临床决策为框架，应用护理程序，从评估着手，护理措施和持续评价贯穿其中，为患儿和家庭提供“家庭为中心”和“年龄相适应”的系统性和整体性护理，呈现出护理价值，并通过情景演练案例帮助学生有效掌握所学的理论知识和技能，并能应用于临床实践','儿科护理 ',14,'images/product/53.jpg',24,37,10,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'妇科护理（中职助产/十一五规划）','妇科护理',12,'images/product/53.jpg',24,38,10,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));


insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'使用术后护理彩色图解','术后护理',12,'images/product/54.jpg',24,39,10,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'同济大学数学系　编 /2014-07-01 /高等教育出版社','高等数学（第七版）上下册',12,'images/product/55.jpg',24,33,9,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'万雄，余达祥　主编 /2012-01-01 /科学出版社','大学物理上下册',12,'images/product/56.jpg',24,34,9,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));

insert  into  t_product(id,description,name,price,picture,stock,smallTypeId,bigTypeId,hot,hotTime,specialPrice,specialPriceTime) values 
(t_productseq.nextval,'大学英语(4)(自主学习手册)(专升本阶段)( 全国高校网络教育公共基础课教材) 欣羚　主编，张露蓓，杨安文　分册主编 /2008-12-01 /外语教学与研究出版社','大学英语4',12,'images/product/57.jpg',24,35,9,0,to_date('2013-10-16','yy-MM-dd'),0,to_date('2013-10-16','yy-MM-dd'));














select  *  from 
                 (select  rownum rom,p.*  from (
select id,description,hot,hotTime,name,price,picture,specialPrice,specialPriceTime,stock,bigtypeId,smallTypeId  from t_product
                  where  smallTypeId=6  
                 ) p)
                 where  rom>1 and rom<5;
select  *  from  t_product   where smallTypeId=9; 
delete  t_product   where  price in (6099.0,169.0,129.0,229.0,199.0);
  select  *  from 
  (select  rownum rom,p.*  from (
   select id,description,hot,hotTime,name,price,picture,specialPrice,specialPriceTime,
   stock,bigtypeId,smallTypeId  from t_product  where  bigtypeId=1) p)
     where  rom>2 and  rom <7;
     
     select  *  from 
                 (select  rownum rom,p.* from (
select r.id,r.description,r.hot,r.hotTime,r.name,r.price,r.picture,r.specialPrice,r.specialPriceTime,r.stock,r.bigtypeId,r.smallTypeId,s.name smallName 
                from t_product r inner join t_smallType s on (s.id=r.smallTypeId)
                where s.name='中药学')p)
                 where  rom>1 and rom<5;
     
     
  select  *  from t_product;                     
  /*创建商品小类*/
  drop  table t_smallType;
  drop  sequence t_smallTypeseq;
  create table t_smallType(
   id  number(11) primary   key,
   name varchar2(50),
   remarks varchar2(255),
   bigTypeId number(11)
  );

create  sequence t_smallTypeseq;
insert  into  t_smallType  values(t_smallTypeseq.nextval,'计算机软件类','好书',1);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'计算机硬件类','好书',1);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'数电/模电','好书',1);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'算法类','好书',1);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'管理类','好书',1);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'图像类','好书',1);

insert  into  t_smallType  values(t_smallTypeseq.nextval,'方剂类','好书',3);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'中医诊断类','好书',3);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'针灸推拿类','好书',3);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'中国古典医学类','好书',3);

insert  into  t_smallType  values(t_smallTypeseq.nextval,'中药类','好书',4);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'西药类','好书',4);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'药理类','好书',4);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'其他','好书',4);
select *  from t_bigtype;


insert  into  t_smallType  values(t_smallTypeseq.nextval,'临床基础医学类','好书',5);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'基础医学类','好书',5);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'病理类','好书',5);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'生理类','好书',5);



insert  into  t_smallType  values(t_smallTypeseq.nextval,'预防类','好书',2);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'公共卫生类','好书',2); 
insert  into  t_smallType  values(t_smallTypeseq.nextval,'其他','好书',2);

insert  into  t_smallType  values(t_smallTypeseq.nextval,'外科类','好书',6);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'内科类','好书',6);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'放射类','好书',6);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'解刨类','好书',6);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'神经类','好书',6);


insert  into  t_smallType  values(t_smallTypeseq.nextval,'口腔类','好书',7);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'其他','好书',7);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'口腔护理类','好书',7);


insert  into  t_smallType  values(t_smallTypeseq.nextval,'生化类','好书',8);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'临检类','好书',8);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'医学检验类','好书',8);

insert  into  t_smallType  values(t_smallTypeseq.nextval,'高等数学类','好书',9);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'物理类','好书',9);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'英语类','好书',9);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'其他','好书',9);

insert  into  t_smallType  values(t_smallTypeseq.nextval,'儿科护理类','好书',10);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'妇科护理类','好书',10);
insert  into  t_smallType  values(t_smallTypeseq.nextval,'术后护理类','好书',10);

select  * from  t_smallType; 
select  s.id,s.name,s.remarks,s.bigTypeId from  t_smallType s inner  join t_bigtype b  on(s.bigTypeId=b.id); 
/*创建顶部导航 url：进行连接的其他网站*/
drop table t_navigation;
drop  sequence  t_navigationseq;
create table t_navigation(
 id number(11) primary  key,
 name varchar2(50),
 url  varchar2(100)
);
create sequence t_navigationseq;
insert  into t_navigation values (t_navigationseq.nextval,'当当网','http://www.dangdang.com');
insert  into t_navigation values (t_navigationseq.nextval,'亚马逊','http://www.baidu.com');
insert  into t_navigation values (t_navigationseq.nextval,'宁医官网','http://www.baidu.com');
insert  into t_navigation values (t_navigationseq.nextval,'淘宝','http://www.baidu.com');
select  * from t_navigation;
/*创建顾客信息表 idCard:身份证号 status：用来区分是否是管理员*/
create  table  t_user(
id  number(11)  primary  key,
address varchar2(200),
birthday date,
idCard varchar2(20),
email  varchar2(20),
mobile varchar2(20),
password varchar(20),
gender  char(1),
status number(11),
trueName varchar2(20),
userName varchar2(20)
);
create sequence  t_userseq;
select  * from  t_user;
delete   t_user  where  id in(41,81);


    
    
    
    
         
