package com.webpetlove.ph.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.webpetlove.ph.entity.Ratings;

public interface RatingsReposity extends JpaRepository<Ratings, Long>{
	  @Query(value="select * from ratings where product_id =?1",nativeQuery = true) 
	  List<Ratings> findByrantigs(Long id);
	  /*SELECT * FROM `ratings` WHERE ratings.user_id = 54 and ratings.product_id = 1484425983309*/
	  @Query(value="select * from ratings where user_id =?1 and ratings.product_id =?2",nativeQuery = true)
	  Ratings finByUserRantings(Long id, Long product_id);
	 
}
