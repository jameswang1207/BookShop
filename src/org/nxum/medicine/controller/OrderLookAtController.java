package org.nxum.medicine.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.service.OrderService;
import org.nxum.medicine.util.NavigationUtil;
import org.nxum.medicine.view.entity.UpdateOrderEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/medicine")
public class OrderLookAtController {
	@Autowired
	private OrderService service;

	@RequestMapping(value = "/toLookAtOrder", method = RequestMethod.GET)
	public String toLookAtOrder(HttpServletRequest request, ModelMap map) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		List<UpdateOrderEntity> orders = this.service.findcurrentUserOrder(
				user.getId(), null);
		String naviUtil = NavigationUtil.genNavCode("订单的管理");
		map.addAttribute("naviUtil", naviUtil);
		map.addAttribute("pageView", "../user/orderList.jsp");
		map.addAttribute("orders", orders);
		return "user";
	}

	@RequestMapping(value = "/toLookAtOrderByOrderNo", method = RequestMethod.POST)
	public String toLookAtOrderByOrderNo(
			@RequestParam("orderNo") String orderNo, ModelMap map) {
		List<UpdateOrderEntity> orders = null;
		if (orderNo != null) {
			orders = this.service.findcurrentUserOrder(null, orderNo);
		}
		String naviUtil = NavigationUtil.genNavCode("订单的管理");
		map.addAttribute("naviUtil", naviUtil);
		map.addAttribute("pageView", "../user/orderList.jsp");
		map.addAttribute("orders", orders);
		return "user";
	}

	@ResponseBody
	@RequestMapping(value = "/toUpdateStatus/{orderNo}", method = RequestMethod.POST)
	public boolean updateStatus(@PathVariable("orderNo") String orderNo) {
		@SuppressWarnings("unused")
		boolean flag = this.service.updateStatus(orderNo);
		if (flag = true) {
			return true;
		} else {
			return false;
		}
	}
}
