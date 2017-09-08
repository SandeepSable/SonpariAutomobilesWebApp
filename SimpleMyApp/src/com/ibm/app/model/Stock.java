package com.ibm.app.model;

import java.io.Serializable;

public class Stock implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6502406283493058461L;
	private int productId;
	private String productName;
	private int quantity;
	private String inserted_by;
	private String inserted_time;
	private String lastModified_by;
	private String lastModified_time;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getInserted_by() {
		return inserted_by;
	}

	public void setInserted_by(String inserted_by) {
		this.inserted_by = inserted_by;
	}

	public String getInserted_time() {
		return inserted_time;
	}

	public void setInserted_time(String inserted_time) {
		this.inserted_time = inserted_time;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Stock [productId=").append(productId).append(", productName=").append(productName)
				.append(", quantity=").append(quantity).append(", inserted_by=").append(inserted_by)
				.append(", inserted_time=").append(inserted_time).append(", lastModified_by=").append(lastModified_by)
				.append(", lastModified_time=").append(lastModified_time).append("]");
		return builder.toString();
	}

}