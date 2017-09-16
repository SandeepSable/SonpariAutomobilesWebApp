package com.ibm.app.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ibm.app.model.Product;
import com.ibm.app.service.ProductService;

@Controller
public class ProductController {

	private static final String UPLOADED_FOLDER = "C:\\sonpari\\images\\";
	@Autowired
	ProductService productService;
	@Autowired
	ServletContext context;

	@RequestMapping(value = "/add-product", method = RequestMethod.GET)
	public String showAddProductForm(ModelMap model) {
		System.out.println("ProductController.showAddProductForm()");
		model.addAttribute("product", new Product());
		return "/add-product";
	}

	@RequestMapping(value = "/add-product", method = RequestMethod.POST)
	public String handleAddProductForm(@Valid Product product, BindingResult result, ModelMap model,@RequestParam("photo") MultipartFile multipartFile) {
		String photoFileFullPathWithName = "";
    	String fileName = null;
	    System.out.println("ProductController.handleAddProductForm()-------------->");
		System.out.println("--product--->" + product);
		System.out.println("ProductController.handleAddProductForm()");
		if (result.hasErrors()) {
			return "/add-product";
		}
		product.setFilePath(photoFileFullPathWithName);
		String userName = AppController.getCurrentUserName();
		product.setInsertedBy(userName);
		product.setInsertedTime(System.currentTimeMillis()+"");
		Product retProduct = productService.addProduct(product);
		model.addAttribute("success", "vastu \' " + product.getProductName() + " \'  samaaivasT krNyaat AalaI Aaho.");
		model.addAttribute("product", retProduct);
		

    	if (!multipartFile.isEmpty()) {
            try {
                fileName = multipartFile.getOriginalFilename();
                byte[] bytes = multipartFile.getBytes();
                File file = new File("C:/sonpari/images/"+retProduct.getProductId()+"/");
                file.mkdirs();
                
                
                BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File("C:/sonpari/images/"+retProduct.getProductId()+"/"+fileName)));
                buffStream.write(bytes);
                buffStream.close();
                System.out.println("You have successfully uploaded " + fileName);
            }
            catch (Exception e) 
            {
                System.out.println("You failed to upload " + fileName + ": " + e.getMessage());
            }
        }
    	else 
        {
            System.out.println("Unable to upload. File is empty.");
        }

		return "success-page";
	}

	@RequestMapping(value = { "/edit-product-{pid}" }, method = RequestMethod.GET)
	public String showEditProductForm(ModelMap model, @PathVariable int pid) {
		System.out.println("ProductController.showEditProductForm()");
		Product product = productService.getProductByProductId(pid);
		model.addAttribute("edit", "true");
		product.setProductId(pid);
		model.addAttribute("product", product);
		return "edit-product";
	}

	@RequestMapping(value = { "/edit-product" }, method = RequestMethod.POST)
	public String handleEditProductForm(@Valid Product product, BindingResult result, ModelMap model,
			@RequestParam(value = "productId", required = true) int productId) {

		product.setProductId(productId);
		System.out.println("ProductController.handleEditProductForm()---->" + product);
		if (result.hasErrors()) {
			return "edit-product";
		}
		productService.editProduct(product);
		// model.addAttribute("success", "Proudct for " + product.getProductName() + "
		// updated successfully.");
		return "redirect:/view-product";
	}

	@RequestMapping(value = "/sale1", method = RequestMethod.GET)
	public String billingForm1(ModelMap model) {
		List<Product> products = productService.getProductList();
		model.addAttribute("products", products);
		return "billing";
	}

	@RequestMapping(value = "/sale2", method = RequestMethod.GET)
	public String billingForm2(ModelMap model) {
		List<Product> products = productService.getProductList();
		model.addAttribute("products", products);
		return "billing_2";
	}

	// view all prouducts
	@RequestMapping(value = "/view-product", method = RequestMethod.GET)
	public String viewProduct(ModelMap model) {
		System.out.println("ProductController.viewProduct()");
		List<Product> list = productService.getProductList();
		model.addAttribute("products", list);
		return "/product-list";
	}

	// Now delete the product by product id
	@RequestMapping(value = "/delete-product-{productId}", method = RequestMethod.GET)
	public String deleteProductByProductId(ModelMap model, @PathVariable int productId) {
		// model.addAttribute("loggedinuser", getPrincipal());
		Boolean isDeleted = productService.deleteProductByProductId(productId);
		System.out.println("kaaZuna takNyat Aali aaho.");

		return "redirect:/view-product";
	}

	@RequestMapping(value = { "/slickgrid-table" }, method = RequestMethod.GET)
	public String handleSlickGridTableRequest() {
		return "/slickgridTable";
	}

}