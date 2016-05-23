 /*与当前用户的id来进行order的查询*/
 select  
       order_product.createTime,
       order_product.orderNo,
       order_product.status,
       order_product.userId,
       order_product.num,
       order_product.id,
       order_product.productId,
       order_product.orderId,
       product.name,
       product.description
           from (select
                 torder.createTime,
                 torder.orderNo,
                 torder.status,
                 torder.userId,
                 torder.cost,
                 orderproduct.num,
                 orderproduct.id,
                 orderproduct.productId,
                 orderproduct.orderId
                 from  t_order torder  left outer join  t_order_product orderproduct 
                 on (torder.id=orderproduct.orderId))order_product left outer  join t_product product 
                 on (order_product.productId=product.id)  where userId=2;
select  *  from t_order;



  select    
              t_order.createTime,
		       t_order.orderNo,
		       t_order.status,
		       t_order.userId,
		       t_order.id,
		       t_order.cost,
		       t_order_product.num,
		       t_product.name,
		       t_product.description,
		       t_product.hot,
		       t_product.price,
		       t_product.picture,
		       t_product.specialPrice,
		       t_product.specialPriceTime
                from  t_order  left outer join t_order_product on (t_order.id=t_order_product.orderId) 
                           left  outer join t_product on (t_order_product.productId=t_product.id) where userId =2;    
select *  from t_order;
select *  from  t_user;
update  t_user set status='2' where userName='JAVA';
select
             userName,password,status
             from  t_user  where  username='JAVA';
             
select  *  from  t_bigtype;
select  *  from  t_smallType;
select  *  from  t_product;
delete   from  t_product  where  id=240;
 delete   from  t_product  where  name='计算机硬件组装与维修经典教程'; 
delete  t_user    where  id=101;           
select  * from  t_user;

select *  from    
         (select   rownum ron,p.* from  (   
         select  id,address,birthday,idCard,email,mobile,password ,gender,status,trueName,userName
                  from  t_user  where  status='1' ) p) where  ron>0 and ron<2

select id,address,birthday,idCard,email,mobile,password ,gender,status,trueName,userName  from    
         (select   rownum ron,p.* from  (   
         select  id,address,birthday,idCard,email,mobile,password ,gender,status,trueName,userName
                  from  t_user  where  status='1' ) p) where  ron>0 and ron<2

select  * from  t_user;
delete  t_user  where  id=130;
select  *  from t_product;

select  *  from 
(select  rownum ron,p.* from 
(select
t_product.id productId,description,hot,hotTime,t_product.name productName,
price,picture,specialPrice,specialPriceTime,stock,t_bigtype.name bigtypeName,t_smallType.name smallTypeName
   from   t_product left  outer join t_bigtype  on (t_product.bigtypeId=t_bigtype.id)
   left  outer  join t_smallType on(t_product.smalltypeId=t_smallType.id)) p where productName  like '%Java%'  ) where  ron>1  and  ron<9;

select *  from  t_bigtype;
     
 select  *  from  t_product   left  outer   join  t_bigtype on (t_product.bigtypeId=t_bigtype.id);            
 
 select  *  from  t_product     where    name  like '%Java%';
  
 select  *  from 
       (select  rownum ron,p.* from 
             (select
                   t_product.id productId,description,hot,hotTime,t_product.name productName,
                   price,picture,specialPrice,specialPriceTime,stock,t_bigtype.name bigtypeName,
                   t_smallType.name smallTypeName  from   t_product left  outer join t_bigtype  on (t_product.bigtypeId=t_bigtype.id)
                   left  outer  join t_smallType on(t_product.smalltypeId=t_smallType.id))p where   productName like '%Java%') 
                   where  ron>1 and ron<10; 
 
 delete   t_product   where   name like 'james';  
 
 
select  *  from (
 select  rownum  ron,p.*  from 
                (select id,name,remarks  from  t_bigtype) p)
                 where    ron>1 and  ron<5;      
          
           select *  from  t_smallType;
             delete  t_smallType  where  id=68;
  
  
   select   t_order.id orderId,
            cost,createtime,
            orderno,
            t_order.status orderStatus,
            t_user.id userId,
            address,
            birthday,
            idcard,
            email,
            mobile,
            password,
            gender,
            t_user.status userStatus,
            truename,
            username
            from  t_order left outer join  t_user on  (t_order.userId=t_user.id);
   
   
   select  *  from t_order_product; 
   select *  from  t_order;
   select  *  from  t_user;       
   select  *   from t_comment;
   
   select id,content,createTime,personName,replyContent,replyTime from  t_comment where  personName='tome'; 
   
   select  *  from  t_user  where  status='2' and  password='123456'
   
   
        