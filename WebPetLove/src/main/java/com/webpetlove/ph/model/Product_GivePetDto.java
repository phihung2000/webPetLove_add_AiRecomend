package com.webpetlove.ph.model;

public class Product_GivePetDto {
	  private Long prodGpetId;
	  private String command;
	  private Long cateGpetId;
	  private String prodGpetName;
	  private Double priceGpet;
	  private Double buyGpet;
	  private String descripGpet;
	  private int quantityGpet;
	  private String providerGpet;
	  private String imageGpet;
	public Long getProdGpetId() {
		return prodGpetId;
	}
	public void setProdGpetId(Long prodGpetId) {
		this.prodGpetId = prodGpetId;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public Long getCateGpetId() {
		return cateGpetId;
	}
	public void setCateGpetId(Long cateGpetId) {
		this.cateGpetId = cateGpetId;
	}
	public String getProdGpetName() {
		return prodGpetName;
	}
	public void setProdGpetName(String prodGpetName) {
		this.prodGpetName = prodGpetName;
	}
	public Double getPriceGpet() {
		return priceGpet;
	}
	public void setPriceGpet(Double priceGpet) {
		this.priceGpet = priceGpet;
	}
	public Double getBuyGpet() {
		return buyGpet;
	}
	public void setBuyGpet(Double buyGpet) {
		this.buyGpet = buyGpet;
	}
	public String getDescripGpet() {
		return descripGpet;
	}
	public void setDescripGpet(String descripGpet) {
		this.descripGpet = descripGpet;
	}
	public int getQuantityGpet() {
		return quantityGpet;
	}
	public void setQuantityGpet(int quantityGpet) {
		this.quantityGpet = quantityGpet;
	}
	public String getProviderGpet() {
		return providerGpet;
	}
	public void setProviderGpet(String providerGpet) {
		this.providerGpet = providerGpet;
	}
	public String getImageGpet() {
		return imageGpet;
	}
	public void setImageGpet(String imageGpet) {
		this.imageGpet = imageGpet;
	}
	@Override
	public String toString() {
		return "Product_GivePetDto [prodGpetId=" + prodGpetId + ", command=" + command + ", cateGpetId=" + cateGpetId
				+ ", prodGpetName=" + prodGpetName + ", priceGpet=" + priceGpet + ", buyGpet=" + buyGpet
				+ ", descripGpet=" + descripGpet + ", quantityGpet=" + quantityGpet + ", providerGpet=" + providerGpet
				+ ", imageGpet=" + imageGpet + "]";
	}
	  
	  
}
