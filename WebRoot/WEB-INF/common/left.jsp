<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/menu.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/navigation.css" />
</head>
<body>
<div class="service-menu">
	<input class="menu-code-index" type="hidden" value="c849" />
	<!--默认下值设置data-service-index=c203的列表项展开与子列表标签导航高亮显示-->
	<h2 class="menu-title"><a href="javascript:void(0)">商品分类</a></h2>
	
	   <c:forEach items="${bigtypes }" var="medicinebigType">
	       <strong class="menu-p"><i class="menu-i"></i><a href="javascript:void(0)">${medicinebigType.name }</a></strong>
			<div class="menu-c">
				<ul>
				    <c:forEach items="${smallTypes}" var="medicinesmallType">
						 <c:if test="${medicinesmallType.bigTypeId==medicinebigType.id}">
<li><a data-service-index="c716" href="<%=request.getContextPath()%>/medicine/toMedicineSmallList/${medicinesmallType.id}/1">${medicinesmallType.name}</a></li>
						 </c:if>
					</c:forEach>
				</ul>
			</div>
	   </c:forEach>
</div> 

<div class="spacer"></div>
<div class="last-view">
	<h2>最近浏览</h2>
	<dl class="clearfix">
	 <c:forEach var="p" items="${currentMedicine}">
	 	<dt>
	 		<img src="<%=request.getContextPath()%>/${p.picture }" class="imgs" style="height: 50px;width: 50px;">
	 	</dt>
	 	<dd>
	 		<a href="<%=request.getContextPath()%>/medicine/toMedicineDetails/${p.id}" target="_blank">${p.name}</a>
	 	</dd>
	 </c:forEach>
	</dl>
    </div>   			
</body>
</html>
