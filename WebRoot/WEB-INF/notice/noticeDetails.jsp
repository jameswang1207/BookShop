<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>最新公告</title>
</head>
<body>
<div id="notice" class="right-main">
		<h1>标题:${notice.title}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间:${notice.createTime}</h1>
		<div class="content">
			${notice.content}
		</div>
	</div>
</body>
</html>