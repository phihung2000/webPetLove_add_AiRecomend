package com.webpetlove.ph.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "comment")
public class Comment {
	
		@Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  @Column(name = "comment_id ")
	  private long  commentid;

	  @Column(name = "comment_email")
	  private String   commentemail;
	  
	  @Column(name = "comment_name ")
	  private String   commentname;
	  
	  @Column(name = "comment_text")
	  private String   comment_text;
	  @Column(name = "product_id")
	  private Long   productid;
	  
//	  @Column(name = "product_givepet_id")
//	  private long   productGivePetID;
	  
	public long getCommentid() {
		return commentid;
	}
	public void setCommentid(long commentid) {
		this.commentid = commentid;
	}
	public String getCommentemail() {
		return commentemail;
	}
	public void setCommentemail(String commentemail) {
		this.commentemail = commentemail;
	}
	public String getCommentname() {
		return commentname;
	}
	public void setCommentname(String commentname) {
		this.commentname = commentname;
	}
	public String getComment_text() {
		return comment_text;
	}
	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}
	public Long getProductid() {
		return productid;
	}
	public void setProductid(Long productid) {
		this.productid = productid;
	}
//	public long getProductGivePetID() {
//		return productGivePetID;
//	}
//	public void setProductGivePetID(long productGivePetID) {
//		this.productGivePetID = productGivePetID;
//	}
	  
}
