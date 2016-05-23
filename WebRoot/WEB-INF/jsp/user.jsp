<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<title>宁医书网</title>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="../common/top.jsp"/>
</div>
<div id="position" class="wrap">
		${naviUtil}
</div>

<div id="main" class="wrap">
	<div id="menu-mng" class="lefter" >
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><a href="<%=request.getContextPath()%>/medicine/lookAtUser">个人信息管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="<%=request.getContextPath()%>/medicine/toLookAtOrder">个人订单管理</a></dd>
			</dl>
		</div>
	</div>
	
<div class="main">
              <jsp:include page="${pageView}"/>  
</div>
<div class="clear"></div>
</div>
<div id="footer">
	<jsp:include page="../common/footer.jsp"/>
</div>
</body>
</html>