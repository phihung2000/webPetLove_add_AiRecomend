package com.webpetlove.ph.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ratings")
public class Ratings {
	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  @Column(name = "rating_id ")
	  private long  ratingsid;

	  @Column(name = "user_id")
	  private Long      userId;
	  
	  @Column(name = "product_id ")
	  private Long      productid;
	  
//	  @Column(name = "product_givepet_id")
//	  private long   productGivePetID;
	  
	  @Column(name = "ratings ")
	  private Long      ratings;
	  
	public long getRatingsid() {
		return ratingsid;
	}

	public void setRatingsid(long ratingsid) {
		this.ratingsid = ratingsid;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getProductid() {
		return productid;
	}

	public void setProductid(Long productid) {
		this.productid = productid;
	}

	public Long getRatings() {
		return ratings;
	}

	public void setRatings(Long ratings) {
		this.ratings = ratings;
	}

//	public long getProductGivePetID() {
//		return productGivePetID;
//	}
//
//	public void setProductGivePetID(long productGivePetID) {
//		this.productGivePetID = productGivePetID;
//	}
	
	  
}
