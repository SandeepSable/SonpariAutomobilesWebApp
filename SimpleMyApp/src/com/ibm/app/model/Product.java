package com.ibm.app.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="SP_PRODUCT")
public class Product implements Serializable{

	private static final long serialVersionUID = -2237200875611159283L;

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PRODUCT_ID")
	private Integer productId;

	@NotEmpty(message="AavaSyak Aaho.")
	@Column(name="PRODUCT_NAME", unique=true, nullable=false)
	private String productName;
    
	@Column(name="QUANTITY", nullable=true)
	private Integer stock;

	@Column(name="ALISE_NAME", nullable=true)
	private String aliasName; 
		
	
	@Column(name="DESCRIPTION", nullable=true)
	private String description;
	

	@Column(name="MANUFACTURER_NAME", nullable=true)
	private String manufacturerName;
		

	@Column(name="WARRENTY", nullable=true)
	private String warrenty;
		
	@NotEmpty(message="AavaSyak Aaho.")
	@Column(name="PRICE", nullable=false)
	private String price;
	
	
	@NotEmpty(message="AavaSyak Aaho.")
	@Column(name="GST_TAX", nullable=false)
	private String gstTax;
	
	
	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	@NotEmpty(message="AavaSyak Aaho.")
	@Column(name="STORAGE_LOCATION", nullable=false)
	private String storageLocation;
	
	
	@Column(name="IS_DISABLED", nullable=true)
	private Boolean isDisabled;

	@Column(name="FILE_PATH", nullable=true)
	private String filePath;

	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Column(name="INSERTED_BY", nullable=true)
	private String insertedBy ;

	@Column(name="INSERTED_TIME", nullable=true)
	private String insertedTime;

	@Column(name="LAST_MODIFIED_BY", nullable=true)
	private String lastModifiedBy;

	@Column(name="LAST_MODIFIED_TIME", nullable=true)
	private String lastModifiedTime;

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

	public String getAliasName() {
		return aliasName;
	}

	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturerName() {
		return manufacturerName;
	}

	public void setManufacturerName(String manufacturerName) {
		this.manufacturerName = manufacturerName;
	}

	public String getWarrenty() {
		return warrenty;
	}

	public void setWarrenty(String warrenty) {
		this.warrenty = warrenty;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getGstTax() {
		return gstTax;
	}

	public void setGstTax(String gstTax) {
		this.gstTax = gstTax;
	}

	public String getStorageLocation() {
		return storageLocation;
	}

	public void setStorageLocation(String storageLocation) {
		this.storageLocation = storageLocation;
	}

	public Boolean getIsDisabled() {
		return isDisabled;
	}

	public void setIsDisabled(Boolean isDisabled) {
		this.isDisabled = isDisabled;
	}

	public String getInsertedBy() {
		return insertedBy;
	}

	public void setInsertedBy(String insertedBy) {
		this.insertedBy = insertedBy;
	}

	public String getInsertedTime() {
		return insertedTime;
	}

	public void setInsertedTime(String insertedTime) {
		this.insertedTime = insertedTime;
	}

	public String getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public String getLastModifiedTime() {
		return lastModifiedTime;
	}

	public void setLastModifiedTime(String lastModifiedTime) {
		this.lastModifiedTime = lastModifiedTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Product [productId=").append(productId).append(", productName=").append(productName)
				.append(", aliasName=").append(aliasName).append(", description=").append(description)
				.append(", manufacturerName=").append(manufacturerName).append(", warrenty=").append(warrenty)
				.append(", price=").append(price).append(", gstTax=").append(gstTax).append(", storageLocation=")
				.append(storageLocation).append(", isDisabled=").append(isDisabled).append(", insertedBy=")
				.append(insertedBy).append(", insertedTime=").append(insertedTime).append(", lastModifiedBy=")
				.append(lastModifiedBy).append(", lastModifiedTime=").append(lastModifiedTime).append("]");
		return builder.toString();
	}



}
