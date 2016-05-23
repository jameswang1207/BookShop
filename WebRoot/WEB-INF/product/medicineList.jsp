<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书名列表</title>
<script type="text/javascript">
     function   medicineByBigTypeId(medicineId,pageNow){
           window.location="<%=request.getContextPath()%>/medicine/toMedicineList/"+medicineId+"/"+pageNow;
     }
     function   medicineSmallTypeId(medicineId,pageNow){
           window.location="<%=request.getContextPath()%>/medicine/toMedicineSmallList/"+medicineId+"/"+pageNow;
     }
</script>
</head>
<body>
<div class="main">
	<div class="product-list">
			<h2>全部书类</h2>
			<ul class="product clearfix">
				<c:forEach items="${medicineByBigTypeId}" var="p">
					<li>
						<dl>
							<dt>
<a href="<%=request.getContextPath()%>/medicine/toMedicineDetails/${p.id}" target="_blank"><img src="<%=request.getContextPath()%>/${p.picture}"/></a>
							</dt>
							<dd class="title">
<a href="<%=request.getContextPath()%>/medicine/toMedicineDetails/${p.id}" target="_blank">${p.name}</a>
							</dd>
							<dd class="price">
								￥${p.price}
							</dd>
						</dl>
					</li>
				</c:forEach>
			</ul>
<!-- 在分页中要注意的是将大小商品进行不同的标示 -->		
			<div class="clear"></div>
			<div class="pager">
				<ul class="clearfix">
					     <c:choose>
			                    <c:when test="${product.pageNow>1}">
				                     <c:choose>
				                        <c:when test="${type==1}">
		<li style="cursor:pointer;"  onclick="medicineByBigTypeId(${medicineBigTypeId},${product.pageNow-1});">上一页</li>
					                        </c:when>
					                        <c:otherwise>
		<li style="cursor:pointer;"  onclick="medicineSmallTypeId(${medicineBigTypeId},${product.pageNow-1});">上一页</li>			                        
				                        </c:otherwise>
				                     </c:choose>
			        	        </c:when>
			        	        <c:otherwise>
			        	        <li style="cursor:pointer;">上一页</li>
			            	    </c:otherwise>
        	             </c:choose> 
					     <c:forEach begin="1" end="${product.pageCount}" var="i">
					       <c:choose>
					         <c:when test="${i==product.pageNow}">
						         <c:choose>
							         <c:when test="${type==1}">
		<li style="cursor:pointer;"  class="current" onclick="medicineByBigTypeId(${medicineBigTypeId},${i});">${i}</li>
							         </c:when>
							         <c:otherwise>
		<li style="cursor:pointer;"  class="current" onclick="medicineSmallTypeId(${medicineBigTypeId},${i});">${i}</li>
							         </c:otherwise>
						         </c:choose>
					         </c:when>
					         <c:otherwise>
					         
					         <c:choose>
							         <c:when test="${type==1}">
		<li style="cursor:pointer;"  onclick="medicineByBigTypeId(${medicineBigTypeId},${i});">${i}</li>
							         </c:when>
							         <c:otherwise>
		<li style="cursor:pointer;"  onclick="medicineSmallTypeId(${medicineBigTypeId},${i});">${i}</li>
							         </c:otherwise>
						         </c:choose>
					         </c:otherwise>
					       </c:choose>
					   </c:forEach>
					   
					  <c:choose>
					    <c:when test="${product.pageNow<product.pageCount}">
						    <c:choose>
							    <c:when test="${type==1}">
		<li style="cursor:pointer;"  onclick="medicineByBigTypeId(${medicineBigTypeId},${product.pageNow+1});">下一页</li>
							    </c:when>
							    <c:otherwise>
		<li style="cursor:pointer;"  onclick="medicineSmallTypeId(${medicineBigTypeId},${product.pageNow+1});">下一页</li>
							    </c:otherwise>
						    </c:choose>
					    </c:when>
					    <c:otherwise>
					     <li style="cursor:pointer;">下一页</li>
					    </c:otherwise>
					  </c:choose>	
			  </ul>
			</div>
	</div>
</div>
</body>
</html>