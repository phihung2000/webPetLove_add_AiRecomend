package com.webpetlove.ph.model;


public class CartResponse {
  private Long price;
  private Integer quantity;
  private String message;
  public Long getPrice() {
    return price;
  }
  public void setPrice(Long price) {
    this.price = price;
  }
  public Integer getQuantity() {
    return quantity;
  }
  public void setQuantity(Integer quantity) {
    this.quantity = quantity;
  }
  public String getMessage() {
    return message;
  }
  public void setMessage(String message) {
    this.message = message;
  }
  
  
}
