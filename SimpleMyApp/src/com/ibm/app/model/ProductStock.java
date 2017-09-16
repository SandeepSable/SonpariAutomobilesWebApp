package com.ibm.app.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

public class ProductStock {

	@Entity
	@Table(name = "SP_PRODUCT")
	public class Product implements Serializable {

		private static final long serialVersionUID = 1L;

		@Id
		@NotEmpty(message = "AavaSyak Aaho.")
		@Column(name = "PRODUCT_ID")
		private Integer productId;

		@NotEmpty(message = "AavaSyak Aaho.")
		@Column(name = "PRODUCT_NAME", unique = true, nullable = false)
		private String productName;

		@NotEmpty(message = "AavaSyak Aaho.")
		@Column(name = "QUANTITY", unique = true, nullable = false)
		private String quantity;

		public Integer getProductId() {
			return productId;
		}

		public void setProductId(Integer productId) {
			this.productId = productId;
		}

		public String getProductName() {
			return productName;
		}

		public void setProductName(String productName) {
			this.productName = productName;
		}

		public String getQuantity() {
			return quantity;
		}

		public void setQuantity(String quantity) {
			this.quantity = quantity;
		}

	}
}
