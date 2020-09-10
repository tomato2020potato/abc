package cn.gzh.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class Order implements Serializable{
	private Integer oid;   //订单id
	private Double total = 0d; //订单总金额
	private Date ordertime; //下单时间
	private Integer state;  //订单状态  0订单取消  1未付款 2已付款,但是未发货  3已发货,未收货  4.已收货,未评价 5.已评价
	private Address address; //收货地址
	private User user; //订单所属用户
	private Set<OrderItem> orderItem = new HashSet<OrderItem>();
	
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	
	public void setTotal(Double total) {
		
		this.total =total;
	}
	public Double getTotal() {
		
		
		return total;
	}

	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<OrderItem> getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(Set<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}
	
	public void addTotal(Double total){
		this.total+=total;
	}
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", total=" + total + ", ordertime="
				+ ordertime + ", state=" + state + ", address=" + address
				+ ",  orderItem=" + orderItem + "]";
	}
	
}
