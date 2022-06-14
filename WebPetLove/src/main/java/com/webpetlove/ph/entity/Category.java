package com.webpetlove.ph.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "category_id")
  private long   categoryID;

  @Column(name = "category_name")
  private String categoryName;

  public Category() {
  }

  public Category(String name) {
    this.categoryName = name;
  }

  public Category(Long id, String name) {
    this.categoryID = id;
    this.categoryName = name;
  }
  
  public long getCategoryID() {
    return categoryID;
  }

  public void setCategoryID(long categoryID) {
    this.categoryID = categoryID;
  }

  public String getCategoryName() {
    return categoryName;
  }

  public void setCategoryName(String categoryName) {
    this.categoryName = categoryName;
  }

}
