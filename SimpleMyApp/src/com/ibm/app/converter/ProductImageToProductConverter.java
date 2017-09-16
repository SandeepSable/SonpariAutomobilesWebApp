package com.ibm.app.converter;

import org.springframework.core.convert.converter.Converter;

import com.ibm.app.model.Product;

public class ProductImageToProductConverter implements Converter<Product, Product> {

	@Override
	public Product convert(Product product) {
		System.out.println("ProductImageToProductConverter.convert()=====================================================");
		product.setFilePath("");
		return null;
	}

	
}
