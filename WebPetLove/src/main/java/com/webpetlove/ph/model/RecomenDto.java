package com.webpetlove.ph.model;

import javax.persistence.Column;

public class RecomenDto {

	 private Long id_Recommend ;
	 private Long product_id;
	 private Long Loai_Recommend;
	 
	 public RecomenDto() {}
	
	public RecomenDto(Long id_Recommend, Long product_id, Long loai_Recommend) {
		super();
		this.id_Recommend = id_Recommend;
		this.product_id = product_id;
		Loai_Recommend = loai_Recommend;
	}

	public Long getId_Recommend() {
		return id_Recommend;
	}
	public void setId_Recommend(Long id_Recommend) {
		this.id_Recommend = id_Recommend;
	}
	public Long getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Long product_id) {
		this.product_id = product_id;
	}
	public Long getLoai_Recommend() {
		return Loai_Recommend;
	}
	public void setLoai_Recommend(Long loai_Recommend) {
		Loai_Recommend = loai_Recommend;
	}
	@Override
	public String toString() {
		return "RecomenDto [id_Recommend=" + id_Recommend + ", product_id=" + product_id + ", Loai_Recommend="
				+ Loai_Recommend + "]";
	}
	 
}
