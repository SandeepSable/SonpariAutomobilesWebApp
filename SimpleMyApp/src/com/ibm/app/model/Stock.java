package com.ibm.app.model;

import java.io.Serializable;
import java.util.Date;

public class Stock implements Serializable {

	private int stockId;
	private String stockName;
	private int quantity;
	private String updated_by;
	private Date updated_time;
	private String lastModified_by;
	private String lastModified_time;
	public int getStockId() {
		return stockId;
	}
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(String updated_by) {
		this.updated_by = updated_by;
	}
	public Date getUpdated_time() {
		return updated_time;
	}
	public void setUpdated_time(Date updated_time) {
		this.updated_time = updated_time;
	}
	public String getLastModified_by() {
		return lastModified_by;
	}
	public void setLastModified_by(String lastModified_by) {
		this.lastModified_by = lastModified_by;
	}
	public String getLastModified_time() {
		return lastModified_time;
	}
	public void setLastModified_time(String lastModified_time) {
		this.lastModified_time = lastModified_time;
	}
	
	

}