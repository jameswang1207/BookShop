<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书类详单页面</title>
<script type="text/javascript">
    function   addProductShoppingCart(productId){
          if('${userLogin.userName}'==''){
             alert("请先登录在进行购买!!!");  
          }else{
                  $.post("<%=request.getContextPath()%>/medicine/productIntoCart/"+productId,
                    function(ok){
                          if(ok){
                           alert("商品加入购物车成功!!!");
                           //必须reload一下，这样就可以从新加载当前的页面，这样就可以跟新页面中的购物车中的数字
                           location.reload();
                          }else{
                            alert("商品加入购物车失败,请重新加入!!!");
                          }
                       });
           }
     }
     
     //进行直接卖商品而不是加入到购物车中
       function  buy_product(productId){
           if('${userLogin.userName}'==''){
             alert("请先登录在进行购买!!!");
             }else{
                $.post("<%=request.getContextPath()%>/medicine/productIntoCart/"+productId,
                    function(ok){
                          if(ok){
                           location.reload();
                           //单页面刷新完在进行跳转,实现用户的直接购买    
                           window.location.href="<%=request.getContextPath()%>/medicine/toShoppingCart"
                          }else{
                            alert("商品购买失败,请重新购买!!!");
                          }
                       });
             }
          }
</script>
</head>
<body>
<div id="product"  class="main">
	<h1>${medicine.name}</h1>
	<div class="infos">
		<div class="thumb">
			<img class="img" src="<%=request.getContextPath()%>/${medicine.picture}" />
		</div>
		<div class="buy">
			<br/>
			<p>
				宁医书网价：<span class="price">￥${medicine.price}</span>
			</p>
			<p>库 存：${medicine.stock}</p>
			<br/>
			<div class="button">
				<input type="button" name="button" onclick="buy_product(${medicine.id})" /><br/>
				<a href="javascript:addProductShoppingCart(${medicine.id})">放入购物车</a>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="introduce">
		<h2>
			<strong>书类详情</strong>
		</h2>
		<div class="text">
			${medicine.description}
		</div>
	</div>
</div>
</body>
</html>