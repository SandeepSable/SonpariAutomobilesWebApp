package com.ibm.app.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.app.messaging.MessageSender;
import com.ibm.app.model.InventoryResponse;
import com.ibm.app.model.Order;
import com.ibm.app.model.OrderStatus;
import com.ibm.app.utility.BasicUtil;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	static final Logger LOG = LoggerFactory.getLogger(OrderServiceImpl.class);

	@Autowired
	MessageSender messageSender;

	@Autowired
	OrderRepository orderRepository;

	@Override
	public void sendOrder(Order order) {
		System.out.println("OrderServiceImpl.sendOrder()..........");
		order.setOrderId(BasicUtil.getUniqueId());
		order.setStatus(OrderStatus.CREATED);
		orderRepository.putOrder(order);
		System.out.println("Application : sending order request {}" + order);
		messageSender.sendMessage(order);
		System.out.println("OrderServiceImpl.sendOrder()... closing");
	}

	@Override
	public void updateOrder(InventoryResponse response) {

		Order order = orderRepository.getOrder(response.getOrderId());
		if (response.getReturnCode() == 200) {
			order.setStatus(OrderStatus.CONFIRMED);
		} else if (response.getReturnCode() == 300) {
			order.setStatus(OrderStatus.FAILED);
		} else {
			order.setStatus(OrderStatus.PENDING);
		}
		orderRepository.putOrder(order);
	}

	public Map<String, Order> getAllOrders() {
		return orderRepository.getAllOrders();
	}

}
