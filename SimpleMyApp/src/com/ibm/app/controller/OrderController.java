package com.ibm.app.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ibm.app.model.Order;
import com.ibm.app.service.OrderService;
import com.ibm.app.service.ProductService;

@Controller
public class OrderController {

	@Autowired
	ProductService productService;
	@Autowired
	MessageSource messageSource;
	@Autowired
	OrderService orderService;

	@RequestMapping(value = { "/newOrder" }, method = RequestMethod.GET)
	public String prepareOrder(ModelMap model) {
		Order order = new Order();
		model.addAttribute("order", order);
		return "order";
	}

	@RequestMapping(value = { "/newOrder" }, method = RequestMethod.POST)
	public String sendOrder(@Valid Order order, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "/order";
		}
		orderService.sendOrder(order);
		model.addAttribute("success", "Order for " + order.getProductName() + " registered.");
		return "/orderSuccess";
	}

	@RequestMapping(value = { "/orderStatus" }, method = RequestMethod.GET)
	public String checkOrderStatus(ModelMap model) {
		model.addAttribute("orders", orderService.getAllOrders());
		return "/orderStatus";
	}

}