package com.webpetlove.ph.entity;

public class allBill {
	private Long    user_id;
	private Long   productId;
	
	public allBill() {};
	
//	public allBill(Long user_id, Long productId) {
//		super();
//		this.user_id = user_id;
//		this.productId = productId;
//	}
	public allBill(Long productId) {
		this.productId = productId;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}
	
}
