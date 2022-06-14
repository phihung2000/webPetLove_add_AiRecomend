package com.webpetlove.ph.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="category_givepet")
public class Category_givepet {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="catergoty_givepet_id")
	private long catergoty_givepetid;
	@Column(name="categoryname_givepet")
	private String categorynameGivepet;
	
	public Category_givepet() {}
	public Category_givepet(String categorynameGivepet) {
		super();
		this.categorynameGivepet = categorynameGivepet;
	}
	public Category_givepet(long catergoty_givepetid, String categorynameGivepet) {
		super();
		this.catergoty_givepetid = catergoty_givepetid;
		this.categorynameGivepet = categorynameGivepet;
	}

	public long getCatergoty_givepetid() {
		return catergoty_givepetid;
	}

	public void setCatergoty_givepetid(long catergoty_givepetid) {
		this.catergoty_givepetid = catergoty_givepetid;
	}

	public String getCategorynameGivepet() {
		return categorynameGivepet;
	}

	public void setCategorynameGivepet(String categorynameGivepet) {
		this.categorynameGivepet = categorynameGivepet;
	}
}
