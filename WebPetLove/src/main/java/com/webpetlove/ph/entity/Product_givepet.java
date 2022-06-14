package com.webpetlove.ph.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "product_givepet")
public class Product_givepet {
	@Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  @Column(name = "product_givepet_id")
	  private long   productGivePetID;

	  @Column(name = "catergoty_givepet_id")
	  private Long   categoryGivePetId;

	  @Column(name = "product_givepet_name")
	  private String productGivePetName;

	  @Column(name = "product_givepet_image")
	  private String productGivePetImage;

	  @Column(name = "product_givepet_price")
	  private double productGivePetPrice;

	  @Column(name = "product_givepet_description", columnDefinition="TEXT")
	  private String productGivePetDescription;
	  
	  @Column(name = "product_givepet_quantity")
	  private Integer productGivePetQuantity;
	  
	  @Column(name = "product_givepet_provider")
	  private String productGivePetProvider;
	  
	  @Column(name = "product_givepet_buy")
	  private Double productGivePetBuy;
	  
	  public Product_givepet() {
	  }
	  
	  public Product_givepet(long productGivePetID, Long categoryGivePetId, String productGivePetName,
			String productGivePetImage, double productGivePetPrice, String productGivePetDescription,
			String productGivePetProvider, Integer productGivePetQuantity, Double productGivePetBuy) {
		super();
		this.productGivePetID = productGivePetID;
		this.categoryGivePetId = categoryGivePetId;
		this.productGivePetName = productGivePetName;
		this.productGivePetImage = productGivePetImage;
		this.productGivePetPrice = productGivePetPrice;
		this.productGivePetDescription = productGivePetDescription;
		this.productGivePetProvider = productGivePetProvider;
		this.productGivePetQuantity = productGivePetQuantity;
		this.productGivePetBuy = productGivePetBuy;
	}

	public long getProductGivePetID() {
		return productGivePetID;
	}

	public void setProductGivePetID(long productGivePetID) {
		this.productGivePetID = productGivePetID;
	}

	public Long getCategoryGivePetId() {
		return categoryGivePetId;
	}

	public void setCategoryGivePetId(Long categoryGivePetId) {
		this.categoryGivePetId = categoryGivePetId;
	}

	public String getProductGivePetName() {
		return productGivePetName;
	}

	public void setProductGivePetName(String productGivePetName) {
		this.productGivePetName = productGivePetName;
	}

	public String getProductGivePetImage() {
		return productGivePetImage;
	}

	public void setProductGivePetImage(String productGivePetImage) {
		this.productGivePetImage = productGivePetImage;
	}

	public double getProductGivePetPrice() {
		return productGivePetPrice;
	}

	public void setProductGivePetPrice(double productGivePetPrice) {
		this.productGivePetPrice = productGivePetPrice;
	}

	public String getProductGivePetDescription() {
		return productGivePetDescription;
	}

	public void setProductGivePetDescription(String productGivePetDescription) {
		this.productGivePetDescription = productGivePetDescription;
	}

	public String getProductGivePetProvider() {
		return productGivePetProvider;
	}

	public void setProductGivePetProvider(String productGivePetProvider) {
		this.productGivePetProvider = productGivePetProvider;
	}

	public Integer getProductGivePetQuantity() {
		return productGivePetQuantity;
	}

	public void setProductGivePetQuantity(Integer productGivePetQuantity) {
		this.productGivePetQuantity = productGivePetQuantity;
	}

	public Double getProductGivePetBuy() {
		return productGivePetBuy;
	}

	public void setProductGivePetBuy(Double productGivePetBuy) {
		this.productGivePetBuy = productGivePetBuy;
	}

	@Override
	public String toString() {
		return "Product_givepet [productGivePetID=" + productGivePetID + ", categoryGivePetId=" + categoryGivePetId
				+ ", productGivePetName=" + productGivePetName + ", productGivePetImage=" + productGivePetImage
				+ ", productGivePetPrice=" + productGivePetPrice + ", productGivePetDescription="
				+ productGivePetDescription + ", productGivePetProvider=" + productGivePetProvider
				+ ", productGivePetQuantity=" + productGivePetQuantity + ", productGivePetBuy=" + productGivePetBuy
				+ "]";
	}

	
	  
}
