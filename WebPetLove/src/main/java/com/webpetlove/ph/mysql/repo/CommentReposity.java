package com.webpetlove.ph.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.webpetlove.ph.entity.Comment;

public interface CommentReposity extends JpaRepository<Comment, Long>{
	@Query(value="SELECT * FROM `comment` WHERE product_id=?1",nativeQuery = true) 
	  List<Comment> findBycommetn(Long id);
}
