package org.nxum.medicine.controller;
import org.nxum.medicine.util.NavigationUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class ToShoppingCartController {
@RequestMapping(value="toShoppingCart",method=RequestMethod.GET)
 public String  toShoppingCart(ModelMap map){
	     map.addAttribute("pageView","../shoppingCart/shoppingCart.jsp");
	     String  navUtil= NavigationUtil.genNavCode("购物车");
	     map.addAttribute("navUtil",navUtil);
	     return "shoppingCartMain";
 }
}
