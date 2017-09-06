package com.ibm.app.service;

import java.util.List;

import com.ibm.app.model.Order;
import com.ibm.app.model.Product;

public interface ProductService {

	public void sendOrder(Order order);

	public Product addProduct(Product product);

	public void editProduct(Product product);
	
	public List<Product> getProductList();

	public Product getProductByProductId(int productId);

	public Boolean deleteProductByProductId(int productId);

}
