package com.webpetlove.ph.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.webpetlove.ph.entity.Bill;

public interface Bilstatus extends JpaRepository<Bill, Long>{
	
	  @Query(value="select * from bill where bill.status=1",nativeQuery = true) 
	  List<Bill> findAllActiveUsersNative();
	  @Query(value="select * from bill where bill.status=3",nativeQuery = true) 
	  List<Bill> findAllActivebillsuccess();
	  @Query(value="select * from bill where bill.status=2",nativeQuery = true) 
	  List<Bill> findAllActivebilldelete();
}

