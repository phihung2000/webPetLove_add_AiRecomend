package com.webpetlove.ph.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "product_id")
  private long   productID;

  @Column(name = "category_id")
  private Long   categoryId;

  @Column(name="catergoty_givepet_id")
	private Long catergoty_givepetid;
  
  @Column(name = "product_name")
  private String productName;

  @Column(name = "product_image")
  private String productImage;

  @Column(name = "product_price")
  private double productPrice;

  @Column(name = "product_description", columnDefinition="TEXT")
  private String productDescription;

  @Column(name = "product_provider")
  private String productProvider;
  
  @Column(name = "product_quantity")
  private Integer productQuantity;
  
  @Column(name = "product_buy")
  private Double productBuy;
  
  public Double getProductBuy() {
    return productBuy;
  }

  public void setProductBuy(Double productBuy) {
    this.productBuy = productBuy;
  }

  public String getProductProvider() {
    return productProvider;
  }

  public void setProductProvider(String productProvider) {
    this.productProvider = productProvider;
  }

  public Integer getProductQuantity() {
    return productQuantity;
  }

  public void setProductQuantity(Integer productQuantity) {
    this.productQuantity = productQuantity;
  }

  public void setProductPrice(double productPrice) {
    this.productPrice = productPrice;
  }

  public Product(long productID, Long categoryId,Long catergoty_givepetid, String productName, String productImage,
                 double productPrice, String productDescription) {
    this(categoryId,catergoty_givepetid, productName, productImage, productPrice, productDescription);
    this.productID = productID;
  }
  
  public Product(Long categoryId,Long catergoty_givepetid, String productName, String productImage,
                 double productPrice, String productDescription) {
    this.categoryId = categoryId;
    this.catergoty_givepetid= catergoty_givepetid;
    this.productName = productName;
    this.productImage = productImage;
    this.productPrice = productPrice;
    this.productDescription = productDescription;
  }
  
  public Product() {
  }

  public long getProductID() {
    return productID;
  }

  public void setProductID(long productID) {
    this.productID = productID;
  }

  public Long getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(Long categoryId) {
    this.categoryId = categoryId;
  }
  
  public Long getCatergoty_givepetid() {
	return catergoty_givepetid;
}

public void setCatergoty_givepetid(Long catergoty_givepetid) {
	this.catergoty_givepetid = catergoty_givepetid;
}

public String getProductName() {
    return productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }

  public String getProductImage() {
    return productImage;
  }

  public void setProductImage(String productImage) {
    this.productImage = productImage;
  }

  public Double getProductPrice() {
    return productPrice;
  }

  public void setProductPrice(Double productPrice) {
    this.productPrice = productPrice;
  }

  public String getProductDescription() {
    return productDescription;
  }

  public void setProductDescription(String productDescription) {
    this.productDescription = productDescription;
  }

  @Override
  public String toString() {
    return "Product [productID=" + productID + ", categoryId=" + categoryId + ", productName="
        + productName + ", productImage=" + productImage + ", productPrice=" + productPrice
        + ", productDescription=" + productDescription + "]";
  }
}
