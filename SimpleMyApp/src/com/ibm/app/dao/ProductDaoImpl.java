package com.ibm.app.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ibm.app.model.Product;
import com.ibm.app.model.ProductStock;
import com.ibm.app.model.Stock;
import com.ibm.app.model.User;

@Repository("productDao")
public class ProductDaoImpl extends AbstractDao<Integer, Product> implements ProductDao {

	static final Logger logger = LoggerFactory.getLogger(ProductDaoImpl.class);

	@Override
	public Product findById(int id) {
		Hibernate.initialize(Product.class);
		return null;
	}

	@Override
	public void addProduct(Product product) {

		persist(product);
	}

	@Override
	public void deleteById(String sso) {

	}

	@Override
	public void editProduct(Product product) {
		System.out.println("Product::" + product);
		update(product);
	}

	@Override
	public List<Product> findAllProducts() {

		Criteria criteria = createEntityCriteria().addOrder(Order.asc("productName"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To avoid duplicates.
		List<Product> products = (List<Product>) criteria.list();
		System.out.println("products list ::" + products);
		return products;
	}

	@Override
	public Product getProductByProductId(int productId) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("productId", productId));
		Product product = (Product) crit.uniqueResult();
		return product;

	}

	@Override
	public Boolean deleteProductByProductId(int productId) {

		try {
			delete(getByKey(productId));
		} catch (Exception ex) {
			return false;
		}
		return true;
	}
}
