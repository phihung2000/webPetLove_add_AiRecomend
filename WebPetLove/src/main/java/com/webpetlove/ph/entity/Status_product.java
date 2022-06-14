package com.webpetlove.ph.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "status_product")
public class Status_product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "status_id")
	private int status_id;
	@Column(name="product_id")
	private Long product_id;
	@Column(name="statusproduct")
	private String statusproduct;
	public Status_product() {};
	public Status_product(int status_id, Long product_id, String statusproduct) {
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
	public Long getproduct_id() {
		return product_id;
	}
	public void setproduct_id(Long product_id) {
		this.product_id = product_id;
	}
	public String getStatus_product() {
		return statusproduct;
	}
	public void setStatus_product(String statusproduct) {
		this.statusproduct = statusproduct;
	}
}
