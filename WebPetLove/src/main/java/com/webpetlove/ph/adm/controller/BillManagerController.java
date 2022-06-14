package com.webpetlove.ph.adm.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webpetlove.ph.entity.Bill;
import com.webpetlove.ph.mysql.repo.BillRepository;

@RestController
@RequestMapping("/bill")
public class BillManagerController {

  private @Autowired BillRepository billRepository;
  
  @GetMapping("/news")
  public List<String> noti(){
    List<String> phones = new LinkedList<>();
    
    try {
      List<Bill> bills = billRepository.findByNotiIsFalse();
      for(Bill b: bills) {
        phones.add(b.getPhone());
        b.setNoti(true);
      }
      billRepository.saveAll(bills);
      
      return phones;
    } catch (Exception e) {
      return phones;
    }
  }
}
