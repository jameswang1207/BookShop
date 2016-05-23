<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm(){
		var nickName=$("#nickName").val();
		var content=$("#content").val();
		if(nickName==""){
			$("#error").html("昵称不能为空！");
			return false;
		}
		if(content==""){
			$("#error").html("留言内容不能为空！");
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

<div id="position" class="wrap">
 ${navUtil}
 <!--用来生成小导航的代码 大商品前面的小导航 -->                                  
</div>

<div id="main"  class="wrap">
	<div class="lefter">
		<jsp:include page="../common/left.jsp"/>
	</div>
	
	<div class="main">
	<div class="guestbook">
		<h2>全部留言</h2>
		<ul>
			<c:forEach items="${comments}" var="comment">
				<li>
					<dl>
						<dt>${comment.content}</dt>
						<dd class="author">
							网友：${comment.personName }
							<span class="timer">
								${comment.createTime}
							</span>
							<!-- not empty的使用 -->
							<c:if test="${not empty comment.replyContent }">
								<dd>
									宁医书网回复：${comment.replyContent }&nbsp;&nbsp;
									<span class="timer">
							         </span>
								</dd>
							</c:if>
						</dd>
					</dl>
				</li><br/>
			</c:forEach>
		</ul>
		<div class="clear"></div>
		<div class="pager">
				<ul class="clearfix">
				  <c:choose>
				    <c:when test="${comment.pageNow>1}">
					    <li><a href="<%=request.getContextPath()%>/medicine/toComment/${comment.pageNow-1}">上一页</a></li>
					</c:when>
					<c:otherwise>
					     <li><a href="#">上一页</a></li>  
					</c:otherwise>
				 </c:choose>
				    
				    <c:forEach begin="1"  end="${comment.pageCount}"  var="i">
				         <c:choose>
							     <c:when test="${comment.pageNow==i}">
			<li><a class="current"  href="<%=request.getContextPath()%>/medicine/toComment/${i}">${i}</a></li>
							     </c:when>
							  <c:otherwise>
			<li><a href="<%=request.getContextPath()%>/medicine/toComment/${i}">${i}</a></li>
			                  </c:otherwise>
	                     </c:choose>
					</c:forEach>
					
					<c:choose>
				    <c:when test="${comment.pageCount>comment.pageNow}">
					    <li><a href="<%=request.getContextPath()%>/medicine/toComment/${comment.pageNow+1}">下一页</a></li>
					</c:when>
					<c:otherwise>
					     <li><a href="#">下一页</a></li>  
					</c:otherwise>
				 </c:choose>
				</ul>
		</div>
		<div id="reply-box">
			<form action="<%=request.getContextPath()%>/medicine/saveComment" method="post" onsubmit="return checkForm()">
				<table>
					<tr>
						<td class="field">昵称：</td>
						<td><input class="text" type="text"  id="nickName"  name="personName" />
						</td>
					</tr>
					<tr>
						<td class="field">留言内容：</td>
						<td><textarea id="content" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit"
								name="submit" value="提交留言" /> </label>&nbsp;&nbsp;<font id="error"  color="red">${error }</font>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>
</div>
<div class="clear"></div>

<div id="footer">
	<jsp:include page="../common/footer.jsp"/>
</div>
</body>
</html>