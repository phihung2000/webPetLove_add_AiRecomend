package com.webpetlove.ph.model;

public class StatusProductDto {
	private int status_id;
	private Long product_id;
	private String statusproduct;
	public StatusProductDto(int status_id, Long product_id, String statusproduct) {
		super();
		this.status_id = status_id;
		this.product_id = product_id;
		this.statusproduct = statusproduct;
	}
	public int getStatus_id() {
		return status_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public Long getProdId() {
		return product_id;
	}
	public void setProdId(Long product_id) {
		this.product_id = product_id;
	}
	public String getstatusproduct() {
		return statusproduct;
	}
	public void setstatusproduct(String statusproduct) {
		this.statusproduct = statusproduct;
	}
	@Override
	public String toString() {
		return "StatusProductDto [status_id=" + status_id + ", prodId=" + product_id + ", status_product=" + statusproduct
				+ "]";
	}
	
	

}
