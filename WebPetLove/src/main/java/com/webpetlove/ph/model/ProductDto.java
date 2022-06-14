package com.webpetlove.ph.model;

public class ProductDto {
  private Long prodId;
  private String command;
  private Long cateId;
  private Long catergoty_givepetid; 
  private String prodName;
  private Double price;
  private Double buy;
  private String descrip;
  private int quantity;
  private String provider;
  private String image;
  
  
  public Double getBuy() {
    return buy;
  }
  public void setBuy(Double buy) {
    this.buy = buy;
  }
  public int getQuantity() {
    return quantity;
  }
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  public String getProvider() {
    return provider;
  }
  public void setProvider(String provider) {
    this.provider = provider;
  }
  public Long getProdId() {
    return prodId;
  }
  public void setProdId(Long prodId) {
    this.prodId = prodId;
  }
  public String getCommand() {
    return command;
  }
  public void setCommand(String command) {
    this.command = command;
  }
  public Long getCateId() {
    return cateId;
  }
  public void setCateId(Long cateId) {
    this.cateId = cateId;
  }
  
  public Long getCatergoty_givepetid() {
	return catergoty_givepetid;
}
public void setCatergoty_givepetid(Long catergoty_givepetid) {
	this.catergoty_givepetid = catergoty_givepetid;
}
public String getProdName() {
    return prodName;
  }
  public void setProdName(String prodName) {
    this.prodName = prodName;
  }
  public Double getPrice() {
    return price;
  }
  public void setPrice(Double price) {
    this.price = price;
  }
  public String getDescrip() {
    return descrip;
  }
  public void setDescrip(String descrip) {
    this.descrip = descrip;
  }
  public String getImage() {
    return image;
  }
  public void setImage(String image) {
    this.image = image;
  }
@Override
public String toString() {
	return "ProductDto [prodId=" + prodId + ", command=" + command + ", cateId=" + cateId + ", catergoty_givepetid="
			+ catergoty_givepetid + ", prodName=" + prodName + ", price=" + price + ", buy=" + buy + ", descrip="
			+ descrip + ", quantity=" + quantity + ", provider=" + provider + ", image=" + image + "]";
}
  
}
