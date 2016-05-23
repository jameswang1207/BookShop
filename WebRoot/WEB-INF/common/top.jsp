<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顶端页面设置</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
 function medicineByBigTypeId(id,pageNow){
           window.location="<%=request.getContextPath()%>/medicine/toMedicineList/"+id+"/"+pageNow;
     }
</script>
</head>
<body>
<div id="logo">
	<img src="<%=request.getContextPath()%>/images/logo.gif" />
</div>
<!--搜索框 -->
<div id="divSeacherSmallName">
  <form action="<%=request.getContextPath()%>/medicine/toMedicineSmallSeach/1" method="post">
		 <input type="text" id="txtSearch" name="smallName" autocomplete="off" value="计算机软件类"/>
		 <input type="submit" id="cmdSearch"  value="搜索" /><br/>
		 <div id="suggest" style="width: 200px"></div>
  </form>
</div>

<div class="help">
   <c:choose>
      <c:when test="${not empty userLogin}">
			<a href="<%=request.getContextPath()%>/medicine/toShoppingCart" class="shopping">购物车(${shoppingCart.cartSize==null?0:shoppingCart.cartSize}件商品)</a>
			<a href="<%=request.getContextPath()%>/medicine/toUserCenter">${userLogin.userName }</a>
			<a href="<%=request.getContextPath()%>/medicine/logout">注销</a>
			<a href="<%=request.getContextPath()%>/medicine/toRegister">注册</a>
			<a href="<%=request.getContextPath()%>/medicine/toComment/1">留言</a>
		</c:when>	
	<c:otherwise>
		<a href="#" class="shopping">购物车</a>
		<a href="<%=request.getContextPath()%>/medicine/toLogin">登录</a>
		<a href="<%=request.getContextPath()%>/medicine/toRegister">注册</a>
		<a href="<%=request.getContextPath()%>/medicine/toComment/1">留言</a>
	</c:otherwise>
</c:choose>
</div>
<!--链接导航 -->
<div class="navbar">
	<ul class="clearfix">
	<li class="current"><a href="<%=request.getContextPath()%>/medicine/toIndex">首页</a></li>
		   <c:forEach var="navigationHref" items="${navigations}" varStatus="status">
				<c:choose>
					<c:when test="${status.index==0 }">
						<li class="first">
							<a href="${navigationHref.url}" target="_blank">${navigationHref.name }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="${navigationHref.url}" target="_blank">${navigationHref.name }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	  </ul>
</div>

<!--大类商品显示-->
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
		<c:forEach var="medicinebigType" items="${bigtypes}">
			<li>
	<span id="medicineTag" style="cursor:pointer;" onclick="medicineByBigTypeId(${medicinebigType.id},1);">${medicinebigType.name }</span>
			</li>
		</c:forEach>
		</ul> 
	</div>
</div>
</body>
</html>