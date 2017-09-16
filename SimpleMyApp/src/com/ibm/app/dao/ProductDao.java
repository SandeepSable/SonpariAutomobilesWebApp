package com.ibm.app.dao;

import java.util.List;
import java.util.Map;

import com.ibm.app.model.Product;
import com.ibm.app.model.Stock;

public interface ProductDao {

	Product findById(int id);

	void addProduct(Product product);

	void deleteById(String sso);

	void editProduct(Product product);

	List<Product> findAllProducts();

	Product getProductByProductId(int productId);

	Boolean deleteProductByProductId(int productId);

}
