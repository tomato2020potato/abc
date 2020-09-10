package cn.gzh.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.gzh.domain.Address;
import cn.gzh.domain.Cart;
import cn.gzh.domain.CartItem;
import cn.gzh.domain.Order;
import cn.gzh.domain.OrderItem;
import cn.gzh.domain.User;
import cn.gzh.service.AddressService;
import cn.gzh.service.OrderService;
import cn.gzh.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport{
	
	private OrderService orderService;
	private AddressService addressService;
	private UserService userService;
	private Integer oid;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	/**
	 * 保存订单
	 * @return
	 */
	public String save(){
		
		//从session中拿到用户和购物车
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		Cart shopcart = (Cart) session.getAttribute("shopcart");
		User user = (User) session.getAttribute("user");
		
		if(shopcart==null||shopcart.getCartItems().size()==0){
			
			return "order_save_notCart";
		}
		if(user==null){
			
			return LOGIN;
		}
		
		Order order = new Order();
		
		order.setOrdertime(new Date());   //设置订单时间
		order.setState(1);   //未支付
		order.setUser(user);  //设置所属用户
		
		for(CartItem item: shopcart.getCartItems() ){  //取出购物车的购物项
			OrderItem orderitem = new OrderItem();
			orderitem.setProduct(item.getProduct());  //设置商品
			orderitem.setCount(item.getCount());
			orderitem.setOrder(order);
			
			order.addTotal(orderitem.getSubtotal());  //设置总价
			
			order.getOrderItem().add(orderitem);    //订单项添加到订单
		}
		
		
		 oid = orderService.save(order);  //保存订单
		
		 
			user = userService.login(user.getLoginName(), user.getPassword());  //重新登录
		 
		//清空购物车
		shopcart.clear();
		
		session.setAttribute("new_order", order);  //把最新的订单信息打印到页面
		session.setAttribute("user", user);  //更新用户信息
		
		return "order_save_success";
	}
	
	private Integer addressid;  //收货地址id
	
	public String cancelOrder(){
		if(oid==null){
			return null;
		}
		HttpSession session = ServletActionContext.getRequest().getSession(); //拿到session中的用户
		
		User  user = (User) session.getAttribute("user");
		
		if(user==null){
			return null;  //未登录
		}
		
		Order findOrder = orderService.findByOid(oid, user);
		findOrder.setState(0); //设置为订单取消
		
		orderService.update(findOrder);
		
		user = userService.login(user.getLoginName(), user.getPassword());  //重新登录
		session.setAttribute("user", user);
		
		return "order_cancel_success";
	}
	

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getAddressid() {
		return addressid;
	}

	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	
	
}
