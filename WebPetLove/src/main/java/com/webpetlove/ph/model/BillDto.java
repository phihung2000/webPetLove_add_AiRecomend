package com.webpetlove.ph.model;

import java.util.Date;

public class BillDto {

  private Long productId;
  
  private String product;
  
  private Date date;
  
  private int quantity;
  
  private double price;

  private String productImage;
  private Short status ;
  
  
  public Short getStatus() {
	return status;
}

public void setStatus(Short status) {
	this.status = status;
}

public String getProductImage() {
    return productImage;
  }

  public void setProductImage(String productImage) {
    this.productImage = productImage;
  }

  public String getProduct() {
    return product;
  }

  public void setProduct(String product) {
    this.product = product;
  }

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public Long getProductId() {
    return productId;
  }

  public void setProductId(Long productId) {
    this.productId = productId;
  }
}
