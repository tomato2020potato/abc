package cn.gzh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.gzh.domain.Manage;
import cn.gzh.domain.User;
import cn.gzh.service.ProductService;

public class addProductionAction extends ActionSupport implements ModelDriven<Manage>{
	
	private ProductService productService;
	private Manage model_product = new Manage();

//配置模型自动装配
public Manage getModel() {
	return model_product;
}
public String addproduct(){
	
	{System.out.println("aaaaaaaaaaaa"+model_product.getPname());
		
		productService.add(model_product);
	addActionMessage("添加成功!");
	return "addproductsuccess";

}
	
}public void setProductService(ProductService productService) {
	this.productService = productService;
}

}
