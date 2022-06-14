package com.webpetlove.ph.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "recommend")
public class Recommend {
	
	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  @Column(name = "id_Recommend")
	 private Long id_Recommend ;
	  
	  @Column(name = "product_id")
	 private Long product_id;
	  
	  @Column(name = "loai_Recommend")
	 private Long loai_Recommend;

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
		return loai_Recommend;
	}

	public void setLoai_Recommend(Long loai_Recommend) {
		this.loai_Recommend = loai_Recommend;
	}

}
