package com.ibm.app.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ibm.app.model.Stock;

@Repository("stockDao")
public class StockDaoImpl extends AbstractDao<Integer, Stock> implements StockDao {

	static final Logger logger = LoggerFactory.getLogger(StockDaoImpl.class);

	@Override
	public void updateStockAudit(Stock stockAudit) {
		persist(stockAudit);
	}
}
