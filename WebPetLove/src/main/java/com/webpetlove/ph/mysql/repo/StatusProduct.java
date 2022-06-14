package com.webpetlove.ph.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webpetlove.ph.entity.Product;
import com.webpetlove.ph.entity.Status_product;

@Repository
public interface StatusProduct extends JpaRepository<Product,Status_product >{
//	@Query(value ="select a.product_name from product a ,status_product b where b.product_id = a.product_id AND b.status_product LIKE '%HOT'", nativeQuery = true)
	@Query(value ="select * from status_product b ,product a where b.product_id=a.product_id and b.statusproduct like '%HOT%' ", nativeQuery = true)
	//@Query(value ="select a.product_name from status_product b, product a WHERE a.product_id = b.product_id AND b.status_product LIKE 'HOT' ", nativeQuery = true)
	List<Product> findByProduct();
}
