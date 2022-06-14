package com.webpetlove.ph.mysql.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.webpetlove.ph.entity.Category_givepet;



public interface Category_givepetRepository extends JpaRepository<Category_givepet, Long> {
	@Query(value = "select * from category_givepet where catergoty_givepet_id = ?1 and categoryname_givepet = ?2", nativeQuery = true)
	  public Category_givepet findByIdAndName(Long id, String name);
}
