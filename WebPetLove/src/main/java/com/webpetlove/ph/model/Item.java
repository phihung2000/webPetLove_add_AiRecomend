package com.webpetlove.ph.model;

import com.webpetlove.ph.entity.Bill;
import com.webpetlove.ph.entity.Product;
import com.webpetlove.ph.entity.Product_givepet;

public class Item {
    private Product product;
//    private Product_givepet ProductGP;
    private int quantity;
    private Bill bill;
    public Item(){        
    }
    public Item(Product product, int quantity ) {
        this.product = product;
        this.quantity = quantity;
//        this.ProductGP = ProductGP;
		/* this.bill = bill; */
    }
    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
	public Bill getBill() {
		return bill;
	}
	public void setBill(Bill bill) {
		this.bill = bill;
	}
//	public Product_givepet getProductGP() {
//		return ProductGP;
//	}
//	public void setProductGP(Product_givepet productGP) {
//		ProductGP = productGP;
//	}   
    
}
