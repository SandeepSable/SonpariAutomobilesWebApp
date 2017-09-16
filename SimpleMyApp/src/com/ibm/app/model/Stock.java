package com.ibm.app.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SP_STOCK_AUDIT_TABLE")
public class Stock implements Serializable {

	private static final long serialVersionUID = -650240622443058461L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "AUDIT_ID")
	private Integer auditId;
	
	@Column(name = "PRODUCT_ID")
	private int productId;

	@Column(name = "PRODUCT_NAME")
	private String productName;

	@Column(name = "QUANTITY")
	private int quantity;

	@Column(name = "INSERTED_BY")
	private String inserted_by;

	@Column(name = "INSERTED_TIME")
	private String inserted_time;


	public Integer getAuditId() {
		return auditId;
	}

	public void setAuditId(Integer auditId) {
		this.auditId = auditId;
	}

	
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Stock [productId=");
		builder.append(productId);
		builder.append(", productName=");
		builder.append(productName);
		builder.append(", quantity=");
		builder.append(quantity);
		builder.append(", inserted_by=");
		builder.append(inserted_by);
		builder.append(", inserted_time=");
		builder.append(inserted_time);
		builder.append("]");
		return builder.toString();
	}

}