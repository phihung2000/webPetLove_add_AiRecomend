package com.webpetlove.ph.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webpetlove.ph.entity.Product;
import com.webpetlove.ph.entity.Recommend;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

  List<Product> findByCategoryId(Long id);
  
  List<Product> findByProductName(String name);
  
  @Query(value = "select * from product where catergoty_givepet_id=?1", nativeQuery = true)
  List<Product> findByCategoryGPID(Long id);
  
  @Query(value = "select * from product where product_name like %?1%", nativeQuery = true)
  List<Product> findByFirstnameLike(String keyword);
  
  @Query(value = "SELECT * FROM `product` WHERE product_price BETWEEN ?1 AND ?2", nativeQuery = true)
  List<Product> findByProductPrice(double value1,double value2);
  
  @Query(value="SELECT a.* FROM product a INNER JOIN recommend b ON a.product_id=b.product_id AND b.Loai_Recommend IN(?1,?2,?3) GROUP BY a.product_id", nativeQuery = true)
	List<Product> findNameProduct(Long id1 , Long id2 ,Long id3);
  
  @Query(value="SELECT a.* FROM product a INNER JOIN recommend b ON a.product_id=b.product_id AND b.Loai_Recommend IN(0,1,0) GROUP BY a.product_id", nativeQuery = true)
	List<Product> tesst();
}
