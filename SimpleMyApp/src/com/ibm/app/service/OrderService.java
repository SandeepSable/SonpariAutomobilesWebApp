package com.ibm.app.service;

import java.util.Map;

import com.ibm.app.model.InventoryResponse;
import com.ibm.app.model.Order;

public interface OrderService {
	public void sendOrder(Order order);
	
	public void updateOrder(InventoryResponse response);
	
	public Map<String, Order> getAllOrders();
}
