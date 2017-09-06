package com.ibm.app.service;

import java.util.Map;

import com.ibm.app.model.Order;

public interface OrderRepository {

	public void putOrder(Order order);
	
	public Order getOrder(String orderId);
	
	public Map<String, Order> getAllOrders();
}
