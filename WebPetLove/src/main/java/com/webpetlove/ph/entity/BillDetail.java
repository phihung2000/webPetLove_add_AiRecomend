package com.webpetlove.ph.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bill_detail")
public class BillDetail {
  
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "bill_detail_id")
  private long   billDetailID;

  @Column(name = "bill_id")
  private Long   billId;

  @Column(name = "product_id")
  private Long   productId;
  
//  @Column(name = "product_givepet_id")
//  private long   productGivePetID;
  
  private double price;

  private int    quantity;

  public BillDetail() {}
  
  
	public BillDetail(Long billId, Long productId ,double price, int quantity) {
		this.billId = billId;
		this.productId = productId;
		this.price = price;
		this.quantity = quantity;
	}

public long getBillDetailID() {
    return billDetailID;
  }

  public void setBillDetailID(long billDetailID) {
    this.billDetailID = billDetailID;
  }

  public Long getBillId() {
    return this.billId;
  }

  public void setBillId(Long billId) {
    this.billId = billId;
  }

  public Long getProductId() {
    return this.productId;
  }

  public void setProductId(Long productId) {
    this.productId = productId;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

//public long getProductGivePetID() {
//	return productGivePetID;
//}
//
//
//public void setProductGivePetID(long productGivePetID) {
//	this.productGivePetID = productGivePetID;
//}
  
}
