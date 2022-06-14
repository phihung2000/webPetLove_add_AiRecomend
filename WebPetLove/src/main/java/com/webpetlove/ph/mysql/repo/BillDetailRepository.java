package com.webpetlove.ph.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webpetlove.ph.entity.BillDetail;

public interface BillDetailRepository extends JpaRepository<BillDetail, Long> {

  List<BillDetail> findByBillId(Long id);
}
