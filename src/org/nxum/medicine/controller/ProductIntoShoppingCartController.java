package org.nxum.medicine.controller;
import java.util.List;
import org.nxum.medicine.entity.ShoppingCartOfProduct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.nxum.medicine.dao.ProductDao;
import org.nxum.medicine.entity.Product;
import org.nxum.medicine.entity.ShoppingCart;
import org.nxum.medicine.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
//产品加入购物的的控制
@Controller
@RequestMapping("/medicine")
public class ProductIntoShoppingCartController {
	@Autowired
	private  ProductDao  dao;
	@ResponseBody
	@RequestMapping(value="/productIntoCart/{productId}",method=RequestMethod.POST)
    public boolean   produnctIntoCart(@PathVariable("productId") Integer  productId,
    		                           HttpServletRequest  request){
		    HttpSession session  =  request.getSession();
		   //获取当前的session与用户登陆用的session是一个session
		   Product   product =  this.dao.findMedicineById(productId);
		   ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingCart");
		    if(cart==null){
		    	  cart =  new ShoppingCart();
		    	  //将创建好的shopping与单签用户进行绑定(表示一人一车)
		    User  loginUser = (User)session.getAttribute("userLogin");
		    	  cart.setUserId(loginUser.getId());
		    }
		   //得到当前购物车中的product 
		   List<ShoppingCartOfProduct>  shoppingCartOfProductList 
		                                      = cart.getShoppingCartOfProducts();
		     boolean  flag =true;  
		     for(ShoppingCartOfProduct cartOfProduct:shoppingCartOfProductList){
		    	    if(cartOfProduct.getProduct().getId().equals(product.getId())){
		    	    	cartOfProduct.setCount(cartOfProduct.getCount()+1);
		    	    	flag =  false;
		    	    	break;
		    	    }
		     }
		     //如果当前购物车中没有product，则将当前的产品加入到购物车中，shoppingCartOfProduct=product，比他多添加了一个
		     //count属性和一个标士Id
		     ShoppingCartOfProduct  shoppingCartOfProduct  =  new ShoppingCartOfProduct();
		     if(flag){
                   shoppingCartOfProduct.setCount(1);
                   shoppingCartOfProduct.setProduct(product);
                   //并将当前的商品加入到cart的类表中
                   shoppingCartOfProductList.add(shoppingCartOfProduct);
		     }
		     
		     //记录够无车中的商品总类
		     cart.setCartSize(shoppingCartOfProductList.size());
		     //将你的cart加入到session中
		     session.setAttribute("shoppingCart",cart);
	         return true;
   } 
   
	//刷新session主要是用来改变里面的count值
	@ResponseBody
	@RequestMapping(value="/toRefrshSession/{productId}/{count}",method=RequestMethod.POST)
	public  boolean refreshSession(@PathVariable("productId") Integer productId,
			                       @PathVariable("count") Integer count,
			                       HttpServletRequest request
			                       ){
		   Product  product =  this.dao.findMedicineById(productId);
		   HttpSession  session  =  request.getSession();
		   ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingCart");
		   List<ShoppingCartOfProduct>  shoppingCartOfProductList 
                                                    = cart.getShoppingCartOfProducts(); 
		     for(ShoppingCartOfProduct cartproduct:shoppingCartOfProductList){
		    	    if(cartproduct.getProduct().getId().equals(product.getId())){
		    	    	  cartproduct.setCount(count);
		    	    	    break;
		    	    }
		     }
		   session.setAttribute("shoppingCart",cart);
		 return  true;
	}
	
   // 将购物车中的不想要的东西进行删除,这里不需要取数据库中进行查询
	@ResponseBody
	@RequestMapping(value="/removeProductOfSession/{productId}",method=RequestMethod.DELETE)
   public boolean removeSessionProduct(@PathVariable("productId") Integer productId,
		                               HttpServletRequest  request
		                                ){	
		    HttpSession session =  request.getSession();
		    ShoppingCart  cart =   (ShoppingCart) session.getAttribute("shoppingCart");
		    List<ShoppingCartOfProduct>  shoppingCartOfProductList 
                                             = cart.getShoppingCartOfProducts();
		    //该地方是可以进行删除的，因为在遍历到有相同的时候，就break，并不在遍历，因此是可以进行删除的
                  for(int i=0;i<shoppingCartOfProductList.size();i++){    	  
                	    if(shoppingCartOfProductList.get(i).getProduct().getId().equals(productId)){
                	    	   shoppingCartOfProductList.remove(i);
                	    	   break;
                	    }
                  }
              //改变购物车中的商品种类
          cart.setCartSize(shoppingCartOfProductList.size());
          session.setAttribute("shoppingCart",cart);
	      return  true;
   }	
	
	
	
}
