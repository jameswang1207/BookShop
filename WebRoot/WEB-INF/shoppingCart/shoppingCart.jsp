<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宁医书网购物车</title>
<script type="text/javascript">
   $(function (){
     //进行总价的计算
       function  toTital(){
               var  s =  0;
                 //每次执行传递进来的函数时，函数中的this关键字都指向一个不同的DOM元素（每次都是一个不同的匹配元素）。
               $(".productTr").each(function (){
                 //find找出正在处理元素的子元素
                  var  n =   $(this).find('.text_box').val();
                  var  price  =  $(this).find('.price_').text();
                  s +=  n*price;
                 //alert("总价格式"+s);
               });
               $("#product_total").html(s);
       }
        toTital();
   });
   
   //用于add min change text_box中的数据，用该方法可以将总价格进行计算出来
   function  toTital(){
               var  s =  0;
                 //每次执行传递进来的函数时，函数中的this关键字都指向一个不同的DOM元素（每次都是一个不同的匹配元素）。
               $(".productTr").each(function (){
                 //find找出正在处理元素的子元素
                  var  n =   $(this).find('.text_box').val();
                  var  price  =  $(this).find('.price_').text();
                  s +=  n*price;
                 //alert("总价格式"+s);
               });
               $("#product_total").html(s);
       }
       
   //点击+进行该商品的添加
   function   addProduct(productId){
      var t =$("#count_"+productId);
      //重置小框中的个数
       t.val(parseInt(t.val())+1);
       var price = $("#productPrice_"+productId).text();
       $("#oneClassProduct_"+productId).text(price*t.val());
      //重新刷新session中的商品的件数count 
       refreshSession(productId,t.val());
       //再掉一下 toTital();进行总价的重置  
        toTital();  
   }
   
     //点击-进行该商品的减少
      function  minProduct(productId){
      var t =$("#count_"+productId);
      //重置小框中的个数
        if(t.val()>0){
        t.val(parseInt(t.val())-1);
        }else{
        t.val(0);
        }
       var price = $("#productPrice_"+productId).text();
       $("#oneClassProduct_"+productId).text(price*t.val());
      //重新刷新session中的商品的件数count 
       refreshSession(productId,t.val());
       //再掉一下 toTital();进行总价的重置  
       toTital();
      }
      
      //直接进行修改
      function  changProduct(productId){
      var t =$("#count_"+productId);
      //重置小框中的个数
        if(t.val()>0){
        t.val(t.val());
        }else{
         t.val(0);
        }
       var price = $("#productPrice_"+productId).text();
       $("#oneClassProduct_"+productId).text(price*t.val());
      //重新刷新session中的商品的件数count 
       refreshSession(productId,t.val());
       //再掉一下 toTital();进行总价的重置  
       toTital();
      }
      
   //进行session中的数据进行刷新
   function  refreshSession(productId,count){
       $.post("<%=request.getContextPath()%>/medicine/toRefrshSession/"+productId+"/"+count,
             function(ok){
                 if(ok){
  //alert("session刷新成功");
                 }else{
                  alert("session刷新失败");
                 }             
             }, "json");          
   }
   
   //进行购物车中的商品的删除操作
   function  deleteProduct(productId){
          var  flag=confirm("你确定要进行删除吗？");
              if(flag==true){ 
                   $.ajax({
						  type: "delete",
						   url: "<%=request.getContextPath()%>/medicine/removeProductOfSession/"+productId,
						   success: function(ok){
						       if(ok){
//alert("商品从购物车中删除成功!!!");
				                 window.location.href="<%=request.getContextPath()%>/medicine/toShoppingCart";
						          }
						         }
								});
                    }
                }
  //进行订单的保存            
     function saveOrder(){
        var cost =  $("#product_total").text();
        if(cost != null && cost != "" && cost != 0){
         window.location.href="<%=request.getContextPath()%>/medicine/toSaveOrder/"+ cost;
        }
     }            
</script>
</head>
<body>
	<div id="shopping">

		<table id="myTableProduct">
			<tr>
				<th>商品名称</th>
				<th>商品单价</th>
				<th>金额</th>
				<th>购买数量</th>
				<th>操作</th>
			</tr>

			<c:forEach items="${shoppingCart.shoppingCartOfProducts}"
				var="shoppingCartOfProduct">
				<tr class="productTr">
					<td class="thumb"><img class="imgs"
						src="<%=request.getContextPath()%>/${shoppingCartOfProduct.product.picture}" />
						<a
						href="<%=request.getContextPath()%>/medicine/toMedicineDetails/${shoppingCartOfProduct.product.id}">${shoppingCartOfProduct.product.name}</a>
					</td>
					<td class="price"><span>￥<label
							id="productPrice_${shoppingCartOfProduct.product.id}"
							class="price_">${shoppingCartOfProduct.product.price}</label>
					</span></td>
					<td class="price"><span>￥<label
							id="oneClassProduct_${shoppingCartOfProduct.product.id}">${shoppingCartOfProduct.product.price*shoppingCartOfProduct.count}</label>
					</span></td>
					<td class="number"><input type="hidden" id="product_id"
						value="" /> <input class="min"
						onclick="minProduct(${shoppingCartOfProduct.product.id})"
						type="button" value="-" /> <input
						id="count_${shoppingCartOfProduct.product.id}"
						onblur="changProduct(${shoppingCartOfProduct.product.id})"
						class="text_box" style="width: 30px;text-align: center" name=""
						type="text" value="${shoppingCartOfProduct.count}" /> <input
						class="add"
						onclick="addProduct(${shoppingCartOfProduct.product.id})"
						type="button" value="+" /></td>
					<td class="delete"><a
						href="javascript:deleteProduct(${shoppingCartOfProduct.product.id})">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>

		<div class="button">
			<input type="button" onclick="saveOrder()" />
		</div>
	</div>

	<div class="shopping_list_end">
		<ul>
			<li class="shopping_list_end_2">￥<label id="product_total"></label>
			</li>
			<li class="shopping_list_end_3">商品金额总计：</li>
		</ul>
	</div>
	<!-- 用户个人信息展示 -->
	<div style="background-color: #e6e6e6;margin-top: 10px;min-height: 40px;">
		<p style="font-size: 20px ;background-color: #f7f4eb ; font-weight: 700">个人信息</>
		<div style="padding: 5px; text-align: center">
			<p style="color:#3a52a8">收件人：${userLogin.trueName}</p>
			<p style="color:#3a52a8">收获地址：${userLogin.address}</p>
			<p style="color:#3a52a8">联系电话：${userLogin.mobile}</p>
		</div>
	</div>
</body>
</html>