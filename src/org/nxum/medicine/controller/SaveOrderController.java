package org.nxum.medicine.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nxum.medicine.entity.ShoppingCart;
import org.nxum.medicine.entity.ShoppingCartOfProduct;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.service.OrderService;
import org.nxum.medicine.util.NavigationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/medicine")
public class SaveOrderController {
	 @Autowired
	 private OrderService  orderService;
     @RequestMapping(value="/toSaveOrder/{cost}",method=RequestMethod.GET)
	 public  String  toSaveOrder(HttpServletRequest request,
			                      @PathVariable("cost") Double cost,
			                      ModelMap map
			                      ){
    	HttpSession  session  =  request.getSession();
    	ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingCart");
//System.out.println("当前的页面中的cart"+cart);    	
    	User  user  = (User)session.getAttribute("userLogin");
//System.out.println("当前使用购物车的用户"+user);
    	List<ShoppingCartOfProduct> scfps =  cart.getShoppingCartOfProducts();
//System.out.println("购物车中的商品"+scfps);    	
        //保存订单
    	orderService.saveOrder(user, scfps, cost, cart);
    	String navUtil = NavigationUtil.genNavCode("购买成功"); 
    	map.addAttribute("navUtil",navUtil);
    	map.addAttribute("pageView","../shoppingCart/shopping-result.jsp");
	    return  "shoppingCartMain" ;
   }
}
