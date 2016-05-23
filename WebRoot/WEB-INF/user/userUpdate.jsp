<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--引入springMVC标签，这样就可以进行自动的进行数据的传输 -->
<%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm(){
		 var userName=$("#userName").val();
		 var trueName=$("#trueName").val();
		 var password=$("#password").val();
		 var birthday=$("#birthday").val();
		 var mobile=$("#mobile").val();
		 var address=$("#address").val();
		 var dentityCode=$("#dentityCode").val();
		 var email=$("#email").val();
		 if(userName==""){
			 $("#error").html("用户名不能为空！");
			 return false;
		 }
		  if(trueName==""){
			 $("#error").html("用户真实姓名不能为空！");
			 return false;
		 }
		 if(password==""){
			 $("#error").html("密码不能为空！");
			 return false;
		 }
		 if(birthday==""){
			 $("#error").html("出生日期不能为空！");
			 return false;
		 }
		 if(mobile==""){
			 $("#error").html("手机号码不能为空！");
			 return false;
		 }
		 if(address==""){
			 $("#error").html("送货地址不能为空！");
			 return false;
		 }
		 if(dentityCode==""){
			 $("#error").html("身份证不能为空！");
			 return false;
		 }
		 if(email==""){
			 $("#error").html("邮件不能为空！");
			 return false;
		 }
	}
</script>
</head>
<body>
<h2>修改用户</h2>
<div class="manage">
	<form:form action="updateUser" commandName="user" method="put" onsubmit="return checkForm()">
		<table class="form">
			<tr>
				<td class="field">用户名：</td>
				<td><form:input  cssClass="text" name="userName" path="userName" readonly="true"/></td>
			</tr>
			<tr>
				<td class="field">姓名：</td>
				<td><form:input  cssClass="text"  id="trueName" name="trueName" path="trueName"/></td>
			</tr>
			<tr>
				<td class="field">密码：</td>
				<td><form:password  path="password"  cssClass="text" id="password" name="password" showPassword="true"/></td>
			</tr>
			<tr>
				<td class="field">性别：</td>
				<td>
							<form:radiobutton  path="gender" name="gender"  value="M" />男 
							<form:radiobutton  path="gender" name="gender"  value="F" />女 
				</td>
			</tr>
			<tr>
				<td class="field">出生日期：</td>
				<td>
					<form:input path="birthday"  id="birthday"  name="birthday"  cssClass="Wdate" onClick="WdatePicker()"/>	
				</td>
			</tr>
			<tr>
				<td class="field">手机号码：</td>
				<td><form:input path="mobile" id="mobile" cssClass="text" name="mobile" readonly="true"/></td>
			</tr>
			<tr>
				<td class="field">送货地址：</td>
				<td><form:input  path="address" cssClass="text"  id="address" name="address"/></td>
			</tr>
			<tr>
				<td class="field">身份证号：</td>
				<td><form:input   path="idCard" cssClass="text" id="dentityCode" name="idCard" /></td>
			</tr>
			<tr>
				<td class="field">Email：</td>
				<td><form:input cssClass="text" path="email" id="email" name="email"/></td>
			</tr>
			<tr>
				<td>
				    <form:input  path="status" type="hidden"  name="status"/>
					<form:input  path="id" type="hidden"  name="id"/>
				</td>
				<td><label class="ui-blue"><input type="submit" name="submit" value="更新" /></label></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><font id="error" color="red"></font> </td>
			</tr>
		</table>
	</form:form>
</div>
</body>
</html>