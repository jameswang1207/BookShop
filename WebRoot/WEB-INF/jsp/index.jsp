<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<title>宁医书网 - 首页</title>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="../common/top.jsp"/>
</div>

<div id="main" class="wrap">
	<div class="lefter">
		<jsp:include page="../common/left.jsp"/>
	</div>
	<div class="main">
			<div class="price-off ">
				<h2>今日特价书</h2>
				<ul class="product clearfix">
					<c:forEach items="${specials}" var="specialMedicine">
						<li>
							<dl>
								<dt>
<a href="<%=request.getContextPath()%>/medicine/toMedicineDetails/${specialMedicine.id}" target="_blank"><img src="../${specialMedicine.picture}"/></a>
								</dt>
								<dd class="title">
<a href="<%=request.getContextPath()%>/medicine/toMedicineDetails/${specialMedicine.id}" target="_blank">${specialMedicine.name }</a>
								</dd>
								<dd class="price">
									￥${specialMedicine.price}
								</dd>
							</dl>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="side">
				<div class="news-list">
					<h4>最新公告</h4>
					<ul>
						<c:forEach items="${notices}" var="notice">
<li><a href="<%=request.getContextPath()%>/medicine/toNotices/${notice.title}">${notice.title}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="spacer"></div>
				<div class="news-list">
					<h4>新闻动态</h4>
					<ul>
						<c:forEach items="${news}" var="new">
<li><a href="<%=request.getContextPath()%>/medicine/toNews/${new.title }">${new.title }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="spacer clear"></div>
			
			<div class="hot">
				<h2>热卖书推荐</h2>
				<ul class="product clearfix">
					<c:forEach items="${hots}" var="hotMedicaine">
						<li>
							<dl>
								<dt>
<a href="<%=request.getContextPath()%>/medicine/toMedicineDetails/${hotMedicaine.id}" target="_blank"><img src="../${hotMedicaine.picture }"/></a>
								</dt>
								<dd class="title">
<a href="<%=request.getContextPath()%>/medicine/toMedicineDetails/${hotMedicaine.id}" target="_blank">${hotMedicaine.name }</a>
								</dd>
								<dd class="price">
									￥${hotMedicaine.price}
								</dd>
							</dl>
						</li>
					</c:forEach>
				</ul>
			</div>
			
		</div>
		<div class="clear"></div>
</div>

<div id="footer">
	<jsp:include page="../common/footer.jsp"/>
</div>
</body>
</html>