<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻动态</title>
</head>
<body>
<div id="news" class="right-main">
		<h1>标题:${news.title}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间:${news.createTime}</h1>
		<div class="content">
			${news.content}
		</div>
	</div>
</body>
</html>