package com.ibm.app.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibm.app.model.Product;
import com.ibm.app.model.Stock;
import com.ibm.app.service.ProductService;

@Controller
public class StockController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = "/add-stock", method = RequestMethod.GET)
	public String showStockFormPage(Model model) {
		List<Product> list = productService.getProductList();
		System.out.println("productsList---->" + list);
		model.addAttribute("product", new Product());
		Map map = new HashMap<String, String>();

		for (Product product : list) {
			map.put(product.getProductId(), product.getProductName());
		}
		model.addAttribute("productsList", map);
		return "add-stock";
	}

	@RequestMapping(value = "/add-stock", method = RequestMethod.POST)
	public String stockFormPagePostMethod(Model model,HttpServletRequest request,@RequestParam("productName") int productId,@RequestParam("stock") int newQuantity) 
	{
		System.out.println("productId::------------------------->"+productId);
		System.out.println("newQuantity::----------------------->"+newQuantity);
		Product product = this.productService.getProductByProductId(productId);
		int oldQuantity = 0;
		try
		{
			oldQuantity= product.getStock();
		}
		catch(Exception ex)
		{
			oldQuantity = 0;
		}
		product.setStock((oldQuantity + newQuantity));
		this.productService.editProduct(product);
		
		Stock stockAudit = new Stock();
		stockAudit.setAuditId(null);
		stockAudit.setProductId(productId);
		stockAudit.setQuantity(newQuantity);
		stockAudit.setProductName(product.getProductName());
		stockAudit.setInserted_by(AppController.getCurrentUserName());
		stockAudit.setInserted_time(System.currentTimeMillis()+"");
		this.productService.updateStockAudit(stockAudit);
		
		return "/home";
      
	}
}
