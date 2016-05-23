<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<title>宁医书网</title>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="../common/top.jsp"/>
</div>
<div id="position" class="wrap">
		${navUtil}
</div>	
<div id="main" class="wrap">
	<div class="lefter">
		<jsp:include page="../common/left.jsp"/>
	</div>
<jsp:include page="${pageView}"/>

<div class="clear"></div>
</div>
<div id="footer">
	<jsp:include page="../common/footer.jsp"/>
</div>
</body>
</html>