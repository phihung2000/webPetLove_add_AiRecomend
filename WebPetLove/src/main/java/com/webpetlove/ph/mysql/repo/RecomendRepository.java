package com.webpetlove.ph.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webpetlove.ph.entity.Recommend;

@Repository
public interface RecomendRepository extends JpaRepository<Recommend, Long>{
	//lấy ra các loại recomend
	 @Query(value="SELECT * FROM `recommend` a  WHERE a.product_id=?1 GROUP BY a.loai_Recommend", nativeQuery = true)
	 List<Recommend> findByLoaiRecomend(Long id);
	//show ra tên sp hình ảnh 
//	@Query(value="SELECT a.product_id,a.product_name , a.product_image,a.product_price FROM product a INNER JOIN recommend b ON a.product_id=b.product_id AND b.Loai_Recommend IN(?1,?2,?3)", nativeQuery = true)
//	List<Product> findNameProduct(Long id1 , Long id2 ,Long id3);
}
