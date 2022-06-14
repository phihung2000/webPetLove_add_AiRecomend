package com.webpetlove.ph.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "user_id")
  private Long    id;

  @Column(name = "user_email")
  private String  userEmail;
  
  private String phone;

  @Column(name = "user_pass")
  private String  userPass;

  @Column(name = "user_name")
  private String userName;

  @Column(name = "usergroup_id")
  private int     groupid;
  
  @Column(name = "GioiTinh")
  private int  gioitinh;

  @Column(name = "petlove")
  private String petlove;

  @Column(name = "loaiKH")
  private int     loaikh;
  
  @Column(name = "DiaChi")
  private String diachi;
  
  @Column(name = "NgaySinh")
  private String ngaysinh;

public User(Long id, String userEmail, String phone, String userPass, String userName, int groupid, int gioitinh,
		String petlove, int loaikh , String diachi,String ngaysinh) {
	super();
	this.id = id;
	this.userEmail = userEmail;
	this.phone = phone;
	this.userPass = userPass;
	this.userName = userName;
	this.groupid = groupid;
	this.gioitinh = gioitinh;
	this.petlove = petlove;
	this.loaikh = loaikh;
	this.diachi =diachi;
	this.ngaysinh = ngaysinh;
}

public User() {}

  public int getGioitinh() {
	return gioitinh;
}

public void setGioitinh(int gioitinh) {
	this.gioitinh = gioitinh;
}

public String getPetlove() {
	return petlove;
}

public void setPetlove(String petlove) {
	this.petlove = petlove;
}

public int getLoaikh() {
	return loaikh;
}

public void setLoaikh(int loaikh) {
	this.loaikh = loaikh;
}

public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public int getGroupid() {
    return groupid;
  }

  public void setGroupid(int groupid) {
    this.groupid = groupid;
  }

  public Long getId() {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getUserEmail() {
    return userEmail;
  }

  public void setUserEmail(String userEmail) {
    this.userEmail = userEmail;
  }

  public String getUserPass() {
    return userPass;
  }

  public void setUserPass(String userPass) {
    this.userPass = userPass;
  }
  public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public String getDiachi() {
	return diachi;
}

public void setDiachi(String diachi) {
	this.diachi = diachi;
}

public String getNgaysinh() {
	return ngaysinh;
}

public void setNgaysinh(String ngaysinh) {
	this.ngaysinh = ngaysinh;
}

@Override
public String toString() {
	return "User [id=" + id + ", userEmail=" + userEmail + ", phone=" + phone + ", userPass=" + userPass + ", userName="
			+ userName + ", groupid=" + groupid + ", gioitinh=" + gioitinh + ", petlove=" + petlove + ", loaikh="
			+ loaikh +", diachi=" + diachi +", ngaysinh=" + ngaysinh + "]";
}
}
