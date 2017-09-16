package com.ibm.app.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibm.app.dao.ProductDao;
import com.ibm.app.dao.StockDao;
import com.ibm.app.messaging.MessageSender;
import com.ibm.app.model.Order;
import com.ibm.app.model.Product;
import com.ibm.app.model.Stock;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {

	static final Logger LOG = LoggerFactory.getLogger(ProductServiceImpl.class);

	@Autowired
	MessageSender messageSender;
	@Autowired
	ProductDao productDao;
	@Autowired
	StockDao stockDao;

	
	@Override
	public void sendOrder(Order order) {
		LOG.info("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
		LOG.info("Application : sending order request {}", order);
		messageSender.sendMessage(order);
		LOG.info("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
	}

	@Override
	public Product addProduct(Product product) {
		productDao.addProduct(product);
		return product;
	}

	@Override
	public List<Product> getProductList() {

		return productDao.findAllProducts();

	}

	@Override
	public Product getProductByProductId(int productId) {

		Product product = productDao.getProductByProductId(productId);
		return product;
	}

	@Override
	public Boolean deleteProductByProductId(int productId) {

		Boolean isDeleted = productDao.deleteProductByProductId(productId);
		return isDeleted;

	}

	@Override
	public void editProduct(Product product) {
		productDao.editProduct(product);
	}

	@Override
	public void updateStockAudit(Stock stockAudit) {

		stockDao.updateStockAudit(stockAudit);
		
	}


}
