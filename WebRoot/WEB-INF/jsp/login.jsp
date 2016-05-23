<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	function loadimage(){
document.getElementById("randImage").src = "<%=request.getContextPath()%>/medicine/getCode/"+Math.random();
	}
	
	function checkForm(){
		 var userName=$("#userName").val();
		 var password=$("#password").val();
		 var imageCode=$("#imageCode").val();
		 if(userName==""){
			 $("#error").html("用户名不能为空！");			 
			 return false;
		 }
		 if(password==""){
			 $("#error").html("密码不能为空！");
			 return false;
		 }
		 if(imageCode==""){
			 $("#error").html("验证码不能为空！");
			 return false;
		 }
		 return true;
	}
</script>

</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="../common/top.jsp"/>
</div>
<div id="register" class="wrap">
<div class="shadow">
	<em class="corner lb"></em> <em class="corner rt"></em>
	<div class="box">
		<h1>欢迎来到宁医书网</h1>
		<form id="loginForm"  method="post" action="<%=request.getContextPath()%>/medicine/login" onsubmit="return checkForm()">
		<table>
			<tr>
				<td class="field">用户名：</td>
				<td><input Class="text"  id="userName" type="text"
					    name="userName"  value="${Resultuser.userName}"/>
				</td>
			</tr>
			<tr>
				<td class="field">登录密码：</td>
				<td><input Class="text"  type="password" id="password"
					    name="password"  value="${Resultuser.password}"/>
				</td>
			</tr>
			<tr>
				<td class="field">验证码：</td>
				<td><input Class="text" style="width: 60px;margin-right: 10px;"
							name="code" type="text" id="imageCode"/><img
							onclick="javascript:loadimage();" title="换一张试试" name="randImage"
							id="randImage" src="<%=request.getContextPath()%>/medicine/getCode/100" width="60" height="20" border="1"
							align="absmiddle"/>					
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
						 <label  Class="ui-green">
						<input type="submit" name="submit" value="立即登录" />
						</label>
				</td>
				<td><p id="error" style="color:red">${error}</p></td>
			</tr>
		</table>
	</form>
</div>
</div>
</div>
<div id="footer">
	<jsp:include page="../common/footer.jsp"/>
</div>
</body>
</html>