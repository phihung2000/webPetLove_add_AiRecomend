package com.webpetlove.ph.mysql.repo;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webpetlove.ph.entity.Product;
import com.webpetlove.ph.entity.Product_givepet;

@Repository
public interface ProductGPRepository extends JpaRepository<Product_givepet,Long> {

//	  List<Product_givepet> findByProductName(String name);
			@Query(value = "select * from product_givepet where catergoty_givepet_id =?1", nativeQuery = true)
	  List<Product_givepet> findByCategoryGPId(Long id);
	  @Query(value = "select * from product_givepet where product_givepet_id =?1", nativeQuery = true)
	  List<Product_givepet> findByProductID(Long id);
}
