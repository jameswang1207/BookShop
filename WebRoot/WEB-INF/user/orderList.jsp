<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
     function  resovedProdut(orderNo){
           var r=confirm("你确定要确定收货吗?");
            if (r==true)
           {
             $.post("<%=request.getContextPath()%>/medicine/toUpdateStatus/"+orderNo,
              function(ok){
                 if(ok){
                  location.reload();
                 }else{
                  alert("商品签收失败!请重试");
                 }
              });
           }
           else
           {
             alert("你已经取消确认收货!!");
           }
     }
</script>
<title>订单中心</title>
</head>
<body>
<h2>订单管理</h2>
		<div class="manage">
		<div class="search">
				<form action="toLookAtOrderByOrderNo" method="post">
					   订单号：<input type="text" class="text" name="orderNo"/> 
					 <label class="ui-blue"><input type="submit"  name="submit" value="查询" /></label>
				</form>
			</div>
			<div class="spacer"></div>
				<table class="list">
				<c:forEach var="order" items="${orders}">
				<tr style="background-color: #f7f4eb">
					<td colspan="4">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					单号:${order.orderNo}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					下单时间:${order.createTime}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					状态：
					<c:choose>
						<c:when test="${order.status==1 }">待审核</c:when>
						<c:when test="${order.status==2 }">审核中</c:when>
						<c:when test="${order.status==3 }">
			   <label class="ui-blue"><input style="cursor: pointer;" type="button"  value="已发货"  onclick="resovedProdut(${order.orderNo})"/></label>
			   </c:when>
						<c:when test="${order.status==4 }">交易已完成</c:when>
					</c:choose>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					总金额：${order.cost}&nbsp;(元)
					</td>
				</tr>
				    <c:forEach var="products" items="${order.products}">
					<tr>
						<td width="50%">
							<a href="#" target="_blank"><img width="72" height="72" src="<%=request.getContextPath()%>/${products.picture}"></a>
							&nbsp;&nbsp;
							<a href="#" target="_blank">${products.name}</a>
						</td>
						<td width="17%">
							&nbsp;&nbsp;
							${products.price}
						</td>
						<td width="17%">
							&nbsp;&nbsp;
							${products.productCount} 
						</td>
						<td>
							&nbsp;&nbsp;小计：
						    ${products.productCount*products.price}&nbsp;(元)
						</td>
					</tr>
			    </c:forEach>
				</c:forEach>
				</table>
		</div>
</body>
</html>