<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>用户管理</h2>
<div class="manage">
	<table class="list">
		<tr>
			<th>ID</th>
			<th>姓名</th>
			<th>性别</th>
			<th>Email</th>
			<th>手机</th>
			<th>操作</th>
		</tr>
		<tr>
			<td class="first w4 c">${userLogin.id}</td>
			<td class="w1 c">${userLogin.trueName}</td>
			 <c:choose>
	                  <c:when test="${userLogin.gender=='M'}">
	                  <td class="w2 c">男</td>
	                  </c:when>
	                  <c:otherwise>
	                  <td class="w2 c">女</td>
	                  </c:otherwise>			 
			 </c:choose>
			<td>${userLogin.email}</td>
			<td class="w4 c">${userLogin.mobile}</td>
			<td class="w1 c"><a href="<%=request.getContextPath()%>/medicine/toUpdate">修改</a></td>
		</tr>
	</table>
</div>
</body>
</html>